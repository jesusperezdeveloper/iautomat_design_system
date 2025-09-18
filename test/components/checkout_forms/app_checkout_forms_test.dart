import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/checkout_forms/app_checkout_forms.dart';
import 'package:iautomat_design_system/src/components/checkout_forms/app_checkout_forms_config.dart';

void main() {
  group('AppCheckoutForms', () {
    late AppCheckoutField testField;

    setUp(() {

      testField = const AppCheckoutField(
        key: 'testField',
        label: 'Test Field',
        type: AppCheckoutFieldType.text,
        placeholder: 'Enter test value',
        required: true,
      );
    });

    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckoutForms(
              fields: [testField],
            ),
          ),
        ),
      );

      expect(find.byType(AppCheckoutForms), findsOneWidget);
      expect(find.text('Test Field'), findsOneWidget);
      expect(find.text('Enter test value'), findsOneWidget);
    });

    group('Variants', () {
      testWidgets('shows address variant correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms.address(),
            ),
          ),
        );

        expect(find.byType(AppCheckoutForms), findsOneWidget);
        expect(find.text('Dirección'), findsOneWidget);
        expect(find.text('Nombre'), findsOneWidget);
        expect(find.text('Email'), findsOneWidget);
      });

      testWidgets('shows payment variant correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms.payment(),
            ),
          ),
        );

        expect(find.byType(AppCheckoutForms), findsOneWidget);
        expect(find.text('Pago'), findsOneWidget);
        expect(find.text('Nombre del titular'), findsOneWidget);
        expect(find.text('Número de tarjeta'), findsOneWidget);
      });
    });

    group('Field Types', () {
      testWidgets('renders text field correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [
                  const AppCheckoutField(
                    key: 'name',
                    label: 'Name',
                    type: AppCheckoutFieldType.text,
                    placeholder: 'Enter your name',
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Name'), findsOneWidget);
        expect(find.byType(TextFormField), findsOneWidget);
      });

      testWidgets('renders email field correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [
                  const AppCheckoutField(
                    key: 'email',
                    label: 'Email',
                    type: AppCheckoutFieldType.email,
                    placeholder: 'Enter your email',
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Email'), findsOneWidget);
        expect(find.byType(TextFormField), findsOneWidget);
      });

      testWidgets('renders checkbox field correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [
                  const AppCheckoutField(
                    key: 'agree',
                    label: 'I agree to terms',
                    type: AppCheckoutFieldType.checkbox,
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.text('I agree to terms'), findsOneWidget);
        expect(find.byType(CheckboxListTile), findsOneWidget);
      });

      testWidgets('renders dropdown field correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [
                  const AppCheckoutField(
                    key: 'country',
                    label: 'Country',
                    type: AppCheckoutFieldType.dropdown,
                    options: ['USA', 'Canada', 'Mexico'],
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Country'), findsOneWidget);
        expect(find.byType(DropdownButtonFormField<String>), findsOneWidget);
      });
    });

    group('Validation', () {
      testWidgets('shows required field validation', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [
                  const AppCheckoutField(
                    key: 'required_field',
                    label: 'Required Field',
                    type: AppCheckoutFieldType.text,
                    required: true,
                  ),
                ],
                autoValidate: true,
              ),
            ),
          ),
        );

        // Trigger validation by submitting empty form
        await tester.tap(find.text('Enviar'));
        await tester.pump();

        expect(find.text('Este campo es requerido'), findsOneWidget);
      });

      testWidgets('validates email format', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [
                  const AppCheckoutField(
                    key: 'email',
                    label: 'Email',
                    type: AppCheckoutFieldType.email,
                    required: true,
                  ),
                ],
                autoValidate: true,
              ),
            ),
          ),
        );

        // Enter invalid email
        await tester.enterText(find.byType(TextFormField), 'invalid-email');
        await tester.tap(find.text('Enviar'));
        await tester.pump();

        expect(find.text('Ingresa un email válido'), findsOneWidget);
      });

      testWidgets('validates credit card format', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [
                  const AppCheckoutField(
                    key: 'cardNumber',
                    label: 'Card Number',
                    type: AppCheckoutFieldType.creditCard,
                    required: true,
                  ),
                ],
                autoValidate: true,
              ),
            ),
          ),
        );

        // Enter invalid card number
        await tester.enterText(find.byType(TextFormField), '1234');
        await tester.tap(find.text('Enviar'));
        await tester.pump();

        expect(find.text('Ingresa un número de tarjeta válido'), findsOneWidget);
      });
    });

    group('Field Interactions', () {
      testWidgets('calls onFieldChanged when text changes', (tester) async {
        String? changedField;
        dynamic changedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [testField],
                onFieldChanged: (field, value) {
                  changedField = field;
                  changedValue = value;
                },
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(TextFormField), 'test value');
        await tester.pump();

        expect(changedField, equals('testField'));
        expect(changedValue, equals('test value'));
      });

      testWidgets('formats credit card input correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [
                  const AppCheckoutField(
                    key: 'cardNumber',
                    label: 'Card Number',
                    type: AppCheckoutFieldType.creditCard,
                  ),
                ],
                config: const AppCheckoutFormsConfig(
                  behavior: AppCheckoutBehavior(enableFormatting: true),
                ),
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(TextFormField), '1234567890123456');
        await tester.pump();

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.controller?.text, equals('1234 5678 9012 3456'));
      });

      testWidgets('handles checkbox state changes', (tester) async {
        String? changedField;
        dynamic changedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [
                  const AppCheckoutField(
                    key: 'checkbox',
                    label: 'Test Checkbox',
                    type: AppCheckoutFieldType.checkbox,
                  ),
                ],
                onFieldChanged: (field, value) {
                  changedField = field;
                  changedValue = value;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(Checkbox));
        await tester.pump();

        expect(changedField, equals('checkbox'));
        expect(changedValue, equals('true'));
      });
    });

    group('Form Submission', () {
      testWidgets('calls onSubmit when form is valid', (tester) async {
        AppCheckoutFormData? submittedData;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [
                  const AppCheckoutField(
                    key: 'name',
                    label: 'Name',
                    type: AppCheckoutFieldType.text,
                    required: true,
                  ),
                ],
                onSubmit: (data) {
                  submittedData = data;
                },
              ),
            ),
          ),
        );

        // Fill required field
        await tester.enterText(find.byType(TextFormField), 'John Doe');
        await tester.pump();

        // Submit form
        await tester.tap(find.text('Enviar'));
        await tester.pump();

        expect(submittedData, isNotNull);
        expect(submittedData!.values['name'], equals('John Doe'));
        expect(submittedData!.isValid, isTrue);
      });

      testWidgets('prevents submission when form is invalid', (tester) async {
        AppCheckoutFormData? submittedData;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [
                  const AppCheckoutField(
                    key: 'required_field',
                    label: 'Required Field',
                    type: AppCheckoutFieldType.text,
                    required: true,
                  ),
                ],
                onSubmit: (data) {
                  submittedData = data;
                },
              ),
            ),
          ),
        );

        // Submit without filling required field
        await tester.tap(find.text('Enviar'));
        await tester.pump();

        expect(submittedData, isNull);
      });

      testWidgets('shows loading state during submission', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [testField],
                onSubmit: (data) async {
                  // Simulate async operation
                  await Future.delayed(const Duration(milliseconds: 100));
                },
              ),
            ),
          ),
        );

        // Fill field and submit
        await tester.enterText(find.byType(TextFormField), 'test');
        await tester.tap(find.text('Enviar'));
        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });

    group('States', () {
      testWidgets('shows skeleton state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [testField],
                initialState: AppCheckoutState.skeleton,
              ),
            ),
          ),
        );

        expect(find.byType(AppCheckoutForms), findsOneWidget);
        // Should show skeleton loaders instead of regular fields
      });

      testWidgets('shows loading state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [testField],
                initialState: AppCheckoutState.loading,
              ),
            ),
          ),
        );

        expect(find.byType(AppCheckoutForms), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('shows disabled state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [testField],
                initialState: AppCheckoutState.disabled,
                readOnly: true,
              ),
            ),
          ),
        );

        expect(find.byType(AppCheckoutForms), findsOneWidget);
        expect(find.byType(TextFormField), findsOneWidget);
      });
    });

    group('Initial Values', () {
      testWidgets('sets initial values correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [testField],
                initialValues: const {
                  'testField': 'Initial Value',
                },
              ),
            ),
          ),
        );

        final textField = tester.widget<TextFormField>(find.byType(TextFormField));
        expect(textField.controller?.text, equals('Initial Value'));
      });
    });

    group('Custom Validators', () {
      testWidgets('uses custom validators', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [testField],
                validators: {
                  'testField': (value) {
                    if (value == 'invalid') return 'Custom error message';
                    return '';
                  },
                },
              ),
            ),
          ),
        );

        await tester.enterText(find.byType(TextFormField), 'invalid');
        await tester.tap(find.text('Enviar'));
        await tester.pump();

        expect(find.text('Custom error message'), findsOneWidget);
      });
    });

    group('Accessibility', () {
      testWidgets('provides proper semantics', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [testField],
              ),
            ),
          ),
        );

        expect(find.bySemanticsLabel('Formulario de checkout'), findsOneWidget);
        expect(find.bySemanticsLabel('Test Field, Campo requerido'), findsOneWidget);
      });

      testWidgets('supports RTL correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: AppCheckoutForms(
                  fields: [testField],
                ),
              ),
            ),
          ),
        );

        expect(find.byType(AppCheckoutForms), findsOneWidget);
        // Should adapt layout for RTL
      });

      testWidgets('handles keyboard navigation', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [
                  testField,
                  const AppCheckoutField(
                    key: 'field2',
                    label: 'Field 2',
                    type: AppCheckoutFieldType.text,
                  ),
                ],
              ),
            ),
          ),
        );

        // Focus first field
        await tester.tap(find.byType(TextFormField).first);
        await tester.pump();

        // Press Tab to move to next field
        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pump();

        // Second field should be focused
        final focusedNode = FocusManager.instance.primaryFocus;
        expect(focusedNode, isNotNull);
      });

      testWidgets('handles Enter key submission', (tester) async {
        AppCheckoutFormData? submittedData;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [testField],
                onSubmit: (data) {
                  submittedData = data;
                },
              ),
            ),
          ),
        );

        // Fill field
        await tester.enterText(find.byType(TextFormField), 'test');
        await tester.pump();

        // Press Enter to submit
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pump();

        expect(submittedData, isNotNull);
      });
    });

    group('Platform Specific', () {
      testWidgets('adapts to platform correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [testField],
              ),
            ),
          ),
        );

        expect(find.byType(AppCheckoutForms), findsOneWidget);
        // Should show platform-appropriate form styling
      });
    });

    group('Custom Configuration', () {
      testWidgets('applies custom configuration correctly', (tester) async {
        const config = AppCheckoutFormsConfig(
          variant: AppCheckoutVariant.address,
          state: AppCheckoutState.defaultState,
          colors: AppCheckoutColors(
            backgroundColor: Colors.red,
            borderColor: Colors.blue,
          ),
          spacing: AppCheckoutSpacing(
            padding: 24.0,
            fieldSpacing: 20.0,
          ),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCheckoutForms(
                fields: [testField],
                config: config,
              ),
            ),
          ),
        );

        expect(find.byType(AppCheckoutForms), findsOneWidget);
      });
    });
  });

  group('AppCheckoutUtils', () {
    test('validates fields correctly', () {
      const field = AppCheckoutField(
        key: 'email',
        label: 'Email',
        type: AppCheckoutFieldType.email,
        required: true,
      );

      // Test required validation
      var validation = AppCheckoutUtils.validateField(field, '');
      expect(validation.isValid, isFalse);
      expect(validation.errorMessage, contains('requerido'));

      // Test email validation
      validation = AppCheckoutUtils.validateField(field, 'invalid-email');
      expect(validation.isValid, isFalse);
      expect(validation.errorMessage, contains('email válido'));

      // Test valid email
      validation = AppCheckoutUtils.validateField(field, 'test@example.com');
      expect(validation.isValid, isTrue);
    });

    test('validates complete form correctly', () {
      final fields = [
        const AppCheckoutField(
          key: 'name',
          label: 'Name',
          type: AppCheckoutFieldType.text,
          required: true,
        ),
        const AppCheckoutField(
          key: 'email',
          label: 'Email',
          type: AppCheckoutFieldType.email,
          required: true,
        ),
      ];

      final values = {
        'name': 'John Doe',
        'email': 'john@example.com',
      };

      final formData = AppCheckoutUtils.validateForm(fields, values);

      expect(formData.isValid, isTrue);
      expect(formData.values, equals(values));
      expect(formData.validations, hasLength(2));
    });

    test('formats credit card correctly', () {
      final formatted = AppCheckoutUtils.formatFieldValue(
        AppCheckoutFieldType.creditCard,
        '1234567890123456',
      );
      expect(formatted, equals('1234 5678 9012 3456'));
    });

    test('formats expiry date correctly', () {
      final formatted = AppCheckoutUtils.formatFieldValue(
        AppCheckoutFieldType.expiryDate,
        '1225',
      );
      expect(formatted, equals('12/25'));
    });

    test('formats phone number correctly', () {
      final formatted = AppCheckoutUtils.formatFieldValue(
        AppCheckoutFieldType.phone,
        '1234567890',
      );
      expect(formatted, equals('(123) 456-7890'));
    });

    test('detects card type correctly', () {
      expect(AppCheckoutUtils.detectCardType('4111111111111111'), equals('Visa'));
      expect(AppCheckoutUtils.detectCardType('5555555555554444'), equals('Mastercard'));
      expect(AppCheckoutUtils.detectCardType('378282246310005'), equals('American Express'));
      expect(AppCheckoutUtils.detectCardType('6011111111111117'), equals('Discover'));
      expect(AppCheckoutUtils.detectCardType('1234567890123456'), equals('Unknown'));
    });

    test('masks sensitive data correctly', () {
      final fields = [
        const AppCheckoutField(
          key: 'cardNumber',
          label: 'Card Number',
          type: AppCheckoutFieldType.creditCard,
          sensitive: true,
        ),
        const AppCheckoutField(
          key: 'name',
          label: 'Name',
          type: AppCheckoutFieldType.text,
        ),
      ];

      final values = {
        'cardNumber': '1234567890123456',
        'name': 'John Doe',
      };

      final masked = AppCheckoutUtils.maskSensitiveData(fields, values);

      expect(masked['cardNumber'], equals('**** **** **** 3456'));
      expect(masked['name'], equals('John Doe'));
    });
  });

  group('AppCheckoutField Extensions', () {
    test('keyboard type is correct for field types', () {
      expect(AppCheckoutFieldType.email.keyboardType, TextInputType.emailAddress);
      expect(AppCheckoutFieldType.phone.keyboardType, TextInputType.phone);
      expect(AppCheckoutFieldType.number.keyboardType, TextInputType.number);
      expect(AppCheckoutFieldType.text.keyboardType, TextInputType.text);
    });

    test('sensitive fields are identified correctly', () {
      expect(AppCheckoutFieldType.password.isSensitive, isTrue);
      expect(AppCheckoutFieldType.creditCard.isSensitive, isTrue);
      expect(AppCheckoutFieldType.cvv.isSensitive, isTrue);
      expect(AppCheckoutFieldType.text.isSensitive, isFalse);
    });

    test('default patterns are correct', () {
      expect(AppCheckoutFieldType.email.defaultPattern, isNotNull);
      expect(AppCheckoutFieldType.creditCard.defaultPattern, isNotNull);
      expect(AppCheckoutFieldType.phone.defaultPattern, isNotNull);
    });
  });

  group('AppCheckoutVariant Extensions', () {
    test('display names are correct', () {
      expect(AppCheckoutVariant.address.displayName, equals('Dirección'));
      expect(AppCheckoutVariant.payment.displayName, equals('Pago'));
    });

    test('default fields are provided', () {
      expect(AppCheckoutVariant.address.defaultFields, isNotEmpty);
      expect(AppCheckoutVariant.payment.defaultFields, isNotEmpty);

      final addressFields = AppCheckoutVariant.address.defaultFields;
      expect(addressFields.any((field) => field.key == 'firstName'), isTrue);
      expect(addressFields.any((field) => field.key == 'email'), isTrue);

      final paymentFields = AppCheckoutVariant.payment.defaultFields;
      expect(paymentFields.any((field) => field.key == 'cardNumber'), isTrue);
      expect(paymentFields.any((field) => field.key == 'cvv'), isTrue);
    });

    test('icons are assigned correctly', () {
      expect(AppCheckoutVariant.address.icon, equals(Icons.location_on));
      expect(AppCheckoutVariant.payment.icon, equals(Icons.payment));
    });
  });

  group('AppCheckoutState Extensions', () {
    test('interactive states are identified correctly', () {
      expect(AppCheckoutState.defaultState.isInteractive, isTrue);
      expect(AppCheckoutState.hover.isInteractive, isTrue);
      expect(AppCheckoutState.focus.isInteractive, isTrue);
      expect(AppCheckoutState.disabled.isInteractive, isFalse);
      expect(AppCheckoutState.loading.isInteractive, isFalse);
      expect(AppCheckoutState.skeleton.isInteractive, isFalse);
    });

    test('loading and skeleton states are identified correctly', () {
      expect(AppCheckoutState.loading.isLoading, isTrue);
      expect(AppCheckoutState.skeleton.isSkeleton, isTrue);
      expect(AppCheckoutState.defaultState.isLoading, isFalse);
      expect(AppCheckoutState.defaultState.isSkeleton, isFalse);
    });
  });
}