import 'package:flutter/material.dart';

import 'app_metric_card.dart';
import 'metric_card_config.dart';

class MetricCardStoryExample extends StatefulWidget {
  const MetricCardStoryExample({super.key});

  @override
  State<MetricCardStoryExample> createState() => _MetricCardStoryExampleState();
}

class _MetricCardStoryExampleState extends State<MetricCardStoryExample> {
  AppMetricCardVariant _selectedVariant = AppMetricCardVariant.delta;
  AppMetricCardState _selectedState = AppMetricCardState.defaultState;
  AppMetricCardSize _selectedSize = AppMetricCardSize.medium;
  AppMetricCardLayout _selectedLayout = AppMetricCardLayout.vertical;
  bool _animationEnabled = true;
  bool _interactionEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AppMetricCard Stories'),
        backgroundColor: theme.colorScheme.surfaceContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildControlPanel(),
            const SizedBox(height: 32),
            _buildBasicMetricCards(),
            const SizedBox(height: 32),
            _buildDeltaVariantExamples(),
            const SizedBox(height: 32),
            _buildSparklineVariantExamples(),
            const SizedBox(height: 32),
            _buildSizeVariations(),
            const SizedBox(height: 32),
            _buildLayoutVariations(),
            const SizedBox(height: 32),
            _buildStateExamples(),
            const SizedBox(height: 32),
            _buildCustomizedCards(),
            const SizedBox(height: 32),
            _buildComplexExamples(),
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
                _buildVariantSelector(),
                _buildStateSelector(),
                _buildSizeSelector(),
                _buildLayoutSelector(),
                _buildToggleControls(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVariantSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Variante:'),
        const SizedBox(height: 8),
        DropdownButton<AppMetricCardVariant>(
          value: _selectedVariant,
          onChanged: (value) => setState(() => _selectedVariant = value!),
          items: AppMetricCardVariant.values.map((variant) {
            return DropdownMenuItem(
              value: variant,
              child: Text(variant.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildStateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Estado:'),
        const SizedBox(height: 8),
        DropdownButton<AppMetricCardState>(
          value: _selectedState,
          onChanged: (value) => setState(() => _selectedState = value!),
          items: AppMetricCardState.values.map((state) {
            return DropdownMenuItem(
              value: state,
              child: Text(state.name),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Tamaño:'),
        const SizedBox(height: 8),
        DropdownButton<AppMetricCardSize>(
          value: _selectedSize,
          onChanged: (value) => setState(() => _selectedSize = value!),
          items: AppMetricCardSize.values.map((size) {
            return DropdownMenuItem(
              value: size,
              child: Text(size.name),
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
        DropdownButton<AppMetricCardLayout>(
          value: _selectedLayout,
          onChanged: (value) => setState(() => _selectedLayout = value!),
          items: AppMetricCardLayout.values.map((layout) {
            return DropdownMenuItem(
              value: layout,
              child: Text(layout.name),
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

  Widget _buildBasicMetricCards() {
    return _buildExampleSection(
      'Métricas Básicas',
      'Tarjetas de métricas simples sin variantes especiales.',
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.0,
        children: [
          AppMetricCard(
            variant: _selectedVariant,
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Usuarios Activos',
            value: '2,847',
            icon: Icons.people,
            animation: AppMetricCardAnimation(
              enabled: _animationEnabled,
              type: AppMetricCardAnimationType.fade,
            ),
            onTap: _interactionEnabled
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Usuarios Activos presionado')),
                    );
                  }
                : null,
          ),
          AppMetricCard(
            variant: _selectedVariant,
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Ingresos',
            value: '\$45,234',
            unit: 'USD',
            icon: Icons.attach_money,
            iconColor: Colors.green,
            animation: AppMetricCardAnimation(
              enabled: _animationEnabled,
              type: AppMetricCardAnimationType.slide,
            ),
            onTap: _interactionEnabled
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ingresos presionado')),
                    );
                  }
                : null,
          ),
          AppMetricCard(
            variant: _selectedVariant,
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Conversiones',
            value: '18.5',
            unit: '%',
            subtitle: 'Tasa de conversión',
            icon: Icons.trending_up,
            iconColor: Colors.blue,
            animation: AppMetricCardAnimation(
              enabled: _animationEnabled,
              type: AppMetricCardAnimationType.scale,
            ),
          ),
          AppMetricCard(
            variant: _selectedVariant,
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Tiempo Promedio',
            value: '3:42',
            unit: 'min',
            icon: Icons.timer,
            iconColor: Colors.orange,
            animation: AppMetricCardAnimation(
              enabled: _animationEnabled,
              type: AppMetricCardAnimationType.bounce,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeltaVariantExamples() {
    return _buildExampleSection(
      'Variante Delta',
      'Tarjetas con indicadores de cambio y tendencias.',
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.8,
        children: [
          AppMetricCard.delta(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Ventas Mensuales',
            value: '\$24,567',
            delta: const AppMetricCardDelta(
              value: 12.5,
              type: AppMetricCardDeltaType.increase,
              period: AppMetricCardDeltaPeriod.month,
            ),
            icon: Icons.shopping_cart,
            iconColor: Colors.green,
          ),
          AppMetricCard.delta(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Gastos Operativos',
            value: '\$8,234',
            delta: const AppMetricCardDelta(
              value: -5.2,
              type: AppMetricCardDeltaType.decrease,
              period: AppMetricCardDeltaPeriod.month,
              label: 'Reducción',
            ),
            icon: Icons.trending_down,
            iconColor: Colors.red,
          ),
          AppMetricCard.delta(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Usuarios Registrados',
            value: '1,247',
            delta: const AppMetricCardDelta(
              value: 8.7,
              type: AppMetricCardDeltaType.increase,
              period: AppMetricCardDeltaPeriod.week,
              showPercentage: true,
            ),
            icon: Icons.person_add,
            iconColor: Colors.blue,
          ),
          AppMetricCard.delta(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Tiempo de Carga',
            value: '2.34',
            unit: 's',
            delta: const AppMetricCardDelta(
              value: 0.0,
              type: AppMetricCardDeltaType.neutral,
              period: AppMetricCardDeltaPeriod.day,
              label: 'Sin cambios',
            ),
            icon: Icons.speed,
            iconColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildSparklineVariantExamples() {
    final sampleTrend = _generateSampleTrend();
    final volatileTrend = _generateVolatileTrend();
    final growthTrend = _generateGrowthTrend();
    final declineTrend = _generateDeclineTrend();

    return _buildExampleSection(
      'Variante Sparkline',
      'Tarjetas con gráficos de línea para mostrar tendencias.',
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.8,
        children: [
          AppMetricCard.sparkline(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Visitas del Sitio',
            value: '12,847',
            trend: sampleTrend,
            icon: Icons.visibility,
            iconColor: Colors.blue,
          ),
          AppMetricCard.sparkline(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Ingresos Diarios',
            value: '\$3,456',
            unit: 'USD',
            trend: growthTrend,
            icon: Icons.trending_up,
            iconColor: Colors.green,
          ),
          AppMetricCard.sparkline(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Errores del Sistema',
            value: '23',
            trend: volatileTrend,
            icon: Icons.error_outline,
            iconColor: Colors.red,
          ),
          AppMetricCard.sparkline(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Tiempo de Respuesta',
            value: '145',
            unit: 'ms',
            trend: declineTrend,
            icon: Icons.timer,
            iconColor: Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildSizeVariations() {
    return _buildExampleSection(
      'Variaciones de Tamaño',
      'Diferentes tamaños de tarjetas métricas.',
      Row(
        children: [
          Expanded(
            child: AppMetricCard.delta(
              size: AppMetricCardSize.small,
              layout: AppMetricCardLayout.compact,
              title: 'Pequeña',
              value: '123',
              delta: const AppMetricCardDelta(
                value: 5.2,
                type: AppMetricCardDeltaType.increase,
              ),
              icon: Icons.star,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: AppMetricCard.delta(
              size: AppMetricCardSize.medium,
              title: 'Mediana',
              value: '4,567',
              delta: const AppMetricCardDelta(
                value: -2.1,
                type: AppMetricCardDeltaType.decrease,
              ),
              icon: Icons.favorite,
              iconColor: Colors.red,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: AppMetricCard.delta(
              size: AppMetricCardSize.large,
              title: 'Grande',
              value: '\$89,123',
              subtitle: 'Ingresos totales',
              delta: const AppMetricCardDelta(
                value: 15.7,
                type: AppMetricCardDeltaType.increase,
                label: 'Crecimiento',
              ),
              icon: Icons.account_balance,
              iconColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLayoutVariations() {
    final sampleTrend = _generateSampleTrend();

    return _buildExampleSection(
      'Variaciones de Layout',
      'Diferentes disposiciones de contenido.',
      Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppMetricCard.delta(
                  layout: AppMetricCardLayout.vertical,
                  title: 'Layout Vertical',
                  value: '1,234',
                  delta: const AppMetricCardDelta(
                    value: 8.5,
                    type: AppMetricCardDeltaType.increase,
                  ),
                  icon: Icons.vertical_align_top,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppMetricCard.delta(
                  layout: AppMetricCardLayout.horizontal,
                  title: 'Layout Horizontal',
                  value: '5,678',
                  delta: const AppMetricCardDelta(
                    value: -3.2,
                    type: AppMetricCardDeltaType.decrease,
                  ),
                  icon: Icons.horizontal_rule,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppMetricCard.sparkline(
            layout: AppMetricCardLayout.compact,
            title: 'Layout Compacto con Sparkline',
            value: '9,876',
            trend: sampleTrend,
            icon: Icons.compress,
            iconColor: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildStateExamples() {
    return _buildExampleSection(
      'Estados de Interacción',
      'Diferentes estados visuales de las tarjetas.',
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.2,
        children: [
          AppMetricCard.delta(
            state: AppMetricCardState.defaultState,
            title: 'Estado Normal',
            value: '1,234',
            delta: const AppMetricCardDelta(
              value: 5.0,
              type: AppMetricCardDeltaType.increase,
            ),
            icon: Icons.check_circle,
          ),
          AppMetricCard.delta(
            state: AppMetricCardState.hover,
            title: 'Estado Hover',
            value: '2,345',
            delta: const AppMetricCardDelta(
              value: 3.2,
              type: AppMetricCardDeltaType.increase,
            ),
            icon: Icons.mouse,
            iconColor: Colors.blue,
          ),
          AppMetricCard.delta(
            state: AppMetricCardState.pressed,
            title: 'Estado Pressed',
            value: '3,456',
            delta: const AppMetricCardDelta(
              value: -1.5,
              type: AppMetricCardDeltaType.decrease,
            ),
            icon: Icons.touch_app,
            iconColor: Colors.orange,
          ),
          AppMetricCard.delta(
            state: AppMetricCardState.focus,
            title: 'Estado Focus',
            value: '4,567',
            delta: const AppMetricCardDelta(
              value: 7.8,
              type: AppMetricCardDeltaType.increase,
            ),
            icon: Icons.center_focus_strong,
            iconColor: Colors.purple,
          ),
          AppMetricCard.delta(
            state: AppMetricCardState.selected,
            title: 'Estado Selected',
            value: '5,678',
            delta: const AppMetricCardDelta(
              value: 2.1,
              type: AppMetricCardDeltaType.increase,
            ),
            icon: Icons.radio_button_checked,
            iconColor: Colors.green,
          ),
          AppMetricCard.delta(
            state: AppMetricCardState.disabled,
            title: 'Estado Disabled',
            value: '6,789',
            delta: const AppMetricCardDelta(
              value: 0.0,
              type: AppMetricCardDeltaType.neutral,
            ),
            icon: Icons.block,
            iconColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomizedCards() {
    return _buildExampleSection(
      'Tarjetas Personalizadas',
      'Tarjetas con estilos y widgets personalizados.',
      Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppMetricCard.delta(
                  title: 'Ventas Premium',
                  value: '\$156,789',
                  delta: const AppMetricCardDelta(
                    value: 23.5,
                    type: AppMetricCardDeltaType.increase,
                    label: 'Este mes',
                  ),
                  style: AppMetricCardStyle(
                    backgroundColor: Colors.blue.withValues(alpha: 0.05),
                    borderColor: Colors.blue,
                    borderWidth: 2,
                    borderRadius: 16,
                    deltaStyle: AppMetricCardDeltaStyle(
                      backgroundColor: Colors.green.withValues(alpha: 0.1),
                      foregroundColor: Colors.green.shade700,
                      borderRadius: 12,
                    ),
                  ),
                  prefix: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.diamond, color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppMetricCard(
                  title: 'Métrica Personalizada',
                  value: 'N/A',
                  customValueWidget: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Operativo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  suffix: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Opciones')),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppMetricCard.sparkline(
            title: 'Rendimiento del Servidor',
            value: '99.9',
            unit: '%',
            subtitle: 'Tiempo de actividad',
            trend: _generateHighPerformanceTrend(),
            style: AppMetricCardStyle(
              backgroundColor: Colors.green.withValues(alpha: 0.05),
              borderColor: Colors.green,
              borderWidth: 1,
              sparklineStyle: AppMetricCardSparklineStyle(
                lineColor: Colors.green,
                fillColor: Colors.green.withValues(alpha: 0.2),
                showFill: true,
                showPoints: true,
                pointRadius: 2,
              ),
            ),
            icon: Icons.dns,
            iconColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildComplexExamples() {
    return _buildExampleSection(
      'Ejemplos Complejos',
      'Tarjetas con múltiples elementos y funcionalidades avanzadas.',
      Column(
        children: [
          AppMetricCard.delta(
            size: AppMetricCardSize.large,
            title: 'Dashboard Ejecutivo',
            value: '\$2,847,392',
            unit: 'USD',
            subtitle: 'Ingresos totales del trimestre',
            delta: const AppMetricCardDelta(
              value: 18.7,
              type: AppMetricCardDeltaType.increase,
              period: AppMetricCardDeltaPeriod.quarter,
              label: 'vs Q3',
              showPercentage: true,
            ),
            prefix: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.account_balance,
                color: Colors.white,
                size: 24,
              ),
            ),
            suffix: PopupMenuButton<String>(
              onSelected: (value) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Acción: $value')),
                );
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'export',
                  child: Text('Exportar datos'),
                ),
                const PopupMenuItem(
                  value: 'details',
                  child: Text('Ver detalles'),
                ),
                const PopupMenuItem(
                  value: 'configure',
                  child: Text('Configurar'),
                ),
              ],
              child: const Icon(Icons.more_vert),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Dashboard Ejecutivo presionado')),
              );
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: AppMetricCard.sparkline(
                  layout: AppMetricCardLayout.horizontal,
                  title: 'Tráfico Web',
                  value: '45.2K',
                  subtitle: 'Visitantes únicos',
                  trend: _generateWebTrafficTrend(),
                  icon: Icons.language,
                  iconColor: Colors.blue,
                  style: AppMetricCardStyle(
                    sparklineStyle: AppMetricCardSparklineStyle(
                      lineColor: Colors.blue,
                      fillColor: Colors.blue.withValues(alpha: 0.1),
                      showFill: true,
                      height: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: AppMetricCard.delta(
                  layout: AppMetricCardLayout.compact,
                  title: 'Conversión',
                  value: '3.8',
                  unit: '%',
                  delta: const AppMetricCardDelta(
                    value: 0.3,
                    type: AppMetricCardDeltaType.increase,
                    showPercentage: false,
                    unit: 'pp',
                  ),
                  icon: Icons.trending_up,
                  iconColor: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonExample() {
    return _buildExampleSection(
      'Estado de Carga (Skeleton)',
      'Tarjetas mostrando el estado de carga.',
      GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.0,
        children: [
          const AppMetricCard(
            state: AppMetricCardState.skeleton,
            title: 'Cargando...',
            value: '---',
            icon: Icons.hourglass_empty,
          ),
          const AppMetricCard.delta(
            state: AppMetricCardState.skeleton,
            title: 'Cargando...',
            value: '---',
            delta: AppMetricCardDelta(
              value: 0,
              type: AppMetricCardDeltaType.neutral,
            ),
            icon: Icons.hourglass_empty,
          ),
          AppMetricCard.sparkline(
            state: AppMetricCardState.skeleton,
            title: 'Cargando...',
            value: '---',
            trend: const [],
            icon: Icons.hourglass_empty,
          ),
          const AppMetricCard(
            state: AppMetricCardState.loading,
            title: 'Procesando...',
            value: '...',
            icon: Icons.refresh,
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

  List<AppMetricCardDataPoint> _generateSampleTrend() {
    final now = DateTime.now();
    return List.generate(15, (index) {
      return AppMetricCardDataPoint(
        value: 50 + (index * 5) + (index % 3) * 10,
        timestamp: now.subtract(Duration(days: 14 - index)),
      );
    });
  }

  List<AppMetricCardDataPoint> _generateVolatileTrend() {
    final now = DateTime.now();
    return List.generate(20, (index) {
      final base = 30.0;
      final volatility = (index % 4) * 15 - 7.5;
      return AppMetricCardDataPoint(
        value: base + volatility,
        timestamp: now.subtract(Duration(hours: 19 - index)),
      );
    });
  }

  List<AppMetricCardDataPoint> _generateGrowthTrend() {
    final now = DateTime.now();
    return List.generate(12, (index) {
      return AppMetricCardDataPoint(
        value: 20 + (index * index * 0.8),
        timestamp: now.subtract(Duration(days: 11 - index)),
      );
    });
  }

  List<AppMetricCardDataPoint> _generateDeclineTrend() {
    final now = DateTime.now();
    return List.generate(10, (index) {
      return AppMetricCardDataPoint(
        value: 100 - (index * index * 1.2),
        timestamp: now.subtract(Duration(days: 9 - index)),
      );
    });
  }

  List<AppMetricCardDataPoint> _generateHighPerformanceTrend() {
    final now = DateTime.now();
    return List.generate(24, (index) {
      final base = 99.5;
      final noise = (index % 5) * 0.1;
      return AppMetricCardDataPoint(
        value: base + noise,
        timestamp: now.subtract(Duration(hours: 23 - index)),
      );
    });
  }

  List<AppMetricCardDataPoint> _generateWebTrafficTrend() {
    final now = DateTime.now();
    return List.generate(7, (index) {
      final weekend = (index == 0 || index == 6) ? 0.7 : 1.0;
      return AppMetricCardDataPoint(
        value: (40000 + index * 2000) * weekend + (index % 2) * 1000,
        timestamp: now.subtract(Duration(days: 6 - index)),
      );
    });
  }
}

class MetricCardBasicStory extends StatelessWidget {
  const MetricCardBasicStory({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppMetricCard(
      title: 'Usuarios Activos',
      value: '2,847',
      icon: Icons.people,
    );
  }
}

class MetricCardDeltaStory extends StatelessWidget {
  const MetricCardDeltaStory({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppMetricCard.delta(
      title: 'Ingresos Mensuales',
      value: '\$24,567',
      delta: AppMetricCardDelta(
        value: 12.5,
        type: AppMetricCardDeltaType.increase,
        period: AppMetricCardDeltaPeriod.month,
      ),
      icon: Icons.attach_money,
      iconColor: Colors.green,
    );
  }
}

class MetricCardSparklineStory extends StatelessWidget {
  const MetricCardSparklineStory({super.key});

  @override
  Widget build(BuildContext context) {
    final trend = List.generate(10, (index) {
      return AppMetricCardDataPoint(
        value: 50 + index * 5.0,
        timestamp: DateTime.now().subtract(Duration(days: 9 - index)),
      );
    });

    return AppMetricCard.sparkline(
      title: 'Visitas del Sitio',
      value: '12,847',
      trend: trend,
      icon: Icons.visibility,
      iconColor: Colors.blue,
    );
  }
}

class MetricCardSkeletonStory extends StatelessWidget {
  const MetricCardSkeletonStory({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppMetricCard(
      state: AppMetricCardState.skeleton,
      title: 'Cargando...',
      value: '---',
      icon: Icons.hourglass_empty,
    );
  }
}

class MetricCardCustomStory extends StatelessWidget {
  const MetricCardCustomStory({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMetricCard.delta(
      title: 'Métrica Premium',
      value: '\$89,123',
      subtitle: 'Ingresos especiales',
      delta: const AppMetricCardDelta(
        value: 23.5,
        type: AppMetricCardDeltaType.increase,
        label: 'Excelente',
      ),
      style: AppMetricCardStyle(
        backgroundColor: Colors.blue.withValues(alpha: 0.05),
        borderColor: Colors.blue,
        borderWidth: 2,
        borderRadius: 16,
      ),
      prefix: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.diamond, color: Colors.blue),
      ),
    );
  }
}
