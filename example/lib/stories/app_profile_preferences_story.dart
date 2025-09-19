import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Story para demostrar DSProfilePreferences en diferentes configuraciones
class DSProfilePreferencesStory extends StatefulWidget {
  const DSProfilePreferencesStory({super.key});

  @override
  State<DSProfilePreferencesStory> createState() => _DSProfilePreferencesStoryState();
}

class _DSProfilePreferencesStoryState extends State<DSProfilePreferencesStory>
    with TickerProviderStateMixin {
  late TabController _tabController;
  DSProfileState _currentState = DSProfileState.defaultState;

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
        title: const Text('DSProfilePreferences Story'),
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
            child: DSProfilePreferences(
              config: DSProfilePreferencesConfigDefaults.basicProfile,
              onSave: (data) => _showSnackBar('Guardado: ${data.values}'),
              onCancel: () => _showSnackBar('Cancelado'),
              initialData: const DSProfileFormData(
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
            child: DSProfilePreferences(
              config: const DSProfilePreferencesConfig(
                fields: [
                  DSProfileField(
                    id: 'display_name',
                    type: DSProfileFieldType.text,
                    label: 'Nombre para mostrar',
                    placeholder: 'Ingresa tu nombre',
                    icon: Icons.person,
                  ),
                  DSProfileField(
                    id: 'bio',
                    type: DSProfileFieldType.text,
                    label: 'Biografía',
                    placeholder: 'Cuéntanos sobre ti',
                    description: 'Máximo 160 caracteres',
                    icon: Icons.description,
                    validation: DSProfileFieldValidation(maxLength: 160),
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
            child: DSProfilePreferences(
              config: DSProfilePreferencesConfigDefaults.fullProfile,
              onSave: (data) => _showSnackBar('Guardado: ${data.values}'),
              onCancel: () => _showSnackBar('Cancelado'),
              onFormChanged: (data) => debugPrint('Form changed: ${data.values}'),
              onFieldValidated: (validation) => debugPrint('Field validated: ${validation.fieldId} -> ${validation.isValid}'),
              initialData: const DSProfileFormData(
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
            child: DSProfilePreferences(
              config: const DSProfilePreferencesConfig(
                fields: [
                  DSProfileField(
                    id: 'personal_header',
                    type: DSProfileFieldType.header,
                    label: 'Información Personal',
                  ),
                  DSProfileField(
                    id: 'full_name',
                    type: DSProfileFieldType.text,
                    label: 'Nombre completo',
                    required: true,
                    icon: Icons.person,
                  ),
                  DSProfileField(
                    id: 'email_address',
                    type: DSProfileFieldType.email,
                    label: 'Correo electrónico',
                    required: true,
                    icon: Icons.email,
                  ),
                  DSProfileField(
                    id: 'phone_number',
                    type: DSProfileFieldType.phone,
                    label: 'Teléfono',
                    icon: Icons.phone,
                  ),
                  DSProfileField(
                    id: 'divider1',
                    type: DSProfileFieldType.divider,
                    label: '',
                  ),
                  DSProfileField(
                    id: 'preferences_header',
                    type: DSProfileFieldType.header,
                    label: 'Preferencias',
                  ),
                  DSProfileField(
                    id: 'notifications',
                    type: DSProfileFieldType.toggle,
                    label: 'Recibir notificaciones',
                    description: 'Activa para recibir notificaciones push',
                    icon: Icons.notifications,
                    value: true,
                  ),
                  DSProfileField(
                    id: 'theme',
                    type: DSProfileFieldType.select,
                    label: 'Tema',
                    icon: Icons.palette,
                    options: [
                      DSProfileFieldOption(
                        value: 'light',
                        label: 'Claro',
                        icon: Icons.light_mode,
                      ),
                      DSProfileFieldOption(
                        value: 'dark',
                        label: 'Oscuro',
                        icon: Icons.dark_mode,
                      ),
                      DSProfileFieldOption(
                        value: 'system',
                        label: 'Sistema',
                        icon: Icons.settings,
                      ),
                    ],
                    value: 'system',
                  ),
                  DSProfileField(
                    id: 'volume',
                    type: DSProfileFieldType.slider,
                    label: 'Volumen de notificaciones',
                    icon: Icons.volume_up,
                    value: 75.0,
                    config: {
                      'min': 0.0,
                      'max': 100.0,
                      'divisions': 10,
                    },
                  ),
                  DSProfileField(
                    id: 'birthday',
                    type: DSProfileFieldType.date,
                    label: 'Fecha de nacimiento',
                    icon: Icons.cake,
                    description: 'Solo visible para ti',
                  ),
                  DSProfileField(
                    id: 'accent_color',
                    type: DSProfileFieldType.color,
                    label: 'Color de acento',
                    icon: Icons.color_lens,
                    value: Colors.blue,
                  ),
                  DSProfileField(
                    id: 'profile_picture',
                    type: DSProfileFieldType.file,
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
            child: DSProfilePreferences(
              config: DSProfilePreferencesConfig(
                state: _currentState,
                fields: DSProfilePreferencesConfigDefaults.fullProfile.fields,
              ),
              enabled: _currentState != DSProfileState.disabled,
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
            child: DSProfilePreferences(
              config: DSProfilePreferencesConfig(
                fields: DSProfilePreferencesConfigDefaults.basicProfile.fields,
                colors: const DSProfileColors(
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
            child: DSProfilePreferences(
              config: const DSProfilePreferencesConfig(
                fields: [
                  DSProfileField(
                    id: 'username',
                    type: DSProfileFieldType.text,
                    label: 'Nombre de usuario',
                    required: true,
                    validation: DSProfileFieldValidation(
                      required: true,
                      minLength: 3,
                      maxLength: 20,
                      pattern: r'^[a-zA-Z0-9_]+$',
                      errorMessage: 'Solo letras, números y guiones bajos',
                    ),
                  ),
                  DSProfileField(
                    id: 'email',
                    type: DSProfileFieldType.email,
                    label: 'Email',
                    required: true,
                    validation: DSProfileFieldValidation(
                      required: true,
                    ),
                  ),
                ],
                behavior: DSProfileBehavior(
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
            child: DSProfilePreferences(
              config: const DSProfilePreferencesConfig(
                fields: [
                  DSProfileField(
                    id: 'name',
                    type: DSProfileFieldType.text,
                    label: 'Nombre',
                    required: true,
                    importance: DSProfileFieldImportance.critical,
                  ),
                  DSProfileField(
                    id: 'notifications',
                    type: DSProfileFieldType.toggle,
                    label: 'Notificaciones importantes',
                    description: 'Recibir alertas de seguridad y actualizaciones críticas',
                    importance: DSProfileFieldImportance.high,
                  ),
                ],
                a11yConfig: DSProfileA11yConfig(
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
              children: DSProfileState.values.map((state) {
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

void _onFormSubmitted(DSProfileFormData data) {
  debugPrint('Form submitted: ${data.values}');
}

void _onFormChanged(DSProfileFormData data) {
  debugPrint('Form changed: ${data.values}');
}

void _onFieldValidated(DSProfileFieldValidationResult validation) {
  debugPrint('Field validated: ${validation.fieldId} -> ${validation.isValid}');
}

void _onNavigate(String from, String to) {
  debugPrint('Navigate: $from -> $to');
}

void _onCancelled() {
  debugPrint('Form cancelled');
}

/// Widget de demostración independiente para usar en otras historias
class DSProfilePreferencesDemo extends StatelessWidget {
  final DSProfileVariant variant;
  final DSProfileState state;
  final List<DSProfileField>? customFields;

  const DSProfilePreferencesDemo({
    super.key,
    this.variant = DSProfileVariant.sections,
    this.state = DSProfileState.defaultState,
    this.customFields,
  });

  @override
  Widget build(BuildContext context) {
    final fields = customFields ?? _getDefaultFields();

    return DSProfilePreferences(
      config: DSProfilePreferencesConfig(
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

  List<DSProfileField> _getDefaultFields() {
    return const [
      DSProfileField(
        id: 'personal_info',
        type: DSProfileFieldType.header,
        label: 'Información Personal',
      ),
      DSProfileField(
        id: 'name',
        type: DSProfileFieldType.text,
        label: 'Nombre completo',
        required: true,
        icon: Icons.person,
        placeholder: 'Ingresa tu nombre',
      ),
      DSProfileField(
        id: 'email',
        type: DSProfileFieldType.email,
        label: 'Correo electrónico',
        required: true,
        icon: Icons.email,
        placeholder: 'ejemplo@correo.com',
      ),
      DSProfileField(
        id: 'phone',
        type: DSProfileFieldType.phone,
        label: 'Teléfono',
        icon: Icons.phone,
        placeholder: '+34 600 000 000',
      ),
      DSProfileField(
        id: 'preferences',
        type: DSProfileFieldType.header,
        label: 'Preferencias',
      ),
      DSProfileField(
        id: 'notifications',
        type: DSProfileFieldType.toggle,
        label: 'Recibir notificaciones',
        description: 'Mantente informado de las actualizaciones',
        icon: Icons.notifications,
        value: true,
      ),
      DSProfileField(
        id: 'theme',
        type: DSProfileFieldType.select,
        label: 'Tema de la aplicación',
        icon: Icons.palette,
        options: [
          DSProfileFieldOption(
            value: 'light',
            label: 'Claro',
            icon: Icons.light_mode,
          ),
          DSProfileFieldOption(
            value: 'dark',
            label: 'Oscuro',
            icon: Icons.dark_mode,
          ),
          DSProfileFieldOption(
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