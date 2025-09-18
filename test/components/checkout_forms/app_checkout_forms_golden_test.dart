import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppCheckoutForms Golden Tests', () {
    final testAddressFields = AppCheckoutVariant.address.defaultFields.take(5).toList();
    final testPaymentFields = AppCheckoutVariant.payment.defaultFields.take(4).toList();

    Widget createCheckoutWidget({
      AppCheckoutFormsConfig? config,
      List<AppCheckoutField>? fields,
      AppCheckoutVariant? variant,
      AppCheckoutState? state,
      Map<String, dynamic>? initialValues,
    }) {
      return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 600,
              height: 800,
              child: AppCheckoutForms(
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
        variant: AppCheckoutVariant.address,
        state: AppCheckoutState.defaultState,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_address_default.png'),
      );
    });

    testWidgets('payment variant default state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: AppCheckoutVariant.payment,
        fields: testPaymentFields,
        state: AppCheckoutState.defaultState,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_payment_default.png'),
      );
    });

    testWidgets('address variant hover state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: AppCheckoutVariant.address,
        state: AppCheckoutState.hover,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_address_hover.png'),
      );
    });

    testWidgets('payment variant focus state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: AppCheckoutVariant.payment,
        fields: testPaymentFields,
        state: AppCheckoutState.focus,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_payment_focus.png'),
      );
    });

    testWidgets('address variant loading state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: AppCheckoutVariant.address,
        state: AppCheckoutState.loading,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_address_loading.png'),
      );
    });

    testWidgets('payment variant skeleton state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: AppCheckoutVariant.payment,
        fields: testPaymentFields,
        state: AppCheckoutState.skeleton,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_payment_skeleton.png'),
      );
    });

    testWidgets('address variant disabled state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: AppCheckoutVariant.address,
        state: AppCheckoutState.disabled,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_address_disabled.png'),
      );
    });

    testWidgets('custom colors configuration', (tester) async {
      final customConfig = AppCheckoutFormsConfig(
        variant: AppCheckoutVariant.address,
        state: AppCheckoutState.defaultState,
        colors: const AppCheckoutColors(
          backgroundColor: Color(0xFFF5F5F5),
          borderColor: Colors.blue,
          focusedBorderColor: Colors.deepPurple,
          labelColor: Colors.indigo,
          buttonPrimaryColor: Colors.green,
          buttonTextColor: Colors.white,
          headerColor: Colors.orange,
          headerTextColor: Colors.black,
        ),
        spacing: const AppCheckoutSpacing(
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
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_custom_colors.png'),
      );
    });

    testWidgets('with initial values', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: AppCheckoutVariant.address,
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
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_with_values.png'),
      );
    });

    testWidgets('payment variant with card data', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: AppCheckoutVariant.payment,
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
        find.byType(AppCheckoutForms),
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
                  child: AppCheckoutForms(
                    fields: testAddressFields,
                    variant: AppCheckoutVariant.address,
                    initialState: AppCheckoutState.defaultState,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
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
                child: AppCheckoutForms(
                  fields: testAddressFields,
                  variant: AppCheckoutVariant.address,
                  initialState: AppCheckoutState.defaultState,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_dark_theme.png'),
      );
    });

    testWidgets('validation errors state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: AppCheckoutVariant.address,
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
        find.byType(AppCheckoutForms),
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
                child: AppCheckoutForms(
                  fields: testPaymentFields,
                  variant: AppCheckoutVariant.payment,
                  initialState: AppCheckoutState.defaultState,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
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
                child: AppCheckoutForms(
                  fields: testAddressFields,
                  variant: AppCheckoutVariant.address,
                  initialState: AppCheckoutState.defaultState,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_desktop.png'),
      );
    });

    testWidgets('mixed field types', (tester) async {
      final mixedFields = [
        const AppCheckoutField(
          key: 'name',
          label: 'Full Name',
          type: AppCheckoutFieldType.text,
          required: true,
          flex: 2,
        ),
        const AppCheckoutField(
          key: 'email',
          label: 'Email',
          type: AppCheckoutFieldType.email,
          required: true,
          flex: 2,
        ),
        const AppCheckoutField(
          key: 'country',
          label: 'Country',
          type: AppCheckoutFieldType.dropdown,
          options: ['United States', 'Canada', 'Mexico'],
          required: true,
          flex: 1,
        ),
        const AppCheckoutField(
          key: 'newsletter',
          label: 'Subscribe to newsletter',
          type: AppCheckoutFieldType.checkbox,
          required: false,
          flex: 2,
        ),
        const AppCheckoutField(
          key: 'comments',
          label: 'Comments',
          type: AppCheckoutFieldType.text,
          placeholder: 'Optional comments...',
          maxLines: 3,
          required: false,
          flex: 2,
        ),
      ];

      await tester.pumpWidget(createCheckoutWidget(
        fields: mixedFields,
        variant: AppCheckoutVariant.address,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_mixed_fields.png'),
      );
    });

    testWidgets('pressed state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: AppCheckoutVariant.payment,
        fields: testPaymentFields,
        state: AppCheckoutState.pressed,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_pressed.png'),
      );
    });

    testWidgets('selected state', (tester) async {
      await tester.pumpWidget(createCheckoutWidget(
        variant: AppCheckoutVariant.address,
        state: AppCheckoutState.selected,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_selected.png'),
      );
    });

    testWidgets('minimal configuration', (tester) async {
      final minimalFields = [
        const AppCheckoutField(
          key: 'email',
          label: 'Email',
          type: AppCheckoutFieldType.email,
          required: true,
        ),
        const AppCheckoutField(
          key: 'password',
          label: 'Password',
          type: AppCheckoutFieldType.password,
          required: true,
        ),
      ];

      final minimalConfig = AppCheckoutFormsConfig(
        variant: AppCheckoutVariant.address,
        spacing: const AppCheckoutSpacing(
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
        find.byType(AppCheckoutForms),
        matchesGoldenFile('golden/checkout_forms_minimal.png'),
      );
    });
  });
}