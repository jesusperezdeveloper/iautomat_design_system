import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Stories para demostrar todas las variantes y configuraciones
/// del componente DSAuthScreens
class DSAuthScreensStory extends StatefulWidget {
  const DSAuthScreensStory({super.key});

  @override
  State<DSAuthScreensStory> createState() => _DSAuthScreensStoryState();
}

class _DSAuthScreensStoryState extends State<DSAuthScreensStory> {
  DSAuthVariant _currentVariant = DSAuthVariant.signIn;
  DSAuthState _currentState = DSAuthState.defaultState;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSAuthScreens Stories'),
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
              children: DSAuthVariant.values.map((variant) {
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
              children: DSAuthState.values.map((state) {
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
          child: _buildAuthScreen(variant: DSAuthVariant.signIn),
        ),

        const SizedBox(height: 24),

        // Sign Up
        _buildVariantSection(
          title: 'Sign Up',
          description: 'Pantalla de registro con formulario completo',
          child: _buildAuthScreen(variant: DSAuthVariant.signUp),
        ),

        const SizedBox(height: 24),

        // OTP
        _buildVariantSection(
          title: 'OTP Verification',
          description: 'Pantalla de verificación de código OTP',
          child: _buildAuthScreen(variant: DSAuthVariant.otp),
        ),

        const SizedBox(height: 24),

        // SSO
        _buildVariantSection(
          title: 'Social Sign-On',
          description: 'Pantalla con proveedores de autenticación social',
          child: _buildAuthScreen(variant: DSAuthVariant.sso),
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
                          variant: DSAuthVariant.signIn,
                          state: DSAuthState.loading,
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
                          variant: DSAuthVariant.signIn,
                          state: DSAuthState.skeleton,
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
                          variant: DSAuthVariant.signIn,
                          state: DSAuthState.disabled,
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
    required DSAuthVariant variant,
    DSAuthState state = DSAuthState.defaultState,
  }) {
    final config = DSAuthScreensConfig(
      variant: variant,
      state: state,
      colors: _getColorsForVariant(variant),
      spacing: _getSpacingForVariant(variant),
      animation: const DSAuthAnimation(
        enabled: true,
        duration: Duration(milliseconds: 300),
      ),
      behavior: _getBehaviorForVariant(variant),
      a11yConfig: const DSAuthA11yConfig(),
      validation: const DSAuthValidation(),
    );

    return DSAuthScreens(
      config: config,
      fields: _getFieldsForVariant(variant),
      providers: _getProvidersForVariant(variant),
      onSubmit: _handleSubmit,
      onProviderAuth: _handleProviderAuth,
      onFormChanged: _handleFormChanged,
      onFieldValidated: _handleFieldValidated,
      onNavigate: _handleNavigate,
      onResendOtp: variant == DSAuthVariant.otp ? _handleResendOtp : null,
      logo: _buildLogo(),
      title: _getTitleForVariant(variant),
      subtitle: _getSubtitleForVariant(variant),
      footer: _buildFooter(),
      initialValues: _getInitialValuesForVariant(variant),
      autofocus: state != DSAuthState.disabled && state != DSAuthState.skeleton,
      showBackButton: variant != DSAuthVariant.signIn,
      onBack: () {
        // Simular navegación hacia atrás
        debugPrint('Back pressed for ${variant.displayName}');
      },
    );
  }

  DSAuthColors _getColorsForVariant(DSAuthVariant variant) {
    final colorScheme = Theme.of(context).colorScheme;

    return DSAuthColors(
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

  DSAuthSpacing _getSpacingForVariant(DSAuthVariant variant) {
    return const DSAuthSpacing(
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

  DSAuthBehavior _getBehaviorForVariant(DSAuthVariant variant) {
    return DSAuthBehavior(
      autoValidate: true,
      validateOnChange: true,
      enableAutofill: true,
      enablePasswordToggle: true,
      showLogo: true,
      showHeader: true,
      otpLength: variant == DSAuthVariant.otp ? 6 : 6,
      autoSubmitOtp: variant == DSAuthVariant.otp,
    );
  }

  List<DSAuthField> _getFieldsForVariant(DSAuthVariant variant) {
    switch (variant) {
      case DSAuthVariant.signIn:
        return [
          const DSAuthField(
            key: 'email',
            label: 'Email',
            type: DSAuthFieldType.email,
            placeholder: 'ejemplo@correo.com',
            required: true,
            prefixIcon: Icons.email_outlined,
          ),
          const DSAuthField(
            key: 'password',
            label: 'Contraseña',
            type: DSAuthFieldType.password,
            placeholder: 'Ingresa tu contraseña',
            required: true,
            sensitive: true,
            prefixIcon: Icons.lock_outlined,
          ),
        ];

      case DSAuthVariant.signUp:
        return [
          const DSAuthField(
            key: 'name',
            label: 'Nombre completo',
            type: DSAuthFieldType.text,
            placeholder: 'Tu nombre completo',
            required: true,
            prefixIcon: Icons.person_outlined,
          ),
          const DSAuthField(
            key: 'email',
            label: 'Email',
            type: DSAuthFieldType.email,
            placeholder: 'ejemplo@correo.com',
            required: true,
            prefixIcon: Icons.email_outlined,
          ),
          const DSAuthField(
            key: 'password',
            label: 'Contraseña',
            type: DSAuthFieldType.password,
            placeholder: 'Crea una contraseña segura',
            required: true,
            sensitive: true,
            prefixIcon: Icons.lock_outlined,
          ),
          const DSAuthField(
            key: 'confirmPassword',
            label: 'Confirmar contraseña',
            type: DSAuthFieldType.confirmPassword,
            placeholder: 'Confirma tu contraseña',
            required: true,
            sensitive: true,
            prefixIcon: Icons.lock_outlined,
          ),
          const DSAuthField(
            key: 'terms',
            label: 'Acepto los términos y condiciones',
            type: DSAuthFieldType.terms,
            required: true,
          ),
        ];

      case DSAuthVariant.otp:
        return [
          const DSAuthField(
            key: 'otp',
            label: 'Código de verificación',
            type: DSAuthFieldType.otp,
            placeholder: '000000',
            required: true,
            maxLength: 6,
          ),
        ];

      case DSAuthVariant.sso:
        return []; // Solo proveedores sociales
    }
  }

  List<DSAuthProvider> _getProvidersForVariant(DSAuthVariant variant) {
    if (variant == DSAuthVariant.sso || variant == DSAuthVariant.signIn) {
      return [
        DSAuthProviders.google,
        DSAuthProviders.apple,
        DSAuthProviders.facebook,
        DSAuthProviders.github,
      ];
    }
    return [];
  }

  String _getTitleForVariant(DSAuthVariant variant) {
    switch (variant) {
      case DSAuthVariant.signIn:
        return 'Bienvenido de vuelta';
      case DSAuthVariant.signUp:
        return 'Crear cuenta';
      case DSAuthVariant.otp:
        return 'Verificar código';
      case DSAuthVariant.sso:
        return 'Inicia sesión con';
    }
  }

  String _getSubtitleForVariant(DSAuthVariant variant) {
    switch (variant) {
      case DSAuthVariant.signIn:
        return 'Ingresa tus credenciales para continuar';
      case DSAuthVariant.signUp:
        return 'Completa el formulario para crear tu cuenta';
      case DSAuthVariant.otp:
        return 'Ingresa el código de 6 dígitos que enviamos a tu email';
      case DSAuthVariant.sso:
        return 'Elige tu proveedor de autenticación preferido';
    }
  }

  Map<String, dynamic> _getInitialValuesForVariant(DSAuthVariant variant) {
    if (variant == DSAuthVariant.signIn) {
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

  Future<DSAuthResult> _handleSubmit(DSAuthFormData data) async {
    debugPrint('Form submitted: ${data.values}');

    // Simular delay de red
    await Future.delayed(const Duration(seconds: 2));

    // Simular diferentes resultados según el formulario
    if (data.values['email'] == 'error@test.com') {
      return const DSAuthResult(
        success: false,
        error: 'Credenciales inválidas',
        errorCode: 'invalid_credentials',
      );
    }

    if (data.values['email'] == 'locked@test.com') {
      return const DSAuthResult(
        success: false,
        error: 'Cuenta bloqueada temporalmente',
        errorCode: 'account_locked',
      );
    }

    return DSAuthResult(
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

  Future<DSAuthResult> _handleProviderAuth(DSAuthProvider provider) async {
    debugPrint('Provider auth: ${provider.name}');

    // Simular delay de OAuth
    await Future.delayed(const Duration(seconds: 1));

    return DSAuthResult(
      success: true,
      token: 'oauth_token_${provider.name}_${DateTime.now().millisecondsSinceEpoch}',
      user: {
        'id': 'oauth_${provider.name}_123',
        'name': 'Usuario ${provider.displayName}',
        'email': 'user@${provider.name}.com',
      },
      type: DSAuthResultType.social,
      provider: provider,
      timestamp: DateTime.now(),
    );
  }

  void _handleFormChanged(DSAuthFormData data) {
    debugPrint('Form changed: ${data.values.keys}');
  }

  void _handleFieldValidated(DSAuthFieldValidation validation) {
    debugPrint('Field validated: ${validation.fieldKey} -> ${validation.isValid}');
  }

  void _handleNavigate(DSAuthVariant from, DSAuthVariant to) {
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

// Extensión para agregar displayName a DSAuthState
extension DSAuthStateDisplayName on DSAuthState {
  String get displayName {
    switch (this) {
      case DSAuthState.defaultState:
        return 'Default';
      case DSAuthState.hover:
        return 'Hover';
      case DSAuthState.pressed:
        return 'Pressed';
      case DSAuthState.focus:
        return 'Focus';
      case DSAuthState.selected:
        return 'Selected';
      case DSAuthState.disabled:
        return 'Disabled';
      case DSAuthState.loading:
        return 'Loading';
      case DSAuthState.skeleton:
        return 'Skeleton';
    }
  }
}