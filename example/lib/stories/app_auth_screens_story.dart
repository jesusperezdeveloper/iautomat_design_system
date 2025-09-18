import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Stories para demostrar todas las variantes y configuraciones
/// del componente AppAuthScreens
class AppAuthScreensStory extends StatefulWidget {
  const AppAuthScreensStory({super.key});

  @override
  State<AppAuthScreensStory> createState() => _AppAuthScreensStoryState();
}

class _AppAuthScreensStoryState extends State<AppAuthScreensStory> {
  AppAuthVariant _currentVariant = AppAuthVariant.signIn;
  AppAuthState _currentState = AppAuthState.defaultState;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppAuthScreens Stories'),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
            },
          ),
        ],
      ),
      body: Theme(
        data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildControls(),
              const SizedBox(height: 24),
              _buildCurrentStory(),
              const SizedBox(height: 32),
              _buildAllVariants(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Controles',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),

            // Selector de variante
            Text(
              'Variante:',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: AppAuthVariant.values.map((variant) {
                return ChoiceChip(
                  label: Text(variant.displayName),
                  selected: _currentVariant == variant,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _currentVariant = variant;
                      });
                    }
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Selector de estado
            Text(
              'Estado:',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: AppAuthState.values.map((state) {
                return ChoiceChip(
                  label: Text(state.displayName),
                  selected: _currentState == state,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _currentState = state;
                      });
                    }
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentStory() {
    return Card(
      child: Container(
        height: 600,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ejemplo Actual: ${_currentVariant.displayName} - ${_currentState.displayName}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),

            Expanded(
              child: _buildAuthScreen(
                variant: _currentVariant,
                state: _currentState,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllVariants() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Todas las Variantes',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),

        // Sign In
        _buildVariantSection(
          title: 'Sign In',
          description: 'Pantalla de inicio de sesión con email y contraseña',
          child: _buildAuthScreen(variant: AppAuthVariant.signIn),
        ),

        const SizedBox(height: 24),

        // Sign Up
        _buildVariantSection(
          title: 'Sign Up',
          description: 'Pantalla de registro con formulario completo',
          child: _buildAuthScreen(variant: AppAuthVariant.signUp),
        ),

        const SizedBox(height: 24),

        // OTP
        _buildVariantSection(
          title: 'OTP Verification',
          description: 'Pantalla de verificación de código OTP',
          child: _buildAuthScreen(variant: AppAuthVariant.otp),
        ),

        const SizedBox(height: 24),

        // SSO
        _buildVariantSection(
          title: 'Social Sign-On',
          description: 'Pantalla con proveedores de autenticación social',
          child: _buildAuthScreen(variant: AppAuthVariant.sso),
        ),

        const SizedBox(height: 24),

        // Estados especiales
        _buildSpecialStates(),
      ],
    );
  }

  Widget _buildVariantSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 400,
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialStates() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Estados Especiales',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                // Loading State
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Loading',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 300,
                        child: _buildAuthScreen(
                          variant: AppAuthVariant.signIn,
                          state: AppAuthState.loading,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16),

                // Skeleton State
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Skeleton',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 300,
                        child: _buildAuthScreen(
                          variant: AppAuthVariant.signIn,
                          state: AppAuthState.skeleton,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16),

                // Disabled State
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Disabled',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 300,
                        child: _buildAuthScreen(
                          variant: AppAuthVariant.signIn,
                          state: AppAuthState.disabled,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthScreen({
    required AppAuthVariant variant,
    AppAuthState state = AppAuthState.defaultState,
  }) {
    final config = AppAuthScreensConfig(
      variant: variant,
      state: state,
      colors: _getColorsForVariant(variant),
      spacing: _getSpacingForVariant(variant),
      animation: const AppAuthAnimation(
        enabled: true,
        duration: Duration(milliseconds: 300),
      ),
      behavior: _getBehaviorForVariant(variant),
      a11yConfig: const AppAuthA11yConfig(),
      validation: const AppAuthValidation(),
    );

    return AppAuthScreens(
      config: config,
      fields: _getFieldsForVariant(variant),
      providers: _getProvidersForVariant(variant),
      onSubmit: _handleSubmit,
      onProviderAuth: _handleProviderAuth,
      onFormChanged: _handleFormChanged,
      onFieldValidated: _handleFieldValidated,
      onNavigate: _handleNavigate,
      onResendOtp: variant == AppAuthVariant.otp ? _handleResendOtp : null,
      logo: _buildLogo(),
      title: _getTitleForVariant(variant),
      subtitle: _getSubtitleForVariant(variant),
      footer: _buildFooter(),
      initialValues: _getInitialValuesForVariant(variant),
      autofocus: state != AppAuthState.disabled && state != AppAuthState.skeleton,
      showBackButton: variant != AppAuthVariant.signIn,
      onBack: () {
        // Simular navegación hacia atrás
        debugPrint('Back pressed for ${variant.displayName}');
      },
    );
  }

  AppAuthColors _getColorsForVariant(AppAuthVariant variant) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppAuthColors(
      backgroundColor: colorScheme.surface,
      surfaceColor: colorScheme.surface,
      primaryColor: colorScheme.primary,
      secondaryColor: colorScheme.secondary,
      fieldBackgroundColor: colorScheme.surface,
      fieldBorderColor: colorScheme.outline,
      fieldFocusedBorderColor: colorScheme.primary,
      fieldErrorBorderColor: colorScheme.error,
      titleColor: colorScheme.onSurface,
      subtitleColor: colorScheme.onSurface.withValues(alpha: 0.7),
      bodyTextColor: colorScheme.onSurface,
      labelColor: colorScheme.onSurface.withValues(alpha: 0.8),
      hintColor: colorScheme.onSurface.withValues(alpha: 0.6),
      errorColor: colorScheme.error,
      successColor: Colors.green,
      linkColor: colorScheme.primary,
      buttonPrimaryBackgroundColor: colorScheme.primary,
      buttonPrimaryTextColor: colorScheme.onPrimary,
      buttonSecondaryBackgroundColor: colorScheme.secondary,
      buttonSecondaryTextColor: colorScheme.onSecondary,
      providerBackgroundColor: colorScheme.surface,
      providerBorderColor: colorScheme.outline,
      providerTextColor: colorScheme.onSurface,
      dividerColor: colorScheme.outline,
      skeletonColor: colorScheme.onSurface.withValues(alpha: 0.1),
    );
  }

  AppAuthSpacing _getSpacingForVariant(AppAuthVariant variant) {
    return const AppAuthSpacing(
      screenPadding: EdgeInsets.all(24),
      fieldSpacing: 16,
      sectionSpacing: 32,
      elementSpacing: 8,
      fieldBorderRadius: 12,
      buttonBorderRadius: 8,
      buttonMinHeight: 56,
      fieldMinHeight: 56,
    );
  }

  AppAuthBehavior _getBehaviorForVariant(AppAuthVariant variant) {
    return AppAuthBehavior(
      autoValidate: true,
      validateOnChange: true,
      enableAutofill: true,
      enablePasswordToggle: true,
      showLogo: true,
      showHeader: true,
      otpLength: variant == AppAuthVariant.otp ? 6 : 6,
      autoSubmitOtp: variant == AppAuthVariant.otp,
    );
  }

  List<AppAuthField> _getFieldsForVariant(AppAuthVariant variant) {
    switch (variant) {
      case AppAuthVariant.signIn:
        return [
          const AppAuthField(
            key: 'email',
            label: 'Email',
            type: AppAuthFieldType.email,
            placeholder: 'ejemplo@correo.com',
            required: true,
            prefixIcon: Icons.email_outlined,
          ),
          const AppAuthField(
            key: 'password',
            label: 'Contraseña',
            type: AppAuthFieldType.password,
            placeholder: 'Ingresa tu contraseña',
            required: true,
            sensitive: true,
            prefixIcon: Icons.lock_outlined,
          ),
        ];

      case AppAuthVariant.signUp:
        return [
          const AppAuthField(
            key: 'name',
            label: 'Nombre completo',
            type: AppAuthFieldType.text,
            placeholder: 'Tu nombre completo',
            required: true,
            prefixIcon: Icons.person_outlined,
          ),
          const AppAuthField(
            key: 'email',
            label: 'Email',
            type: AppAuthFieldType.email,
            placeholder: 'ejemplo@correo.com',
            required: true,
            prefixIcon: Icons.email_outlined,
          ),
          const AppAuthField(
            key: 'password',
            label: 'Contraseña',
            type: AppAuthFieldType.password,
            placeholder: 'Crea una contraseña segura',
            required: true,
            sensitive: true,
            prefixIcon: Icons.lock_outlined,
          ),
          const AppAuthField(
            key: 'confirmPassword',
            label: 'Confirmar contraseña',
            type: AppAuthFieldType.confirmPassword,
            placeholder: 'Confirma tu contraseña',
            required: true,
            sensitive: true,
            prefixIcon: Icons.lock_outlined,
          ),
          const AppAuthField(
            key: 'terms',
            label: 'Acepto los términos y condiciones',
            type: AppAuthFieldType.terms,
            required: true,
          ),
        ];

      case AppAuthVariant.otp:
        return [
          const AppAuthField(
            key: 'otp',
            label: 'Código de verificación',
            type: AppAuthFieldType.otp,
            placeholder: '000000',
            required: true,
            maxLength: 6,
          ),
        ];

      case AppAuthVariant.sso:
        return []; // Solo proveedores sociales
    }
  }

  List<AppAuthProvider> _getProvidersForVariant(AppAuthVariant variant) {
    if (variant == AppAuthVariant.sso || variant == AppAuthVariant.signIn) {
      return [
        AppAuthProviders.google,
        AppAuthProviders.apple,
        AppAuthProviders.facebook,
        AppAuthProviders.github,
      ];
    }
    return [];
  }

  String _getTitleForVariant(AppAuthVariant variant) {
    switch (variant) {
      case AppAuthVariant.signIn:
        return 'Bienvenido de vuelta';
      case AppAuthVariant.signUp:
        return 'Crear cuenta';
      case AppAuthVariant.otp:
        return 'Verificar código';
      case AppAuthVariant.sso:
        return 'Inicia sesión con';
    }
  }

  String _getSubtitleForVariant(AppAuthVariant variant) {
    switch (variant) {
      case AppAuthVariant.signIn:
        return 'Ingresa tus credenciales para continuar';
      case AppAuthVariant.signUp:
        return 'Completa el formulario para crear tu cuenta';
      case AppAuthVariant.otp:
        return 'Ingresa el código de 6 dígitos que enviamos a tu email';
      case AppAuthVariant.sso:
        return 'Elige tu proveedor de autenticación preferido';
    }
  }

  Map<String, dynamic> _getInitialValuesForVariant(AppAuthVariant variant) {
    if (variant == AppAuthVariant.signIn) {
      return {
        'email': 'demo@iautomat.com',
      };
    }
    return {};
  }

  Widget _buildLogo() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        Icons.auto_awesome,
        size: 40,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 16),
        Text(
          'Al continuar, aceptas nuestros términos de servicio y política de privacidad',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Handlers de eventos

  Future<AppAuthResult> _handleSubmit(AppAuthFormData data) async {
    debugPrint('Form submitted: ${data.values}');

    // Simular delay de red
    await Future.delayed(const Duration(seconds: 2));

    // Simular diferentes resultados según el formulario
    if (data.values['email'] == 'error@test.com') {
      return const AppAuthResult(
        success: false,
        error: 'Credenciales inválidas',
        errorCode: 'invalid_credentials',
      );
    }

    if (data.values['email'] == 'locked@test.com') {
      return const AppAuthResult(
        success: false,
        error: 'Cuenta bloqueada temporalmente',
        errorCode: 'account_locked',
      );
    }

    return AppAuthResult(
      success: true,
      token: 'fake_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      user: {
        'id': '123',
        'name': data.values['name'] ?? 'Usuario Demo',
        'email': data.values['email'] ?? 'demo@iautomat.com',
      },
      timestamp: DateTime.now(),
    );
  }

  Future<AppAuthResult> _handleProviderAuth(AppAuthProvider provider) async {
    debugPrint('Provider auth: ${provider.name}');

    // Simular delay de OAuth
    await Future.delayed(const Duration(seconds: 1));

    return AppAuthResult(
      success: true,
      token: 'oauth_token_${provider.name}_${DateTime.now().millisecondsSinceEpoch}',
      user: {
        'id': 'oauth_${provider.name}_123',
        'name': 'Usuario ${provider.displayName}',
        'email': 'user@${provider.name}.com',
      },
      type: AppAuthResultType.social,
      provider: provider,
      timestamp: DateTime.now(),
    );
  }

  void _handleFormChanged(AppAuthFormData data) {
    debugPrint('Form changed: ${data.values.keys}');
  }

  void _handleFieldValidated(AppAuthFieldValidation validation) {
    debugPrint('Field validated: ${validation.fieldKey} -> ${validation.isValid}');
  }

  void _handleNavigate(AppAuthVariant from, AppAuthVariant to) {
    debugPrint('Navigate: $from -> $to');
    setState(() {
      _currentVariant = to;
    });
  }

  Future<bool> _handleResendOtp() async {
    debugPrint('Resending OTP...');
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}

// Extensión para agregar displayName a AppAuthState
extension AppAuthStateDisplayName on AppAuthState {
  String get displayName {
    switch (this) {
      case AppAuthState.defaultState:
        return 'Default';
      case AppAuthState.hover:
        return 'Hover';
      case AppAuthState.pressed:
        return 'Pressed';
      case AppAuthState.focus:
        return 'Focus';
      case AppAuthState.selected:
        return 'Selected';
      case AppAuthState.disabled:
        return 'Disabled';
      case AppAuthState.loading:
        return 'Loading';
      case AppAuthState.skeleton:
        return 'Skeleton';
    }
  }
}