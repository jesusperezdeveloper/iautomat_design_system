import 'package:flutter/material.dart';
import 'app_text_field.dart';
import 'text_field_config.dart';

class TextFieldStory extends StatelessWidget {
  const TextFieldStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppTextField Stories'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StorySection(
              title: 'Single Line Text Fields',
              child: _SingleLineStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Multiline Text Fields',
              child: _MultilineStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Password Fields',
              child: _PasswordStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'With Icons and Actions',
              child: _WithIconsStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Validation Examples',
              child: _ValidationStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Input Formatters',
              child: _InputFormattersStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Interactive States',
              child: _InteractiveStatesStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Platform Adaptive',
              child: _PlatformAdaptiveStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'RTL Support',
              child: _RtlSupportStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Custom Configuration',
              child: _CustomConfigStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Accessibility',
              child: _AccessibilityStory(),
            ),
          ],
        ),
      ),
    );
  }
}

class _StorySection extends StatelessWidget {
  final String title;
  final Widget child;

  const _StorySection({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ],
    );
  }
}

class _SingleLineStory extends StatefulWidget {
  const _SingleLineStory();

  @override
  State<_SingleLineStory> createState() => _SingleLineStoryState();
}

class _SingleLineStoryState extends State<_SingleLineStory> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: _controller1,
          label: 'Nombre completo',
          hint: 'Ingresa tu nombre',
          variant: AppTextFieldVariant.single,
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: _controller2,
          label: 'Email',
          hint: 'ejemplo@correo.com',
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icons.email,
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: _controller3,
          label: 'Teléfono',
          hint: '123 456 7890',
          keyboardType: TextInputType.phone,
          prefixIcon: Icons.phone,
          inputFormatters: AppTextFieldFormatters.phoneNumber(),
        ),
        const SizedBox(height: 16),
        const AppTextField(
          label: 'Campo deshabilitado',
          hint: 'No puedes escribir aquí',
          enabled: false,
        ),
        const SizedBox(height: 16),
        const AppTextField(
          label: 'Campo de solo lectura',
          hint: 'Solo lectura',
          readOnly: true,
        ),
        const SizedBox(height: 16),
        const AppTextField(
          label: 'Estado de carga',
          hint: 'Cargando...',
          overrideState: AppTextFieldState.loading,
        ),
        const SizedBox(height: 16),
        const AppTextField(
          label: 'Estado skeleton',
          overrideState: AppTextFieldState.skeleton,
        ),
      ],
    );
  }
}

class _MultilineStory extends StatefulWidget {
  const _MultilineStory();

  @override
  State<_MultilineStory> createState() => _MultilineStoryState();
}

class _MultilineStoryState extends State<_MultilineStory> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: _controller1,
          label: 'Descripción',
          hint: 'Escribe una descripción detallada...',
          variant: AppTextFieldVariant.multiline,
          maxLines: 4,
          helperText: 'Máximo 500 caracteres',
          maxLength: 500,
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: _controller2,
          label: 'Comentarios',
          hint: 'Comparte tus comentarios...',
          variant: AppTextFieldVariant.multiline,
          minLines: 3,
          maxLines: 6,
        ),
        const SizedBox(height: 16),
        const AppTextField(
          label: 'Multiline deshabilitado',
          hint: 'Campo multilinea deshabilitado',
          variant: AppTextFieldVariant.multiline,
          enabled: false,
          maxLines: 3,
        ),
      ],
    );
  }
}

class _PasswordStory extends StatefulWidget {
  const _PasswordStory();

  @override
  State<_PasswordStory> createState() => _PasswordStoryState();
}

class _PasswordStoryState extends State<_PasswordStory> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: _passwordController,
          label: 'Contraseña',
          hint: 'Ingresa tu contraseña',
          variant: AppTextFieldVariant.password,
          validator: AppTextFieldValidator.combine([
            AppTextFieldValidator.required,
            AppTextFieldValidator.minLength(8),
          ]),
          helperText: 'Mínimo 8 caracteres',
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: _confirmPasswordController,
          label: 'Confirmar contraseña',
          hint: 'Confirma tu contraseña',
          variant: AppTextFieldVariant.password,
          validator: (value) {
            if (value != _passwordController.text) {
              return 'Las contraseñas no coinciden';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        const AppTextField(
          label: 'Contraseña deshabilitada',
          hint: 'Contraseña deshabilitada',
          variant: AppTextFieldVariant.password,
          enabled: false,
        ),
      ],
    );
  }
}

