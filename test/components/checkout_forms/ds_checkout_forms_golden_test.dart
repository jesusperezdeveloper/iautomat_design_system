import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSCheckoutForms Golden Tests', () {
    final testAddressFields = DSCheckoutVariant.address.defaultFields.take(5).toList();
    final testPaymentFields = DSCheckoutVariant.payment.defaultFields.take(4).toList();

    Widget createCheckoutWidget({
      DSCheckoutFormsConfig? config,
      List<DSCheckoutField>? fields,
      DSCheckoutVariant? variant,
      DSCheckoutState? state,
      Map<String, dynamic>? initialValues,
    }) {
      return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 600,
              height: 800,
              child: DSCheckoutForms(
                config: config,
                fields: fields ?? testAddressFields,
                variant: variant,
                initialState: state,
                initialValues: initialValues,
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('address variant default state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: DSCheckoutVariant.address,
        state: DSCheckoutState.defaultState,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_address_default.png'),
      );
    });

    testWidgets('payment variant default state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: DSCheckoutVariant.payment,
        fields: testPaymentFields,
        state: DSCheckoutState.defaultState,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_payment_default.png'),
      );
    });

    testWidgets('address variant hover state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: DSCheckoutVariant.address,
        state: DSCheckoutState.hover,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_address_hover.png'),
      );
    });

    testWidgets('payment variant focus state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: DSCheckoutVariant.payment,
        fields: testPaymentFields,
        state: DSCheckoutState.focus,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_payment_focus.png'),
      );
    });

    testWidgets('address variant loading state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: DSCheckoutVariant.address,
        state: DSCheckoutState.loading,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_address_loading.png'),
      );
    });

    testWidgets('payment variant skeleton state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: DSCheckoutVariant.payment,
        fields: testPaymentFields,
        state: DSCheckoutState.skeleton,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_payment_skeleton.png'),
      );
    });

    testWidgets('address variant disabled state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: DSCheckoutVariant.address,
        state: DSCheckoutState.disabled,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_address_disabled.png'),
      );
    });

    testWidgets('custom colors configuration', (tester) async {
      final customConfig = DSCheckoutFormsConfig(
        variant: DSCheckoutVariant.address,
        state: DSCheckoutState.defaultState,
        colors: const DSCheckoutColors(
          backgroundColor: Color(0xFFF5F5F5),
          borderColor: Colors.blue,
          focusedBorderColor: Colors.deepPurple,
          labelColor: Colors.indigo,
          buttonPrimaryColor: Colors.green,
          buttonTextColor: Colors.white,
          headerColor: Colors.orange,
          headerTextColor: Colors.black,
        ),
        spacing: const DSCheckoutSpacing(
          padding: 20.0,
          fieldSpacing: 16.0,
          borderRadius: 12.0,
        ),
      );

      await tester.pumpWidget(createCheckoutWidget(
        config: customConfig,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_custom_colors.png'),
      );
    });

    testWidgets('with initial values', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: DSCheckoutVariant.address,
        initialValues: const {
          'firstName': 'John',
          'lastName': 'Doe',
          'email': 'john.doe@example.com',
          'phone': '+1 (555) 123-4567',
          'address1': '123 Main St',
        },
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_with_values.png'),
      );
    });

    testWidgets('payment variant with card data', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: DSCheckoutVariant.payment,
        fields: testPaymentFields,
        initialValues: const {
          'cardholderName': 'John Doe',
          'cardNumber': '4111 1111 1111 1111',
          'expiryDate': '12/25',
          'cvv': '123',
        },
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_payment_filled.png'),
      );
    });

    testWidgets('RTL layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 600,
                  height: 800,
                  child: DSCheckoutForms(
                    fields: testAddressFields,
                    variant: DSCheckoutVariant.address,
                    initialState: DSCheckoutState.defaultState,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_rtl.png'),
      );
    });

    testWidgets('dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(useMaterial3: true),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 600,
                height: 800,
                child: DSCheckoutForms(
                  fields: testAddressFields,
                  variant: DSCheckoutVariant.address,
                  initialState: DSCheckoutState.defaultState,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_dark_theme.png'),
      );
    });

    testWidgets('validation errors state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: DSCheckoutVariant.address,
        initialValues: const {
          'firstName': '',
          'email': 'invalid-email',
          'phone': '123',
        },
      ));

      // Trigger validation by submitting
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_validation_errors.png'),
      );
    });

    testWidgets('compact mobile layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 360,
                height: 640,
                child: DSCheckoutForms(
                  fields: testPaymentFields,
                  variant: DSCheckoutVariant.payment,
                  initialState: DSCheckoutState.defaultState,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_mobile.png'),
      );
    });

    testWidgets('wide desktop layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 1200,
                height: 800,
                child: DSCheckoutForms(
                  fields: testAddressFields,
                  variant: DSCheckoutVariant.address,
                  initialState: DSCheckoutState.defaultState,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_desktop.png'),
      );
    });

    testWidgets('mixed field types', (tester) async {
      final mixedFields = [
        const DSCheckoutField(
          key: 'name',
          label: 'Full Name',
          type: DSCheckoutFieldType.text,
          required: true,
          flex: 2,
        ),
        const DSCheckoutField(
          key: 'email',
          label: 'Email',
          type: DSCheckoutFieldType.email,
          required: true,
          flex: 2,
        ),
        const DSCheckoutField(
          key: 'country',
          label: 'Country',
          type: DSCheckoutFieldType.dropdown,
          options: ['United States', 'Canada', 'Mexico'],
          required: true,
          flex: 1,
        ),
        const DSCheckoutField(
          key: 'newsletter',
          label: 'Subscribe to newsletter',
          type: DSCheckoutFieldType.checkbox,
          required: false,
          flex: 2,
        ),
        const DSCheckoutField(
          key: 'comments',
          label: 'Comments',
          type: DSCheckoutFieldType.text,
          placeholder: 'Optional comments...',
          maxLines: 3,
          required: false,
          flex: 2,
        ),
      ];

      await tester.pumpWidget(createCheckoutWidget(
        fields: mixedFields,
        variant: DSCheckoutVariant.address,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_mixed_fields.png'),
      );
    });

    testWidgets('pressed state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: DSCheckoutVariant.payment,
        fields: testPaymentFields,
        state: DSCheckoutState.pressed,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_pressed.png'),
      );
    });

    testWidgets('selected state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: DSCheckoutVariant.address,
        state: DSCheckoutState.selected,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_selected.png'),
      );
    });

    testWidgets('minimal configuration', (tester) async {
      final minimalFields = [
        const DSCheckoutField(
          key: 'email',
          label: 'Email',
          type: DSCheckoutFieldType.email,
          required: true,
        ),
        const DSCheckoutField(
          key: 'password',
          label: 'Password',
          type: DSCheckoutFieldType.password,
          required: true,
        ),
      ];

      final minimalConfig = DSCheckoutFormsConfig(
        variant: DSCheckoutVariant.address,
        spacing: const DSCheckoutSpacing(
          padding: 16.0,
          fieldSpacing: 12.0,
        ),
      );

      await tester.pumpWidget(createCheckoutWidget(
        config: minimalConfig,
        fields: minimalFields,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_minimal.png'),
      );
    });
  });
}