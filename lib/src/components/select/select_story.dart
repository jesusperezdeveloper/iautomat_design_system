import 'package:flutter/material.dart';
import 'ds_select.dart';
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

  final List<DSSelectItem<String>> countries = [
    DSSelectItem(
      value: 'es',
      label: 'España',
      subtitle: 'Europa',
      leading: Icon(Icons.flag, color: Colors.red),
    ),
    DSSelectItem(
      value: 'us',
      label: 'Estados Unidos',
      subtitle: 'América del Norte',
      leading: Icon(Icons.flag, color: Colors.blue),
    ),
    DSSelectItem(
      value: 'mx',
      label: 'México',
      subtitle: 'América del Norte',
      leading: Icon(Icons.flag, color: Colors.green),
    ),
    DSSelectItem(
      value: 'ar',
      label: 'Argentina',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.lightBlue),
    ),
    DSSelectItem(
      value: 'co',
      label: 'Colombia',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.yellow),
    ),
    DSSelectItem(
      value: 'pe',
      label: 'Perú',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.red),
    ),
    DSSelectItem(
      value: 'cl',
      label: 'Chile',
      subtitle: 'América del Sur',
      leading: Icon(Icons.flag, color: Colors.red),
    ),
    DSSelectItem(
      value: 'disabled',
      label: 'Opción Deshabilitada',
      subtitle: 'No disponible',
      enabled: false,
    ),
  ];

  final List<DSSelectItem<String>> colors = [
    DSSelectItem(
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
    DSSelectItem(
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
    DSSelectItem(
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
    DSSelectItem(
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
    DSSelectItem(
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
        title: const Text('DSSelect Story'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildStorySection(
            'Single Select',
            'Selección simple con opciones básicas',
            DSSelect<String>(
              items: countries,
              value: singleValue,
              onChanged: (value) => setState(() => singleValue = value),
              placeholder: 'Selecciona un país',
              label: 'País',
              helperText: 'Elige tu país de residencia',
              variant: DSSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'Multi Select',
            'Selección múltiple con chips',
            DSSelect<String>(
              items: colors,
              values: multiValues,
              onMultiChanged: (values) => setState(() => multiValues = values),
              placeholder: 'Selecciona colores',
              label: 'Colores Favoritos',
              helperText: 'Puedes seleccionar múltiples colores',
              variant: DSSelectVariant.multi,
            ),
          ),
          _buildStorySection(
            'Searchable Select',
            'Selección con búsqueda integrada',
            DSSelect<String>(
              items: countries,
              value: searchableValue,
              onChanged: (value) => setState(() => searchableValue = value),
              placeholder: 'Buscar y seleccionar país',
              label: 'País (Búsqueda)',
              helperText: 'Usa la búsqueda para encontrar países',
              searchHint: 'Buscar países...',
              variant: DSSelectVariant.searchable,
            ),
          ),
          _buildStorySection(
            'With Icons',
            'Select con iconos de prefijo y sufijo',
            DSSelect<String>(
              items: colors.take(3).toList(),
              value: singleValue,
              onChanged: (value) => setState(() => singleValue = value),
              placeholder: 'Selecciona color',
              label: 'Color con Iconos',
              prefixIcon: Icon(Icons.palette),
              suffixIcon: Icon(Icons.star),
              variant: DSSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'Disabled State',
            'Select deshabilitado',
            DSSelect<String>(
              items: countries,
              value: disabledValue,
              onChanged: (value) => setState(() => disabledValue = value),
              placeholder: 'Campo deshabilitado',
              label: 'Select Deshabilitado',
              helperText: 'Este campo no se puede modificar',
              enabled: false,
              variant: DSSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'Error State',
            'Select con mensaje de error',
            DSSelect<String>(
              items: countries,
              value: singleValue,
              onChanged: (value) => setState(() => singleValue = value),
              placeholder: 'Selecciona una opción',
              label: 'Campo con Error',
              errorText: 'Este campo es requerido',
              variant: DSSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'Loading State',
            'Select en estado de carga',
            DSSelect<String>(
              items: countries,
              value: loadingValue,
              onChanged: (value) => setState(() => loadingValue = value),
              placeholder: 'Cargando...',
              label: 'Estado de Carga',
              helperText: 'Los datos se están cargando',
              overrideState: DSSelectState.loading,
              variant: DSSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'Skeleton State',
            'Select en estado skeleton',
            DSSelect<String>(
              items: countries,
              value: null,
              onChanged: (_) {},
              placeholder: 'Cargando...',
              label: 'Estado Skeleton',
              helperText: 'Cargando contenido...',
              overrideState: DSSelectState.skeleton,
              variant: DSSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'Custom Configuration',
            'Select con configuración personalizada',
            DSSelect<String>(
              items: countries,
              value: singleValue,
              onChanged: (value) => setState(() => singleValue = value),
              placeholder: 'Configuración personalizada',
              label: 'Custom Config',
              helperText: 'Con estilos personalizados',
              config: const DSSelectConfig(
                borderRadius: 16,
                contentPadding: EdgeInsets.all(20),
                minimumHeight: 60,
                borderWidth: 3,
                maxDropdownHeight: 250,
              ),
              variant: DSSelectVariant.single,
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
            DSSelect<String>(
              items: colors,
              value: singleValue,
              onChanged: (value) => setState(() => singleValue = value),
              placeholder: 'Tamaño compacto',
              label: 'Select Compacto',
              dense: true,
              width: 200,
              variant: DSSelectVariant.single,
            ),
          ),
          _buildStorySection(
            'RTL Support',
            'Soporte para texto de derecha a izquierda',
            DSSelect<String>(
              items: [
                DSSelectItem(value: 'ar', label: 'العربية'),
                DSSelectItem(value: 'he', label: 'עברית'),
                DSSelectItem(value: 'fa', label: 'فارسی'),
              ],
              value: singleValue,
              onChanged: (value) => setState(() => singleValue = value),
              placeholder: 'اختر لغة',
              label: 'اللغة',
              textDirection: TextDirection.rtl,
              variant: DSSelectVariant.single,
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
          DSSelect<String>(
            items: countries,
            value: singleValue,
            onChanged: (value) => setState(() => singleValue = value),
            placeholder: 'Campo requerido',
            label: 'País Requerido',
            validator: DSSelectValidator.required,
            variant: DSSelectVariant.single,
          ),
          const SizedBox(height: 16),
          DSSelect<String>(
            items: colors,
            values: multiValues,
            onMultiChanged: (values) => setState(() => multiValues = values),
            placeholder: 'Mínimo 2 colores',
            label: 'Selección Múltiple (Min 2)',
            multiValidator: DSSelectValidator.minSelection(2),
            helperText: 'Selecciona al menos 2 colores',
            variant: DSSelectVariant.multi,
          ),
          const SizedBox(height: 16),
          DSSelect<String>(
            items: colors,
            values: multiValues,
            onMultiChanged: (values) => setState(() => multiValues = values),
            placeholder: 'Máximo 3 colores',
            label: 'Selección Múltiple (Max 3)',
            multiValidator: DSSelectValidator.maxSelection(3),
            helperText: 'Selecciona máximo 3 colores',
            variant: DSSelectVariant.multi,
          ),
          const SizedBox(height: 16),
          DSSelect<String>(
            items: countries,
            values: multiValues,
            onMultiChanged: (values) => setState(() => multiValues = values),
            placeholder: 'Validación combinada',
            label: 'Validación Combinada',
            multiValidator: DSSelectValidator.combine([
              DSSelectValidator.required,
              DSSelectValidator.minSelection(1),
              DSSelectValidator.maxSelection(3),
            ]),
            helperText: 'Requerido, mínimo 1, máximo 3',
            variant: DSSelectVariant.multi,
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