class _WithIconsStory extends StatefulWidget {
  const _WithIconsStory();

  @override
  State<_WithIconsStory> createState() => _WithIconsStoryState();
}

class _WithIconsStoryState extends State<_WithIconsStory> {
  final _searchController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: _searchController,
          label: 'Buscar',
          hint: 'Buscar productos...',
          prefixIcon: Icons.search,
          suffixIcon: Icons.mic,
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: _amountController,
          label: 'Monto',
          hint: '0.00',
          keyboardType: TextInputType.number,
          prefix: const Padding(
            padding: EdgeInsets.only(left: 12, right: 8),
            child: Text('\$'),
          ),
          suffix: const Padding(
            padding: EdgeInsets.only(left: 8, right: 12),
            child: Text('USD'),
          ),
          inputFormatters: AppTextFieldFormatters.decimal(),
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Ubicación',
          hint: 'Ingresa tu ubicación',
          prefixIcon: Icons.location_on,
          suffix: IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: () {},
            tooltip: 'Usar ubicación actual',
          ),
        ),
      ],
    );
  }
}

class _ValidationStory extends StatefulWidget {
  const _ValidationStory();

  @override
  State<_ValidationStory> createState() => _ValidationStoryState();
}

class _ValidationStoryState extends State<_ValidationStory> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: _nameController,
            label: 'Nombre requerido',
            hint: 'Tu nombre completo',
            validator: AppTextFieldValidator.required,
            prefixIcon: Icons.person,
          ),
          const SizedBox(height: 16),
          AppTextField(
            controller: _emailController,
            label: 'Email válido',
            hint: 'correo@ejemplo.com',
            keyboardType: TextInputType.emailAddress,
            validator: AppTextFieldValidator.combine([
              AppTextFieldValidator.required,
              AppTextFieldValidator.email,
            ]),
            prefixIcon: Icons.email,
          ),
          const SizedBox(height: 16),
          AppTextField(
            controller: _phoneController,
            label: 'Teléfono (solo números)',
            hint: '1234567890',
            keyboardType: TextInputType.phone,
            validator: AppTextFieldValidator.combine([
              AppTextFieldValidator.required,
              AppTextFieldValidator.numeric,
              AppTextFieldValidator.minLength(10),
            ]),
            inputFormatters: AppTextFieldFormatters.numeric(),
            prefixIcon: Icons.phone,
          ),
          const SizedBox(height: 16),
          const AppTextField(
            label: 'Campo con error',
            hint: 'Este campo tiene un error',
            errorText: 'Este es un mensaje de error',
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Formulario válido')),
                    );
                  }
                },
                child: const Text('Validar'),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () {
                  _formKey.currentState!.reset();
                  _nameController.clear();
                  _emailController.clear();
                  _phoneController.clear();
                },
                child: const Text('Limpiar'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InputFormattersStory extends StatefulWidget {
  const _InputFormattersStory();

  @override
  State<_InputFormattersStory> createState() => _InputFormattersStoryState();
}

class _InputFormattersStoryState extends State<_InputFormattersStory> {
  final _numericController = TextEditingController();
  final _upperCaseController = TextEditingController();
  final _lowerCaseController = TextEditingController();
  final _alphanumericController = TextEditingController();

  @override
  void dispose() {
    _numericController.dispose();
    _upperCaseController.dispose();
    _lowerCaseController.dispose();
    _alphanumericController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: _numericController,
          label: 'Solo números',
          hint: '123456',
          inputFormatters: AppTextFieldFormatters.numeric(),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: _upperCaseController,
          label: 'Mayúsculas automáticas',
          hint: 'TEXTO EN MAYÚSCULAS',
          inputFormatters: AppTextFieldFormatters.upperCase(),
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: _lowerCaseController,
          label: 'Minúsculas automáticas',
          hint: 'texto en minúsculas',
          inputFormatters: AppTextFieldFormatters.lowerCase(),
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: _alphanumericController,
          label: 'Solo alfanumérico',
          hint: 'abc123',
          inputFormatters: AppTextFieldFormatters.alphanumeric(),
          helperText: 'Solo letras y números permitidos',
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Máximo 10 caracteres',
          hint: 'Máx 10 chars',
          inputFormatters: AppTextFieldFormatters.maxLength(10),
          maxLength: 10,
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Sin espacios',
          hint: 'SinEspacios',
          inputFormatters: AppTextFieldFormatters.noSpaces(),
          helperText: 'Los espacios se eliminan automáticamente',
        ),
      ],
    );
  }
}

