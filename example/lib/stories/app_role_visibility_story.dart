import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class DSRoleVisibilityStory extends StatefulWidget {
  const DSRoleVisibilityStory({super.key});

  @override
  State<DSRoleVisibilityStory> createState() => _DSRoleVisibilityStoryState();
}

class _DSRoleVisibilityStoryState extends State<DSRoleVisibilityStory> {
  final List<DSRole> _currentUserRoles = [DSRolePredefined.user];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSRoleVisibility Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserRoleSelector(),
            const SizedBox(height: 24),
            _buildExamplesList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserRoleSelector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Simular Usuario',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: DSRolePredefined.all.map((role) {
                final isSelected = _currentUserRoles.any((r) => r.id == role.id);
                return FilterChip(
                  label: Text(role.name),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        if (!_currentUserRoles.any((r) => r.id == role.id)) {
                          _currentUserRoles.add(role);
                        }
                      } else {
                        _currentUserRoles.removeWhere((r) => r.id == role.id);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Text(
              'Roles actuales: ${_currentUserRoles.map((r) => r.name).join(', ')}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamplesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ejemplos de Visibilidad por Roles',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),

        // Ejemplo básico - Solo Admins
        _buildExample(
          'Solo Administradores',
          'Solo los usuarios con rol de administrador pueden ver este contenido.',
          const DSRoleVisibilityConfig(
            roles: [DSRolePredefined.admin],
            evaluationMode: DSRoleEvaluationMode.any,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              children: [
                Icon(Icons.admin_panel_settings, color: Colors.red, size: 32),
                SizedBox(height: 8),
                Text(
                  'Panel de Administración',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Solo visible para administradores'),
              ],
            ),
          ),
        ),

        // Ejemplo - Editores y Administradores
        _buildExample(
          'Editores y Administradores',
          'Visible para usuarios con rol de editor o administrador.',
          const DSRoleVisibilityConfig(
            roles: [DSRolePredefined.editor, DSRolePredefined.admin],
            evaluationMode: DSRoleEvaluationMode.any,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              children: [
                Icon(Icons.edit, color: Colors.blue, size: 32),
                SizedBox(height: 8),
                Text(
                  'Editor de Contenido',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Visible para editores y administradores'),
              ],
            ),
          ),
        ),

        // Ejemplo - Con placeholder
        _buildExample(
          'Con Placeholder',
          'Muestra un placeholder cuando el usuario no tiene permisos.',
          const DSRoleVisibilityConfig(
            roles: [DSRolePredefined.admin],
            evaluationMode: DSRoleEvaluationMode.any,
            showPlaceholder: true,
            behavior: DSRoleVisibilityBehavior(
              preserveSpaceWhenHidden: true,
              showErrorMessages: true,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              children: [
                Icon(Icons.lock, color: Colors.green, size: 32),
                SizedBox(height: 8),
                Text(
                  'Contenido Restringido',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Solo para administradores'),
              ],
            ),
          ),
        ),

        // Ejemplo - Múltiples roles requeridos
        _buildExample(
          'Múltiples Roles Requeridos',
          'Requiere TODOS los roles especificados (admin Y editor).',
          const DSRoleVisibilityConfig(
            roles: [DSRolePredefined.admin, DSRolePredefined.editor],
            evaluationMode: DSRoleEvaluationMode.all,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              border: Border.all(color: Colors.purple),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              children: [
                Icon(Icons.security, color: Colors.purple, size: 32),
                SizedBox(height: 8),
                Text(
                  'Área de Máxima Seguridad',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Requiere múltiples roles'),
              ],
            ),
          ),
        ),

        // Ejemplo - Con debug helpers
        _buildExample(
          'Con Debug Helpers',
          'Muestra información de debugging durante el desarrollo.',
          const DSRoleVisibilityConfig(
            roles: [DSRolePredefined.user],
            evaluationMode: DSRoleEvaluationMode.any,
            showDebugHelpers: true,
            behavior: DSRoleVisibilityBehavior(
              enableDebugMode: true,
              enableLogging: true,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              border: Border.all(color: Colors.orange),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              children: [
                Icon(Icons.bug_report, color: Colors.orange, size: 32),
                SizedBox(height: 8),
                Text(
                  'Panel de Debug',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Con información de desarrollo'),
              ],
            ),
          ),
        ),

        // Ejemplo - Todos los usuarios
        _buildExample(
          'Visible para Todos',
          'No requiere roles específicos, visible para cualquier usuario.',
          const DSRoleVisibilityConfig(
            roles: [],
            evaluationMode: DSRoleEvaluationMode.any,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              children: [
                Icon(Icons.public, color: Colors.green, size: 32),
                SizedBox(height: 8),
                Text(
                  'Contenido Público',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Visible para todos los usuarios'),
              ],
            ),
          ),
        ),

        // Ejemplo con loading state
        _buildExample(
          'Estado de Carga',
          'Simula la evaluación asíncrona de permisos.',
          const DSRoleVisibilityConfig(
            roles: [DSRolePredefined.admin],
            state: DSRoleState.loading,
            behavior: DSRoleVisibilityBehavior(
              enableLogging: true,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              children: [
                Icon(Icons.hourglass_empty, color: Colors.grey, size: 32),
                SizedBox(height: 8),
                Text(
                  'Contenido en Carga',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Evaluando permisos...'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExample(
    String title,
    String description,
    DSRoleVisibilityConfig config,
    Widget content,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 12),
            DSRoleVisibility(
              config: config,
              userRoles: _currentUserRoles,
              onVisibilityChanged: (result) {
                debugPrint('Visibility changed: ${result.hasAccess}');
              },
              errorBuilder: (context, error, config) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    border: Border.all(color: Colors.red.shade200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.block, color: Colors.red, size: 32),
                      const SizedBox(height: 8),
                      const Text(
                        'Acceso Denegado',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        error.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
              child: content,
            ),
            if (config.showDebugHelpers) ...[
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Debug Info:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Roles requeridos: ${config.roles.map((r) => r.name).join(', ')}',
                      style: const TextStyle(fontSize: 11),
                    ),
                    Text(
                      'Modo evaluación: ${config.evaluationMode.name}',
                      style: const TextStyle(fontSize: 11),
                    ),
                    Text(
                      'Roles usuario: ${_currentUserRoles.map((r) => r.name).join(', ')}',
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Ejemplos adicionales para testing y desarrollo
class DSRoleVisibilityExamples {
  static const List<DSRoleVisibilityConfig> configs = [
    // Configuración básica
    DSRoleVisibilityConfig(),

    // Solo administradores
    DSRoleVisibilityConfig(
      roles: [DSRolePredefined.admin],
    ),

    // Editores y administradores
    DSRoleVisibilityConfig(
      roles: [DSRolePredefined.editor, DSRolePredefined.admin],
      evaluationMode: DSRoleEvaluationMode.any,
    ),

    // Requiere múltiples roles
    DSRoleVisibilityConfig(
      roles: [DSRolePredefined.admin, DSRolePredefined.moderator],
      evaluationMode: DSRoleEvaluationMode.all,
    ),

    // Con debug habilitado
    DSRoleVisibilityConfig(
      roles: [DSRolePredefined.user],
      showDebugHelpers: true,
      behavior: DSRoleVisibilityBehavior(
        enableDebugMode: true,
        enableLogging: true,
      ),
    ),

    // Estado de carga
    DSRoleVisibilityConfig(
      roles: [DSRolePredefined.admin],
      state: DSRoleState.loading,
    ),

    // Estado deshabilitado
    DSRoleVisibilityConfig(
      roles: [DSRolePredefined.user],
      state: DSRoleState.disabled,
    ),
  ];

  static List<DSRole> getSampleUserRoles() {
    return [
      DSRolePredefined.user,
      DSRolePredefined.editor,
    ];
  }

  static Widget buildExampleContent(String title, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(Icons.visibility, color: color, size: 48),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Este contenido está visible según la configuración de roles.',
            textAlign: TextAlign.center,
            style: TextStyle(color: color.withValues(alpha: 0.8)),
          ),
        ],
      ),
    );
  }
}