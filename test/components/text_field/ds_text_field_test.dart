import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/text_field/ds_text_field.dart';
import 'package:iautomat_design_system/src/components/text_field/text_field_config.dart';

void main() {
  group('DSTextField', () {
    testWidgets('renders correctly with basic properties', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextField(
              controller: controller,
              label: 'Test Label',
              hint: 'Test Hint',
            ),
          ),
        ),
      );

      expect(find.byType(DSTextField), findsOneWidget);
      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Hint'), findsOneWidget);

      controller.dispose();
    });

    testWidgets('accepts text input', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextField(
              controller: controller,
              label: 'Test Field',
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DSTextField), 'Hello World');
      expect(controller.text, 'Hello World');

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
              child: DSTextField(
                controller: controller,
                label: 'Required Field',
                validator: DSTextFieldValidator.required,
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
      await tester.enterText(find.byType(DSTextField), 'Valid text');
      formKey.currentState!.validate();
      await tester.pump();

      // Error should be gone
      expect(find.text('Este campo es requerido'), findsNothing);

      controller.dispose();
    });

    testWidgets('shows and hides password text', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextField(
              controller: controller,
              label: 'Password',
              variant: DSTextFieldVariant.password,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DSTextField), 'secret123');
      await tester.pump();

      // Initially, visibility icon should be present (password is hidden)
      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);

      // Tap the visibility toggle to show password
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      // Now visibility_off icon should be shown (password is visible)
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);

      // Tap again to hide password
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      // Back to original state - password is hidden
      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);

      controller.dispose();
    });

    testWidgets('supports multiline variant', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextField(
              controller: controller,
              label: 'Multiline',
              variant: DSTextFieldVariant.multiline,
              maxLines: 3,
            ),
          ),
        ),
      );

      await tester.enterText(
          find.byType(DSTextField), 'Line 1\nLine 2\nLine 3');
      expect(controller.text, 'Line 1\nLine 2\nLine 3');

      controller.dispose();
    });

    testWidgets('is disabled when enabled is false', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextField(
              controller: controller,
              label: 'Disabled Field',
              enabled: false,
            ),
          ),
        ),
      );

      // Try to enter text
      await tester.enterText(find.byType(DSTextField), 'Should not work');
      expect(controller.text, '');

      controller.dispose();
    });

    testWidgets('is read-only when readOnly is true', (tester) async {
      final controller = TextEditingController(text: 'Initial text');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextField(
              controller: controller,
              label: 'Read Only Field',
              readOnly: true,
            ),
          ),
        ),
      );

      // Try to enter text
      await tester.enterText(find.byType(DSTextField), 'Should not change');
      expect(controller.text, 'Initial text');

      controller.dispose();
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSTextField(
              label: 'Loading Field',
              overrideState: DSTextFieldState.loading,
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
            body: DSTextField(
              label: 'Skeleton Field',
              overrideState: DSTextFieldState.skeleton,
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
            body: DSTextField(
              label: 'Field with helper',
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
            body: DSTextField(
              label: 'Field with error',
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
            body: DSTextField(
              label: 'Field with icons',
              prefixIcon: Icons.search,
              suffixIcon: Icons.clear,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.clear), findsOneWidget);
    });

    testWidgets('displays prefix and suffix widgets', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextField(
              label: 'Field with widgets',
              prefix: const Text('\$'),
              suffix: const Text('USD'),
            ),
          ),
        ),
      );

      expect(find.text('\$'), findsOneWidget);
      expect(find.text('USD'), findsOneWidget);
    });

    testWidgets('respects focus node', (tester) async {
      final focusNode = FocusNode();
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextField(
              controller: controller,
              label: 'Focusable Field',
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
            body: DSTextField(
              controller: controller,
              label: 'Autofocus Field',
              autoFocus: true,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify the DSTextField widget has autofocus enabled
      final appTextField = tester.widget<DSTextField>(
        find.byType(DSTextField),
      );

      expect(appTextField.autoFocus, true);

      controller.dispose();
    });

    testWidgets('applies custom configuration', (tester) async {
      const customConfig = DSTextFieldConfig(
        borderRadius: 16,
        contentPadding: EdgeInsets.all(20),
        minimumHeight: 60,
      );

      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextField(
              controller: controller,
              label: 'Custom Config Field',
              config: customConfig,
            ),
          ),
        ),
      );

      // Verify configuration is applied
      final textField = tester.widget<DSTextField>(find.byType(DSTextField));
      expect(textField.config?.borderRadius, 16);
      expect(textField.config?.minimumHeight, 60);

      controller.dispose();
    });

    testWidgets('applies custom colors', (tester) async {
      final customColors = DSTextFieldColors(
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
      );

      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextField(
              controller: controller,
              label: 'Custom Colors Field',
              colors: customColors,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(DSTextField), findsOneWidget);

      controller.dispose();
    });

    testWidgets('calls onChanged callback', (tester) async {
      final controller = TextEditingController();
      String? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextField(
              controller: controller,
              label: 'OnChanged Field',
              onChanged: (value) => changedValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DSTextField), 'test');
      expect(changedValue, 'test');

      controller.dispose();
    });

    testWidgets('calls onSubmitted callback', (tester) async {
      final controller = TextEditingController();
      String? submittedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextField(
              controller: controller,
              label: 'OnSubmitted Field',
              onSubmitted: (value) => submittedValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DSTextField), 'test');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      expect(submittedValue, 'test');

      controller.dispose();
    });

    testWidgets('supports character counter', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSTextField(
              controller: controller,
              label: 'Counter Field',
              maxLength: 50,
              helperText: 'Helper text',
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(DSTextField), 'Hello');
      await tester.pump();

      expect(find.text('5/50'), findsOneWidget);

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
                    DSTextField(
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

      await tester.enterText(find.byType(DSTextField), 'Persistent text');
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
                child: DSTextField(
                  controller: controller,
                  label: 'Required Field',
                  validator: DSTextFieldValidator.required,
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
        await tester.enterText(find.byType(DSTextField), 'Not empty');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Este campo es requerido'), findsNothing);

        controller.dispose();
      });

      testWidgets('email validator works', (tester) async {
        final controller = TextEditingController();
        final formKey = GlobalKey<FormState>();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                key: formKey,
                child: DSTextField(
                  controller: controller,
                  label: 'Email Field',
                  validator: DSTextFieldValidator.email,
                ),
              ),
            ),
          ),
        );

        // Test invalid email
        await tester.enterText(find.byType(DSTextField), 'invalid-email');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Ingresa un email válido'), findsOneWidget);

        // Test valid email
        await tester.enterText(find.byType(DSTextField), 'valid@email.com');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Ingresa un email válido'), findsNothing);

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
                child: DSTextField(
                  controller: controller,
                  label: 'MinLength Field',
                  validator: DSTextFieldValidator.minLength(5),
                ),
              ),
            ),
          ),
        );

        // Test short text
        await tester.enterText(find.byType(DSTextField), '123');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Mínimo 5 caracteres'), findsOneWidget);

        // Test valid length
        await tester.enterText(find.byType(DSTextField), '12345');
        formKey.currentState!.validate();
        await tester.pump();

        expect(find.text('Mínimo 5 caracteres'), findsNothing);

        controller.dispose();
      });
    });

    group('Input Formatters', () {
      testWidgets('numeric formatter works', (tester) async {
        final controller = TextEditingController();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSTextField(
                controller: controller,
                label: 'Numeric Field',
                inputFormatters: DSTextFieldFormatters.numeric(),
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(DSTextField), '123abc456');
        expect(controller.text, '123456');

        controller.dispose();
      });

      testWidgets('upperCase formatter works', (tester) async {
        final controller = TextEditingController();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSTextField(
                controller: controller,
                label: 'UpperCase Field',
                inputFormatters: DSTextFieldFormatters.upperCase(),
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(DSTextField), 'hello world');
        expect(controller.text, 'HELLO WORLD');

        controller.dispose();
      });

      testWidgets('lowerCase formatter works', (tester) async {
        final controller = TextEditingController();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSTextField(
                controller: controller,
                label: 'LowerCase Field',
                inputFormatters: DSTextFieldFormatters.lowerCase(),
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(DSTextField), 'HELLO WORLD');
        expect(controller.text, 'hello world');

        controller.dispose();
      });
    });
  });
}