class _InteractiveStatesStory extends StatefulWidget {
  const _InteractiveStatesStory();

  @override
  State<_InteractiveStatesStory> createState() => _InteractiveStatesStoryState();
}

class _InteractiveStatesStoryState extends State<_InteractiveStatesStory> {
  AppTextFieldState? _overrideState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _overrideState = null),
              child: const Text('Default'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = AppTextFieldState.hover),
              child: const Text('Hover'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = AppTextFieldState.focus),
              child: const Text('Focus'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = AppTextFieldState.error),
              child: const Text('Error'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = AppTextFieldState.disabled),
              child: const Text('Disabled'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = AppTextFieldState.loading),
              child: const Text('Loading'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = AppTextFieldState.skeleton),
              child: const Text('Skeleton'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        AppTextField(
          label: 'Campo interactivo',
          hint: 'Cambia el estado arriba',
          overrideState: _overrideState,
          helperText: 'Estado actual: ${_overrideState?.name ?? 'default'}',
        ),
      ],
    );
  }
}

class _PlatformAdaptiveStory extends StatefulWidget {
  const _PlatformAdaptiveStory();

  @override
  State<_PlatformAdaptiveStory> createState() => _PlatformAdaptiveStoryState();
}

class _PlatformAdaptiveStoryState extends State<_PlatformAdaptiveStory> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Este campo se adapta automáticamente a la plataforma:',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: _controller,
          label: 'Campo adaptativo',
          hint: 'Se adapta a iOS/Android/Web',
          helperText: 'Los controles de selección y cursor cambian por plataforma',
        ),
        const SizedBox(height: 16),
        Text(
          'Estado de carga también se adapta:',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        const AppTextField(
          label: 'Cargando (adaptativo)',
          overrideState: AppTextFieldState.loading,
          helperText: 'Indicador de carga específico por plataforma',
        ),
      ],
    );
  }
}

class _RtlSupportStory extends StatefulWidget {
  const _RtlSupportStory();

  @override
  State<_RtlSupportStory> createState() => _RtlSupportStoryState();
}

class _RtlSupportStoryState extends State<_RtlSupportStory> {
  final _ltrController = TextEditingController();
  final _rtlController = TextEditingController();

  @override
  void dispose() {
    _ltrController.dispose();
    _rtlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Left-to-Right (LTR)',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        AppTextField(
          controller: _ltrController,
          label: 'English text field',
          hint: 'Type in English...',
          textDirection: TextDirection.ltr,
          prefixIcon: Icons.language,
        ),
        const SizedBox(height: 16),
        Text(
          'Right-to-Left (RTL)',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        AppTextField(
          controller: _rtlController,
          label: 'حقل النص العربي',
          hint: 'اكتب باللغة العربية...',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          prefixIcon: Icons.language,
        ),
        const SizedBox(height: 16),
        Text(
          'Multiline RTL',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        AppTextField(
          label: 'نص متعدد الأسطر',
          hint: 'اكتب نصاً متعدد الأسطر...',
          variant: AppTextFieldVariant.multiline,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          maxLines: 3,
        ),
      ],
    );
  }
}

class _CustomConfigStory extends StatefulWidget {
  const _CustomConfigStory();

