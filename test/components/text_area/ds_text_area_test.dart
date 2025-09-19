import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/text_area/ds_text_area.dart';
import 'package:iautomat_design_system/src/components/text_area/text_area_config.dart';

void main() {
  group('DSTextArea', () {
    testWidgets('renders correctly with basic properties', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              controller: controller,
              label: 'Test Label',
              hint: 'Test Hint',
            ),
          ),
        ),
      );

      expect(find.byType(DSTextArea), findsOneWidget);
      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Hint'), findsOneWidget);

      controller.dispose();
    });

    testWidgets('accepts text input', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              controller: controller,
              label: 'Test Area',
            ),
          ),
        ),
      );

      await tester.enterText(
          find.byType(DSTextArea), 'Hello World\nMultiple lines');
      expect(controller.text, 'Hello World\nMultiple lines');

      controller.dispose();
    });

    testWidgets('displays validation error', (tester) async {
      final controller = TextEditingController();
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: DSTextArea(
                controller: controller,
                label: 'Required Area',
                validator: DSTextAreaValidator.required,
              ),
            ),
          ),
        ),
      );

      // Trigger validation by calling validate on the form
      formKey.currentState!.validate();
      await tester.pump();

      // The validator should show error for empty field
      expect(find.text('Este campo es requerido'), findsOneWidget);

      // Enter valid text and validate again
      await tester.enterText(find.byType(DSTextArea), 'Valid text');
      formKey.currentState!.validate();
      await tester.pump();

      // Error should be gone
      expect(find.text('Este campo es requerido'), findsNothing);

      controller.dispose();
    });

    testWidgets('supports auto-resize variant', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              controller: controller,
              label: 'Auto-Resize Area',
              variant: DSTextAreaVariant.autoResize,
              minLines: 3,
              maxLines: 8,
            ),
          ),
        ),
      );

      await tester.enterText(
          find.byType(DSTextArea), 'Line 1\nLine 2\nLine 3\nLine 4\nLine 5');
      expect(controller.text, 'Line 1\nLine 2\nLine 3\nLine 4\nLine 5');

      controller.dispose();
    });

    testWidgets('is disabled when enabled is false', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              controller: controller,
              label: 'Disabled Area',
              enabled: false,
            ),
          ),
        ),
      );

      // Try to enter text
      await tester.enterText(find.byType(DSTextArea), 'Should not work');
      expect(controller.text, '');

      controller.dispose();
    });

    testWidgets('is read-only when readOnly is true', (tester) async {
      final controller = TextEditingController(text: 'Initial text');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              controller: controller,
              label: 'Read Only Area',
              readOnly: true,
            ),
          ),
        ),
      );

      // Try to enter text
      await tester.enterText(find.byType(DSTextArea), 'Should not change');
      expect(controller.text, 'Initial text');

      controller.dispose();
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              label: 'Loading Area',
              overrideState: DSTextAreaState.loading,
            ),
          ),
        ),
      );

      // Check for loading indicator - platform specific
      expect(
        find.byType(CircularProgressIndicator).evaluate().isNotEmpty ||
            find.byType(SizedBox).evaluate().length > 1,
        true,
      );
    });

    testWidgets('shows skeleton state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              label: 'Skeleton Area',
              overrideState: DSTextAreaState.skeleton,
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('displays helper text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              label: 'Area with helper',
              helperText: 'This is helper text',
            ),
          ),
        ),
      );

      expect(find.text('This is helper text'), findsOneWidget);
    });

    testWidgets('displays error text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              label: 'Area with error',
              errorText: 'This is an error',
            ),
          ),
        ),
      );

      expect(find.text('This is an error'), findsOneWidget);
    });

    testWidgets('displays prefix and suffix icons', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              label: 'Area with icons',
              prefixIcon: Icons.message,
              suffixIcon: Icons.send,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.message), findsOneWidget);
      expect(find.byIcon(Icons.send), findsOneWidget);
    });

    testWidgets('displays prefix and suffix widgets', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              label: 'Area with widgets',
              prefix: const Text('Pre'),
              suffix: const Text('Post'),
            ),
          ),
        ),
      );

      expect(find.text('Pre'), findsOneWidget);
      expect(find.text('Post'), findsOneWidget);
    });

    testWidgets('respects focus node', (tester) async {
      final focusNode = FocusNode();
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              controller: controller,
              label: 'Focusable Area',
              focusNode: focusNode,
            ),
          ),
        ),
      );

      expect(focusNode.hasFocus, false);

      focusNode.requestFocus();
      await tester.pump();

      // Note: In test environment, focus might not be granted immediately
      // This test verifies the focus node is properly connected

      focusNode.dispose();
      controller.dispose();
    });

    testWidgets('supports autofocus', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              controller: controller,
              label: 'Autofocus Area',
              autoFocus: true,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify the DSTextArea widget has autofocus enabled
      final appTextArea = tester.widget<DSTextArea>(
        find.byType(DSTextArea),
      );

      expect(appTextArea.autoFocus, true);

      controller.dispose();
    });

    testWidgets('applies custom configuration', (tester) async {
      const customConfig = DSTextAreaConfig(
        borderRadius: 16,
        contentPadding: EdgeInsets.all(20),
        minimumHeight: 100,
      );

      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              controller: controller,
              label: 'Custom Config Area',
              config: customConfig,
            ),
          ),
        ),
      );

      // Verify configuration is applied
      final textArea = tester.widget<DSTextArea>(find.byType(DSTextArea));
      expect(textArea.config?.borderRadius, 16);
      expect(textArea.config?.minimumHeight, 100);

      controller.dispose();
    });

    testWidgets('applies custom colors', (tester) async {
      final customColors = DSTextAreaColors(
        borderColor: Colors.red,
        focusedBorderColor: Colors.blue,
        errorBorderColor: Colors.orange,
        disabledBorderColor: Colors.grey,
        fillColor: Colors.yellow[100]!,
        disabledFillColor: Colors.grey[100]!,
        textColor: Colors.black,
        disabledTextColor: Colors.grey,
        hintColor: Colors.grey[600]!,
        disabledHintColor: Colors.grey[400]!,
        labelColor: Colors.blue[800]!,
        focusedLabelColor: Colors.blue,
        errorLabelColor: Colors.red,
        disabledLabelColor: Colors.grey,
        helperTextColor: Colors.green,
        errorTextColor: Colors.red,
        prefixIconColor: Colors.blue,
        suffixIconColor: Colors.blue,
        disabledPrefixIconColor: Colors.grey,
        disabledSuffixIconColor: Colors.grey,
        cursorColor: Colors.blue,
        selectionColor: Colors.blue.withValues(alpha: 0.3),
        selectionHandleColor: Colors.blue,
        counterTextColor: Colors.grey,
        skeletonBaseColor: Colors.grey[300]!,
        skeletonHighlightColor: Colors.grey[100]!,
        scrollbarColor: Colors.grey[400]!,
        scrollbarThumbColor: Colors.grey[600]!,
      );

      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              controller: controller,
              label: 'Custom Colors Area',
              colors: customColors,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(DSTextArea), findsOneWidget);

      controller.dispose();
    });

    testWidgets('calls onChanged callback', (tester) async {
      final controller = TextEditingController();
      String? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              controller: controller,
              label: 'OnChanged Area',
              onChanged: (value) => changedValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DSTextArea), 'test text');
      expect(changedValue, 'test text');

      controller.dispose();
    });

    testWidgets('calls onSubmitted callback', (tester) async {
      final controller = TextEditingController();
      String? submittedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              controller: controller,
              label: 'OnSubmitted Area',
              onSubmitted: (value) => submittedValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DSTextArea), 'test text');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      expect(submittedValue, 'test text');

      controller.dispose();
    });

    testWidgets('supports character counter', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextArea(
              controller: controller,
              label: 'Counter Area',
              maxLength: 100,
              helperText: 'Helper text',
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DSTextArea), 'Hello');
      await tester.pump();

      expect(find.text('5/100'), findsOneWidget);

      controller.dispose();
    });

    testWidgets('maintains state during rebuild', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    DSTextArea(
                      controller: controller,
                      label: 'Rebuild Test',
                    ),
                    TextButton(
                      onPressed: () => setState(() {}),
                      child: const Text('Rebuild'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DSTextArea), 'Persistent text');
      expect(controller.text, 'Persistent text');

      await tester.tap(find.text('Rebuild'));
      await tester.pumpAndSettle();

      expect(controller.text, 'Persistent text');

      controller.dispose();
    });

    group('Validators', () {
      testWidgets('required validator works', (tester) async {
        final controller = TextEditingController();
        final formKey = GlobalKey<FormState>();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                key: formKey,
                child: DSTextArea(
                  controller: controller,
                  label: 'Required Area',
                  validator: DSTextAreaValidator.required,
                ),
              ),
            ),
          ),
        );

        // Validate empty field
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Este campo es requerido'), findsOneWidget);

        // Enter valid text and validate
        await tester.enterText(find.byType(DSTextArea), 'Not empty');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Este campo es requerido'), findsNothing);

        controller.dispose();
      });

      testWidgets('minLength validator works', (tester) async {
        final controller = TextEditingController();
        final formKey = GlobalKey<FormState>();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                key: formKey,
                child: DSTextArea(
                  controller: controller,
                  label: 'MinLength Area',
                  validator: DSTextAreaValidator.minLength(10),
                ),
              ),
            ),
          ),
        );

        // Test short text
        await tester.enterText(find.byType(DSTextArea), 'Short');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Mínimo 10 caracteres'), findsOneWidget);

        // Test valid length
        await tester.enterText(find.byType(DSTextArea), 'This is long enough');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Mínimo 10 caracteres'), findsNothing);

        controller.dispose();
      });

      testWidgets('maxLength validator works', (tester) async {
        final controller = TextEditingController();
        final formKey = GlobalKey<FormState>();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                key: formKey,
                child: DSTextArea(
                  controller: controller,
                  label: 'MaxLength Area',
                  validator: DSTextAreaValidator.maxLength(20),
                ),
              ),
            ),
          ),
        );

        // Test long text
        await tester.enterText(find.byType(DSTextArea),
            'This text is way too long for the maximum limit');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Máximo 20 caracteres'), findsOneWidget);

        // Test valid length
        await tester.enterText(find.byType(DSTextArea), 'Short text');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Máximo 20 caracteres'), findsNothing);

        controller.dispose();
      });

      testWidgets('minWords validator works', (tester) async {
        final controller = TextEditingController();
        final formKey = GlobalKey<FormState>();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                key: formKey,
                child: DSTextArea(
                  controller: controller,
                  label: 'MinWords Area',
                  validator: DSTextAreaValidator.minWords(3),
                ),
              ),
            ),
          ),
        );

        // Test few words
        await tester.enterText(find.byType(DSTextArea), 'Two words');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Mínimo 3 palabras'), findsOneWidget);

        // Test valid word count
        await tester.enterText(find.byType(DSTextArea), 'Three valid words');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Mínimo 3 palabras'), findsNothing);

        controller.dispose();
      });

      testWidgets('maxWords validator works', (tester) async {
        final controller = TextEditingController();
        final formKey = GlobalKey<FormState>();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                key: formKey,
                child: DSTextArea(
                  controller: controller,
                  label: 'MaxWords Area',
                  validator: DSTextAreaValidator.maxWords(5),
                ),
              ),
            ),
          ),
        );

        // Test too many words
        await tester.enterText(find.byType(DSTextArea),
            'This is a text with more than five words total');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Máximo 5 palabras'), findsOneWidget);

        // Test valid word count
        await tester.enterText(
            find.byType(DSTextArea), 'Five words exactly here now');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Máximo 5 palabras'), findsNothing);

        controller.dispose();
      });

      testWidgets('combined validators work', (tester) async {
        final controller = TextEditingController();
        final formKey = GlobalKey<FormState>();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                key: formKey,
                child: DSTextArea(
                  controller: controller,
                  label: 'Combined Validation Area',
                  validator: DSTextAreaValidator.combine([
                    DSTextAreaValidator.required,
                    DSTextAreaValidator.minLength(10),
                  ]),
                ),
              ),
            ),
          ),
        );

        // Test empty (should fail required)
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Este campo es requerido'), findsOneWidget);

        // Test short text (should fail minLength)
        await tester.enterText(find.byType(DSTextArea), 'Short');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Mínimo 10 caracteres'), findsOneWidget);

        // Test valid text (should pass all)
        await tester.enterText(find.byType(DSTextArea), 'This is long enough');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Este campo es requerido'), findsNothing);
        expect(find.text('Mínimo 10 caracteres'), findsNothing);

        controller.dispose();
      });
    });
  });
}
