import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/stepper/app_stepper.dart';
import 'package:iautomat_design_system/src/components/stepper/stepper_config.dart';

void main() {
  group('AppStepper Unit Tests', () {
    final testSteps = [
      const AppStep(
        title: 'Step 1',
        subtitle: 'First step',
        state: AppStepState.completed,
      ),
      const AppStep(
        title: 'Step 2',
        subtitle: 'Second step',
        state: AppStepState.active,
      ),
      const AppStep(
        title: 'Step 3',
        subtitle: 'Third step',
        state: AppStepState.inactive,
      ),
    ];

    group('Widget Rendering', () {
      testWidgets('renders with required props for vertical variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: testSteps,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        expect(find.byType(AppStepper), findsOneWidget);
        expect(find.text('Step 1'), findsOneWidget);
        expect(find.text('Step 2'), findsOneWidget);
        expect(find.text('Step 3'), findsOneWidget);
      });

      testWidgets('renders with required props for horizontal variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 1,
                steps: testSteps,
                variant: AppStepperVariant.horizontal,
              ),
            ),
          ),
        );

        expect(find.byType(AppStepper), findsOneWidget);
        expect(find.text('Step 1'), findsOneWidget);
        expect(find.text('Step 2'), findsOneWidget);
        expect(find.text('Step 3'), findsOneWidget);
      });

      testWidgets('displays step subtitles when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: testSteps,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        expect(find.text('First step'), findsOneWidget);
        expect(find.text('Second step'), findsOneWidget);
        expect(find.text('Third step'), findsOneWidget);
      });

      testWidgets('shows progress indicator when enabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: testSteps,
                variant: AppStepperVariant.vertical,
                config: const AppStepperConfig(showProgressIndicator: true),
              ),
            ),
          ),
        );

        expect(find.byType(LinearProgressIndicator), findsOneWidget);
      });

      testWidgets('hides progress indicator when disabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: testSteps,
                variant: AppStepperVariant.vertical,
                config: const AppStepperConfig(showProgressIndicator: false),
              ),
            ),
          ),
        );

        expect(find.byType(LinearProgressIndicator), findsNothing);
      });
    });

    group('States', () {
      testWidgets('shows loading state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: testSteps,
                overrideState: AppStepperState.loading,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('shows skeleton state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: testSteps,
                overrideState: AppStepperState.skeleton,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        // Skeleton should show a shimmer container instead of steps
        expect(find.text('Step 1'), findsNothing);
        expect(find.byType(Container), findsAtLeastNWidgets(1));
      });

      testWidgets('disabled state prevents interaction', (tester) async {
        bool tapped = false;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: testSteps,
                enabled: false,
                onStepTapped: (_) => tapped = true,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        // Try to tap a step
        await tester.tap(find.text('Step 2'));
        await tester.pump();

        expect(tapped, false);
      });
    });

    group('Configuration', () {
      testWidgets('applies custom configuration', (tester) async {
        const customConfig = AppStepperConfig(
          stepRadius: 16.0,
          stepBorderWidth: 3.0,
          horizontalSpacing: 32.0,
          showOptionalBadge: true,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: testSteps,
                config: customConfig,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        expect(find.byType(AppStepper), findsOneWidget);
      });

      testWidgets('supports custom colors', (tester) async {
        final customColors = AppStepperColors.fromTheme(ThemeData.dark());

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: testSteps,
                colors: customColors,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        expect(find.byType(AppStepper), findsOneWidget);
      });

      testWidgets('shows controls when enabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 1,
                steps: testSteps,
                showControls: true,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        // Should show continue/cancel buttons
        expect(find.byType(ElevatedButton), findsOneWidget);
        expect(find.byType(TextButton), findsOneWidget);
      });

      testWidgets('hides controls when disabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 1,
                steps: testSteps,
                showControls: false,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        // Should not show control buttons
        expect(find.byType(ElevatedButton), findsNothing);
        expect(find.byType(TextButton), findsNothing);
      });
    });

    group('Step Interaction', () {
      testWidgets('calls onStepTapped when step is tapped', (tester) async {
        int? tappedStep;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: testSteps,
                onStepTapped: (step) => tappedStep = step,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        await tester.tap(find.text('Step 2'));
        await tester.pump();

        expect(tappedStep, 1);
      });

      testWidgets('calls onStepContinue when continue button is pressed', (tester) async {
        bool continueCalled = false;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 1,
                steps: testSteps,
                onStepContinue: () => continueCalled = true,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(ElevatedButton));
        await tester.pump();

        expect(continueCalled, true);
      });

      testWidgets('calls onStepCancel when cancel button is pressed', (tester) async {
        bool cancelCalled = false;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 1,
                steps: testSteps,
                onStepCancel: () => cancelCalled = true,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(TextButton));
        await tester.pump();

        expect(cancelCalled, true);
      });
    });

    group('Step Content', () {
      testWidgets('displays step content when provided', (tester) async {
        final stepsWithContent = [
          const AppStep(
            title: 'Step 1',
            state: AppStepState.active,
            content: Text('Step 1 Content'),
          ),
          const AppStep(
            title: 'Step 2',
            state: AppStepState.inactive,
            content: Text('Step 2 Content'),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: stepsWithContent,
                expandActiveStep: true,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        // Only active step content should be visible
        expect(find.text('Step 1 Content'), findsOneWidget);
        expect(find.text('Step 2 Content'), findsNothing);
      });

      testWidgets('shows error state and error text', (tester) async {
        final errorSteps = [
          const AppStep(
            title: 'Step 1',
            state: AppStepState.error,
            errorText: 'This step has an error',
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: errorSteps,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        expect(find.text('This step has an error'), findsOneWidget);
        expect(find.byIcon(Icons.error), findsOneWidget);
      });

      testWidgets('shows completed state with check icon', (tester) async {
        final completedSteps = [
          const AppStep(
            title: 'Completed Step',
            state: AppStepState.completed,
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: completedSteps,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.check), findsOneWidget);
      });
    });

    group('Accessibility', () {
      testWidgets('supports semantic label', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: testSteps,
                semanticLabel: 'Progress Stepper',
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        final semantics = tester.getSemantics(find.byType(Semantics).first);
        expect(semantics.label, contains('Progress Stepper'));
      });

      testWidgets('supports autofocus', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: testSteps,
                autoFocus: true,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(AppStepper), findsOneWidget);
      });
    });

    group('Custom Controls', () {
      testWidgets('uses custom control builder', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 1,
                steps: testSteps,
                variant: AppStepperVariant.vertical,
                controlsBuilder: const AppStepperControlsBuilder(
                  continueLabel: 'Next Step',
                  cancelLabel: 'Previous Step',
                ),
              ),
            ),
          ),
        );

        expect(find.text('Next Step'), findsOneWidget);
        expect(find.text('Previous Step'), findsOneWidget);
      });
    });

    group('Optional Steps', () {
      testWidgets('shows optional badge when configured', (tester) async {
        final optionalSteps = [
          const AppStep(
            title: 'Required Step',
            state: AppStepState.active,
          ),
          const AppStep(
            title: 'Optional Step',
            state: AppStepState.inactive,
            isOptional: true,
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: optionalSteps,
                config: const AppStepperConfig(showOptionalBadge: true),
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        expect(find.text('Opcional'), findsOneWidget);
      });
    });

    group('Platform Adaptation', () {
      testWidgets('shows platform-appropriate loading indicator', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppStepper(
                currentStep: 0,
                steps: testSteps,
                overrideState: AppStepperState.loading,
                variant: AppStepperVariant.vertical,
              ),
            ),
          ),
        );

        // Should show CircularProgressIndicator on non-iOS platforms
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });
  });

  group('AppStep', () {
    test('has correct state properties', () {
      const activeStep = AppStep(title: 'Active', state: AppStepState.active);
      const completedStep = AppStep(title: 'Completed', state: AppStepState.completed);
      const disabledStep = AppStep(title: 'Disabled', state: AppStepState.disabled);
      const errorStep = AppStep(title: 'Error', state: AppStepState.error);

      expect(activeStep.isActive, true);
      expect(activeStep.isCompleted, false);
      expect(activeStep.isDisabled, false);
      expect(activeStep.hasError, false);

      expect(completedStep.isActive, false);
      expect(completedStep.isCompleted, true);
      expect(completedStep.isDisabled, false);
      expect(completedStep.hasError, false);

      expect(disabledStep.isActive, false);
      expect(disabledStep.isCompleted, false);
      expect(disabledStep.isDisabled, true);
      expect(disabledStep.hasError, false);

      expect(errorStep.isActive, false);
      expect(errorStep.isCompleted, false);
      expect(errorStep.isDisabled, false);
      expect(errorStep.hasError, true);
    });

    test('canInteract property works correctly', () {
      const interactiveStep = AppStep(title: 'Interactive', isInteractive: true);
      const nonInteractiveStep = AppStep(title: 'Non-interactive', isInteractive: false);
      const disabledStep = AppStep(title: 'Disabled', state: AppStepState.disabled);

      expect(interactiveStep.canInteract, true);
      expect(nonInteractiveStep.canInteract, false);
      expect(disabledStep.canInteract, false);
    });
  });

  group('AppStepperExtensions', () {
    final testSteps = [
      const AppStep(title: 'Step 1', state: AppStepState.completed),
      const AppStep(title: 'Step 2', state: AppStepState.active),
      const AppStep(title: 'Step 3', state: AppStepState.inactive),
      const AppStep(title: 'Step 4', state: AppStepState.error),
    ];

    test('activeStepIndex returns correct index', () {
      expect(testSteps.activeStepIndex, 1);
    });

    test('completedStepsCount returns correct count', () {
      expect(testSteps.completedStepsCount, 1);
    });

    test('totalStepsCount returns correct count', () {
      expect(testSteps.totalStepsCount, 4);
    });

    test('progress calculates correctly', () {
      expect(testSteps.progress, 0.25); // 1 completed out of 4 total
    });

    test('hasErrors returns true when there are error steps', () {
      expect(testSteps.hasErrors, true);
    });

    test('errorSteps returns steps with errors', () {
      final errorSteps = testSteps.errorSteps;
      expect(errorSteps.length, 1);
      expect(errorSteps.first.title, 'Step 4');
    });

    test('currentStep returns active step', () {
      final currentStep = testSteps.currentStep;
      expect(currentStep?.title, 'Step 2');
    });

    test('stepAt returns correct step', () {
      final step = testSteps.stepAt(2);
      expect(step?.title, 'Step 3');
    });

    test('markStepCompleted works correctly', () {
      final updatedSteps = testSteps.markStepCompleted(2);
      expect(updatedSteps[2].isCompleted, true);
    });

    test('markStepActive works correctly', () {
      final updatedSteps = testSteps.markStepActive(0);
      expect(updatedSteps[0].isActive, true);
      expect(updatedSteps[1].isActive, false); // Previous active step should be inactive
    });

    test('markStepError works correctly', () {
      final updatedSteps = testSteps.markStepError(0, 'Test error');
      expect(updatedSteps[0].hasError, true);
      expect(updatedSteps[0].errorText, 'Test error');
    });
  });

  group('AppStepperValidator', () {
    test('required validator works correctly', () {
      expect(AppStepperValidator.required('test'), null);
      expect(AppStepperValidator.required(''), isNotNull);
      expect(AppStepperValidator.required(null), isNotNull);
    });

    test('custom validator works correctly', () {
      final validator = AppStepperValidator.custom(
        (value) => value?.length == 5,
        'Must be 5 characters',
      );

      expect(validator('12345'), null);
      expect(validator('123'), isNotNull);
      expect(validator(null), null);
    });
  });
}