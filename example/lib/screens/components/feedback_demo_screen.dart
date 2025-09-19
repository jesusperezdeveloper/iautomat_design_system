import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';
import '../../widgets/ds_app_bar_with_back.dart';

class FeedbackDemoScreen extends StatefulWidget {
  const FeedbackDemoScreen({super.key});

  @override
  State<FeedbackDemoScreen> createState() => _FeedbackDemoScreenState();
}

class _FeedbackDemoScreenState extends State<FeedbackDemoScreen> {
  bool _isLoading = false;
  bool _showLinearProgress = false;
  double _progressValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DSAppBarWithBack(
        title: Text('Feedback Demo'),
        backRoute: '/components',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Componentes de Feedback', style: DSTypography.h2),
            const SizedBox(height: 24),

            // SnackBars Section
            _buildSection(
              'SnackBars',
              'Mensajes temporales en la parte inferior',
              _buildSnackBarsDemo(),
            ),

            // Alerts Section
            _buildSection(
              'Alerts y Banners',
              'Notificaciones prominentes para información importante',
              _buildAlertsDemo(),
            ),

            // Progress Indicators Section
            _buildSection(
              'Indicadores de Progreso',
              'Visualización del progreso de tareas',
              _buildProgressDemo(),
            ),

            // Badges Section
            _buildSection(
              'Badges y Chips',
              'Etiquetas e indicadores de estado',
              _buildBadgesDemo(),
            ),

            // Tooltips Section
            _buildSection(
              'Tooltips',
              'Información contextual al hacer hover',
              _buildTooltipsDemo(),
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

  Widget _buildSnackBarsDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () => _showSnackBar('Información guardada correctamente', Icons.check, Colors.green),
              icon: const Icon(Icons.check_circle),
              label: const Text('Éxito'),
            ),
            ElevatedButton.icon(
              onPressed: () => _showSnackBar('Advertencia: Revisa los datos', Icons.warning, Colors.orange),
              icon: const Icon(Icons.warning),
              label: const Text('Advertencia'),
            ),
            ElevatedButton.icon(
              onPressed: () => _showSnackBar('Error: No se pudo conectar', Icons.error, Colors.red),
              icon: const Icon(Icons.error),
              label: const Text('Error'),
            ),
            ElevatedButton.icon(
              onPressed: () => _showActionSnackBar(),
              icon: const Icon(Icons.undo),
              label: const Text('Con Acción'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAlertsDemo() {
    return Column(
      children: [
        // Success Alert
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            border: Border.all(color: Colors.green.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green.shade700),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('¡Operación exitosa!', style: DSTypography.h6.copyWith(color: Colors.green.shade700)),
                    Text('Los datos se han guardado correctamente.', style: DSTypography.bodySmall.copyWith(color: Colors.green.shade600)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Warning Alert
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            border: Border.all(color: Colors.orange.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange.shade700),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Atención requerida', style: DSTypography.h6.copyWith(color: Colors.orange.shade700)),
                    Text('Algunos campos requieren revisión.', style: DSTypography.bodySmall.copyWith(color: Colors.orange.shade600)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Error Alert
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            border: Border.all(color: Colors.red.shade200),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.error, color: Colors.red.shade700),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Error de conexión', style: DSTypography.h6.copyWith(color: Colors.red.shade700)),
                    Text('No se pudo conectar al servidor. Inténtalo de nuevo.', style: DSTypography.bodySmall.copyWith(color: Colors.red.shade600)),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.close, color: Colors.red.shade700),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressDemo() {
    return Column(
      children: [
        // Circular Progress
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text('Circular Progress', style: DSTypography.h6),
                  const SizedBox(height: 12),
                  if (_isLoading)
                    const CircularProgressIndicator()
                  else
                    CircularProgressIndicator(value: _progressValue),
                  const SizedBox(height: 12),
                  Text('${(_progressValue * 100).toInt()}%', style: DSTypography.bodySmall),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isLoading = !_isLoading;
                      });
                    },
                    child: Text(_isLoading ? 'Detener' : 'Cargar'),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => _animateProgress(),
                    child: const Text('Simular progreso'),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Linear Progress
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Linear Progress', style: DSTypography.h6),
                Switch(
                  value: _showLinearProgress,
                  onChanged: (value) {
                    setState(() {
                      _showLinearProgress = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_showLinearProgress)
              const LinearProgressIndicator()
            else
              LinearProgressIndicator(value: _progressValue),
            const SizedBox(height: 8),
            Text('Descargando archivo... ${(_progressValue * 100).toInt()}%',
                 style: DSTypography.bodySmall),
          ],
        ),
      ],
    );
  }

  Widget _buildBadgesDemo() {
    return Column(
      children: [
        // Badges
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            Badge(
              label: const Text('3'),
              child: const Icon(Icons.mail_outline, size: 32),
            ),
            Badge(
              label: const Text('99+'),
              backgroundColor: Colors.red,
              child: const Icon(Icons.notifications_outlined, size: 32),
            ),
            Badge(
              backgroundColor: Colors.green,
              child: const Icon(Icons.shopping_cart_outlined, size: 32),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Chips
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            Chip(
              label: const Text('Flutter'),
              backgroundColor: Colors.blue.shade100,
            ),
            Chip(
              label: const Text('Dart'),
              backgroundColor: Colors.green.shade100,
              onDeleted: () {},
            ),
            ActionChip(
              label: const Text('Filtrar'),
              onPressed: () {},
              avatar: const Icon(Icons.filter_list),
            ),
            FilterChip(
              label: const Text('Activo'),
              selected: true,
              onSelected: (bool value) {},
            ),
            ChoiceChip(
              label: const Text('Opción 1'),
              selected: true,
              onSelected: (bool value) {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTooltipsDemo() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        Tooltip(
          message: 'Este es un tooltip básico',
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Hover para tooltip'),
          ),
        ),
        Tooltip(
          message: 'Tooltip con mensaje largo que puede expandirse en múltiples líneas para mostrar información detallada',
          preferBelow: false,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help_outline),
          ),
        ),
        Tooltip(
          message: 'Configuración',
          child: FloatingActionButton.small(
            onPressed: () {},
            child: const Icon(Icons.settings),
          ),
        ),
      ],
    );
  }

  void _showSnackBar(String message, IconData icon, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _showActionSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Elemento eliminado'),
        action: SnackBarAction(
          label: 'Deshacer',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Acción deshecha')),
            );
          },
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _animateProgress() async {
    for (int i = 0; i <= 100; i += 5) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        setState(() {
          _progressValue = i / 100;
        });
      }
    }
  }
}