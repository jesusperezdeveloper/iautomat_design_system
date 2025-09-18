import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppAuthScreens', () {
    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(),
            fields: const [
              AppAuthField(
                key: 'email',
                label: 'Email',
                type: AppAuthFieldType.email,
                required: true,
              ),
            ],
            providers: const [],
            onSubmit: (data) async => const AppAuthResult(success: true),
          ),
        ),
      );

      expect(find.byType(AppAuthScreens), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('shows all sign-in fields correctly', (tester) async {
      const fields = [
        AppAuthField(
          key: 'email',
          label: 'Email',
          type: AppAuthFieldType.email,
          required: true,
        ),
        AppAuthField(
          key: 'password',
          label: 'Contraseña',
          type: AppAuthFieldType.password,
          required: true,
          sensitive: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(variant: AppAuthVariant.signIn),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const AppAuthResult(success: true),
          ),
        ),
      );

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Contraseña'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
    });

    testWidgets('shows sign-up fields correctly', (tester) async {
      const fields = [
        AppAuthField(
          key: 'name',
          label: 'Nombre',
          type: AppAuthFieldType.text,
          required: true,
        ),
        AppAuthField(
          key: 'email',
          label: 'Email',
          type: AppAuthFieldType.email,
          required: true,
        ),
        AppAuthField(
          key: 'password',
          label: 'Contraseña',
          type: AppAuthFieldType.password,
          required: true,
          sensitive: true,
        ),
        AppAuthField(
          key: 'confirmPassword',
          label: 'Confirmar contraseña',
          type: AppAuthFieldType.confirmPassword,
          required: true,
          sensitive: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(variant: AppAuthVariant.signUp),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const AppAuthResult(success: true),
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
        AppAuthField(
          key: 'otp',
          label: 'Código de verificación',
          type: AppAuthFieldType.otp,
          required: true,
          maxLength: 6,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(variant: AppAuthVariant.otp),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const AppAuthResult(success: true),
            onResendOtp: () async => true,
          ),
        ),
      );

      expect(find.text('Código de verificación'), findsOneWidget);
      expect(find.text('Reenviar código'), findsOneWidget);
    });

    testWidgets('shows social providers correctly', (tester) async {
      const providers = [
        AppAuthProvider(
          id: 'google',
          name: 'google',
          displayName: 'Google',
          icon: Icons.login,
        ),
        AppAuthProvider(
          id: 'apple',
          name: 'apple',
          displayName: 'Apple',
          icon: Icons.apple,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(variant: AppAuthVariant.sso),
            fields: const [],
            providers: providers,
            onSubmit: (data) async => const AppAuthResult(success: true),
            onProviderAuth: (provider) async => const AppAuthResult(success: true),
          ),
        ),
      );

      expect(find.text('Continuar con Google'), findsOneWidget);
      expect(find.text('Continuar con Apple'), findsOneWidget);
      expect(find.byType(OutlinedButton), findsNWidgets(2));
    });

    testWidgets('toggles password visibility', (tester) async {
      const fields = [
        AppAuthField(
          key: 'password',
          label: 'Contraseña',
          type: AppAuthFieldType.password,
          required: true,
          sensitive: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const AppAuthResult(success: true),
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
        AppAuthField(
          key: 'email',
          label: 'Email',
          type: AppAuthFieldType.email,
          required: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const AppAuthResult(success: true),
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
        AppAuthField(
          key: 'email',
          label: 'Email',
          type: AppAuthFieldType.email,
          required: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const AppAuthResult(success: true),
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
        AppAuthField(
          key: 'password',
          label: 'Contraseña',
          type: AppAuthFieldType.password,
          required: true,
          sensitive: true,
        ),
        AppAuthField(
          key: 'confirmPassword',
          label: 'Confirmar contraseña',
          type: AppAuthFieldType.confirmPassword,
          required: true,
          sensitive: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const AppAuthResult(success: true),
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
      AppAuthFormData? submittedData;

      const fields = [
        AppAuthField(
          key: 'email',
          label: 'Email',
          type: AppAuthFieldType.email,
          required: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async {
              submitted = true;
              submittedData = data;
              return const AppAuthResult(success: true);
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
      AppAuthProvider? usedProvider;

      const providers = [
        AppAuthProvider(
          id: 'google',
          name: 'google',
          displayName: 'Google',
          icon: Icons.login,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(),
            fields: const [],
            providers: providers,
            onSubmit: (data) async => const AppAuthResult(success: true),
            onProviderAuth: (provider) async {
              providerUsed = true;
              usedProvider = provider;
              return const AppAuthResult(success: true);
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
        AppAuthField(
          key: 'email',
          label: 'Email',
          type: AppAuthFieldType.email,
          required: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async {
              await Future.delayed(const Duration(seconds: 1));
              return const AppAuthResult(success: true);
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
        AppAuthField(
          key: 'email',
          label: 'Email',
          type: AppAuthFieldType.email,
          required: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(state: AppAuthState.skeleton),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const AppAuthResult(success: true),
          ),
        ),
      );

      // Should show skeleton loading state
      expect(find.byType(AppAuthScreens), findsOneWidget);
      // Note: Skeleton implementation would need more specific testing
      // based on the actual skeleton widget structure
    });

    testWidgets('handles keyboard navigation', (tester) async {
      const fields = [
        AppAuthField(
          key: 'email',
          label: 'Email',
          type: AppAuthFieldType.email,
          required: true,
        ),
        AppAuthField(
          key: 'password',
          label: 'Contraseña',
          type: AppAuthFieldType.password,
          required: true,
          sensitive: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const AppAuthResult(success: true),
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
      AppAuthFormData? changedData;

      const fields = [
        AppAuthField(
          key: 'email',
          label: 'Email',
          type: AppAuthFieldType.email,
          required: true,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const AppAuthResult(success: true),
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
        AppAuthField(
          key: 'email',
          label: 'Email',
          type: AppAuthFieldType.email,
          required: true,
          enabled: false,
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: AppAuthScreens(
            config: const AppAuthScreensConfig(state: AppAuthState.disabled),
            fields: fields,
            providers: const [],
            onSubmit: (data) async => const AppAuthResult(success: true),
          ),
        ),
      );

      final textField = tester.widget<TextFormField>(find.byType(TextFormField));
      expect(textField.enabled, false);
    });
  });

  group('AppAuthUtils', () {
    test('validates email field correctly', () {
      const field = AppAuthField(
        key: 'email',
        label: 'Email',
        type: AppAuthFieldType.email,
        required: true,
      );

      // Valid email
      final validResult = AppAuthUtils.validateField(field, 'test@example.com');
      expect(validResult.isValid, true);

      // Invalid email
      final invalidResult = AppAuthUtils.validateField(field, 'invalid-email');
      expect(invalidResult.isValid, false);
      expect(invalidResult.errorMessage, 'Ingresa un email válido');

      // Empty required field
      final emptyResult = AppAuthUtils.validateField(field, '');
      expect(emptyResult.isValid, false);
      expect(emptyResult.errorMessage, 'Este campo es requerido');
    });

    test('validates password field correctly', () {
      const field = AppAuthField(
        key: 'password',
        label: 'Contraseña',
        type: AppAuthFieldType.password,
        required: true,
      );

      const config = AppAuthValidation(
        minPasswordLength: 8,
        requirePasswordUppercase: true,
        requirePasswordLowercase: true,
        requirePasswordNumber: true,
        requirePasswordSpecialChar: true,
      );

      // Valid password
      final validResult = AppAuthUtils.validateField(
        field,
        'Password123!',
        validationConfig: config,
      );
      expect(validResult.isValid, true);

      // Too short password
      final shortResult = AppAuthUtils.validateField(
        field,
        'Pass1!',
        validationConfig: config,
      );
      expect(shortResult.isValid, false);
      expect(shortResult.errorMessage, contains('8 caracteres'));

      // No uppercase
      final noUpperResult = AppAuthUtils.validateField(
        field,
        'password123!',
        validationConfig: config,
      );
      expect(noUpperResult.isValid, false);
      expect(noUpperResult.errorMessage, contains('mayúscula'));

      // No number
      final noNumberResult = AppAuthUtils.validateField(
        field,
        'Password!',
        validationConfig: config,
      );
      expect(noNumberResult.isValid, false);
      expect(noNumberResult.errorMessage, contains('número'));

      // No special character
      final noSpecialResult = AppAuthUtils.validateField(
        field,
        'Password123',
        validationConfig: config,
      );
      expect(noSpecialResult.isValid, false);
      expect(noSpecialResult.errorMessage, contains('especial'));
    });

    test('validates confirm password field correctly', () {
      const field = AppAuthField(
        key: 'confirmPassword',
        label: 'Confirmar contraseña',
        type: AppAuthFieldType.confirmPassword,
        required: true,
      );

      // Matching passwords
      final matchingResult = AppAuthUtils.validateField(
        field,
        'password123',
        confirmPasswordValue: 'password123',
      );
      expect(matchingResult.isValid, true);

      // Non-matching passwords
      final nonMatchingResult = AppAuthUtils.validateField(
        field,
        'password123',
        confirmPasswordValue: 'different',
      );
      expect(nonMatchingResult.isValid, false);
      expect(nonMatchingResult.errorMessage, 'Las contraseñas no coinciden');
    });

    test('validates OTP field correctly', () {
      const field = AppAuthField(
        key: 'otp',
        label: 'Código OTP',
        type: AppAuthFieldType.otp,
        required: true,
        maxLength: 6,
      );

      // Valid OTP
      final validResult = AppAuthUtils.validateField(field, '123456');
      expect(validResult.isValid, true);

      // Invalid length
      final shortResult = AppAuthUtils.validateField(field, '1234');
      expect(shortResult.isValid, false);
      expect(shortResult.errorMessage, contains('6 dígitos'));

      // Non-numeric
      final nonNumericResult = AppAuthUtils.validateField(field, '12a456');
      expect(nonNumericResult.isValid, false);
      expect(nonNumericResult.errorMessage, contains('números'));
    });

    test('formats field values correctly', () {
      // Phone formatting
      expect(
        AppAuthUtils.formatFieldValue(AppAuthFieldType.phone, '1234567890'),
        '(123) 456-7890',
      );

      // OTP formatting
      expect(
        AppAuthUtils.formatFieldValue(AppAuthFieldType.otp, '123abc456'),
        '123456',
      );

      // Other types remain unchanged
      expect(
        AppAuthUtils.formatFieldValue(AppAuthFieldType.text, 'test'),
        'test',
      );
    });

    test('masks sensitive data correctly', () {
      const fields = [
        AppAuthField(
          key: 'email',
          label: 'Email',
          type: AppAuthFieldType.email,
          sensitive: false,
        ),
        AppAuthField(
          key: 'password',
          label: 'Password',
          type: AppAuthFieldType.password,
          sensitive: true,
        ),
      ];

      final values = {
        'email': 'test@example.com',
        'password': 'secretpassword',
      };

      final masked = AppAuthUtils.maskSensitiveData(fields, values);

      expect(masked['email'], 'test@example.com');
      expect(masked['password'], '**************');
    });
  });

  group('AppAuthVariant Extensions', () {
    test('returns correct display names', () {
      expect(AppAuthVariant.signIn.displayName, 'Iniciar Sesión');
      expect(AppAuthVariant.signUp.displayName, 'Crear Cuenta');
      expect(AppAuthVariant.otp.displayName, 'Verificación');
      expect(AppAuthVariant.sso.displayName, 'Autenticación Social');
    });

    test('returns correct default fields', () {
      final signInFields = AppAuthVariant.signIn.defaultFields;
      expect(signInFields.length, 2);
      expect(signInFields[0].key, 'email');
      expect(signInFields[1].key, 'password');

      final signUpFields = AppAuthVariant.signUp.defaultFields;
      expect(signUpFields.length, 5);
      expect(signUpFields[0].key, 'name');
      expect(signUpFields[1].key, 'email');
      expect(signUpFields[2].key, 'password');
      expect(signUpFields[3].key, 'confirmPassword');
      expect(signUpFields[4].key, 'terms');

      final otpFields = AppAuthVariant.otp.defaultFields;
      expect(otpFields.length, 1);
      expect(otpFields[0].key, 'otp');

      final ssoFields = AppAuthVariant.sso.defaultFields;
      expect(ssoFields.length, 0);
    });
  });
}