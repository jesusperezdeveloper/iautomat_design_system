import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppAuthScreens Golden Tests', () {
    testWidgets('sign-in variant renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: AppAuthScreens(
                config: const AppAuthScreensConfig(
                  variant: AppAuthVariant.signIn,
                ),
                fields: const [
                  AppAuthField(
                    key: 'email',
                    label: 'Email',
                    type: AppAuthFieldType.email,
                    placeholder: 'ejemplo@correo.com',
                    required: true,
                  ),
                  AppAuthField(
                    key: 'password',
                    label: 'Contraseña',
                    type: AppAuthFieldType.password,
                    placeholder: 'Ingresa tu contraseña',
                    required: true,
                    sensitive: true,
                  ),
                ],
                providers: const [],
                onSubmit: (data) async => const AppAuthResult(success: true),
                title: 'Bienvenido de vuelta',
                subtitle: 'Ingresa tus credenciales para continuar',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAuthScreens),
        matchesGoldenFile('app_auth_screens_sign_in.png'),
      );
    });

    testWidgets('sign-up variant renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 700,
              child: AppAuthScreens(
                config: const AppAuthScreensConfig(
                  variant: AppAuthVariant.signUp,
                ),
                fields: const [
                  AppAuthField(
                    key: 'name',
                    label: 'Nombre completo',
                    type: AppAuthFieldType.text,
                    placeholder: 'Tu nombre completo',
                    required: true,
                  ),
                  AppAuthField(
                    key: 'email',
                    label: 'Email',
                    type: AppAuthFieldType.email,
                    placeholder: 'ejemplo@correo.com',
                    required: true,
                  ),
                  AppAuthField(
                    key: 'password',
                    label: 'Contraseña',
                    type: AppAuthFieldType.password,
                    placeholder: 'Crea una contraseña segura',
                    required: true,
                    sensitive: true,
                  ),
                  AppAuthField(
                    key: 'confirmPassword',
                    label: 'Confirmar contraseña',
                    type: AppAuthFieldType.confirmPassword,
                    placeholder: 'Confirma tu contraseña',
                    required: true,
                    sensitive: true,
                  ),
                ],
                providers: const [],
                onSubmit: (data) async => const AppAuthResult(success: true),
                title: 'Crear cuenta',
                subtitle: 'Completa el formulario para crear tu cuenta',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAuthScreens),
        matchesGoldenFile('app_auth_screens_sign_up.png'),
      );
    });

    testWidgets('OTP variant renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 500,
              child: AppAuthScreens(
                config: const AppAuthScreensConfig(
                  variant: AppAuthVariant.otp,
                ),
                fields: const [
                  AppAuthField(
                    key: 'otp',
                    label: 'Código de verificación',
                    type: AppAuthFieldType.otp,
                    placeholder: '000000',
                    required: true,
                    maxLength: 6,
                  ),
                ],
                providers: const [],
                onSubmit: (data) async => const AppAuthResult(success: true),
                onResendOtp: () async => true,
                title: 'Verificar código',
                subtitle: 'Ingresa el código de 6 dígitos que enviamos a tu email',
                showBackButton: true,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAuthScreens),
        matchesGoldenFile('app_auth_screens_otp.png'),
      );
    });

    testWidgets('SSO variant renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 500,
              child: AppAuthScreens(
                config: const AppAuthScreensConfig(
                  variant: AppAuthVariant.sso,
                ),
                fields: const [],
                providers: const [
                  AppAuthProvider(
                    id: 'google',
                    name: 'google',
                    displayName: 'Google',
                    icon: Icons.login,
                    backgroundColor: Colors.white,
                    textColor: Colors.black87,
                  ),
                  AppAuthProvider(
                    id: 'apple',
                    name: 'apple',
                    displayName: 'Apple',
                    icon: Icons.apple,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                  ),
                  AppAuthProvider(
                    id: 'facebook',
                    name: 'facebook',
                    displayName: 'Facebook',
                    icon: Icons.facebook,
                    backgroundColor: Color(0xFF1877F2),
                    textColor: Colors.white,
                  ),
                ],
                onSubmit: (data) async => const AppAuthResult(success: true),
                onProviderAuth: (provider) async => const AppAuthResult(success: true),
                title: 'Inicia sesión con',
                subtitle: 'Elige tu proveedor de autenticación preferido',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAuthScreens),
        matchesGoldenFile('app_auth_screens_sso.png'),
      );
    });

    testWidgets('loading state renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: AppAuthScreens(
                config: const AppAuthScreensConfig(
                  variant: AppAuthVariant.signIn,
                  state: AppAuthState.loading,
                ),
                fields: const [
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
                ],
                providers: const [],
                onSubmit: (data) async => const AppAuthResult(success: true),
                title: 'Bienvenido de vuelta',
                subtitle: 'Ingresa tus credenciales para continuar',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAuthScreens),
        matchesGoldenFile('app_auth_screens_loading.png'),
      );
    });

    testWidgets('skeleton state renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: AppAuthScreens(
                config: const AppAuthScreensConfig(
                  variant: AppAuthVariant.signIn,
                  state: AppAuthState.skeleton,
                ),
                fields: const [
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
                ],
                providers: const [],
                onSubmit: (data) async => const AppAuthResult(success: true),
              ),
            ),
          ),
        ),
      );

      // Let skeleton animation settle
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      await expectLater(
        find.byType(AppAuthScreens),
        matchesGoldenFile('app_auth_screens_skeleton.png'),
      );
    });

    testWidgets('disabled state renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: AppAuthScreens(
                config: const AppAuthScreensConfig(
                  variant: AppAuthVariant.signIn,
                  state: AppAuthState.disabled,
                ),
                fields: const [
                  AppAuthField(
                    key: 'email',
                    label: 'Email',
                    type: AppAuthFieldType.email,
                    required: true,
                    enabled: false,
                  ),
                  AppAuthField(
                    key: 'password',
                    label: 'Contraseña',
                    type: AppAuthFieldType.password,
                    required: true,
                    sensitive: true,
                    enabled: false,
                  ),
                ],
                providers: const [],
                onSubmit: (data) async => const AppAuthResult(success: true),
                title: 'Bienvenido de vuelta',
                subtitle: 'Servicio temporalmente no disponible',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAuthScreens),
        matchesGoldenFile('app_auth_screens_disabled.png'),
      );
    });

    testWidgets('dark theme renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: AppAuthScreens(
                config: const AppAuthScreensConfig(
                  variant: AppAuthVariant.signIn,
                ),
                fields: const [
                  AppAuthField(
                    key: 'email',
                    label: 'Email',
                    type: AppAuthFieldType.email,
                    placeholder: 'ejemplo@correo.com',
                    required: true,
                  ),
                  AppAuthField(
                    key: 'password',
                    label: 'Contraseña',
                    type: AppAuthFieldType.password,
                    placeholder: 'Ingresa tu contraseña',
                    required: true,
                    sensitive: true,
                  ),
                ],
                providers: const [
                  AppAuthProvider(
                    id: 'google',
                    name: 'google',
                    displayName: 'Google',
                    icon: Icons.login,
                  ),
                ],
                onSubmit: (data) async => const AppAuthResult(success: true),
                onProviderAuth: (provider) async => const AppAuthResult(success: true),
                title: 'Bienvenido de vuelta',
                subtitle: 'Ingresa tus credenciales para continuar',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAuthScreens),
        matchesGoldenFile('app_auth_screens_dark_theme.png'),
      );
    });

    testWidgets('compact layout renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 300,
              height: 500,
              child: AppAuthScreens(
                config: const AppAuthScreensConfig(
                  variant: AppAuthVariant.signIn,
                  spacing: AppAuthSpacing(
                    screenPadding: EdgeInsets.all(16),
                    fieldSpacing: 12,
                    sectionSpacing: 24,
                    fieldBorderRadius: 8,
                    buttonBorderRadius: 6,
                  ),
                ),
                fields: const [
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
                ],
                providers: const [],
                onSubmit: (data) async => const AppAuthResult(success: true),
                title: 'Iniciar Sesión',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAuthScreens),
        matchesGoldenFile('app_auth_screens_compact.png'),
      );
    });

    testWidgets('with validation errors renders correctly', (tester) async {
      final GlobalKey<FormState> formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 400,
              height: 600,
              child: AppAuthScreens(
                config: const AppAuthScreensConfig(
                  variant: AppAuthVariant.signIn,
                  validation: AppAuthValidation(
                    showErrorMessages: true,
                  ),
                ),
                fields: const [
                  AppAuthField(
                    key: 'email',
                    label: 'Email',
                    type: AppAuthFieldType.email,
                    placeholder: 'ejemplo@correo.com',
                    required: true,
                  ),
                  AppAuthField(
                    key: 'password',
                    label: 'Contraseña',
                    type: AppAuthFieldType.password,
                    placeholder: 'Ingresa tu contraseña',
                    required: true,
                    sensitive: true,
                  ),
                ],
                providers: const [],
                onSubmit: (data) async => const AppAuthResult(success: true),
                formKey: formKey,
                title: 'Bienvenido de vuelta',
                subtitle: 'Ingresa tus credenciales para continuar',
              ),
            ),
          ),
        ),
      );

      // Enter invalid data
      await tester.enterText(find.byType(TextFormField).first, 'invalid-email');
      await tester.enterText(find.byType(TextFormField).last, '123'); // Too short

      // Trigger validation
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      await expectLater(
        find.byType(AppAuthScreens),
        matchesGoldenFile('app_auth_screens_validation_errors.png'),
      );
    });

    testWidgets('tablet layout renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 768,
              height: 600,
              child: AppAuthScreens(
                config: const AppAuthScreensConfig(
                  variant: AppAuthVariant.signIn,
                ),
                fields: const [
                  AppAuthField(
                    key: 'email',
                    label: 'Email',
                    type: AppAuthFieldType.email,
                    placeholder: 'ejemplo@correo.com',
                    required: true,
                  ),
                  AppAuthField(
                    key: 'password',
                    label: 'Contraseña',
                    type: AppAuthFieldType.password,
                    placeholder: 'Ingresa tu contraseña',
                    required: true,
                    sensitive: true,
                  ),
                ],
                providers: const [
                  AppAuthProvider(
                    id: 'google',
                    name: 'google',
                    displayName: 'Google',
                    icon: Icons.login,
                  ),
                ],
                onSubmit: (data) async => const AppAuthResult(success: true),
                onProviderAuth: (provider) async => const AppAuthResult(success: true),
                title: 'Bienvenido de vuelta',
                subtitle: 'Ingresa tus credenciales para continuar',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAuthScreens),
        matchesGoldenFile('app_auth_screens_tablet.png'),
      );
    });

    testWidgets('desktop layout renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SizedBox(
              width: 1200,
              height: 800,
              child: AppAuthScreens(
                config: const AppAuthScreensConfig(
                  variant: AppAuthVariant.signIn,
                ),
                fields: const [
                  AppAuthField(
                    key: 'email',
                    label: 'Email',
                    type: AppAuthFieldType.email,
                    placeholder: 'ejemplo@correo.com',
                    required: true,
                  ),
                  AppAuthField(
                    key: 'password',
                    label: 'Contraseña',
                    type: AppAuthFieldType.password,
                    placeholder: 'Ingresa tu contraseña',
                    required: true,
                    sensitive: true,
                  ),
                ],
                providers: const [
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
                ],
                onSubmit: (data) async => const AppAuthResult(success: true),
                onProviderAuth: (provider) async => const AppAuthResult(success: true),
                title: 'Bienvenido de vuelta',
                subtitle: 'Ingresa tus credenciales para continuar',
                logo: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppAuthScreens),
        matchesGoldenFile('app_auth_screens_desktop.png'),
      );
    });
  });
}