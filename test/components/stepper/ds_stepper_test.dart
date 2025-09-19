import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/stepper/ds_stepper.dart';
import 'package:iautomat_design_system/src/components/stepper/stepper_config.dart';

void main() {
  group('DSStepper Unit Tests', () {
    final testSteps = [
      const DSStep(
        title: 'Step 1',
        subtitle: 'First step',
        state: DSStepState.completed,
      ),
      const DSStep(
        title: 'Step 2',
        subtitle: 'Second step',
        state: DSStepState.active,
      ),
      const DSStep(
        title: 'Step 3',
        subtitle: 'Third step',
        state: DSStepState.inactive,
      ),
    ];

    group('Widget Rendering', () {
      testWidgets('renders with required props for vertical variant',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 0,
                steps: testSteps,
                variant: DSStepperVariant.vertical,
              ),
            ),
          ),
        );

        expect(find.byType(DSStepper), findsOneWidget);
        expect(find.text('Step 1'), findsOneWidget);
        expect(find.text('Step 2'), findsOneWidget);
        expect(find.text('Step 3'), findsOneWidget);
      });

      testWidgets('renders with required props for horizontal variant',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 1,
                steps: testSteps,
                variant: DSStepperVariant.horizontal,
              ),
            ),
          ),
        );

        expect(find.byType(DSStepper), findsOneWidget);
        expect(find.text('Step 1'), findsOneWidget);
        expect(find.text('Step 2'), findsOneWidget);
        expect(find.text('Step 3'), findsOneWidget);
      });

      testWidgets('displays step subtitles when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 0,
                steps: testSteps,
                variant: DSStepperVariant.vertical,
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
              body: DSStepper(
                currentStep: 0,
                steps: testSteps,
                variant: DSStepperVariant.vertical,
                config: const DSStepperConfig(showProgressIndicator: true),
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
              body: DSStepper(
                currentStep: 0,
                steps: testSteps,
                variant: DSStepperVariant.vertical,
                config: const DSStepperConfig(showProgressIndicator: false),
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
              body: DSStepper(
                currentStep: 0,
                steps: testSteps,
                overrideState: DSStepperState.loading,
                variant: DSStepperVariant.vertical,
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
              body: DSStepper(
                currentStep: 0,
                steps: testSteps,
                overrideState: DSStepperState.skeleton,
                variant: DSStepperVariant.vertical,
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
              body: DSStepper(
                currentStep: 0,
                steps: testSteps,
                enabled: false,
                onStepTapped: (_) => tapped = true,
                variant: DSStepperVariant.vertical,
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
        const customConfig = DSStepperConfig(
          stepRadius: 16.0,
          stepBorderWidth: 3.0,
          horizontalSpacing: 32.0,
          showOptionalBadge: true,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 0,
                steps: testSteps,
                config: customConfig,
                variant: DSStepperVariant.vertical,
              ),
            ),
          ),
        );

        expect(find.byType(DSStepper), findsOneWidget);
      });

      testWidgets('supports custom colors', (tester) async {
        final customColors = DSStepperColors.fromTheme(ThemeData.dark());

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 0,
                steps: testSteps,
                colors: customColors,
                variant: DSStepperVariant.vertical,
              ),
            ),
          ),
        );

        expect(find.byType(DSStepper), findsOneWidget);
      });

      testWidgets('shows controls when enabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 1,
                steps: testSteps,
                showControls: true,
                variant: DSStepperVariant.vertical,
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
              body: DSStepper(
                currentStep: 1,
                steps: testSteps,
                showControls: false,
                variant: DSStepperVariant.vertical,
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
              body: DSStepper(
                currentStep: 0,
                steps: testSteps,
                onStepTapped: (step) => tappedStep = step,
                variant: DSStepperVariant.vertical,
              ),
            ),
          ),
        );

        await tester.tap(find.text('Step 2'));
        await tester.pump();

        expect(tappedStep, 1);
      });

      testWidgets('calls onStepContinue when continue button is pressed',
          (tester) async {
        bool continueCalled = false;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 1,
                steps: testSteps,
                onStepContinue: () => continueCalled = true,
                variant: DSStepperVariant.vertical,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(ElevatedButton));
        await tester.pump();

        expect(continueCalled, true);
      });

      testWidgets('calls onStepCancel when cancel button is pressed',
          (tester) async {
        bool cancelCalled = false;
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 1,
                steps: testSteps,
                onStepCancel: () => cancelCalled = true,
                variant: DSStepperVariant.vertical,
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
          const DSStep(
            title: 'Step 1',
            state: DSStepState.active,
            content: Text('Step 1 Content'),
          ),
          const DSStep(
            title: 'Step 2',
            state: DSStepState.inactive,
            content: Text('Step 2 Content'),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 0,
                steps: stepsWithContent,
                expandActiveStep: true,
                variant: DSStepperVariant.vertical,
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
          const DSStep(
            title: 'Step 1',
            state: DSStepState.error,
            errorText: 'This step has an error',
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 0,
                steps: errorSteps,
                variant: DSStepperVariant.vertical,
              ),
            ),
          ),
        );

        expect(find.text('This step has an error'), findsOneWidget);
        expect(find.byIcon(Icons.error), findsOneWidget);
      });

      testWidgets('shows completed state with check icon', (tester) async {
        final completedSteps = [
          const DSStep(
            title: 'Completed Step',
            state: DSStepState.completed,
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 0,
                steps: completedSteps,
                variant: DSStepperVariant.vertical,
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
              body: DSStepper(
                currentStep: 0,
                steps: testSteps,
                semanticLabel: 'Progress Stepper',
                variant: DSStepperVariant.vertical,
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
              body: DSStepper(
                currentStep: 0,
                steps: testSteps,
                autoFocus: true,
                variant: DSStepperVariant.vertical,
              ),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(DSStepper), findsOneWidget);
      });
    });

    group('Custom Controls', () {
      testWidgets('uses custom control builder', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 1,
                steps: testSteps,
                variant: DSStepperVariant.vertical,
                controlsBuilder: const DSStepperControlsBuilder(
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
          const DSStep(
            title: 'Required Step',
            state: DSStepState.active,
          ),
          const DSStep(
            title: 'Optional Step',
            state: DSStepState.inactive,
            isOptional: true,
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 0,
                steps: optionalSteps,
                config: const DSStepperConfig(showOptionalBadge: true),
                variant: DSStepperVariant.vertical,
              ),
            ),
          ),
        );

        expect(find.text('Opcional'), findsOneWidget);
      });
    });

    group('Platform Adaptation', () {
      testWidgets('shows platform-appropriate loading indicator',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSStepper(
                currentStep: 0,
                steps: testSteps,
                overrideState: DSStepperState.loading,
                variant: DSStepperVariant.vertical,
              ),
            ),
          ),
        );

        // Should show CircularProgressIndicator on non-iOS platforms
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });
  });

  group('DSStep', () {
    test('has correct state properties', () {
      const activeStep = DSStep(title: 'Active', state: DSStepState.active);
      const completedStep =
          DSStep(title: 'Completed', state: DSStepState.completed);
      const disabledStep =
          DSStep(title: 'Disabled', state: DSStepState.disabled);
      const errorStep = DSStep(title: 'Error', state: DSStepState.error);

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
      const interactiveStep =
          DSStep(title: 'Interactive', isInteractive: true);
      const nonInteractiveStep =
          DSStep(title: 'Non-interactive', isInteractive: false);
      const disabledStep =
          DSStep(title: 'Disabled', state: DSStepState.disabled);

      expect(interactiveStep.canInteract, true);
      expect(nonInteractiveStep.canInteract, false);
      expect(disabledStep.canInteract, false);
    });
  });

  group('DSStepperExtensions', () {
    final testSteps = [
      const DSStep(title: 'Step 1', state: DSStepState.completed),
      const DSStep(title: 'Step 2', state: DSStepState.active),
      const DSStep(title: 'Step 3', state: DSStepState.inactive),
      const DSStep(title: 'Step 4', state: DSStepState.error),
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
      expect(updatedSteps[1].isActive,
          false); // Previous active step should be inactive
    });

    test('markStepError works correctly', () {
      final updatedSteps = testSteps.markStepError(0, 'Test error');
      expect(updatedSteps[0].hasError, true);
      expect(updatedSteps[0].errorText, 'Test error');
    });
  });

  group('DSStepperValidator', () {
    test('required validator works correctly', () {
      expect(DSStepperValidator.required('test'), null);
      expect(DSStepperValidator.required(''), isNotNull);
      expect(DSStepperValidator.required(null), isNotNull);
    });

    test('custom validator works correctly', () {
      final validator = DSStepperValidator.custom(
        (value) => value?.length == 5,
        'Must be 5 characters',
      );

      expect(validator('12345'), null);
      expect(validator('123'), isNotNull);
      expect(validator(null), null);
    });
  });
}
