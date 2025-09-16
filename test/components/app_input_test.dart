import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/inputs/app_input.dart';
import 'package:iautomat_design_system/src/components/inputs/input_styles.dart';
import 'package:iautomat_design_system/src/components/inputs/validators.dart';
import 'package:iautomat_design_system/src/theme/app_theme.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';
import 'package:iautomat_design_system/src/theme/spacing.dart';

void main() {
  group('AppInput', () {
    group('Rendering', () {
      testWidgets('should render with basic properties', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Test Input',
                hint: 'Enter text here',
              ),
            ),
          ),
        );

        expect(find.byType(AppInput), findsOneWidget);
        expect(find.byType(TextFormField), findsOneWidget);
      });

      testWidgets('should render all input types', (tester) async {
        const types = [
          InputType.text,
          InputType.email,
          InputType.password,
          InputType.number,
          InputType.multiline,
          InputType.search,
          InputType.url,
          InputType.phone,
        ];

        for (final type in types) {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AppInput(
                  label: 'Test ${type.name}',
                  type: type,
                ),
              ),
            ),
          );

          expect(find.byType(AppInput), findsOneWidget);
          expect(find.byType(TextFormField), findsOneWidget);
          await tester.pumpAndSettle();
        }
      });

      testWidgets('should render with prefix icon', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'With Icon',
                prefixIcon: Icons.email,
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.email), findsOneWidget);
      });

      testWidgets('should render with suffix icon', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'With Suffix',
                suffixIcon: Icons.info,
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.info), findsOneWidget);
      });

      testWidgets('should render with prefix and suffix text', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'With Text',
                prefixText: '$',
                suffixText: '.00',
              ),
            ),
          ),
        );

        final textFormField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textFormField.decoration?.prefixText, '\$');
        expect(textFormField.decoration?.suffixText, '.00');
      });

      testWidgets('should render custom widgets as prefix/suffix', (tester) async {
        const prefixWidget = Icon(Icons.attach_money);
        const suffixWidget = Text('USD');

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Custom Widgets',
                prefixWidget: prefixWidget,
                suffixWidget: suffixWidget,
              ),
            ),
          ),
        );

        expect(find.byWidget(prefixWidget), findsOneWidget);
        expect(find.byWidget(suffixWidget), findsOneWidget);
      });
    });

    group('Input Types', () {
      testWidgets('email input should have email keyboard', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput.email(
                label: 'Email',
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.keyboardType, TextInputType.emailAddress);
      });

      testWidgets('password input should obscure text', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput.password(
                label: 'Password',
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.obscureText, isTrue);
      });

      testWidgets('number input should have numeric keyboard', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Number',
                type: InputType.number,
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.keyboardType, TextInputType.number);
      });

      testWidgets('multiline input should support multiple lines', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput.multiline(
                label: 'Multiline',
                maxLines: 5,
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.maxLines, 5);
        expect(textField.keyboardType, TextInputType.multiline);
      });

      testWidgets('search input should have search action', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput.search(
                label: 'Search',
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.textInputAction, TextInputAction.search);
      });

      testWidgets('phone input should have phone keyboard', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Phone',
                type: InputType.phone,
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.keyboardType, TextInputType.phone);
      });

      testWidgets('url input should have url keyboard', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'URL',
                type: InputType.url,
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.keyboardType, TextInputType.url);
      });
    });

    group('States', () {
      testWidgets('should be enabled by default', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Enabled Input',
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.enabled, isTrue);
      });

      testWidgets('should be disabled when enabled is false', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Disabled Input',
                enabled: false,
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.enabled, isFalse);
      });

      testWidgets('should be readonly when readOnly is true', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'ReadOnly Input',
                readOnly: true,
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.readOnly, isTrue);
      });

      testWidgets('should handle focus changes', (tester) async {
        final focusNode = FocusNode();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Focus Test',
                focusNode: focusNode,
              ),
            ),
          ),
        );

        expect(focusNode.hasFocus, isFalse);

        await tester.tap(find.byType(AppInput));
        await tester.pumpAndSettle();

        expect(focusNode.hasFocus, isTrue);
      });
    });

    group('Text Input and Changes', () {
      testWidgets('should handle text input', (tester) async {
        String? changedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Text Input',
                onChanged: (value) => changedValue = value,
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(AppInput), 'Hello World');
        expect(changedValue, 'Hello World');
      });

      testWidgets('should handle submission', (tester) async {
        String? submittedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Submit Test',
                onSubmitted: (value) => submittedValue = value,
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(AppInput), 'Submit Test');
        await tester.testTextInput.receiveAction(TextInputAction.done);

        expect(submittedValue, 'Submit Test');
      });

      testWidgets('should handle initial value', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Initial Value',
                initialValue: 'Initial Text',
              ),
            ),
          ),
        );

        expect(find.text('Initial Text'), findsOneWidget);
      });

      testWidgets('should work with controller', (tester) async {
        final controller = TextEditingController(text: 'Controller Text');

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Controller Test',
                controller: controller,
              ),
            ),
          ),
        );

        expect(find.text('Controller Text'), findsOneWidget);

        controller.text = 'Updated Text';
        await tester.pumpAndSettle();

        expect(find.text('Updated Text'), findsOneWidget);
      });
    });

    group('Validation', () {
      testWidgets('should show validation error', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                child: AppInput(
                  label: 'Validation Test',
                  validator: (value) => value?.isEmpty == true ? 'Required field' : null,
                  autovalidateMode: AutovalidateMode.always,
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.text('Required field'), findsOneWidget);
      });

      testWidgets('should validate email format', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                child: AppInput.email(
                  label: 'Email',
                  validator: Validators.email(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
            ),
          ),
        );

        // Enter invalid email
        await tester.enterText(find.byType(AppInput), 'invalid-email');
        await tester.pumpAndSettle();

        expect(find.text('Ingresa un email válido'), findsOneWidget);

        // Enter valid email
        await tester.enterText(find.byType(AppInput), 'test@example.com');
        await tester.pumpAndSettle();

        expect(find.text('Ingresa un email válido'), findsNothing);
      });

      testWidgets('should validate required field', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                child: AppInput(
                  label: 'Required',
                  validator: Validators.required(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
            ),
          ),
        );

        // Tap field and leave empty
        await tester.tap(find.byType(AppInput));
        await tester.pumpAndSettle();
        await tester.tap(find.byType(Scaffold));
        await tester.pumpAndSettle();

        expect(find.text('Este campo es obligatorio'), findsOneWidget);
      });

      testWidgets('should validate password strength', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                child: AppInput.password(
                  label: 'Password',
                  validator: Validators.password(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
            ),
          ),
        );

        // Enter weak password
        await tester.enterText(find.byType(AppInput), '123');
        await tester.pumpAndSettle();

        // Should show validation error
        expect(find.text('La contraseña debe tener al menos 8 caracteres'), findsOneWidget);
      });

      testWidgets('should validate phone number format', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Form(
                child: AppInput(
                  label: 'Phone',
                  type: InputType.phone,
                  validator: Validators.phone(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
            ),
          ),
        );

        // Enter invalid phone
        await tester.enterText(find.byType(AppInput), '123');
        await tester.pumpAndSettle();

        expect(find.text('Ingresa un número de teléfono válido'), findsOneWidget);

        // Enter valid phone
        await tester.enterText(find.byType(AppInput), '+1234567890');
        await tester.pumpAndSettle();

        expect(find.text('Ingresa un número de teléfono válido'), findsNothing);
      });
    });

    group('Clear Button', () {
      testWidgets('should show clear button when text is not empty and focused', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Clear Test',
                showClearButton: true,
              ),
            ),
          ),
        );

        // Enter text
        await tester.enterText(find.byType(AppInput), 'Some text');
        await tester.pumpAndSettle();

        // Tap to focus
        await tester.tap(find.byType(AppInput));
        await tester.pumpAndSettle();

        // Should show clear button
        expect(find.byIcon(Icons.clear), findsOneWidget);
      });

      testWidgets('should clear text when clear button is pressed', (tester) async {
        String? currentValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Clear Test',
                showClearButton: true,
                onChanged: (value) => currentValue = value,
              ),
            ),
          ),
        );

        // Enter text and focus
        await tester.enterText(find.byType(AppInput), 'Text to clear');
        await tester.tap(find.byType(AppInput));
        await tester.pumpAndSettle();

        expect(currentValue, 'Text to clear');

        // Tap clear button
        await tester.tap(find.byIcon(Icons.clear));
        await tester.pumpAndSettle();

        expect(currentValue, '');
        expect(find.text('Text to clear'), findsNothing);
      });

      testWidgets('should not show clear button when disabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'No Clear',
                showClearButton: false,
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(AppInput), 'Some text');
        await tester.tap(find.byType(AppInput));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.clear), findsNothing);
      });
    });

    group('Password Visibility Toggle', () {
      testWidgets('should show visibility toggle for password input', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput.password(
                label: 'Password',
                showVisibilityToggle: true,
              ),
            ),
          ),
        );

        // Should show visibility icon (initially showing visibility since text is obscured)
        expect(find.byIcon(Icons.visibility), findsOneWidget);
      });

      testWidgets('should toggle password visibility', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput.password(
                label: 'Password',
                showVisibilityToggle: true,
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.obscureText, isTrue);

        // Tap visibility toggle
        await tester.tap(find.byIcon(Icons.visibility));
        await tester.pumpAndSettle();

        final updatedTextField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(updatedTextField.obscureText, isFalse);

        // Should now show visibility_off icon
        expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      });

      testWidgets('should not show visibility toggle when disabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput.password(
                label: 'Password',
                showVisibilityToggle: false,
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.visibility), findsNothing);
        expect(find.byIcon(Icons.visibility_off), findsNothing);
      });
    });

    group('Character Counter', () {
      testWidgets('should show character counter when enabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Counter Test',
                maxLength: 10,
                showCounter: true,
              ),
            ),
          ),
        );

        expect(find.text('0/10'), findsOneWidget);
      });

      testWidgets('should update character counter as text changes', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Counter Test',
                maxLength: 10,
                showCounter: true,
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(AppInput), 'Hello');
        await tester.pumpAndSettle();

        expect(find.text('5/10'), findsOneWidget);
      });

      testWidgets('should not show counter when disabled', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'No Counter',
                maxLength: 10,
                showCounter: false,
              ),
            ),
          ),
        );

        expect(find.text('0/10'), findsNothing);
      });
    });

    group('Accessibility', () {
      testWidgets('should have proper semantics', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Accessible Input',
                semanticsLabel: 'Custom Semantic Label',
              ),
            ),
          ),
        );

        expect(find.byType(Semantics), findsOneWidget);
      });

      testWidgets('should show tooltip when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Input with Tooltip',
                tooltip: 'This is helpful information',
              ),
            ),
          ),
        );

        expect(find.byType(Tooltip), findsOneWidget);

        final tooltip = tester.widget<Tooltip>(find.byType(Tooltip));
        expect(tooltip.message, 'This is helpful information');
      });

      testWidgets('should handle tap gesture for accessibility', (tester) async {
        bool tapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Tap Test',
                onTap: () => tapped = true,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppInput));
        expect(tapped, isTrue);
      });
    });

    group('Input Formatting', () {
      testWidgets('should apply input formatters', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Formatted Input',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(5),
                ],
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(AppInput), 'abc123def456');
        await tester.pumpAndSettle();

        // Should only keep digits and limit to 5 characters
        expect(find.text('12345'), findsOneWidget);
      });

      testWidgets('should handle max length constraint', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Max Length',
                maxLength: 5,
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(AppInput), '1234567890');
        await tester.pumpAndSettle();

        // Should be limited to 5 characters
        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.controller?.text.length, lessThanOrEqualTo(5));
      });
    });

    group('Input Group', () {
      testWidgets('AppInputGroup should render multiple inputs with proper spacing', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInputGroup(
                spacing: 20,
                children: [
                  AppInput(label: 'First Input'),
                  AppInput(label: 'Second Input'),
                  AppInput(label: 'Third Input'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppInputGroup), findsOneWidget);
        expect(find.text('First Input'), findsOneWidget);
        expect(find.text('Second Input'), findsOneWidget);
        expect(find.text('Third Input'), findsOneWidget);
      });
    });

    group('Extension Methods', () {
      testWidgets('copyWith should create input with modified properties', (tester) async {
        final originalInput = AppInput(
          label: 'Original',
          type: InputType.text,
        );

        final copiedInput = originalInput.copyWith(
          label: 'Modified',
          type: InputType.email,
        );

        expect(copiedInput.label, 'Modified');
        expect(copiedInput.type, InputType.email);
      });
    });

    group('Error Handling', () {
      testWidgets('should not allow both controller and initialValue', (tester) async {
        expect(
          () => AppInput(
            controller: TextEditingController(),
            initialValue: 'Initial',
          ),
          throwsAssertionError,
        );
      });
    });

    group('Theme Integration', () {
      testWidgets('should adapt to light theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: Scaffold(
              body: AppInput(
                label: 'Light Theme',
              ),
            ),
          ),
        );

        expect(find.byType(AppInput), findsOneWidget);
      });

      testWidgets('should adapt to dark theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.darkTheme,
            home: Scaffold(
              body: AppInput(
                label: 'Dark Theme',
              ),
            ),
          ),
        );

        expect(find.byType(AppInput), findsOneWidget);
      });
    });

    group('Performance', () {
      testWidgets('should handle rapid text changes efficiently', (tester) async {
        int changeCount = 0;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Performance Test',
                onChanged: (value) => changeCount++,
              ),
            ),
          ),
        );

        // Rapidly change text
        for (int i = 0; i < 10; i++) {
          await tester.enterText(find.byType(AppInput), 'Text $i');
        }

        // Should handle all changes
        expect(changeCount, 10);
      });
    });

    group('Design System Consistency', () {
      testWidgets('should use consistent spacing from design system', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Spacing Test',
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));

        // Should use design system padding
        expect(textField.decoration?.contentPadding, AppSpacing.inputPadding);
      });

      testWidgets('should use consistent border radius', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppInput(
                label: 'Border Test',
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        final border = textField.decoration?.border as OutlineInputBorder?;

        expect(border?.borderRadius, AppInputStyles.borderRadius);
      });
    });
  });
}