  @override
  State<_CustomConfigStory> createState() => _CustomConfigStoryState();
}

class _CustomConfigStoryState extends State<_CustomConfigStory> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: _controller1,
          label: 'Campo compacto',
          hint: 'Configuración compacta',
          config: const AppTextFieldConfig(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            borderRadius: 8,
            minimumHeight: 40,
          ),
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: _controller2,
          label: 'Campo redondeado',
          hint: 'Bordes muy redondeados',
          config: const AppTextFieldConfig(
            borderRadius: 24,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: _controller3,
          label: 'Colores personalizados',
          hint: 'Tema personalizado',
          colors: AppTextFieldColors(
            borderColor: Colors.purple,
            focusedBorderColor: Colors.purple,
            errorBorderColor: Colors.red,
            disabledBorderColor: Colors.purple.withValues(alpha: 0.3),
            fillColor: Colors.purple.withValues(alpha: 0.05),
            disabledFillColor: Colors.grey.withValues(alpha: 0.1),
            textColor: Colors.purple[900]!,
            disabledTextColor: Colors.grey,
            hintColor: Colors.purple[300]!,
            disabledHintColor: Colors.grey,
            labelColor: Colors.purple[700]!,
            focusedLabelColor: Colors.purple,
            errorLabelColor: Colors.red,
            disabledLabelColor: Colors.grey,
            helperTextColor: Colors.purple[600]!,
            errorTextColor: Colors.red,
            prefixIconColor: Colors.purple,
            suffixIconColor: Colors.purple,
            disabledPrefixIconColor: Colors.grey,
            disabledSuffixIconColor: Colors.grey,
            cursorColor: Colors.purple,
            selectionColor: Colors.purple.withValues(alpha: 0.2),
            selectionHandleColor: Colors.purple,
            counterTextColor: Colors.purple[600]!,
            skeletonBaseColor: theme.colorScheme.surfaceContainerHighest,
            skeletonHighlightColor: theme.colorScheme.surfaceContainerLowest,
          ),
          prefixIcon: Icons.palette,
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Sin label flotante',
          hint: 'Label fijo arriba',
          config: const AppTextFieldConfig(
            enableFloatingLabel: false,
          ),
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Con contador personalizado',
          hint: 'Escribe algo...',
          maxLength: 50,
          config: const AppTextFieldConfig(
            enableCharacterCounter: true,
          ),
          helperText: 'Contador de caracteres habilitado',
        ),
      ],
    );
  }
}

class _AccessibilityStory extends StatefulWidget {
  const _AccessibilityStory();

  @override
  State<_AccessibilityStory> createState() => _AccessibilityStoryState();
}

class _AccessibilityStoryState extends State<_AccessibilityStory> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Navegación por teclado',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Usa Tab para navegar entre campos',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: _controller1,
          label: 'Primer campo (autofocus)',
          hint: 'Se enfoca automáticamente',
          autoFocus: true,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 16),
        AppTextField(
          controller: _controller2,
          label: 'Segundo campo',
          hint: 'Navega con Tab',
          focusNode: _focusNode,
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => _focusNode.requestFocus(),
          child: const Text('Enfocar segundo campo'),
        ),
        const SizedBox(height: 24),
        Text(
          'Labels semánticos',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        AppTextField(
          label: 'Label visible',
          hint: 'Campo con semántica personalizada',
          semanticLabel: 'Campo de entrada de texto con validación personalizada',
          helperText: 'Información adicional para lectores de pantalla',
        ),
        const SizedBox(height: 24),
        Text(
          'Contraste y legibilidad',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        AppTextField(
          label: 'Campo de alto contraste',
          hint: 'Optimizado para accesibilidad',
          helperText: 'Colores optimizados para mejor contraste',
          colors: AppTextFieldColors.fromTheme(Theme.of(context)),
        ),
        const SizedBox(height: 16),
        const AppTextField(
          label: 'Campo con error accesible',
          hint: 'Error claramente visible',
          errorText: 'Mensaje de error con alto contraste',
          helperText: 'Los errores son claramente distinguibles',
        ),
      ],
    );
  }
}