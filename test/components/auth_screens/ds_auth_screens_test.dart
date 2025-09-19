import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSAuthScreens', () {
    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(),
            fields: const [
              DSAuthField(
                key: 'email',
                label: 'Email',
                type: DSAuthFieldType.email,
                required: true,
              ),
            ],
            providers: const [],
            onSubmit: (data) async => const DSAuthResult(success: true),
          ),
        ),
      );

      expect(find.byType(DSAuthScreens), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('shows all sign-in fields correctly', (tester) async {
      const fields = [
        DSAuthField(
          key: 'email',
          label: 'Email',
          type: DSAuthFieldType.email,
          required: true,
        ),
        DSAuthField(
          key: 'password',
          label: 'Contraseña',
          type: DSAuthFieldType.password,
          required: true,
          sensitive: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(variant: DSAuthVariant.signIn),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const DSAuthResult(success: true),
          ),
        ),
      );

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Contraseña'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
    });

    testWidgets('shows sign-up fields correctly', (tester) async {
      const fields = [
        DSAuthField(
          key: 'name',
          label: 'Nombre',
          type: DSAuthFieldType.text,
          required: true,
        ),
        DSAuthField(
          key: 'email',
          label: 'Email',
          type: DSAuthFieldType.email,
          required: true,
        ),
        DSAuthField(
          key: 'password',
          label: 'Contraseña',
          type: DSAuthFieldType.password,
          required: true,
          sensitive: true,
        ),
        DSAuthField(
          key: 'confirmPassword',
          label: 'Confirmar contraseña',
          type: DSAuthFieldType.confirmPassword,
          required: true,
          sensitive: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(variant: DSAuthVariant.signUp),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const DSAuthResult(success: true),
          ),
        ),
      );

      expect(find.text('Nombre'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Contraseña'), findsOneWidget);
      expect(find.text('Confirmar contraseña'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(4));
    });

    testWidgets('shows OTP field correctly', (tester) async {
      const fields = [
        DSAuthField(
          key: 'otp',
          label: 'Código de verificación',
          type: DSAuthFieldType.otp,
          required: true,
          maxLength: 6,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(variant: DSAuthVariant.otp),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const DSAuthResult(success: true),
            onResendOtp: () async => true,
          ),
        ),
      );

      expect(find.text('Código de verificación'), findsOneWidget);
      expect(find.text('Reenviar código'), findsOneWidget);
    });

    testWidgets('shows social providers correctly', (tester) async {
      const providers = [
        DSAuthProvider(
          id: 'google',
          name: 'google',
          displayName: 'Google',
          icon: Icons.login,
        ),
        DSAuthProvider(
          id: 'apple',
          name: 'apple',
          displayName: 'Apple',
          icon: Icons.apple,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(variant: DSAuthVariant.sso),
            fields: const [],
            providers: providers,
            onSubmit: (data) async => const DSAuthResult(success: true),
            onProviderAuth: (provider) async => const DSAuthResult(success: true),
          ),
        ),
      );

      expect(find.text('Continuar con Google'), findsOneWidget);
      expect(find.text('Continuar con Apple'), findsOneWidget);
      expect(find.byType(OutlinedButton), findsNWidgets(2));
    });

    testWidgets('toggles password visibility', (tester) async {
      const fields = [
        DSAuthField(
          key: 'password',
          label: 'Contraseña',
          type: DSAuthFieldType.password,
          required: true,
          sensitive: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const DSAuthResult(success: true),
          ),
        ),
      );

      // Verify that visibility toggle exists
      expect(find.byIcon(Icons.visibility), findsOneWidget);

      // Tap the visibility toggle
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      // After tap, icon should change to visibility_off
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });

    testWidgets('validates required fields', (tester) async {
      const fields = [
        DSAuthField(
          key: 'email',
          label: 'Email',
          type: DSAuthFieldType.email,
          required: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const DSAuthResult(success: true),
          ),
        ),
      );

      // Try to submit without filling required field
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Should show validation error
      expect(find.text('Este campo es requerido'), findsOneWidget);
    });

    testWidgets('validates email format', (tester) async {
      const fields = [
        DSAuthField(
          key: 'email',
          label: 'Email',
          type: DSAuthFieldType.email,
          required: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const DSAuthResult(success: true),
          ),
        ),
      );

      // Enter invalid email
      await tester.enterText(find.byType(TextFormField), 'invalid-email');
      await tester.pump();

      // Try to submit
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Should show validation error
      expect(find.text('Ingresa un email válido'), findsOneWidget);
    });

    testWidgets('validates password confirmation', (tester) async {
      const fields = [
        DSAuthField(
          key: 'password',
          label: 'Contraseña',
          type: DSAuthFieldType.password,
          required: true,
          sensitive: true,
        ),
        DSAuthField(
          key: 'confirmPassword',
          label: 'Confirmar contraseña',
          type: DSAuthFieldType.confirmPassword,
          required: true,
          sensitive: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const DSAuthResult(success: true),
          ),
        ),
      );

      final passwordFields = find.byType(TextFormField);

      // Enter different passwords
      await tester.enterText(passwordFields.at(0), 'password123');
      await tester.enterText(passwordFields.at(1), 'different');
      await tester.pump();

      // Try to submit
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Should show validation error
      expect(find.text('Las contraseñas no coinciden'), findsOneWidget);
    });

    testWidgets('handles form submission', (tester) async {
      bool submitted = false;
      DSAuthFormData? submittedData;

      const fields = [
        DSAuthField(
          key: 'email',
          label: 'Email',
          type: DSAuthFieldType.email,
          required: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async {
              submitted = true;
              submittedData = data;
              return const DSAuthResult(success: true);
            },
          ),
        ),
      );

      // Fill the form
      await tester.enterText(find.byType(TextFormField), 'test@example.com');
      await tester.pump();

      // Submit the form
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Wait for async operation
      await tester.pumpAndSettle();

      expect(submitted, true);
      expect(submittedData?.values['email'], 'test@example.com');
    });

    testWidgets('handles provider authentication', (tester) async {
      bool providerUsed = false;
      DSAuthProvider? usedProvider;

      const providers = [
        DSAuthProvider(
          id: 'google',
          name: 'google',
          displayName: 'Google',
          icon: Icons.login,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(),
            fields: const [],
            providers: providers,
            onSubmit: (data) async => const DSAuthResult(success: true),
            onProviderAuth: (provider) async {
              providerUsed = true;
              usedProvider = provider;
              return const DSAuthResult(success: true);
            },
          ),
        ),
      );

      // Tap the Google provider button
      await tester.tap(find.text('Continuar con Google'));
      await tester.pump();

      // Wait for async operation
      await tester.pumpAndSettle();

      expect(providerUsed, true);
      expect(usedProvider?.name, 'google');
    });

    testWidgets('shows loading state during submission', (tester) async {
      const fields = [
        DSAuthField(
          key: 'email',
          label: 'Email',
          type: DSAuthFieldType.email,
          required: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async {
              await Future.delayed(const Duration(seconds: 1));
              return const DSAuthResult(success: true);
            },
          ),
        ),
      );

      // Fill and submit form
      await tester.enterText(find.byType(TextFormField), 'test@example.com');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      // Should show loading indicator
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Wait for completion
      await tester.pumpAndSettle();

      // Loading indicator should be gone
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets('shows skeleton state correctly', (tester) async {
      const fields = [
        DSAuthField(
          key: 'email',
          label: 'Email',
          type: DSAuthFieldType.email,
          required: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(state: DSAuthState.skeleton),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const DSAuthResult(success: true),
          ),
        ),
      );

      // Should show skeleton loading state
      expect(find.byType(DSAuthScreens), findsOneWidget);
      // Note: Skeleton implementation would need more specific testing
      // based on the actual skeleton widget structure
    });

    testWidgets('handles keyboard navigation', (tester) async {
      const fields = [
        DSAuthField(
          key: 'email',
          label: 'Email',
          type: DSAuthFieldType.email,
          required: true,
        ),
        DSAuthField(
          key: 'password',
          label: 'Contraseña',
          type: DSAuthFieldType.password,
          required: true,
          sensitive: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const DSAuthResult(success: true),
          ),
        ),
      );

      final emailField = find.byType(TextFormField).first;
      final passwordField = find.byType(TextFormField).last;

      // Focus first field
      await tester.tap(emailField);
      await tester.pump();

      // Press Tab to move to next field
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();

      // Verify focus moved to password field
      final focusedNode = FocusScope.of(tester.element(passwordField));
      expect(focusedNode.hasFocus, true);
    });

    testWidgets('handles form state changes', (tester) async {
      DSAuthFormData? changedData;

      const fields = [
        DSAuthField(
          key: 'email',
          label: 'Email',
          type: DSAuthFieldType.email,
          required: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const DSAuthResult(success: true),
            onFormChanged: (data) {
              changedData = data;
            },
          ),
        ),
      );

      // Type in the email field
      await tester.enterText(find.byType(TextFormField), 'test@example.com');
      await tester.pump();

      expect(changedData?.values['email'], 'test@example.com');
      expect(changedData?.isDirty, true);
    });

    testWidgets('respects disabled state', (tester) async {
      const fields = [
        DSAuthField(
          key: 'email',
          label: 'Email',
          type: DSAuthFieldType.email,
          required: true,
          enabled: false,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: DSAuthScreens(
            config: const DSAuthScreensConfig(state: DSAuthState.disabled),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const DSAuthResult(success: true),
          ),
        ),
      );

      final textField = tester.widget<TextFormField>(find.byType(TextFormField));
      expect(textField.enabled, false);
    });
  });

  group('DSAuthUtils', () {
    test('validates email field correctly', () {
      const field = DSAuthField(
        key: 'email',
        label: 'Email',
        type: DSAuthFieldType.email,
        required: true,
      );

      // Valid email
      final validResult = DSAuthUtils.validateField(field, 'test@example.com');
      expect(validResult.isValid, true);

      // Invalid email
      final invalidResult = DSAuthUtils.validateField(field, 'invalid-email');
      expect(invalidResult.isValid, false);
      expect(invalidResult.errorMessage, 'Ingresa un email válido');

      // Empty required field
      final emptyResult = DSAuthUtils.validateField(field, '');
      expect(emptyResult.isValid, false);
      expect(emptyResult.errorMessage, 'Este campo es requerido');
    });

    test('validates password field correctly', () {
      const field = DSAuthField(
        key: 'password',
        label: 'Contraseña',
        type: DSAuthFieldType.password,
        required: true,
      );

      const config = DSAuthValidation(
        minPasswordLength: 8,
        requirePasswordUppercase: true,
        requirePasswordLowercase: true,
        requirePasswordNumber: true,
        requirePasswordSpecialChar: true,
      );

      // Valid password
      final validResult = DSAuthUtils.validateField(
        field,
        'Password123!',
        validationConfig: config,
      );
      expect(validResult.isValid, true);

      // Too short password
      final shortResult = DSAuthUtils.validateField(
        field,
        'Pass1!',
        validationConfig: config,
      );
      expect(shortResult.isValid, false);
      expect(shortResult.errorMessage, contains('8 caracteres'));

      // No uppercase
      final noUpperResult = DSAuthUtils.validateField(
        field,
        'password123!',
        validationConfig: config,
      );
      expect(noUpperResult.isValid, false);
      expect(noUpperResult.errorMessage, contains('mayúscula'));

      // No number
      final noNumberResult = DSAuthUtils.validateField(
        field,
        'Password!',
        validationConfig: config,
      );
      expect(noNumberResult.isValid, false);
      expect(noNumberResult.errorMessage, contains('número'));

      // No special character
      final noSpecialResult = DSAuthUtils.validateField(
        field,
        'Password123',
        validationConfig: config,
      );
      expect(noSpecialResult.isValid, false);
      expect(noSpecialResult.errorMessage, contains('especial'));
    });

    test('validates confirm password field correctly', () {
      const field = DSAuthField(
        key: 'confirmPassword',
        label: 'Confirmar contraseña',
        type: DSAuthFieldType.confirmPassword,
        required: true,
      );

      // Matching passwords
      final matchingResult = DSAuthUtils.validateField(
        field,
        'password123',
        confirmPasswordValue: 'password123',
      );
      expect(matchingResult.isValid, true);

      // Non-matching passwords
      final nonMatchingResult = DSAuthUtils.validateField(
        field,
        'password123',
        confirmPasswordValue: 'different',
      );
      expect(nonMatchingResult.isValid, false);
      expect(nonMatchingResult.errorMessage, 'Las contraseñas no coinciden');
    });

    test('validates OTP field correctly', () {
      const field = DSAuthField(
        key: 'otp',
        label: 'Código OTP',
        type: DSAuthFieldType.otp,
        required: true,
        maxLength: 6,
      );

      // Valid OTP
      final validResult = DSAuthUtils.validateField(field, '123456');
      expect(validResult.isValid, true);

      // Invalid length
      final shortResult = DSAuthUtils.validateField(field, '1234');
      expect(shortResult.isValid, false);
      expect(shortResult.errorMessage, contains('6 dígitos'));

      // Non-numeric
      final nonNumericResult = DSAuthUtils.validateField(field, '12a456');
      expect(nonNumericResult.isValid, false);
      expect(nonNumericResult.errorMessage, contains('números'));
    });

    test('formats field values correctly', () {
      // Phone formatting
      expect(
        DSAuthUtils.formatFieldValue(DSAuthFieldType.phone, '1234567890'),
        '(123) 456-7890',
      );

      // OTP formatting
      expect(
        DSAuthUtils.formatFieldValue(DSAuthFieldType.otp, '123abc456'),
        '123456',
      );

      // Other types remain unchanged
      expect(
        DSAuthUtils.formatFieldValue(DSAuthFieldType.text, 'test'),
        'test',
      );
    });

    test('masks sensitive data correctly', () {
      const fields = [
        DSAuthField(
          key: 'email',
          label: 'Email',
          type: DSAuthFieldType.email,
          sensitive: false,
        ),
        DSAuthField(
          key: 'password',
          label: 'Password',
          type: DSAuthFieldType.password,
          sensitive: true,
        ),
      ];

      final values = {
        'email': 'test@example.com',
        'password': 'secretpassword',
      };

      final masked = DSAuthUtils.maskSensitiveData(fields, values);

      expect(masked['email'], 'test@example.com');
      expect(masked['password'], '**************');
    });
  });

  group('DSAuthVariant Extensions', () {
    test('returns correct display names', () {
      expect(DSAuthVariant.signIn.displayName, 'Iniciar Sesión');
      expect(DSAuthVariant.signUp.displayName, 'Crear Cuenta');
      expect(DSAuthVariant.otp.displayName, 'Verificación');
      expect(DSAuthVariant.sso.displayName, 'Autenticación Social');
    });

    test('returns correct default fields', () {
      final signInFields = DSAuthVariant.signIn.defaultFields;
      expect(signInFields.length, 2);
      expect(signInFields[0].key, 'email');
      expect(signInFields[1].key, 'password');

      final signUpFields = DSAuthVariant.signUp.defaultFields;
      expect(signUpFields.length, 5);
      expect(signUpFields[0].key, 'name');
      expect(signUpFields[1].key, 'email');
      expect(signUpFields[2].key, 'password');
      expect(signUpFields[3].key, 'confirmPassword');
      expect(signUpFields[4].key, 'terms');

      final otpFields = DSAuthVariant.otp.defaultFields;
      expect(otpFields.length, 1);
      expect(otpFields[0].key, 'otp');

      final ssoFields = DSAuthVariant.sso.defaultFields;
      expect(ssoFields.length, 0);
    });
  });
}