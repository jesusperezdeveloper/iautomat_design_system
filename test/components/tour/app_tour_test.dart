import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/tour/app_tour.dart';
import 'package:iautomat_design_system/src/components/tour/app_tour_config.dart';

void main() {
  group('AppTour Widget Tests', () {
    late List<AppTourStep> testSteps;
    late List<GlobalKey> testKeys;

    setUp(() {
      testKeys = [
        GlobalKey(),
        GlobalKey(),
        GlobalKey(),
      ];

      testSteps = [
        AppTourStep(
          id: 'step_1',
          targetKey: testKeys[0],
          title: 'Primer Paso',
          description: 'Esta es la descripción del primer paso del tour.',
          position: AppTourPosition.bottom,
        ),
        AppTourStep(
          id: 'step_2',
          targetKey: testKeys[1],
          title: 'Segundo Paso',
          description: 'Esta es la descripción del segundo paso del tour.',
          position: AppTourPosition.top,
        ),
        AppTourStep(
          id: 'step_3',
          targetKey: testKeys[2],
          title: 'Tercer Paso',
          description: 'Esta es la descripción del tercer paso del tour.',
          position: AppTourPosition.auto,
        ),
      ];
    });

    Widget buildTestWidget({
      AppTourConfig? config,
      List<AppTourStep>? steps,
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
              AppTour(
                config: config ?? const AppTourConfig(),
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

      expect(find.byType(AppTour), findsOneWidget);
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
        config: const AppTourConfig(showProgress: true),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      expect(find.text('1/3'), findsOneWidget);
    });

    testWidgets('hides progress indicator when disabled', (tester) async {
      await tester.pumpWidget(buildTestWidget(
        config: const AppTourConfig(showProgress: false),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(LinearProgressIndicator), findsNothing);
      expect(find.text('1/3'), findsNothing);
    });

    testWidgets('shows skip button when enabled', (tester) async {
      await tester.pumpWidget(buildTestWidget(
        config: const AppTourConfig(enableSkip: true),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Saltar'), findsOneWidget);
    });

    testWidgets('hides skip button when disabled', (tester) async {
      await tester.pumpWidget(buildTestWidget(
        config: const AppTourConfig(enableSkip: false),
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
        config: const AppTourConfig(enableKeyboardNavigation: true),
      ));
      await tester.pumpAndSettle();

      expect(find.text('Primer Paso'), findsOneWidget);

      // Focus the tour
      await tester.tap(find.byType(AppTour));
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
        config: const AppTourConfig(enableKeyboardNavigation: true),
        onSkip: () => skipCalled = true,
      ));
      await tester.pumpAndSettle();

      // Focus the tour
      await tester.tap(find.byType(AppTour));
      await tester.pumpAndSettle();

      // Press escape key
      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();

      expect(skipCalled, isTrue);
    });

    testWidgets('applies custom colors correctly', (tester) async {
      const customColors = AppTourColors(
        backgroundColor: Colors.red,
        buttonColor: Colors.blue,
        textColor: Colors.white,
      );

      await tester.pumpWidget(buildTestWidget(
        config: const AppTourConfig(colors: customColors),
      ));
      await tester.pumpAndSettle();

      // Find Material widget with custom background color
      final materials = find.byType(Material);
      expect(materials, findsWidgets);
    });

    testWidgets('applies custom spacing correctly', (tester) async {
      const customSpacing = AppTourSpacing(
        borderRadius: 16.0,
        elevation: 12.0,
        targetPadding: 20.0,
      );

      await tester.pumpWidget(buildTestWidget(
        config: const AppTourConfig(spacing: customSpacing),
      ));
      await tester.pumpAndSettle();

      expect(find.byType(AppTour), findsOneWidget);
    });

    testWidgets('shows custom button text when provided', (tester) async {
      const customControls = AppTourControls(
        skipButtonText: 'Omitir',
        nextButtonText: 'Continuar',
        finishButtonText: 'Terminar',
      );

      await tester.pumpWidget(buildTestWidget(
        config: const AppTourConfig(controls: customControls),
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
                  AppTour(
                    config: const AppTourConfig(
                      isRtl: true,
                      controls: AppTourControls(
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
      const customAccessibility = AppTourAccessibility(
        semanticLabel: 'Custom Tour',
        skipButtonLabel: 'Custom Skip',
        finishButtonLabel: 'Custom Finish',
      );

      await tester.pumpWidget(buildTestWidget(
        config: const AppTourConfig(
          enableA11y: true,
          accessibility: customAccessibility,
        ),
        steps: [testSteps.first],
      ));
      await tester.pumpAndSettle();

      expect(find.bySemanticsLabel('Custom Tour'), findsOneWidget);
    });
  });

  group('AppTourConfig Tests', () {
    test('creates config with default values', () {
      const config = AppTourConfig();

      expect(config.variant, equals(AppTourVariant.coachmarks));
      expect(config.state, equals(AppTourState.defaultState));
      expect(config.enableSkip, isTrue);
      expect(config.enableNext, isTrue);
      expect(config.enablePrevious, isTrue);
      expect(config.enableKeyboardNavigation, isTrue);
      expect(config.showProgress, isTrue);
    });

    test('creates config with custom values', () {
      const config = AppTourConfig(
        variant: AppTourVariant.coachmarks,
        state: AppTourState.loading,
        enableSkip: false,
        enableNext: false,
        showProgress: false,
      );

      expect(config.variant, equals(AppTourVariant.coachmarks));
      expect(config.state, equals(AppTourState.loading));
      expect(config.enableSkip, isFalse);
      expect(config.enableNext, isFalse);
      expect(config.showProgress, isFalse);
    });

    test('copyWith works correctly', () {
      const originalConfig = AppTourConfig();
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
      const config1 = AppTourConfig(
        enableSkip: false,
        showProgress: true,
      );
      const config2 = AppTourConfig(
        enableSkip: false,
        showProgress: true,
      );
      const config3 = AppTourConfig(
        enableSkip: true,
        showProgress: true,
      );

      expect(config1, equals(config2));
      expect(config1, isNot(equals(config3)));
    });
  });

  group('AppTourStep Tests', () {
    test('creates step with required values', () {
      final targetKey = GlobalKey();
      final step = AppTourStep(
        id: 'test_step',
        targetKey: targetKey,
        title: 'Test Step',
      );

      expect(step.id, equals('test_step'));
      expect(step.targetKey, equals(targetKey));
      expect(step.title, equals('Test Step'));
      expect(step.description, isNull);
      expect(step.position, equals(AppTourPosition.auto));
      expect(step.alignment, equals(AppTourAlignment.center));
      expect(step.showHighlight, isTrue);
      expect(step.enableTap, isTrue);
    });

    test('creates step with all values', () {
      final targetKey = GlobalKey();
      final step = AppTourStep(
        id: 'test_step',
        targetKey: targetKey,
        title: 'Test Step',
        description: 'Test Description',
        position: AppTourPosition.top,
        alignment: AppTourAlignment.start,
        showHighlight: false,
        enableTap: false,
        targetRadius: 16.0,
        targetPadding: const EdgeInsets.all(8.0),
        metadata: {'key': 'value'},
      );

      expect(step.id, equals('test_step'));
      expect(step.title, equals('Test Step'));
      expect(step.description, equals('Test Description'));
      expect(step.position, equals(AppTourPosition.top));
      expect(step.alignment, equals(AppTourAlignment.start));
      expect(step.showHighlight, isFalse);
      expect(step.enableTap, isFalse);
      expect(step.targetRadius, equals(16.0));
      expect(step.targetPadding, equals(const EdgeInsets.all(8.0)));
      expect(step.metadata, equals({'key': 'value'}));
    });

    test('copyWith works correctly', () {
      final targetKey = GlobalKey();
      final originalStep = AppTourStep(
        id: 'test_step',
        targetKey: targetKey,
        title: 'Original Title',
        position: AppTourPosition.auto,
      );

      final modifiedStep = originalStep.copyWith(
        title: 'Modified Title',
        position: AppTourPosition.top,
      );

      expect(modifiedStep.id, equals('test_step'));
      expect(modifiedStep.title, equals('Modified Title'));
      expect(modifiedStep.position, equals(AppTourPosition.top));
      expect(modifiedStep.targetKey, equals(originalStep.targetKey));
    });

    test('equality works correctly', () {
      final targetKey1 = GlobalKey();
      final targetKey2 = GlobalKey();

      final step1 = AppTourStep(
        id: 'test_step',
        targetKey: targetKey1,
        title: 'Test Step',
      );
      final step2 = AppTourStep(
        id: 'test_step',
        targetKey: targetKey1,
        title: 'Test Step',
      );
      final step3 = AppTourStep(
        id: 'different_step',
        targetKey: targetKey2,
        title: 'Test Step',
      );

      expect(step1, equals(step2));
      expect(step1, isNot(equals(step3)));
    });
  });

  group('AppTourColors Tests', () {
    test('creates colors with default values', () {
      const colors = AppTourColors();

      expect(colors.backgroundColor, isNull);
      expect(colors.buttonColor, isNull);
      expect(colors.textColor, isNull);
    });

    test('creates colors with custom values', () {
      const colors = AppTourColors(
        backgroundColor: Colors.red,
        buttonColor: Colors.blue,
        textColor: Colors.white,
      );

      expect(colors.backgroundColor, equals(Colors.red));
      expect(colors.buttonColor, equals(Colors.blue));
      expect(colors.textColor, equals(Colors.white));
    });
  });

  group('AppTourPosition Tests', () {
    test('has all expected position values', () {
      expect(AppTourPosition.values, contains(AppTourPosition.top));
      expect(AppTourPosition.values, contains(AppTourPosition.bottom));
      expect(AppTourPosition.values, contains(AppTourPosition.left));
      expect(AppTourPosition.values, contains(AppTourPosition.right));
      expect(AppTourPosition.values, contains(AppTourPosition.center));
      expect(AppTourPosition.values, contains(AppTourPosition.auto));
    });
  });

  group('AppTourVariant Tests', () {
    test('has coachmarks variant', () {
      expect(AppTourVariant.values, contains(AppTourVariant.coachmarks));
    });
  });
}