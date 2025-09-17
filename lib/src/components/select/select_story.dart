import 'package:flutter/material.dart';
import 'app_select.dart';
import 'select_config.dart';

class SelectStory extends StatefulWidget {
  const SelectStory({super.key});

  @override
  State<SelectStory> createState() => _SelectStoryState();
}

class _SelectStoryState extends State<SelectStory> {
  String? singleValue;
  List<String> multiValues = [];
  String? searchableValue;
  String? loadingValue;
  String? disabledValue;

  final List<AppSelectItem<String>> countries = [
    AppSelectItem(
      value: 'es',
      label: 'España',
      subtitle: 'Europa',
      leading: Icon(Icons.flag, color: Colors.red),
    ),
    AppSelectItem(
      value: 'us',
      label: 'Estados Unidos',
      subtitle: 'América del Norte',
      leading: Icon(Icons.flag, color: Colors.blue),
    ),
    AppSelectItem(
      value: 'mx',
      label: 'México',
      subtitle: 'América del Norte',
      leading: Icon(Icons.flag, color: Colors.green),
    ),
    AppSelectItem(
      value: 'ar',
      label: 'Argentina',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.lightBlue),
    ),
    AppSelectItem(
      value: 'co',
      label: 'Colombia',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.yellow),
    ),
    AppSelectItem(
      value: 'pe',
      label: 'Perú',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.red),
    ),
    AppSelectItem(
      value: 'cl',
      label: 'Chile',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.red),
    ),
    AppSelectItem(
      value: 'disabled',
      label: 'Opción Deshabilitada',
      subtitle: 'No disponible',
      enabled: false,
    ),
  ];

  final List<AppSelectItem<String>> colors = [
    AppSelectItem(
      value: 'red',
      label: 'Rojo',
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    ),
    AppSelectItem(
      value: 'blue',
      label: 'Azul',
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    ),
    AppSelectItem(
      value: 'green',
      label: 'Verde',
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
      ),
    ),
    AppSelectItem(
      value: 'yellow',
      label: 'Amarillo',
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.yellow,
          shape: BoxShape.circle,
        ),
      ),
    ),
    AppSelectItem(
      value: 'purple',
      label: 'Morado',
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.purple,
          shape: BoxShape.circle,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppSelect Story'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildStorySection(
            'Single Select',
            'Selección simple con opciones básicas',
            AppSelect<String>(
              items: countries,
              value: singleValue,
              onChanged: (value) => setState(() => singleValue = value),
              placeholder: 'Selecciona un país',
              label: 'País',
              helperText: 'Elige tu país de residencia',
              variant: AppSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'Multi Select',
            'Selección múltiple con chips',
            AppSelect<String>(
              items: colors,
              values: multiValues,
              onMultiChanged: (values) => setState(() => multiValues = values),
              placeholder: 'Selecciona colores',
              label: 'Colores Favoritos',
              helperText: 'Puedes seleccionar múltiples colores',
              variant: AppSelectVariant.multi,
            ),
          ),
          _buildStorySection(
            'Searchable Select',
            'Selección con búsqueda integrada',
            AppSelect<String>(
              items: countries,
              value: searchableValue,
              onChanged: (value) => setState(() => searchableValue = value),
              placeholder: 'Buscar y seleccionar país',
              label: 'País (Búsqueda)',
              helperText: 'Usa la búsqueda para encontrar países',
              searchHint: 'Buscar países...',
              variant: AppSelectVariant.searchable,
            ),
          ),
          _buildStorySection(
            'With Icons',
            'Select con iconos de prefijo y sufijo',
            AppSelect<String>(
              items: colors.take(3).toList(),
              value: singleValue,
              onChanged: (value) => setState(() => singleValue = value),
              placeholder: 'Selecciona color',
              label: 'Color con Iconos',
              prefixIcon: Icon(Icons.palette),
              suffixIcon: Icon(Icons.star),
              variant: AppSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'Disabled State',
            'Select deshabilitado',
            AppSelect<String>(
              items: countries,
              value: disabledValue,
              onChanged: (value) => setState(() => disabledValue = value),
              placeholder: 'Campo deshabilitado',
              label: 'Select Deshabilitado',
              helperText: 'Este campo no se puede modificar',
              enabled: false,
              variant: AppSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'Error State',
            'Select con mensaje de error',
            AppSelect<String>(
              items: countries,
              value: singleValue,
              onChanged: (value) => setState(() => singleValue = value),
              placeholder: 'Selecciona una opción',
              label: 'Campo con Error',
              errorText: 'Este campo es requerido',
              variant: AppSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'Loading State',
            'Select en estado de carga',
            AppSelect<String>(
              items: countries,
              value: loadingValue,
              onChanged: (value) => setState(() => loadingValue = value),
              placeholder: 'Cargando...',
              label: 'Estado de Carga',
              helperText: 'Los datos se están cargando',
              overrideState: AppSelectState.loading,
              variant: AppSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'Skeleton State',
            'Select en estado skeleton',
            AppSelect<String>(
              items: countries,
              value: null,
              onChanged: (_) {},
              placeholder: 'Cargando...',
              label: 'Estado Skeleton',
              helperText: 'Cargando contenido...',
              overrideState: AppSelectState.skeleton,
              variant: AppSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'Custom Configuration',
            'Select con configuración personalizada',
            AppSelect<String>(
              items: countries,
              value: singleValue,
              onChanged: (value) => setState(() => singleValue = value),
              placeholder: 'Configuración personalizada',
              label: 'Custom Config',
              helperText: 'Con estilos personalizados',
              config: const AppSelectConfig(
                borderRadius: 16,
                contentPadding: EdgeInsets.all(20),
                minimumHeight: 60,
                borderWidth: 3,
                maxDropdownHeight: 250,
              ),
              variant: AppSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'Form Validation',
            'Selects con validación en formulario',
            _buildValidationForm(),
          ),
          _buildStorySection(
            'Compact Size',
            'Select con tamaño compacto',
            AppSelect<String>(
              items: colors,
              value: singleValue,
              onChanged: (value) => setState(() => singleValue = value),
              placeholder: 'Tamaño compacto',
              label: 'Select Compacto',
              dense: true,
              width: 200,
              variant: AppSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'RTL Support',
            'Soporte para texto de derecha a izquierda',
            AppSelect<String>(
              items: [
                AppSelectItem(value: 'ar', label: 'العربية'),
                AppSelectItem(value: 'he', label: 'עברית'),
                AppSelectItem(value: 'fa', label: 'فارسی'),
              ],
              value: singleValue,
              onChanged: (value) => setState(() => singleValue = value),
              placeholder: 'اختر لغة',
              label: 'اللغة',
              textDirection: TextDirection.rtl,
              variant: AppSelectVariant.single,
            ),
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

  Widget _buildValidationForm() {
    return Form(
      child: Column(
        children: [
          AppSelect<String>(
            items: countries,
            value: singleValue,
            onChanged: (value) => setState(() => singleValue = value),
            placeholder: 'Campo requerido',
            label: 'País Requerido',
            validator: AppSelectValidator.required,
            variant: AppSelectVariant.single,
          ),
          const SizedBox(height: 16),
          AppSelect<String>(
            items: colors,
            values: multiValues,
            onMultiChanged: (values) => setState(() => multiValues = values),
            placeholder: 'Mínimo 2 colores',
            label: 'Selección Múltiple (Min 2)',
            multiValidator: AppSelectValidator.minSelection(2),
            helperText: 'Selecciona al menos 2 colores',
            variant: AppSelectVariant.multi,
          ),
          const SizedBox(height: 16),
          AppSelect<String>(
            items: colors,
            values: multiValues,
            onMultiChanged: (values) => setState(() => multiValues = values),
            placeholder: 'Máximo 3 colores',
            label: 'Selección Múltiple (Max 3)',
            multiValidator: AppSelectValidator.maxSelection(3),
            helperText: 'Selecciona máximo 3 colores',
            variant: AppSelectVariant.multi,
          ),
          const SizedBox(height: 16),
          AppSelect<String>(
            items: countries,
            values: multiValues,
            onMultiChanged: (values) => setState(() => multiValues = values),
            placeholder: 'Validación combinada',
            label: 'Validación Combinada',
            multiValidator: AppSelectValidator.combine([
              AppSelectValidator.required,
              AppSelectValidator.minSelection(1),
              AppSelectValidator.maxSelection(3),
            ]),
            helperText: 'Requerido, mínimo 1, máximo 3',
            variant: AppSelectVariant.multi,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Validate form
            },
            child: const Text('Validar Formulario'),
          ),
        ],
      ),
    );
  }
}