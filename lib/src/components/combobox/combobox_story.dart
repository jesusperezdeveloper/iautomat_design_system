import 'package:flutter/material.dart';
import 'ds_combobox.dart';
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

  final List<DSComboBoxSuggestion<String>> countries = [
    DSComboBoxSuggestion(
      value: 'es',
      label: 'España',
      subtitle: 'Europa',
      leading: Icon(Icons.flag, color: Colors.red),
    ),
    DSComboBoxSuggestion(
      value: 'us',
      label: 'Estados Unidos',
      subtitle: 'América del Norte',
      leading: Icon(Icons.flag, color: Colors.blue),
    ),
    DSComboBoxSuggestion(
      value: 'mx',
      label: 'México',
      subtitle: 'América del Norte',
      leading: Icon(Icons.flag, color: Colors.green),
    ),
    DSComboBoxSuggestion(
      value: 'ar',
      label: 'Argentina',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.lightBlue),
    ),
    DSComboBoxSuggestion(
      value: 'co',
      label: 'Colombia',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.yellow),
    ),
    DSComboBoxSuggestion(
      value: 'pe',
      label: 'Perú',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.red),
    ),
    DSComboBoxSuggestion(
      value: 'cl',
      label: 'Chile',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.red),
    ),
    DSComboBoxSuggestion(
      value: 'br',
      label: 'Brasil',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.green),
    ),
    DSComboBoxSuggestion(
      value: 'fr',
      label: 'Francia',
      subtitle: 'Europa',
      leading: Icon(Icons.flag, color: Colors.blue),
    ),
    DSComboBoxSuggestion(
      value: 'de',
      label: 'Alemania',
      subtitle: 'Europa',
      leading: Icon(Icons.flag, color: Colors.black),
    ),
    DSComboBoxSuggestion(
      value: 'it',
      label: 'Italia',
      subtitle: 'Europa',
      leading: Icon(Icons.flag, color: Colors.green),
    ),
    DSComboBoxSuggestion(
      value: 'disabled',
      label: 'País Deshabilitado',
      subtitle: 'No disponible',
      enabled: false,
    ),
  ];

  final List<DSComboBoxSuggestion<String>> technologies = [
    DSComboBoxSuggestion(
      value: 'flutter',
      label: 'Flutter',
      subtitle: 'UI Framework',
      leading: Icon(Icons.phone_android, color: Colors.blue),
    ),
    DSComboBoxSuggestion(
      value: 'react',
      label: 'React',
      subtitle: 'JavaScript Library',
      leading: Icon(Icons.web, color: Colors.cyan),
    ),
    DSComboBoxSuggestion(
      value: 'vue',
      label: 'Vue.js',
      subtitle: 'Progressive Framework',
      leading: Icon(Icons.web, color: Colors.green),
    ),
    DSComboBoxSuggestion(
      value: 'angular',
      label: 'Angular',
      subtitle: 'Web Framework',
      leading: Icon(Icons.web, color: Colors.red),
    ),
    DSComboBoxSuggestion(
      value: 'nextjs',
      label: 'Next.js',
      subtitle: 'React Framework',
      leading: Icon(Icons.web, color: Colors.black),
    ),
    DSComboBoxSuggestion(
      value: 'nuxtjs',
      label: 'Nuxt.js',
      subtitle: 'Vue Framework',
      leading: Icon(Icons.web, color: Colors.green),
    ),
    DSComboBoxSuggestion(
      value: 'svelte',
      label: 'Svelte',
      subtitle: 'Compile-time Framework',
      leading: Icon(Icons.web, color: Colors.orange),
    ),
  ];

  final List<DSComboBoxSuggestion<String>> emails = [
    DSComboBoxSuggestion(
      value: 'juan.perez@example.com',
      label: 'Juan Pérez',
      subtitle: 'juan.perez@example.com',
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text('JP', style: TextStyle(color: Colors.white)),
      ),
    ),
    DSComboBoxSuggestion(
      value: 'maria.garcia@example.com',
      label: 'María García',
      subtitle: 'maria.garcia@example.com',
      leading: CircleAvatar(
        backgroundColor: Colors.pink,
        child: Text('MG', style: TextStyle(color: Colors.white)),
      ),
    ),
    DSComboBoxSuggestion(
      value: 'carlos.rodriguez@example.com',
      label: 'Carlos Rodríguez',
      subtitle: 'carlos.rodriguez@example.com',
      leading: CircleAvatar(
        backgroundColor: Colors.green,
        child: Text('CR', style: TextStyle(color: Colors.white)),
      ),
    ),
    DSComboBoxSuggestion(
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
        title: const Text('DSComboBox Story'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildStorySection(
            'Basic Typeahead',
            'ComboBox básico con sugerencias estáticas',
            DSComboBox<String>(
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
              variant: DSComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'With Icons and Subtitles',
            'ComboBox con iconos y subtítulos',
            DSComboBox<String>(
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
              variant: DSComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Email Suggestions',
            'ComboBox para sugerencias de email',
            DSComboBox<String>(
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
              variant: DSComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'With Validation',
            'ComboBox con validación',
            DSComboBox<String>(
              query: validationQuery,
              onQueryChanged: (query) =>
                  setState(() => validationQuery = query),
              suggestions: countries,
              onSelected: (suggestion) {
                setState(() => validationQuery = suggestion.label);
              },
              placeholder: 'Campo requerido',
              label: 'País Requerido',
              validator: DSComboBoxValidator.required,
              variant: DSComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Error State',
            'ComboBox con mensaje de error',
            DSComboBox<String>(
              query: '',
              onQueryChanged: (query) {},
              suggestions: countries,
              onSelected: (suggestion) {},
              placeholder: 'Campo con error',
              label: 'Campo con Error',
              errorText: 'Este campo es requerido',
              variant: DSComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Disabled State',
            'ComboBox deshabilitado',
            DSComboBox<String>(
              query: disabledQuery,
              onQueryChanged: (query) => setState(() => disabledQuery = query),
              suggestions: countries,
              onSelected: (suggestion) {},
              placeholder: 'Campo deshabilitado',
              label: 'ComboBox Deshabilitado',
              helperText: 'Este campo no se puede modificar',
              enabled: false,
              variant: DSComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Loading State',
            'ComboBox en estado de carga',
            DSComboBox<String>(
              query: loadingQuery,
              onQueryChanged: (query) => setState(() => loadingQuery = query),
              suggestions: countries,
              onSelected: (suggestion) {},
              placeholder: 'Cargando...',
              label: 'Estado de Carga',
              helperText: 'Los datos se están cargando',
              overrideState: DSComboBoxState.loading,
              variant: DSComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Skeleton State',
            'ComboBox en estado skeleton',
            DSComboBox<String>(
              query: '',
              onQueryChanged: (query) {},
              suggestions: countries,
              onSelected: (suggestion) {},
              placeholder: 'Cargando...',
              label: 'Estado Skeleton',
              helperText: 'Cargando contenido...',
              overrideState: DSComboBoxState.skeleton,
              variant: DSComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Async Suggestions',
            'ComboBox con búsqueda asíncrona',
            DSComboBox<String>(
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
              variant: DSComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Custom Configuration',
            'ComboBox con configuración personalizada',
            DSComboBox<String>(
              query: customQuery,
              onQueryChanged: (query) => setState(() => customQuery = query),
              suggestions: countries,
              onSelected: (suggestion) {
                setState(() => customQuery = suggestion.label);
              },
              placeholder: 'Configuración personalizada',
              label: 'Custom Config',
              helperText: 'Con estilos personalizados',
              config: const DSComboBoxConfig(
                borderRadius: 16,
                minimumHeight: 60,
                borderWidth: 3,
                contentPadding: EdgeInsets.all(20),
                typeaheadDebounceMs: 500,
                maxSuggestions: 5,
                highlightMatches: true,
                enableFloatingLabel: false,
              ),
              variant: DSComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Multiple Validators',
            'ComboBox con validación combinada',
            DSComboBox<String>(
              query: '',
              onQueryChanged: (query) {},
              suggestions: countries,
              onSelected: (suggestion) {},
              placeholder: 'Email con validación',
              label: 'Email Válido',
              helperText: 'Debe ser un email válido de al menos 5 caracteres',
              validator: DSComboBoxValidator.combine([
                DSComboBoxValidator.required,
                DSComboBoxValidator.minLength(5),
                DSComboBoxValidator.email,
              ]),
              keyboardType: TextInputType.emailAddress,
              variant: DSComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'Compact Size',
            'ComboBox con tamaño compacto',
            DSComboBox<String>(
              query: '',
              onQueryChanged: (query) {},
              suggestions: technologies,
              onSelected: (suggestion) {},
              placeholder: 'Tamaño compacto',
              label: 'ComboBox Compacto',
              dense: true,
              width: 250,
              variant: DSComboBoxVariant.typeahead,
            ),
          ),
          _buildStorySection(
            'RTL Support',
            'Soporte para texto de derecha a izquierda',
            DSComboBox<String>(
              query: '',
              onQueryChanged: (query) {},
              suggestions: [
                DSComboBoxSuggestion(value: 'ar', label: 'العربية'),
                DSComboBoxSuggestion(value: 'he', label: 'עברית'),
                DSComboBoxSuggestion(value: 'fa', label: 'فارسی'),
                DSComboBoxSuggestion(value: 'ur', label: 'اردو'),
              ],
              onSelected: (suggestion) {},
              placeholder: 'اختر لغة',
              label: 'اللغة',
              textDirection: TextDirection.rtl,
              variant: DSComboBoxVariant.typeahead,
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

  Future<List<DSComboBoxSuggestion<String>>> _performAsyncSearch(
      String query) async {
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
        .map((company) => DSComboBoxSuggestion(
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
          DSComboBox<String>(
            query: formQuery,
            onQueryChanged: (query) => setState(() => formQuery = query),
            suggestions: countries,
            onSelected: (suggestion) {
              setState(() => formQuery = suggestion.label);
            },
            placeholder: 'Selecciona tu país',
            label: 'País de Residencia',
            validator: DSComboBoxValidator.required,
            variant: DSComboBoxVariant.typeahead,
          ),
          const SizedBox(height: 16),
          DSComboBox<String>(
            query: '',
            onQueryChanged: (query) {},
            suggestions: technologies,
            onSelected: (suggestion) {},
            placeholder: 'Tu especialidad',
            label: 'Tecnología Principal',
            validator: DSComboBoxValidator.required,
            variant: DSComboBoxVariant.typeahead,
          ),
          const SizedBox(height: 16),
          DSComboBox<String>(
            query: '',
            onQueryChanged: (query) {},
            suggestions: emails,
            onSelected: (suggestion) {},
            placeholder: 'contacto@ejemplo.com',
            label: 'Email de Contacto',
            validator: DSComboBoxValidator.combine([
              DSComboBoxValidator.required,
              DSComboBoxValidator.email,
            ]),
            keyboardType: TextInputType.emailAddress,
            variant: DSComboBoxVariant.typeahead,
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
