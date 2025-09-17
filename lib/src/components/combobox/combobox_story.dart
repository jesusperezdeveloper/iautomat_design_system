import 'package:flutter/material.dart';
import 'app_combobox.dart';
import 'combobox_config.dart';

class ComboBoxStory extends StatefulWidget {
  const ComboBoxStory({super.key});

  @override
  State<ComboBoxStory> createState() => _ComboBoxStoryState();
}

class _ComboBoxStoryState extends State<ComboBoxStory> {
  String basicQuery = '';
  String validationQuery = '';
  String customQuery = '';
  String asyncQuery = '';
  String formQuery = '';
  String loadingQuery = '';
  String disabledQuery = '';

  final List<AppComboBoxSuggestion<String>> countries = [
    AppComboBoxSuggestion(
      value: 'es',
      label: 'España',
      subtitle: 'Europa',
      leading: Icon(Icons.flag, color: Colors.red),
    ),
    AppComboBoxSuggestion(
      value: 'us',
      label: 'Estados Unidos',
      subtitle: 'América del Norte',
      leading: Icon(Icons.flag, color: Colors.blue),
    ),
    AppComboBoxSuggestion(
      value: 'mx',
      label: 'México',
      subtitle: 'América del Norte',
      leading: Icon(Icons.flag, color: Colors.green),
    ),
    AppComboBoxSuggestion(
      value: 'ar',
      label: 'Argentina',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.lightBlue),
    ),
    AppComboBoxSuggestion(
      value: 'co',
      label: 'Colombia',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.yellow),
    ),
    AppComboBoxSuggestion(
      value: 'pe',
      label: 'Perú',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.red),
    ),
    AppComboBoxSuggestion(
      value: 'cl',
      label: 'Chile',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.red),
    ),
    AppComboBoxSuggestion(
      value: 'br',
      label: 'Brasil',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.green),
    ),
    AppComboBoxSuggestion(
      value: 'fr',
      label: 'Francia',
      subtitle: 'Europa',
      leading: Icon(Icons.flag, color: Colors.blue),
    ),
    AppComboBoxSuggestion(
      value: 'de',
      label: 'Alemania',
      subtitle: 'Europa',
      leading: Icon(Icons.flag, color: Colors.black),
    ),
    AppComboBoxSuggestion(
      value: 'it',
      label: 'Italia',
      subtitle: 'Europa',
      leading: Icon(Icons.flag, color: Colors.green),
    ),
    AppComboBoxSuggestion(
      value: 'disabled',
      label: 'País Deshabilitado',
      subtitle: 'No disponible',
      enabled: false,
    ),
  ];

  final List<AppComboBoxSuggestion<String>> technologies = [
    AppComboBoxSuggestion(
      value: 'flutter',
      label: 'Flutter',
      subtitle: 'UI Framework',
      leading: Icon(Icons.phone_android, color: Colors.blue),
    ),
    AppComboBoxSuggestion(
      value: 'react',
      label: 'React',
      subtitle: 'JavaScript Library',
      leading: Icon(Icons.web, color: Colors.cyan),
    ),
    AppComboBoxSuggestion(
      value: 'vue',
      label: 'Vue.js',
      subtitle: 'Progressive Framework',
      leading: Icon(Icons.web, color: Colors.green),
    ),
    AppComboBoxSuggestion(
      value: 'angular',
      label: 'Angular',
      subtitle: 'Web Framework',
      leading: Icon(Icons.web, color: Colors.red),
    ),
    AppComboBoxSuggestion(
      value: 'nextjs',
      label: 'Next.js',
      subtitle: 'React Framework',
      leading: Icon(Icons.web, color: Colors.black),
    ),
    AppComboBoxSuggestion(
      value: 'nuxtjs',
      label: 'Nuxt.js',
      subtitle: 'Vue Framework',
      leading: Icon(Icons.web, color: Colors.green),
    ),
    AppComboBoxSuggestion(
      value: 'svelte',
      label: 'Svelte',
      subtitle: 'Compile-time Framework',
      leading: Icon(Icons.web, color: Colors.orange),
    ),
  ];

  final List<AppComboBoxSuggestion<String>> emails = [
    AppComboBoxSuggestion(
      value: 'juan.perez@example.com',
      label: 'Juan Pérez',
      subtitle: 'juan.perez@example.com',
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text('JP', style: TextStyle(color: Colors.white)),
      ),
    ),
    AppComboBoxSuggestion(
      value: 'maria.garcia@example.com',
      label: 'María García',
      subtitle: 'maria.garcia@example.com',
      leading: CircleAvatar(
        backgroundColor: Colors.pink,
        child: Text('MG', style: TextStyle(color: Colors.white)),
      ),
    ),
    AppComboBoxSuggestion(
      value: 'carlos.rodriguez@example.com',
      label: 'Carlos Rodríguez',
      subtitle: 'carlos.rodriguez@example.com',
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Text('CR', style: TextStyle(color: Colors.white)),
      ),
    ),
    AppComboBoxSuggestion(
      value: 'ana.martinez@example.com',
      label: 'Ana Martínez',
      subtitle: 'ana.martinez@example.com',
      leading: CircleAvatar(
        backgroundColor: Colors.purple,
        child: Text('AM', style: TextStyle(color: Colors.white)),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppComboBox Story'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildStorySection(
            'Basic Typeahead',
            'ComboBox básico con sugerencias estáticas',
            AppComboBox<String>(
              query: basicQuery,
              onQueryChanged: (query) => setState(() => basicQuery = query),
              suggestions: countries,
              onSelected: (suggestion) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Seleccionado: ${suggestion.label}')),
                );
              },
              placeholder: 'Buscar países...',
              label: 'País',
              helperText: 'Escribe para buscar países',
              variant: AppComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'With Icons and Subtitles',
            'ComboBox con iconos y subtítulos',
            AppComboBox<String>(
              query: '',
              onQueryChanged: (query) {},
              suggestions: technologies,
              onSelected: (suggestion) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tecnología: ${suggestion.label}')),
                );
              },
              placeholder: 'Buscar tecnologías...',
              label: 'Tecnología',
              helperText: 'Elige tu tecnología favorita',
              prefixIcon: Icon(Icons.code),
              variant: AppComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Email Suggestions',
            'ComboBox para sugerencias de email',
            AppComboBox<String>(
              query: '',
              onQueryChanged: (query) {},
              suggestions: emails,
              onSelected: (suggestion) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Email: ${suggestion.value}')),
                );
              },
              placeholder: 'Buscar contactos...',
              label: 'Para',
              helperText: 'Busca contactos por nombre o email',
              prefixIcon: Icon(Icons.email),
              variant: AppComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'With Validation',
            'ComboBox con validación',
            AppComboBox<String>(
              query: validationQuery,
              onQueryChanged: (query) => setState(() => validationQuery = query),
              suggestions: countries,
              onSelected: (suggestion) {
                setState(() => validationQuery = suggestion.label);
              },
              placeholder: 'Campo requerido',
              label: 'País Requerido',
              validator: AppComboBoxValidator.required,
              variant: AppComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Error State',
            'ComboBox con mensaje de error',
            AppComboBox<String>(
              query: '',
              onQueryChanged: (query) {},
              suggestions: countries,
              onSelected: (suggestion) {},
              placeholder: 'Campo con error',
              label: 'Campo con Error',
              errorText: 'Este campo es requerido',
              variant: AppComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Disabled State',
            'ComboBox deshabilitado',
            AppComboBox<String>(
              query: disabledQuery,
              onQueryChanged: (query) => setState(() => disabledQuery = query),
              suggestions: countries,
              onSelected: (suggestion) {},
              placeholder: 'Campo deshabilitado',
              label: 'ComboBox Deshabilitado',
              helperText: 'Este campo no se puede modificar',
              enabled: false,
              variant: AppComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Loading State',
            'ComboBox en estado de carga',
            AppComboBox<String>(
              query: loadingQuery,
              onQueryChanged: (query) => setState(() => loadingQuery = query),
              suggestions: countries,
              onSelected: (suggestion) {},
              placeholder: 'Cargando...',
              label: 'Estado de Carga',
              helperText: 'Los datos se están cargando',
              overrideState: AppComboBoxState.loading,
              variant: AppComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Skeleton State',
            'ComboBox en estado skeleton',
            AppComboBox<String>(
              query: '',
              onQueryChanged: (query) {},
              suggestions: countries,
              onSelected: (suggestion) {},
              placeholder: 'Cargando...',
              label: 'Estado Skeleton',
              helperText: 'Cargando contenido...',
              overrideState: AppComboBoxState.skeleton,
              variant: AppComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Async Suggestions',
            'ComboBox con búsqueda asíncrona',
            AppComboBox<String>(
              query: asyncQuery,
              onQueryChanged: (query) => setState(() => asyncQuery = query),
              suggestions: const [], // No usamos las sugerencias estáticas
              onSelected: (suggestion) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Resultado: ${suggestion.label}')),
                );
              },
              onQuerySubmitted: _performAsyncSearch,
              placeholder: 'Búsqueda asíncrona...',
              label: 'Búsqueda Externa',
              helperText: 'Simula búsqueda en servidor',
              variant: AppComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Custom Configuration',
            'ComboBox con configuración personalizada',
            AppComboBox<String>(
              query: customQuery,
              onQueryChanged: (query) => setState(() => customQuery = query),
              suggestions: countries,
              onSelected: (suggestion) {
                setState(() => customQuery = suggestion.label);
              },
              placeholder: 'Configuración personalizada',
              label: 'Custom Config',
              helperText: 'Con estilos personalizados',
              config: const AppComboBoxConfig(
                borderRadius: 16,
                minimumHeight: 60,
                borderWidth: 3,
                contentPadding: EdgeInsets.all(20),
                typeaheadDebounceMs: 500,
                maxSuggestions: 5,
                highlightMatches: true,
                enableFloatingLabel: false,
              ),
              variant: AppComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Multiple Validators',
            'ComboBox con validación combinada',
            AppComboBox<String>(
              query: '',
              onQueryChanged: (query) {},
              suggestions: countries,
              onSelected: (suggestion) {},
              placeholder: 'Email con validación',
              label: 'Email Válido',
              helperText: 'Debe ser un email válido de al menos 5 caracteres',
              validator: AppComboBoxValidator.combine([
                AppComboBoxValidator.required,
                AppComboBoxValidator.minLength(5),
                AppComboBoxValidator.email,
              ]),
              keyboardType: TextInputType.emailAddress,
              variant: AppComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Compact Size',
            'ComboBox con tamaño compacto',
            AppComboBox<String>(
              query: '',
              onQueryChanged: (query) {},
              suggestions: technologies,
              onSelected: (suggestion) {},
              placeholder: 'Tamaño compacto',
              label: 'ComboBox Compacto',
              dense: true,
              width: 250,
              variant: AppComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'RTL Support',
            'Soporte para texto de derecha a izquierda',
            AppComboBox<String>(
              query: '',
              onQueryChanged: (query) {},
              suggestions: [
                AppComboBoxSuggestion(value: 'ar', label: 'العربية'),
                AppComboBoxSuggestion(value: 'he', label: 'עברית'),
                AppComboBoxSuggestion(value: 'fa', label: 'فارسی'),
                AppComboBoxSuggestion(value: 'ur', label: 'اردو'),
              ],
              onSelected: (suggestion) {},
              placeholder: 'اختر لغة',
              label: 'اللغة',
              textDirection: TextDirection.rtl,
              variant: AppComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Form Integration',
            'Integración con formulario',
            _buildFormExample(),
          ),
        ],
      ),
    );
  }

  Future<List<AppComboBoxSuggestion<String>>> _performAsyncSearch(String query) async {
    // Simular búsqueda asíncrona
    await Future.delayed(const Duration(milliseconds: 800));

    if (query.isEmpty) return [];

    // Simular resultados de API
    final mockResults = [
      'Apple Inc.',
      'Google LLC',
      'Microsoft Corporation',
      'Amazon.com Inc.',
      'Meta Platforms Inc.',
      'Tesla Inc.',
      'Netflix Inc.',
      'Adobe Inc.',
      'Salesforce Inc.',
      'Oracle Corporation',
    ];

    return mockResults
        .where((company) => company.toLowerCase().contains(query.toLowerCase()))
        .map((company) => AppComboBoxSuggestion(
              value: company.toLowerCase().replaceAll(' ', '_'),
              label: company,
              subtitle: 'Empresa de tecnología',
              leading: Icon(Icons.business, color: Colors.blue),
            ))
        .toList();
  }

  Widget _buildFormExample() {
    return Form(
      child: Column(
        children: [
          AppComboBox<String>(
            query: formQuery,
            onQueryChanged: (query) => setState(() => formQuery = query),
            suggestions: countries,
            onSelected: (suggestion) {
              setState(() => formQuery = suggestion.label);
            },
            placeholder: 'Selecciona tu país',
            label: 'País de Residencia',
            validator: AppComboBoxValidator.required,
            variant: AppComboBoxVariant.typeahead,
          ),
          const SizedBox(height: 16),
          AppComboBox<String>(
            query: '',
            onQueryChanged: (query) {},
            suggestions: technologies,
            onSelected: (suggestion) {},
            placeholder: 'Tu especialidad',
            label: 'Tecnología Principal',
            validator: AppComboBoxValidator.required,
            variant: AppComboBoxVariant.typeahead,
          ),
          const SizedBox(height: 16),
          AppComboBox<String>(
            query: '',
            onQueryChanged: (query) {},
            suggestions: emails,
            onSelected: (suggestion) {},
            placeholder: 'contacto@ejemplo.com',
            label: 'Email de Contacto',
            validator: AppComboBoxValidator.combine([
              AppComboBoxValidator.required,
              AppComboBoxValidator.email,
            ]),
            keyboardType: TextInputType.emailAddress,
            variant: AppComboBoxVariant.typeahead,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Formulario enviado')),
              );
            },
            child: const Text('Enviar Formulario'),
          ),
        ],
      ),
    );
  }

  Widget _buildStorySection(String title, String description, Widget child) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}