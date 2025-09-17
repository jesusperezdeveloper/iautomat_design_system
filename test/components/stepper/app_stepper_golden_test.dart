import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/stepper/app_stepper.dart';
import 'package:iautomat_design_system/src/components/stepper/stepper_config.dart';

void main() {
  group('AppStepper Golden Tests', () {
    final testSteps = [
      const AppStep(
        title: 'Personal Information',
        subtitle: 'Enter your basic details',
        state: AppStepState.completed,
      ),
      const AppStep(
        title: 'Address',
        subtitle: 'Add your shipping address',
        state: AppStepState.active,
      ),
      const AppStep(
        title: 'Payment',
        subtitle: 'Configure payment method',
        state: AppStepState.inactive,
      ),
      const AppStep(
        title: 'Confirmation',
        subtitle: 'Review and confirm',
        state: AppStepState.inactive,
        isOptional: true,
      ),
    ];

    final errorSteps = [
      const AppStep(
        title: 'Step 1',
        subtitle: 'Completed step',
        state: AppStepState.completed,
      ),
      const AppStep(
        title: 'Step 2',
        subtitle: 'Step with error',
        state: AppStepState.error,
        errorText: 'This step has an error',
      ),
      const AppStep(
        title: 'Step 3',
        subtitle: 'Disabled step',
        state: AppStepState.disabled,
      ),
    ];

    final stepsWithContent = [
      AppStep(
        title: 'Step 1',
        subtitle: 'Active step with content',
        state: AppStepState.active,
        content: Container(
          padding: const EdgeInsets.all(16),
          child: const Column(
            children: [
              Text('This is the content for step 1'),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
      const AppStep(
        title: 'Step 2',
        subtitle: 'Inactive step',
        state: AppStepState.inactive,
      ),
    ];

    Widget buildStepper({
      AppStepperVariant variant = AppStepperVariant.vertical,
      List<AppStep>? steps,
      int currentStep = 1,
      AppStepperState? overrideState,
      bool enabled = true,
      AppStepperConfig? config,
      bool showControls = true,
      bool expandActiveStep = true,
    }) {
      return MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: variant == AppStepperVariant.horizontal ? 600 : 400,
              height: variant == AppStepperVariant.horizontal ? 300 : 500,
              child: AppStepper(
                currentStep: currentStep,
                steps: steps ?? testSteps,
                variant: variant,
                enabled: enabled,
                config: config,
                overrideState: overrideState,
                showControls: showControls,
                expandActiveStep: expandActiveStep,
                onStepTapped: (_) {},
                onStepContinue: () {},
                onStepCancel: () {},
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('vertical default state', (tester) async {
      await tester.pumpWidget(buildStepper());
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_vertical_default.png'),
      );
    });

    testWidgets('horizontal default state', (tester) async {
      await tester.pumpWidget(buildStepper(
        variant: AppStepperVariant.horizontal,
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_horizontal_default.png'),
      );
    });

    testWidgets('vertical with first step active', (tester) async {
      await tester.pumpWidget(buildStepper(currentStep: 0));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_vertical_first_step.png'),
      );
    });

    testWidgets('horizontal with last step active', (tester) async {
      await tester.pumpWidget(buildStepper(
        variant: AppStepperVariant.horizontal,
        currentStep: 3,
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_horizontal_last_step.png'),
      );
    });

    testWidgets('disabled state', (tester) async {
      await tester.pumpWidget(buildStepper(enabled: false));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_disabled.png'),
      );
    });

    testWidgets('loading state', (tester) async {
      await tester.pumpWidget(buildStepper(
        overrideState: AppStepperState.loading,
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_loading.png'),
      );
    });

    testWidgets('skeleton state', (tester) async {
      await tester.pumpWidget(buildStepper(
        overrideState: AppStepperState.skeleton,
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_skeleton.png'),
      );
    });

    testWidgets('error states', (tester) async {
      await tester.pumpWidget(buildStepper(
        steps: errorSteps,
        currentStep: 1,
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_error_states.png'),
      );
    });

    testWidgets('with step content expanded', (tester) async {
      await tester.pumpWidget(buildStepper(
        steps: stepsWithContent,
        currentStep: 0,
        expandActiveStep: true,
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_with_content.png'),
      );
    });

    testWidgets('without controls', (tester) async {
      await tester.pumpWidget(buildStepper(
        showControls: false,
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_without_controls.png'),
      );
    });

    testWidgets('compact mode', (tester) async {
      await tester.pumpWidget(buildStepper(
        config: const AppStepperConfig(
          compactMode: true,
          minimumStepHeight: 32.0,
          stepRadius: 12.0,
          horizontalSpacing: 12.0,
          verticalSpacing: 16.0,
        ),
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_compact_mode.png'),
      );
    });

    testWidgets('custom configuration', (tester) async {
      await tester.pumpWidget(buildStepper(
        config: const AppStepperConfig(
          stepRadius: 20.0,
          stepBorderWidth: 3.0,
          horizontalSpacing: 32.0,
          verticalSpacing: 40.0,
          showOptionalBadge: true,
          showProgressIndicator: true,
        ),
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_custom_config.png'),
      );
    });

    testWidgets('with progress indicator', (tester) async {
      await tester.pumpWidget(buildStepper(
        config: const AppStepperConfig(
          showProgressIndicator: true,
          progressIndicatorHeight: 6.0,
        ),
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_with_progress.png'),
      );
    });

    testWidgets('dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                height: 500,
                child: AppStepper(
                  currentStep: 1,
                  steps: testSteps,
                  variant: AppStepperVariant.vertical,
                  onStepTapped: (_) {},
                  onStepContinue: () {},
                  onStepCancel: () {},
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_dark_theme.png'),
      );
    });

    testWidgets('RTL support', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  height: 500,
                  child: AppStepper(
                    currentStep: 1,
                    steps: const [
                      AppStep(
                        title: 'المعلومات الشخصية',
                        subtitle: 'أدخل بياناتك الأساسية',
                        state: AppStepState.completed,
                      ),
                      AppStep(
                        title: 'العنوان',
                        subtitle: 'أضف عنوان الشحن',
                        state: AppStepState.active,
                      ),
                      AppStep(
                        title: 'الدفع',
                        subtitle: 'اختر طريقة الدفع',
                        state: AppStepState.inactive,
                      ),
                      AppStep(
                        title: 'التأكيد',
                        subtitle: 'راجع وأكد',
                        state: AppStepState.inactive,
                        isOptional: true,
                      ),
                    ],
                    variant: AppStepperVariant.vertical,
                    config: AppStepperConfig(showOptionalBadge: true),
                    onStepTapped: (_) {},
                    onStepContinue: () {},
                    onStepCancel: () {},
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_rtl.png'),
      );
    });

    testWidgets('horizontal with error states', (tester) async {
      await tester.pumpWidget(buildStepper(
        variant: AppStepperVariant.horizontal,
        steps: errorSteps,
        currentStep: 1,
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_horizontal_errors.png'),
      );
    });

    testWidgets('vertical with optional badge', (tester) async {
      await tester.pumpWidget(buildStepper(
        config: const AppStepperConfig(showOptionalBadge: true),
        currentStep: 3,
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_optional_badge.png'),
      );
    });

    testWidgets('horizontal compact', (tester) async {
      await tester.pumpWidget(buildStepper(
        variant: AppStepperVariant.horizontal,
        config: const AppStepperConfig(
          compactMode: true,
          stepRadius: 14.0,
          horizontalSpacing: 16.0,
        ),
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_horizontal_compact.png'),
      );
    });

    testWidgets('all steps completed', (tester) async {
      final completedSteps = testSteps.map((step) =>
        step.copyWith(state: AppStepState.completed)).toList();

      await tester.pumpWidget(buildStepper(
        steps: completedSteps,
        currentStep: 3,
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_all_completed.png'),
      );
    });

    testWidgets('single step', (tester) async {
      await tester.pumpWidget(buildStepper(
        steps: [testSteps.first],
        currentStep: 0,
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_single_step.png'),
      );
    });

    testWidgets('no step headers', (tester) async {
      await tester.pumpWidget(buildStepper(
        config: const AppStepperConfig(showStepHeaders: false),
      ));
      await expectLater(
        find.byType(AppStepper),
        matchesGoldenFile('stepper_no_headers.png'),
      );
    });
  });
}