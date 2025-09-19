import 'package:flutter/material.dart';

import 'ds_description_list.dart';
import 'description_list_config.dart';

class DescriptionListStoryExample extends StatefulWidget {
  const DescriptionListStoryExample({super.key});

  @override
  State<DescriptionListStoryExample> createState() =>
      _DescriptionListStoryExampleState();
}

class _DescriptionListStoryExampleState
    extends State<DescriptionListStoryExample> {
  DSDescriptionListState _selectedState = DSDescriptionListState.defaultState;
  DSDescriptionListLayout _selectedLayout = DSDescriptionListLayout.adaptive;
  DSDescriptionListDensity _selectedDensity = DSDescriptionListDensity.normal;
  DSDescriptionListSpacing _selectedSpacing = DSDescriptionListSpacing.normal;
  bool _animationEnabled = true;
  bool _interactionEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DSDescriptionList Stories'),
        backgroundColor: theme.colorScheme.surfaceContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildControlPanel(),
            const SizedBox(height: 32),
            _buildBasicExample(),
            const SizedBox(height: 32),
            _buildPersonalInfoExample(),
            const SizedBox(height: 32),
            _buildProductSpecsExample(),
            const SizedBox(height: 32),
            _buildContactInfoExample(),
            const SizedBox(height: 32),
            _buildSystemInfoExample(),
            const SizedBox(height: 32),
            _buildInteractiveExample(),
            const SizedBox(height: 32),
            _buildCustomStyledExample(),
            const SizedBox(height: 32),
            _buildResponsiveExample(),
            const SizedBox(height: 32),
            _buildSkeletonExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildControlPanel() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Controles',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildStateSelector(),
                _buildLayoutSelector(),
                _buildDensitySelector(),
                _buildSpacingSelector(),
                _buildToggleControls(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Estado:'),
        const SizedBox(height: 8),
        DropdownButton<DSDescriptionListState>(
          value: _selectedState,
          onChanged: (value) => setState(() => _selectedState = value!),
          items: DSDescriptionListState.values.map((state) {
            return DropdownMenuItem(
              value: state,
              child: Text(state.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildLayoutSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Layout:'),
        const SizedBox(height: 8),
        DropdownButton<DSDescriptionListLayout>(
          value: _selectedLayout,
          onChanged: (value) => setState(() => _selectedLayout = value!),
          items: DSDescriptionListLayout.values.map((layout) {
            return DropdownMenuItem(
              value: layout,
              child: Text(layout.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDensitySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Densidad:'),
        const SizedBox(height: 8),
        DropdownButton<DSDescriptionListDensity>(
          value: _selectedDensity,
          onChanged: (value) => setState(() => _selectedDensity = value!),
          items: DSDescriptionListDensity.values.map((density) {
            return DropdownMenuItem(
              value: density,
              child: Text(density.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSpacingSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Espaciado:'),
        const SizedBox(height: 8),
        DropdownButton<DSDescriptionListSpacing>(
          value: _selectedSpacing,
          onChanged: (value) => setState(() => _selectedSpacing = value!),
          items: DSDescriptionListSpacing.values.map((spacing) {
            return DropdownMenuItem(
              value: spacing,
              child: Text(spacing.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildToggleControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Opciones:'),
        const SizedBox(height: 8),
        Row(
          children: [
            Checkbox(
              value: _animationEnabled,
              onChanged: (value) => setState(() => _animationEnabled = value!),
            ),
            const Text('Animación'),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _interactionEnabled,
              onChanged: (value) =>
                  setState(() => _interactionEnabled = value!),
            ),
            const Text('Interacción'),
          ],
        ),
      ],
    );
  }

  Widget _buildBasicExample() {
    return _buildExampleSection(
      'Ejemplo Básico',
      'Lista de descripción simple con elementos básicos.',
      DSDescriptionList.responsive(
        state: _selectedState,
        layout: _selectedLayout,
        density: _selectedDensity,
        spacing: _selectedSpacing,
        animation: DSDescriptionListAnimation(
          enabled: _animationEnabled,
          type: DSDescriptionListAnimationType.fade,
        ),
        items: [
          const DSDescriptionListItem(
            term: 'Nombre',
            description: 'Juan Pérez',
          ),
          const DSDescriptionListItem(
            term: 'Email',
            description: 'juan.perez@example.com',
          ),
          const DSDescriptionListItem(
            term: 'Teléfono',
            description: '+1 (555) 123-4567',
            divider: true,
          ),
          const DSDescriptionListItem(
            term: 'Dirección',
            description: '123 Main St, Ciudad, Estado 12345',
            secondaryDescription: 'Dirección principal de envío',
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoExample() {
    return _buildExampleSection(
      'Información Personal',
      'Lista con iconos y elementos secundarios.',
      DSDescriptionList.responsive(
        state: _selectedState,
        layout: _selectedLayout,
        density: _selectedDensity,
        spacing: _selectedSpacing,
        items: [
          const DSDescriptionListItem(
            term: 'Fecha de Nacimiento',
            description: '15 de Marzo, 1990',
            icon: Icons.cake,
            iconColor: Colors.orange,
          ),
          const DSDescriptionListItem(
            term: 'Nacionalidad',
            description: 'Mexicana',
            icon: Icons.flag,
            iconColor: Colors.green,
          ),
          const DSDescriptionListItem(
            term: 'Estado Civil',
            description: 'Soltero/a',
            icon: Icons.favorite,
            iconColor: Colors.red,
            divider: true,
          ),
          DSDescriptionListItem(
            term: 'Idiomas',
            description: 'Español, Inglés',
            secondaryDescription: 'Fluido en ambos idiomas',
            icon: Icons.language,
            iconColor: Colors.blue,
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.person, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductSpecsExample() {
    return _buildExampleSection(
      'Especificaciones del Producto',
      'Lista técnica con widgets personalizados.',
      DSDescriptionList.responsive(
        state: _selectedState,
        layout: _selectedLayout,
        density: _selectedDensity,
        spacing: _selectedSpacing,
        items: [
          const DSDescriptionListItem(
            term: 'Modelo',
            description: 'iPhone 15 Pro',
            highlighted: true,
          ),
          const DSDescriptionListItem(
            term: 'Procesador',
            description: 'Apple A17 Pro',
            secondaryDescription: '3nm technology',
          ),
          DSDescriptionListItem(
            term: 'Memoria',
            description: '128GB',
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green),
              ),
              child: const Text(
                'Disponible',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            divider: true,
          ),
          const DSDescriptionListItem(
            term: 'Pantalla',
            description: '6.1" Super Retina XDR',
            secondaryDescription: '2556×1179 pixels, 460 ppi',
          ),
          const DSDescriptionListItem(
            term: 'Cámara',
            description: 'Triple sistema de 48MP',
            secondaryDescription: 'Principal, Ultra Angular, Teleobjetivo',
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfoExample() {
    return _buildExampleSection(
      'Información de Contacto',
      'Lista con acciones y elementos interactivos.',
      DSDescriptionList.responsive(
        state: _selectedState,
        layout: _selectedLayout,
        density: _selectedDensity,
        spacing: _selectedSpacing,
        onTap: _interactionEnabled
            ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Lista presionada')),
                );
              }
            : null,
        items: [
          DSDescriptionListItem(
            term: 'Email Principal',
            description: 'contacto@empresa.com',
            icon: Icons.email,
            onTap: _interactionEnabled
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Email presionado')),
                    );
                  }
                : null,
            trailing:
                _interactionEnabled ? const Icon(Icons.open_in_new) : null,
          ),
          DSDescriptionListItem(
            term: 'Teléfono',
            description: '+52 55 1234 5678',
            icon: Icons.phone,
            onTap: _interactionEnabled
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Teléfono presionado')),
                    );
                  }
                : null,
            trailing: _interactionEnabled ? const Icon(Icons.call) : null,
          ),
          DSDescriptionListItem(
            term: 'Dirección',
            description: 'Av. Insurgentes Sur 123',
            secondaryDescription: 'Ciudad de México, México',
            icon: Icons.location_on,
            onTap: _interactionEnabled
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Dirección presionada')),
                    );
                  }
                : null,
            trailing: _interactionEnabled ? const Icon(Icons.map) : null,
            divider: true,
          ),
          DSDescriptionListItem(
            term: 'Sitio Web',
            description: 'www.empresa.com',
            icon: Icons.web,
            onTap: _interactionEnabled
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sitio web presionado')),
                    );
                  }
                : null,
            trailing: _interactionEnabled ? const Icon(Icons.launch) : null,
          ),
        ],
      ),
    );
  }

  Widget _buildSystemInfoExample() {
    return _buildExampleSection(
      'Información del Sistema',
      'Lista con estados y colores personalizados.',
      DSDescriptionList.responsive(
        state: _selectedState,
        layout: _selectedLayout,
        density: _selectedDensity,
        spacing: _selectedSpacing,
        items: [
          DSDescriptionListItem(
            term: 'Estado del Servidor',
            description: 'En línea',
            icon: Icons.circle,
            iconColor: Colors.green,
            trailing: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
          DSDescriptionListItem(
            term: 'CPU',
            description: '45%',
            secondaryDescription: 'Uso normal',
            trailing: SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                value: 0.45,
                backgroundColor: Colors.grey.withValues(alpha: 0.3),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ),
          DSDescriptionListItem(
            term: 'Memoria',
            description: '8.2 GB / 16 GB',
            secondaryDescription: '51% utilizada',
            trailing: SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                value: 0.51,
                backgroundColor: Colors.grey.withValues(alpha: 0.3),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
            ),
            divider: true,
          ),
          DSDescriptionListItem(
            term: 'Disco',
            description: '120 GB / 500 GB',
            secondaryDescription: '24% utilizado',
            trailing: SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                value: 0.24,
                backgroundColor: Colors.grey.withValues(alpha: 0.3),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveExample() {
    return _buildExampleSection(
      'Lista Interactiva',
      'Lista con elementos seleccionables y acciones.',
      DSDescriptionList.responsive(
        state: _selectedState,
        layout: _selectedLayout,
        density: _selectedDensity,
        spacing: _selectedSpacing,
        items: [
          DSDescriptionListItem(
            term: 'Notificaciones',
            description: 'Activadas',
            icon: Icons.notifications,
            trailing: Switch(
              value: true,
              onChanged: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Notificaciones: ${value ? "On" : "Off"}')),
                );
              },
            ),
          ),
          DSDescriptionListItem(
            term: 'Modo Oscuro',
            description: 'Desactivado',
            icon: Icons.dark_mode,
            trailing: Switch(
              value: false,
              onChanged: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Modo Oscuro: ${value ? "On" : "Off"}')),
                );
              },
            ),
          ),
          DSDescriptionListItem(
            term: 'Ubicación',
            description: 'Permitir acceso',
            icon: Icons.location_on,
            trailing: Switch(
              value: true,
              onChanged: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Ubicación: ${value ? "On" : "Off"}')),
                );
              },
            ),
            divider: true,
          ),
          DSDescriptionListItem(
            term: 'Idioma',
            description: 'Español',
            icon: Icons.language,
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Seleccionar idioma')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCustomStyledExample() {
    return _buildExampleSection(
      'Estilo Personalizado',
      'Lista con estilos y colores personalizados.',
      DSDescriptionList.responsive(
        state: _selectedState,
        layout: _selectedLayout,
        density: _selectedDensity,
        spacing: _selectedSpacing,
        style: DSDescriptionListStyle(
          backgroundColor: Colors.blue.withValues(alpha: 0.05),
          borderColor: Colors.blue,
          borderWidth: 2,
          borderRadius: 16,
          padding: const EdgeInsets.all(20),
          itemStyle: DSDescriptionListItemStyle(
            termTextStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            descriptionTextStyle: TextStyle(
              color: Colors.blue.shade700,
            ),
            secondaryDescriptionTextStyle: TextStyle(
              color: Colors.blue.shade400,
              fontSize: 12,
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          dividerStyle: DSDescriptionListDividerStyle(
            color: Colors.blue.withValues(alpha: 0.3),
            thickness: 1,
          ),
        ),
        items: [
          const DSDescriptionListItem(
            term: 'Plan',
            description: 'Premium',
            secondaryDescription: 'Incluye todas las funciones',
          ),
          const DSDescriptionListItem(
            term: 'Usuarios',
            description: '10 / 50',
            secondaryDescription: 'Usuarios activos este mes',
          ),
          const DSDescriptionListItem(
            term: 'Almacenamiento',
            description: '2.4 TB / 5 TB',
            secondaryDescription: '48% utilizado',
            divider: true,
          ),
          const DSDescriptionListItem(
            term: 'Próxima facturación',
            description: '15 de Febrero, 2024',
            secondaryDescription: 'Renovación automática',
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveExample() {
    return _buildExampleSection(
      'Diseño Responsivo',
      'Lista que se adapta automáticamente al tamaño de pantalla.',
      DSDescriptionList.responsive(
        state: _selectedState,
        layout: DSDescriptionListLayout.adaptive,
        density: _selectedDensity,
        spacing: _selectedSpacing,
        responsive: const DSDescriptionListResponsive(
          mobileBreakpoint: 600,
          tabletBreakpoint: 900,
          desktopBreakpoint: 1200,
          mobileLayout: DSDescriptionListLayout.vertical,
          tabletLayout: DSDescriptionListLayout.horizontal,
          desktopLayout: DSDescriptionListLayout.grid,
          mobileColumns: 1,
          tabletColumns: 2,
          desktopColumns: 3,
        ),
        items: [
          const DSDescriptionListItem(
            term: 'Resolución',
            description: '1920×1080',
            icon: Icons.monitor,
          ),
          const DSDescriptionListItem(
            term: 'Frecuencia',
            description: '60 Hz',
            icon: Icons.refresh,
          ),
          const DSDescriptionListItem(
            term: 'Colores',
            description: '16.7M',
            icon: Icons.palette,
          ),
          const DSDescriptionListItem(
            term: 'Tamaño',
            description: '24 pulgadas',
            icon: Icons.straighten,
          ),
          const DSDescriptionListItem(
            term: 'Conexión',
            description: 'HDMI, USB-C',
            icon: Icons.cable,
          ),
          const DSDescriptionListItem(
            term: 'Consumo',
            description: '65W',
            icon: Icons.power,
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonExample() {
    return _buildExampleSection(
      'Estado de Carga (Skeleton)',
      'Lista mostrando el estado de carga.',
      DSDescriptionList.responsive(
        state: DSDescriptionListState.skeleton,
        layout: _selectedLayout,
        density: _selectedDensity,
        spacing: _selectedSpacing,
        items: [
          const DSDescriptionListItem(
            term: 'Cargando...',
            description: 'Cargando...',
          ),
          const DSDescriptionListItem(
            term: 'Cargando...',
            description: 'Cargando...',
          ),
          const DSDescriptionListItem(
            term: 'Cargando...',
            description: 'Cargando...',
          ),
          const DSDescriptionListItem(
            term: 'Cargando...',
            description: 'Cargando...',
          ),
        ],
      ),
    );
  }

  Widget _buildExampleSection(
      String title, String description, Widget example) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: example,
          ),
        ),
      ],
    );
  }
}

class DescriptionListBasicStory extends StatelessWidget {
  const DescriptionListBasicStory({super.key});

  @override
  Widget build(BuildContext context) {
    return const DSDescriptionList.responsive(
      items: [
        DSDescriptionListItem(
          term: 'Nombre',
          description: 'Juan Pérez',
        ),
        DSDescriptionListItem(
          term: 'Email',
          description: 'juan.perez@example.com',
        ),
        DSDescriptionListItem(
          term: 'Teléfono',
          description: '+1 (555) 123-4567',
        ),
      ],
    );
  }
}

class DescriptionListIconStory extends StatelessWidget {
  const DescriptionListIconStory({super.key});

  @override
  Widget build(BuildContext context) {
    return const DSDescriptionList.responsive(
      items: [
        DSDescriptionListItem(
          term: 'Usuario',
          description: 'Juan Pérez',
          icon: Icons.person,
          iconColor: Colors.blue,
        ),
        DSDescriptionListItem(
          term: 'Email',
          description: 'juan.perez@example.com',
          icon: Icons.email,
          iconColor: Colors.green,
        ),
        DSDescriptionListItem(
          term: 'Teléfono',
          description: '+1 (555) 123-4567',
          icon: Icons.phone,
          iconColor: Colors.orange,
        ),
      ],
    );
  }
}

class DescriptionListInteractiveStory extends StatelessWidget {
  const DescriptionListInteractiveStory({super.key});

  @override
  Widget build(BuildContext context) {
    return DSDescriptionList.responsive(
      items: [
        DSDescriptionListItem(
          term: 'Email',
          description: 'juan.perez@example.com',
          icon: Icons.email,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Email presionado')),
            );
          },
          trailing: const Icon(Icons.open_in_new),
        ),
        DSDescriptionListItem(
          term: 'Teléfono',
          description: '+1 (555) 123-4567',
          icon: Icons.phone,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Teléfono presionado')),
            );
          },
          trailing: const Icon(Icons.call),
        ),
      ],
    );
  }
}

class DescriptionListSkeletonStory extends StatelessWidget {
  const DescriptionListSkeletonStory({super.key});

  @override
  Widget build(BuildContext context) {
    return const DSDescriptionList.responsive(
      state: DSDescriptionListState.skeleton,
      items: [
        DSDescriptionListItem(
          term: 'Cargando...',
          description: 'Cargando...',
        ),
        DSDescriptionListItem(
          term: 'Cargando...',
          description: 'Cargando...',
        ),
        DSDescriptionListItem(
          term: 'Cargando...',
          description: 'Cargando...',
        ),
      ],
    );
  }
}
