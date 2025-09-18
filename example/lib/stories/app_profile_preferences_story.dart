import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Story para demostrar AppProfilePreferences en diferentes configuraciones
class AppProfilePreferencesStory extends StatefulWidget {
  const AppProfilePreferencesStory({super.key});

  @override
  State<AppProfilePreferencesStory> createState() => _AppProfilePreferencesStoryState();
}

class _AppProfilePreferencesStoryState extends State<AppProfilePreferencesStory>
    with TickerProviderStateMixin {
  late TabController _tabController;
  AppProfileState _currentState = AppProfileState.defaultState;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppProfilePreferences Story'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Básico'),
            Tab(text: 'Completo'),
            Tab(text: 'Estados'),
            Tab(text: 'Configuraciones'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildBasicExample(),
          _buildFullExample(),
          _buildStatesExample(),
          _buildConfigurationsExample(),
        ],
      ),
    );
  }

  Widget _buildBasicExample() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildExampleSection(
            title: 'Perfil Básico',
            description: 'Configuración mínima de preferencias de perfil',
            child: AppProfilePreferences(
              config: AppProfilePreferencesConfigDefaults.basicProfile,
              onSave: (data) => _showSnackBar('Guardado: ${data.values}'),
              onCancel: () => _showSnackBar('Cancelado'),
              initialData: const AppProfileFormData(
                values: {
                  'name': 'Juan Pérez',
                  'email': 'juan@example.com',
                },
              ),
            ),
          ),
          const SizedBox(height: 32),
          _buildExampleSection(
            title: 'Solo campos',
            description: 'Sin botones de acción',
            child: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                fields: [
                  AppProfileField(
                    id: 'display_name',
                    type: AppProfileFieldType.text,
                    label: 'Nombre para mostrar',
                    placeholder: 'Ingresa tu nombre',
                    icon: Icons.person,
                  ),
                  AppProfileField(
                    id: 'bio',
                    type: AppProfileFieldType.text,
                    label: 'Biografía',
                    placeholder: 'Cuéntanos sobre ti',
                    description: 'Máximo 160 caracteres',
                    icon: Icons.description,
                    validation: AppProfileFieldValidation(maxLength: 160),
                  ),
                ],
              ),
              onFormChanged: (data) => debugPrint('Form changed: ${data.values}'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFullExample() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildExampleSection(
            title: 'Perfil Completo',
            description: 'Todas las opciones de configuración disponibles',
            child: AppProfilePreferences(
              config: AppProfilePreferencesConfigDefaults.fullProfile,
              onSave: (data) => _showSnackBar('Guardado: ${data.values}'),
              onCancel: () => _showSnackBar('Cancelado'),
              onFormChanged: (data) => debugPrint('Form changed: ${data.values}'),
              onFieldValidated: (validation) => debugPrint('Field validated: ${validation.fieldId} -> ${validation.isValid}'),
              initialData: const AppProfileFormData(
                values: {
                  'name': 'María García',
                  'email': 'maria@example.com',
                  'phone': '+34 600 123 456',
                  'email_notifications': true,
                  'push_notifications': false,
                },
              ),
            ),
          ),
          const SizedBox(height: 32),
          _buildExampleSection(
            title: 'Todos los tipos de campo',
            description: 'Demostración de todos los tipos de campo disponibles',
            child: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                fields: [
                  AppProfileField(
                    id: 'personal_header',
                    type: AppProfileFieldType.header,
                    label: 'Información Personal',
                  ),
                  AppProfileField(
                    id: 'full_name',
                    type: AppProfileFieldType.text,
                    label: 'Nombre completo',
                    required: true,
                    icon: Icons.person,
                  ),
                  AppProfileField(
                    id: 'email_address',
                    type: AppProfileFieldType.email,
                    label: 'Correo electrónico',
                    required: true,
                    icon: Icons.email,
                  ),
                  AppProfileField(
                    id: 'phone_number',
                    type: AppProfileFieldType.phone,
                    label: 'Teléfono',
                    icon: Icons.phone,
                  ),
                  AppProfileField(
                    id: 'divider1',
                    type: AppProfileFieldType.divider,
                    label: '',
                  ),
                  AppProfileField(
                    id: 'preferences_header',
                    type: AppProfileFieldType.header,
                    label: 'Preferencias',
                  ),
                  AppProfileField(
                    id: 'notifications',
                    type: AppProfileFieldType.toggle,
                    label: 'Recibir notificaciones',
                    description: 'Activa para recibir notificaciones push',
                    icon: Icons.notifications,
                    value: true,
                  ),
                  AppProfileField(
                    id: 'theme',
                    type: AppProfileFieldType.select,
                    label: 'Tema',
                    icon: Icons.palette,
                    options: [
                      AppProfileFieldOption(
                        value: 'light',
                        label: 'Claro',
                        icon: Icons.light_mode,
                      ),
                      AppProfileFieldOption(
                        value: 'dark',
                        label: 'Oscuro',
                        icon: Icons.dark_mode,
                      ),
                      AppProfileFieldOption(
                        value: 'system',
                        label: 'Sistema',
                        icon: Icons.settings,
                      ),
                    ],
                    value: 'system',
                  ),
                  AppProfileField(
                    id: 'volume',
                    type: AppProfileFieldType.slider,
                    label: 'Volumen de notificaciones',
                    icon: Icons.volume_up,
                    value: 75.0,
                    config: {
                      'min': 0.0,
                      'max': 100.0,
                      'divisions': 10,
                    },
                  ),
                  AppProfileField(
                    id: 'birthday',
                    type: AppProfileFieldType.date,
                    label: 'Fecha de nacimiento',
                    icon: Icons.cake,
                    description: 'Solo visible para ti',
                  ),
                  AppProfileField(
                    id: 'accent_color',
                    type: AppProfileFieldType.color,
                    label: 'Color de acento',
                    icon: Icons.color_lens,
                    value: Colors.blue,
                  ),
                  AppProfileField(
                    id: 'profile_picture',
                    type: AppProfileFieldType.file,
                    label: 'Foto de perfil',
                    icon: Icons.photo_camera,
                    description: 'JPG, PNG o GIF, máximo 5MB',
                  ),
                ],
              ),
              onSave: (data) => _showSnackBar('Perfil actualizado'),
              onCancel: () => _showSnackBar('Cambios descartados'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatesExample() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStateSelector(),
          const SizedBox(height: 24),
          _buildExampleSection(
            title: 'Estado: ${_currentState.displayName}',
            description: 'Demostración del estado actual del componente',
            child: AppProfilePreferences(
              config: AppProfilePreferencesConfig(
                state: _currentState,
                fields: AppProfilePreferencesConfigDefaults.fullProfile.fields,
              ),
              enabled: _currentState != AppProfileState.disabled,
              onSave: _currentState.isInteractive
                  ? (data) => _showSnackBar('Guardado en estado ${_currentState.displayName}')
                  : null,
              onCancel: _currentState.isInteractive
                  ? () => _showSnackBar('Cancelado en estado ${_currentState.displayName}')
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfigurationsExample() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildExampleSection(
            title: 'Personalización de colores',
            description: 'Ejemplo con colores personalizados',
            child: AppProfilePreferences(
              config: AppProfilePreferencesConfig(
                fields: AppProfilePreferencesConfigDefaults.basicProfile.fields,
                colors: const AppProfileColors(
                  backgroundColor: Color(0xFFF5F5F5),
                  fieldBackgroundColor: Colors.white,
                  primaryButtonColor: Colors.purple,
                  primaryButtonTextColor: Colors.white,
                  borderColor: Colors.purple,
                  focusedBorderColor: Colors.deepPurple,
                ),
              ),
              onSave: (data) => _showSnackBar('Guardado con colores personalizados'),
            ),
          ),
          const SizedBox(height: 32),
          _buildExampleSection(
            title: 'Comportamiento personalizado',
            description: 'Auto-guardado y validación en tiempo real',
            child: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                fields: [
                  AppProfileField(
                    id: 'username',
                    type: AppProfileFieldType.text,
                    label: 'Nombre de usuario',
                    required: true,
                    validation: AppProfileFieldValidation(
                      required: true,
                      minLength: 3,
                      maxLength: 20,
                      pattern: r'^[a-zA-Z0-9_]+$',
                      errorMessage: 'Solo letras, números y guiones bajos',
                    ),
                  ),
                  AppProfileField(
                    id: 'email',
                    type: AppProfileFieldType.email,
                    label: 'Email',
                    required: true,
                    validation: AppProfileFieldValidation(
                      required: true,
                    ),
                  ),
                ],
                behavior: AppProfileBehavior(
                  autoSave: true,
                  autoSaveDelay: 2000,
                  realtimeValidation: true,
                ),
              ),
              onSave: (data) => _showSnackBar('Auto-guardado: ${data.values}'),
              onFormChanged: (data) => debugPrint('Auto-save form: ${data.values}'),
            ),
          ),
          const SizedBox(height: 32),
          _buildExampleSection(
            title: 'Accesibilidad mejorada',
            description: 'Configuración optimizada para screen readers',
            child: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                fields: [
                  AppProfileField(
                    id: 'name',
                    type: AppProfileFieldType.text,
                    label: 'Nombre',
                    required: true,
                    importance: AppProfileFieldImportance.critical,
                  ),
                  AppProfileField(
                    id: 'notifications',
                    type: AppProfileFieldType.toggle,
                    label: 'Notificaciones importantes',
                    description: 'Recibir alertas de seguridad y actualizaciones críticas',
                    importance: AppProfileFieldImportance.high,
                  ),
                ],
                a11yConfig: AppProfileA11yConfig(
                  enabled: true,
                  announceErrors: true,
                  announceSuccess: true,
                  announceStateChanges: true,
                  enableKeyboardNavigation: true,
                  enableSemanticLabels: true,
                  enableHints: true,
                ),
              ),
              onSave: (data) => _showSnackBar('Guardado con accesibilidad mejorada'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExampleSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: child,
        ),
      ],
    );
  }

  Widget _buildStateSelector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selector de Estado',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: AppProfileState.values.map((state) {
                final isSelected = state == _currentState;
                return FilterChip(
                  label: Text(state.displayName),
                  selected: isSelected,
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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// Callbacks de ejemplo para los stories

void _onFormSubmitted(AppProfileFormData data) {
  debugPrint('Form submitted: ${data.values}');
}

void _onFormChanged(AppProfileFormData data) {
  debugPrint('Form changed: ${data.values}');
}

void _onFieldValidated(AppProfileFieldValidationResult validation) {
  debugPrint('Field validated: ${validation.fieldId} -> ${validation.isValid}');
}

void _onNavigate(String from, String to) {
  debugPrint('Navigate: $from -> $to');
}

void _onCancelled() {
  debugPrint('Form cancelled');
}

/// Widget de demostración independiente para usar en otras historias
class AppProfilePreferencesDemo extends StatelessWidget {
  final AppProfileVariant variant;
  final AppProfileState state;
  final List<AppProfileField>? customFields;

  const AppProfilePreferencesDemo({
    super.key,
    this.variant = AppProfileVariant.sections,
    this.state = AppProfileState.defaultState,
    this.customFields,
  });

  @override
  Widget build(BuildContext context) {
    final fields = customFields ?? _getDefaultFields();

    return AppProfilePreferences(
      config: AppProfilePreferencesConfig(
        variant: variant,
        state: state,
        fields: fields,
      ),
      onSave: _onFormSubmitted,
      onCancel: _onCancelled,
      onFormChanged: _onFormChanged,
      onFieldValidated: _onFieldValidated,
      onNavigate: _onNavigate,
    );
  }

  List<AppProfileField> _getDefaultFields() {
    return const [
      AppProfileField(
        id: 'personal_info',
        type: AppProfileFieldType.header,
        label: 'Información Personal',
      ),
      AppProfileField(
        id: 'name',
        type: AppProfileFieldType.text,
        label: 'Nombre completo',
        required: true,
        icon: Icons.person,
        placeholder: 'Ingresa tu nombre',
      ),
      AppProfileField(
        id: 'email',
        type: AppProfileFieldType.email,
        label: 'Correo electrónico',
        required: true,
        icon: Icons.email,
        placeholder: 'ejemplo@correo.com',
      ),
      AppProfileField(
        id: 'phone',
        type: AppProfileFieldType.phone,
        label: 'Teléfono',
        icon: Icons.phone,
        placeholder: '+34 600 000 000',
      ),
      AppProfileField(
        id: 'preferences',
        type: AppProfileFieldType.header,
        label: 'Preferencias',
      ),
      AppProfileField(
        id: 'notifications',
        type: AppProfileFieldType.toggle,
        label: 'Recibir notificaciones',
        description: 'Mantente informado de las actualizaciones',
        icon: Icons.notifications,
        value: true,
      ),
      AppProfileField(
        id: 'theme',
        type: AppProfileFieldType.select,
        label: 'Tema de la aplicación',
        icon: Icons.palette,
        options: [
          AppProfileFieldOption(
            value: 'light',
            label: 'Claro',
            icon: Icons.light_mode,
          ),
          AppProfileFieldOption(
            value: 'dark',
            label: 'Oscuro',
            icon: Icons.dark_mode,
          ),
          AppProfileFieldOption(
            value: 'system',
            label: 'Automático',
            icon: Icons.brightness_auto,
          ),
        ],
        value: 'system',
      ),
    ];
  }
}