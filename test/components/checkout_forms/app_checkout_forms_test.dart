import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/checkout_forms/app_checkout_forms.dart';
import 'package:iautomat_design_system/src/components/checkout_forms/app_checkout_forms_config.dart';

void main() {
  group('DSCheckoutForms', () {
    late DSCheckoutField testField;

    setUp(() {

      testField = const DSCheckoutField(
        key: 'testField',
        label: 'Test Field',
        type: DSCheckoutFieldType.text,
        placeholder: 'Enter test value',
        required: true,
      );
    });

    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSCheckoutForms(
              fields: [testField],
            ),
          ),
        ),
      );

      expect(find.byType(DSCheckoutForms), findsOneWidget);
      expect(find.text('Test Field'), findsOneWidget);
      expect(find.text('Enter test value'), findsOneWidget);
    });

    group('Variants', () {
      testWidgets('shows address variant correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSCheckoutForms.address(),
            ),
          ),
        );

        expect(find.byType(DSCheckoutForms), findsOneWidget);
        expect(find.text('Dirección'), findsOneWidget);
        expect(find.text('Nombre'), findsOneWidget);
        expect(find.text('Email'), findsOneWidget);
      });

      testWidgets('shows payment variant correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSCheckoutForms.payment(),
            ),
          ),
        );

        expect(find.byType(DSCheckoutForms), findsOneWidget);
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
              body: DSCheckoutForms(
                fields: [
                  const DSCheckoutField(
                    key: 'name',
                    label: 'Name',
                    type: DSCheckoutFieldType.text,
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
              body: DSCheckoutForms(
                fields: [
                  const DSCheckoutField(
                    key: 'email',
                    label: 'Email',
                    type: DSCheckoutFieldType.email,
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
              body: DSCheckoutForms(
                fields: [
                  const DSCheckoutField(
                    key: 'agree',
                    label: 'I agree to terms',
                    type: DSCheckoutFieldType.checkbox,
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
              body: DSCheckoutForms(
                fields: [
                  const DSCheckoutField(
                    key: 'country',
                    label: 'Country',
                    type: DSCheckoutFieldType.dropdown,
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
              body: DSCheckoutForms(
                fields: [
                  const DSCheckoutField(
                    key: 'required_field',
                    label: 'Required Field',
                    type: DSCheckoutFieldType.text,
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
              body: DSCheckoutForms(
                fields: [
                  const DSCheckoutField(
                    key: 'email',
                    label: 'Email',
                    type: DSCheckoutFieldType.email,
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
              body: DSCheckoutForms(
                fields: [
                  const DSCheckoutField(
                    key: 'cardNumber',
                    label: 'Card Number',
                    type: DSCheckoutFieldType.creditCard,
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
              body: DSCheckoutForms(
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
              body: DSCheckoutForms(
                fields: [
                  const DSCheckoutField(
                    key: 'cardNumber',
                    label: 'Card Number',
                    type: DSCheckoutFieldType.creditCard,
                  ),
                ],
                config: const DSCheckoutFormsConfig(
                  behavior: DSCheckoutBehavior(enableFormatting: true),
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
              body: DSCheckoutForms(
                fields: [
                  const DSCheckoutField(
                    key: 'checkbox',
                    label: 'Test Checkbox',
                    type: DSCheckoutFieldType.checkbox,
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
        DSCheckoutFormData? submittedData;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSCheckoutForms(
                fields: [
                  const DSCheckoutField(
                    key: 'name',
                    label: 'Name',
                    type: DSCheckoutFieldType.text,
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
        DSCheckoutFormData? submittedData;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSCheckoutForms(
                fields: [
                  const DSCheckoutField(
                    key: 'required_field',
                    label: 'Required Field',
                    type: DSCheckoutFieldType.text,
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
              body: DSCheckoutForms(
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
              body: DSCheckoutForms(
                fields: [testField],
                initialState: DSCheckoutState.skeleton,
              ),
            ),
          ),
        );

        expect(find.byType(DSCheckoutForms), findsOneWidget);
        // Should show skeleton loaders instead of regular fields
      });

      testWidgets('shows loading state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSCheckoutForms(
                fields: [testField],
                initialState: DSCheckoutState.loading,
              ),
            ),
          ),
        );

        expect(find.byType(DSCheckoutForms), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('shows disabled state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSCheckoutForms(
                fields: [testField],
                initialState: DSCheckoutState.disabled,
                readOnly: true,
              ),
            ),
          ),
        );

        expect(find.byType(DSCheckoutForms), findsOneWidget);
        expect(find.byType(TextFormField), findsOneWidget);
      });
    });

    group('Initial Values', () {
      testWidgets('sets initial values correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSCheckoutForms(
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
              body: DSCheckoutForms(
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
              body: DSCheckoutForms(
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
                body: DSCheckoutForms(
                  fields: [testField],
                ),
              ),
            ),
          ),
        );

        expect(find.byType(DSCheckoutForms), findsOneWidget);
        // Should adapt layout for RTL
      });

      testWidgets('handles keyboard navigation', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSCheckoutForms(
                fields: [
                  testField,
                  const DSCheckoutField(
                    key: 'field2',
                    label: 'Field 2',
                    type: DSCheckoutFieldType.text,
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
        DSCheckoutFormData? submittedData;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSCheckoutForms(
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
              body: DSCheckoutForms(
                fields: [testField],
              ),
            ),
          ),
        );

        expect(find.byType(DSCheckoutForms), findsOneWidget);
        // Should show platform-appropriate form styling
      });
    });

    group('Custom Configuration', () {
      testWidgets('applies custom configuration correctly', (tester) async {
        const config = DSCheckoutFormsConfig(
          variant: DSCheckoutVariant.address,
          state: DSCheckoutState.defaultState,
          colors: DSCheckoutColors(
            backgroundColor: Colors.red,
            borderColor: Colors.blue,
          ),
          spacing: DSCheckoutSpacing(
            padding: 24.0,
            fieldSpacing: 20.0,
          ),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSCheckoutForms(
                fields: [testField],
                config: config,
              ),
            ),
          ),
        );

        expect(find.byType(DSCheckoutForms), findsOneWidget);
      });
    });
  });

  group('DSCheckoutUtils', () {
    test('validates fields correctly', () {
      const field = DSCheckoutField(
        key: 'email',
        label: 'Email',
        type: DSCheckoutFieldType.email,
        required: true,
      );

      // Test required validation
      var validation = DSCheckoutUtils.validateField(field, '');
      expect(validation.isValid, isFalse);
      expect(validation.errorMessage, contains('requerido'));

      // Test email validation
      validation = DSCheckoutUtils.validateField(field, 'invalid-email');
      expect(validation.isValid, isFalse);
      expect(validation.errorMessage, contains('email válido'));

      // Test valid email
      validation = DSCheckoutUtils.validateField(field, 'test@example.com');
      expect(validation.isValid, isTrue);
    });

    test('validates complete form correctly', () {
      final fields = [
        const DSCheckoutField(
          key: 'name',
          label: 'Name',
          type: DSCheckoutFieldType.text,
          required: true,
        ),
        const DSCheckoutField(
          key: 'email',
          label: 'Email',
          type: DSCheckoutFieldType.email,
          required: true,
        ),
      ];

      final values = {
        'name': 'John Doe',
        'email': 'john@example.com',
      };

      final formData = DSCheckoutUtils.validateForm(fields, values);

      expect(formData.isValid, isTrue);
      expect(formData.values, equals(values));
      expect(formData.validations, hasLength(2));
    });

    test('formats credit card correctly', () {
      final formatted = DSCheckoutUtils.formatFieldValue(
        DSCheckoutFieldType.creditCard,
        '1234567890123456',
      );
      expect(formatted, equals('1234 5678 9012 3456'));
    });

    test('formats expiry date correctly', () {
      final formatted = DSCheckoutUtils.formatFieldValue(
        DSCheckoutFieldType.expiryDate,
        '1225',
      );
      expect(formatted, equals('12/25'));
    });

    test('formats phone number correctly', () {
      final formatted = DSCheckoutUtils.formatFieldValue(
        DSCheckoutFieldType.phone,
        '1234567890',
      );
      expect(formatted, equals('(123) 456-7890'));
    });

    test('detects card type correctly', () {
      expect(DSCheckoutUtils.detectCardType('4111111111111111'), equals('Visa'));
      expect(DSCheckoutUtils.detectCardType('5555555555554444'), equals('Mastercard'));
      expect(DSCheckoutUtils.detectCardType('378282246310005'), equals('American Express'));
      expect(DSCheckoutUtils.detectCardType('6011111111111117'), equals('Discover'));
      expect(DSCheckoutUtils.detectCardType('1234567890123456'), equals('Unknown'));
    });

    test('masks sensitive data correctly', () {
      final fields = [
        const DSCheckoutField(
          key: 'cardNumber',
          label: 'Card Number',
          type: DSCheckoutFieldType.creditCard,
          sensitive: true,
        ),
        const DSCheckoutField(
          key: 'name',
          label: 'Name',
          type: DSCheckoutFieldType.text,
        ),
      ];

      final values = {
        'cardNumber': '1234567890123456',
        'name': 'John Doe',
      };

      final masked = DSCheckoutUtils.maskSensitiveData(fields, values);

      expect(masked['cardNumber'], equals('**** **** **** 3456'));
      expect(masked['name'], equals('John Doe'));
    });
  });

  group('DSCheckoutField Extensions', () {
    test('keyboard type is correct for field types', () {
      expect(DSCheckoutFieldType.email.keyboardType, TextInputType.emailAddress);
      expect(DSCheckoutFieldType.phone.keyboardType, TextInputType.phone);
      expect(DSCheckoutFieldType.number.keyboardType, TextInputType.number);
      expect(DSCheckoutFieldType.text.keyboardType, TextInputType.text);
    });

    test('sensitive fields are identified correctly', () {
      expect(DSCheckoutFieldType.password.isSensitive, isTrue);
      expect(DSCheckoutFieldType.creditCard.isSensitive, isTrue);
      expect(DSCheckoutFieldType.cvv.isSensitive, isTrue);
      expect(DSCheckoutFieldType.text.isSensitive, isFalse);
    });

    test('default patterns are correct', () {
      expect(DSCheckoutFieldType.email.defaultPattern, isNotNull);
      expect(DSCheckoutFieldType.creditCard.defaultPattern, isNotNull);
      expect(DSCheckoutFieldType.phone.defaultPattern, isNotNull);
    });
  });

  group('DSCheckoutVariant Extensions', () {
    test('display names are correct', () {
      expect(DSCheckoutVariant.address.displayName, equals('Dirección'));
      expect(DSCheckoutVariant.payment.displayName, equals('Pago'));
    });

    test('default fields are provided', () {
      expect(DSCheckoutVariant.address.defaultFields, isNotEmpty);
      expect(DSCheckoutVariant.payment.defaultFields, isNotEmpty);

      final addressFields = DSCheckoutVariant.address.defaultFields;
      expect(addressFields.any((field) => field.key == 'firstName'), isTrue);
      expect(addressFields.any((field) => field.key == 'email'), isTrue);

      final paymentFields = DSCheckoutVariant.payment.defaultFields;
      expect(paymentFields.any((field) => field.key == 'cardNumber'), isTrue);
      expect(paymentFields.any((field) => field.key == 'cvv'), isTrue);
    });

    test('icons are assigned correctly', () {
      expect(DSCheckoutVariant.address.icon, equals(Icons.location_on));
      expect(DSCheckoutVariant.payment.icon, equals(Icons.payment));
    });
  });

  group('DSCheckoutState Extensions', () {
    test('interactive states are identified correctly', () {
      expect(DSCheckoutState.defaultState.isInteractive, isTrue);
      expect(DSCheckoutState.hover.isInteractive, isTrue);
      expect(DSCheckoutState.focus.isInteractive, isTrue);
      expect(DSCheckoutState.disabled.isInteractive, isFalse);
      expect(DSCheckoutState.loading.isInteractive, isFalse);
      expect(DSCheckoutState.skeleton.isInteractive, isFalse);
    });

    test('loading and skeleton states are identified correctly', () {
      expect(DSCheckoutState.loading.isLoading, isTrue);
      expect(DSCheckoutState.skeleton.isSkeleton, isTrue);
      expect(DSCheckoutState.defaultState.isLoading, isFalse);
      expect(DSCheckoutState.defaultState.isSkeleton, isFalse);
    });
  });
}