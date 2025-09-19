import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../../widgets/ds_app_bar_with_back.dart';

class AppBarDemoScreen extends StatefulWidget {
  const AppBarDemoScreen({super.key});

  @override
  State<AppBarDemoScreen> createState() => _AppBarDemoScreenState();
}

class _AppBarDemoScreenState extends State<AppBarDemoScreen> {
  DSTopAppBarVariant _currentVariant = DSTopAppBarVariant.primary;
  DSTopAppBarState _currentState = DSTopAppBarState.defaultState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DSAppBarWithBack(
        title: const Text('AppBar Demo'),
        backRoute: '/components',
        actions: [
          PopupMenuButton<DSTopAppBarVariant>(
            icon: const Icon(Icons.palette),
            tooltip: 'Cambiar variante',
            onSelected: (variant) {
              setState(() {
                _currentVariant = variant;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: DSTopAppBarVariant.primary,
                child: Text('Primary'),
              ),
              const PopupMenuItem(
                value: DSTopAppBarVariant.center,
                child: Text('Center'),
              ),
              const PopupMenuItem(
                value: DSTopAppBarVariant.large,
                child: Text('Large'),
              ),
              const PopupMenuItem(
                value: DSTopAppBarVariant.collapsed,
                child: Text('Collapsed'),
              ),
            ],
          ),
          PopupMenuButton<DSTopAppBarState>(
            icon: const Icon(Icons.tune),
            tooltip: 'Cambiar estado',
            onSelected: (state) {
              setState(() {
                _currentState = state;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: DSTopAppBarState.defaultState,
                child: Text('Default'),
              ),
              const PopupMenuItem(
                value: DSTopAppBarState.loading,
                child: Text('Loading'),
              ),
              const PopupMenuItem(
                value: DSTopAppBarState.skeleton,
                child: Text('Skeleton'),
              ),
              const PopupMenuItem(
                value: DSTopAppBarState.disabled,
                child: Text('Disabled'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('DSTopAppBar - Design System AppBar', style: DSTypography.h2),
            const SizedBox(height: 24),

            // Características principales
            _buildSection(
              'Características Principales',
              'El DSTopAppBar incluye todas las funcionalidades avanzadas del Design System',
              _buildFeaturesDemo(),
            ),

            // Variantes
            _buildSection(
              'Variantes Disponibles',
              'Diferentes estilos y configuraciones',
              _buildVariantsDemo(),
            ),

            // Estados
            _buildSection(
              'Estados del AppBar',
              'Estados para diferentes situaciones de la UI',
              _buildStatesDemo(),
            ),

            // Navegación
            _buildSection(
              'Navegación Automática',
              'Arrow back inteligente y automático',
              _buildNavigationDemo(),
            ),

            // Configuración avanzada
            _buildSection(
              'Configuración Avanzada',
              'Personalización completa del AppBar',
              _buildAdvancedConfigDemo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: DSTypography.h4),
        const SizedBox(height: 8),
        Text(description, style: DSTypography.bodyMedium.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        )),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: content,
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildFeaturesDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 20),
            const SizedBox(width: 8),
            const Expanded(child: Text('Arrow back automático con Navigator.pop()')),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 20),
            const SizedBox(width: 8),
            const Expanded(child: Text('Detección inteligente: back, close, menu o drawer')),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 20),
            const SizedBox(width: 8),
            const Expanded(child: Text('4 variantes: Primary, Center, Large, Collapsed')),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 20),
            const SizedBox(width: 8),
            const Expanded(child: Text('Estados: Default, Loading, Skeleton, Disabled')),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 20),
            const SizedBox(width: 8),
            const Expanded(child: Text('Animaciones y transiciones suaves')),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 20),
            const SizedBox(width: 8),
            const Expanded(child: Text('Responsive design automático')),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 20),
            const SizedBox(width: 8),
            const Expanded(child: Text('Soporte completo para accesibilidad')),
          ],
        ),
      ],
    );
  }

  Widget _buildVariantsDemo() {
    return Column(
      children: [
        _buildVariantCard(
          'Primary',
          'AppBar estándar con título alineado a la izquierda',
          DSTopAppBarVariant.primary,
          Icons.view_headline,
        ),
        const SizedBox(height: 12),
        _buildVariantCard(
          'Center',
          'AppBar con título centrado',
          DSTopAppBarVariant.center,
          Icons.view_agenda,
        ),
        const SizedBox(height: 12),
        _buildVariantCard(
          'Large',
          'AppBar expandible con título grande',
          DSTopAppBarVariant.large,
          Icons.view_day,
        ),
        const SizedBox(height: 12),
        _buildVariantCard(
          'Collapsed',
          'AppBar compacto con altura reducida',
          DSTopAppBarVariant.collapsed,
          Icons.view_compact,
        ),
      ],
    );
  }

  Widget _buildVariantCard(String name, String description, DSTopAppBarVariant variant, IconData icon) {
    final isSelected = _currentVariant == variant;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.outline,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: isSelected
          ? Theme.of(context).colorScheme.primaryContainer
          : null,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected
            ? Theme.of(context).colorScheme.primary
            : null,
        ),
        title: Text(name, style: DSTypography.h6),
        subtitle: Text(description),
        trailing: isSelected
          ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
          : null,
        onTap: () {
          setState(() {
            _currentVariant = variant;
          });
          _showResult('Variante cambiada a $name');
        },
      ),
    );
  }

  Widget _buildStatesDemo() {
    return Column(
      children: [
        _buildStateCard(
          'Default',
          'Estado normal del AppBar',
          DSTopAppBarState.defaultState,
          Icons.check_circle_outline,
        ),
        const SizedBox(height: 12),
        _buildStateCard(
          'Loading',
          'Muestra indicador de carga en título y acciones',
          DSTopAppBarState.loading,
          Icons.hourglass_empty,
        ),
        const SizedBox(height: 12),
        _buildStateCard(
          'Skeleton',
          'Estado de carga con placeholders',
          DSTopAppBarState.skeleton,
          Icons.rectangle_outlined,
        ),
        const SizedBox(height: 12),
        _buildStateCard(
          'Disabled',
          'AppBar deshabilitado con opacidad reducida',
          DSTopAppBarState.disabled,
          Icons.block,
        ),
      ],
    );
  }

  Widget _buildStateCard(String name, String description, DSTopAppBarState state, IconData icon) {
    final isSelected = _currentState == state;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.outline,
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: isSelected
          ? Theme.of(context).colorScheme.secondaryContainer
          : null,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected
            ? Theme.of(context).colorScheme.secondary
            : null,
        ),
        title: Text(name, style: DSTypography.h6),
        subtitle: Text(description),
        trailing: isSelected
          ? Icon(Icons.check, color: Theme.of(context).colorScheme.secondary)
          : null,
        onTap: () {
          setState(() {
            _currentState = state;
          });
          _showResult('Estado cambiado a $name');
        },
      ),
    );
  }

  Widget _buildNavigationDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.auto_awesome, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 8),
                  Text('Navegación Automática', style: DSTypography.h6.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  )),
                ],
              ),
              const SizedBox(height: 8),
              const Text('El DSTopAppBar detecta automáticamente el contexto de navegación:'),
              const SizedBox(height: 12),
              const Text('• Si Navigator.canPop() = true → Muestra arrow back'),
              const Text('• Si es fullscreenDialog → Muestra botón close'),
              const Text('• Si hay Drawer → Muestra botón menu'),
              const Text('• Ejecuta Navigator.pop() automáticamente'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text('Tipos de navegación disponibles:', style: DSTypography.h6),
        const SizedBox(height: 8),
        _buildNavigationTypeCard('Auto', 'Detección automática (recomendado)', DSTopAppBarNavigationType.auto),
        _buildNavigationTypeCard('Back', 'Arrow back forzado', DSTopAppBarNavigationType.back),
        _buildNavigationTypeCard('Close', 'Botón X de cerrar', DSTopAppBarNavigationType.close),
        _buildNavigationTypeCard('Menu', 'Botón hamburger', DSTopAppBarNavigationType.menu),
        _buildNavigationTypeCard('Drawer', 'Botón de drawer', DSTopAppBarNavigationType.drawer),
        _buildNavigationTypeCard('Custom', 'Icono personalizado', DSTopAppBarNavigationType.custom),
      ],
    );
  }

  Widget _buildNavigationTypeCard(String name, String description, DSTopAppBarNavigationType type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              _getNavigationIcon(type),
              size: 16,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: DSTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
                Text(description, style: DSTypography.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getNavigationIcon(DSTopAppBarNavigationType type) {
    switch (type) {
      case DSTopAppBarNavigationType.auto: return Icons.auto_fix_high;
      case DSTopAppBarNavigationType.back: return Icons.arrow_back;
      case DSTopAppBarNavigationType.close: return Icons.close;
      case DSTopAppBarNavigationType.menu: return Icons.menu;
      case DSTopAppBarNavigationType.drawer: return Icons.menu;
      case DSTopAppBarNavigationType.custom: return Icons.build;
    }
  }

  Widget _buildAdvancedConfigDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ejemplo de configuración completa:', style: DSTypography.h6),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            '''DSTopAppBar(
  title: Text('Mi Pantalla'),
  config: DSTopAppBarConfig(
    variant: DSTopAppBarVariant.primary,
    state: DSTopAppBarState.defaultState,
    navigationIcon: DSTopAppBarNavigationIcon(
      type: DSTopAppBarNavigationType.auto,
      tooltip: 'Volver',
      // onPressed: custom action
    ),
    actions: DSTopAppBarActions(
      primary: [action1, action2],
      maxPrimary: 3,
      showOverflow: true,
    ),
    colors: DSTopAppBarColors(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    typography: DSTopAppBarTypography(
      titleStyle: TextStyle(...),
    ),
    spacing: DSTopAppBarSpacing(
      titlePadding: 16.0,
    ),
  ),
)''',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () => _showResult('Revisa la documentación completa en el código'),
          icon: const Icon(Icons.code),
          label: const Text('Ver código completo'),
        ),
      ],
    );
  }

  void _showResult(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}