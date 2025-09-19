import 'package:flutter/material.dart';

import 'app_metric_card.dart';
import 'metric_card_config.dart';

class MetricCardStoryExample extends StatefulWidget {
  const MetricCardStoryExample({super.key});

  @override
  State<MetricCardStoryExample> createState() => _MetricCardStoryExampleState();
}

class _MetricCardStoryExampleState extends State<MetricCardStoryExample> {
  DSMetricCardVariant _selectedVariant = DSMetricCardVariant.delta;
  DSMetricCardState _selectedState = DSMetricCardState.defaultState;
  DSMetricCardSize _selectedSize = DSMetricCardSize.medium;
  DSMetricCardLayout _selectedLayout = DSMetricCardLayout.vertical;
  bool _animationEnabled = true;
  bool _interactionEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DSMetricCard Stories'),
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
        DropdownButton<DSMetricCardVariant>(
          value: _selectedVariant,
          onChanged: (value) => setState(() => _selectedVariant = value!),
          items: DSMetricCardVariant.values.map((variant) {
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
        DropdownButton<DSMetricCardState>(
          value: _selectedState,
          onChanged: (value) => setState(() => _selectedState = value!),
          items: DSMetricCardState.values.map((state) {
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
        DropdownButton<DSMetricCardSize>(
          value: _selectedSize,
          onChanged: (value) => setState(() => _selectedSize = value!),
          items: DSMetricCardSize.values.map((size) {
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
        DropdownButton<DSMetricCardLayout>(
          value: _selectedLayout,
          onChanged: (value) => setState(() => _selectedLayout = value!),
          items: DSMetricCardLayout.values.map((layout) {
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
          DSMetricCard(
            variant: _selectedVariant,
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Usuarios Activos',
            value: '2,847',
            icon: Icons.people,
            animation: DSMetricCardAnimation(
              enabled: _animationEnabled,
              type: DSMetricCardAnimationType.fade,
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
          DSMetricCard(
            variant: _selectedVariant,
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Ingresos',
            value: '\$45,234',
            unit: 'USD',
            icon: Icons.attach_money,
            iconColor: Colors.green,
            animation: DSMetricCardAnimation(
              enabled: _animationEnabled,
              type: DSMetricCardAnimationType.slide,
            ),
            onTap: _interactionEnabled
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ingresos presionado')),
                    );
                  }
                : null,
          ),
          DSMetricCard(
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
            animation: DSMetricCardAnimation(
              enabled: _animationEnabled,
              type: DSMetricCardAnimationType.scale,
            ),
          ),
          DSMetricCard(
            variant: _selectedVariant,
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Tiempo Promedio',
            value: '3:42',
            unit: 'min',
            icon: Icons.timer,
            iconColor: Colors.orange,
            animation: DSMetricCardAnimation(
              enabled: _animationEnabled,
              type: DSMetricCardAnimationType.bounce,
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
          DSMetricCard.delta(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Ventas Mensuales',
            value: '\$24,567',
            delta: const DSMetricCardDelta(
              value: 12.5,
              type: DSMetricCardDeltaType.increase,
              period: DSMetricCardDeltaPeriod.month,
            ),
            icon: Icons.shopping_cart,
            iconColor: Colors.green,
          ),
          DSMetricCard.delta(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Gastos Operativos',
            value: '\$8,234',
            delta: const DSMetricCardDelta(
              value: -5.2,
              type: DSMetricCardDeltaType.decrease,
              period: DSMetricCardDeltaPeriod.month,
              label: 'Reducción',
            ),
            icon: Icons.trending_down,
            iconColor: Colors.red,
          ),
          DSMetricCard.delta(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Usuarios Registrados',
            value: '1,247',
            delta: const DSMetricCardDelta(
              value: 8.7,
              type: DSMetricCardDeltaType.increase,
              period: DSMetricCardDeltaPeriod.week,
              showPercentage: true,
            ),
            icon: Icons.person_add,
            iconColor: Colors.blue,
          ),
          DSMetricCard.delta(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Tiempo de Carga',
            value: '2.34',
            unit: 's',
            delta: const DSMetricCardDelta(
              value: 0.0,
              type: DSMetricCardDeltaType.neutral,
              period: DSMetricCardDeltaPeriod.day,
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
          DSMetricCard.sparkline(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Visitas del Sitio',
            value: '12,847',
            trend: sampleTrend,
            icon: Icons.visibility,
            iconColor: Colors.blue,
          ),
          DSMetricCard.sparkline(
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
          DSMetricCard.sparkline(
            state: _selectedState,
            size: _selectedSize,
            layout: _selectedLayout,
            title: 'Errores del Sistema',
            value: '23',
            trend: volatileTrend,
            icon: Icons.error_outline,
            iconColor: Colors.red,
          ),
          DSMetricCard.sparkline(
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
            child: DSMetricCard.delta(
              size: DSMetricCardSize.small,
              layout: DSMetricCardLayout.compact,
              title: 'Pequeña',
              value: '123',
              delta: const DSMetricCardDelta(
                value: 5.2,
                type: DSMetricCardDeltaType.increase,
              ),
              icon: Icons.star,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: DSMetricCard.delta(
              size: DSMetricCardSize.medium,
              title: 'Mediana',
              value: '4,567',
              delta: const DSMetricCardDelta(
                value: -2.1,
                type: DSMetricCardDeltaType.decrease,
              ),
              icon: Icons.favorite,
              iconColor: Colors.red,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: DSMetricCard.delta(
              size: DSMetricCardSize.large,
              title: 'Grande',
              value: '\$89,123',
              subtitle: 'Ingresos totales',
              delta: const DSMetricCardDelta(
                value: 15.7,
                type: DSMetricCardDeltaType.increase,
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
                child: DSMetricCard.delta(
                  layout: DSMetricCardLayout.vertical,
                  title: 'Layout Vertical',
                  value: '1,234',
                  delta: const DSMetricCardDelta(
                    value: 8.5,
                    type: DSMetricCardDeltaType.increase,
                  ),
                  icon: Icons.vertical_align_top,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DSMetricCard.delta(
                  layout: DSMetricCardLayout.horizontal,
                  title: 'Layout Horizontal',
                  value: '5,678',
                  delta: const DSMetricCardDelta(
                    value: -3.2,
                    type: DSMetricCardDeltaType.decrease,
                  ),
                  icon: Icons.horizontal_rule,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          DSMetricCard.sparkline(
            layout: DSMetricCardLayout.compact,
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
          DSMetricCard.delta(
            state: DSMetricCardState.defaultState,
            title: 'Estado Normal',
            value: '1,234',
            delta: const DSMetricCardDelta(
              value: 5.0,
              type: DSMetricCardDeltaType.increase,
            ),
            icon: Icons.check_circle,
          ),
          DSMetricCard.delta(
            state: DSMetricCardState.hover,
            title: 'Estado Hover',
            value: '2,345',
            delta: const DSMetricCardDelta(
              value: 3.2,
              type: DSMetricCardDeltaType.increase,
            ),
            icon: Icons.mouse,
            iconColor: Colors.blue,
          ),
          DSMetricCard.delta(
            state: DSMetricCardState.pressed,
            title: 'Estado Pressed',
            value: '3,456',
            delta: const DSMetricCardDelta(
              value: -1.5,
              type: DSMetricCardDeltaType.decrease,
            ),
            icon: Icons.touch_app,
            iconColor: Colors.orange,
          ),
          DSMetricCard.delta(
            state: DSMetricCardState.focus,
            title: 'Estado Focus',
            value: '4,567',
            delta: const DSMetricCardDelta(
              value: 7.8,
              type: DSMetricCardDeltaType.increase,
            ),
            icon: Icons.center_focus_strong,
            iconColor: Colors.purple,
          ),
          DSMetricCard.delta(
            state: DSMetricCardState.selected,
            title: 'Estado Selected',
            value: '5,678',
            delta: const DSMetricCardDelta(
              value: 2.1,
              type: DSMetricCardDeltaType.increase,
            ),
            icon: Icons.radio_button_checked,
            iconColor: Colors.green,
          ),
          DSMetricCard.delta(
            state: DSMetricCardState.disabled,
            title: 'Estado Disabled',
            value: '6,789',
            delta: const DSMetricCardDelta(
              value: 0.0,
              type: DSMetricCardDeltaType.neutral,
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
                child: DSMetricCard.delta(
                  title: 'Ventas Premium',
                  value: '\$156,789',
                  delta: const DSMetricCardDelta(
                    value: 23.5,
                    type: DSMetricCardDeltaType.increase,
                    label: 'Este mes',
                  ),
                  style: DSMetricCardStyle(
                    backgroundColor: Colors.blue.withValues(alpha: 0.05),
                    borderColor: Colors.blue,
                    borderWidth: 2,
                    borderRadius: 16,
                    deltaStyle: DSMetricCardDeltaStyle(
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
                child: DSMetricCard(
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
          DSMetricCard.sparkline(
            title: 'Rendimiento del Servidor',
            value: '99.9',
            unit: '%',
            subtitle: 'Tiempo de actividad',
            trend: _generateHighPerformanceTrend(),
            style: DSMetricCardStyle(
              backgroundColor: Colors.green.withValues(alpha: 0.05),
              borderColor: Colors.green,
              borderWidth: 1,
              sparklineStyle: DSMetricCardSparklineStyle(
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
          DSMetricCard.delta(
            size: DSMetricCardSize.large,
            title: 'Dashboard Ejecutivo',
            value: '\$2,847,392',
            unit: 'USD',
            subtitle: 'Ingresos totales del trimestre',
            delta: const DSMetricCardDelta(
              value: 18.7,
              type: DSMetricCardDeltaType.increase,
              period: DSMetricCardDeltaPeriod.quarter,
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
                child: DSMetricCard.sparkline(
                  layout: DSMetricCardLayout.horizontal,
                  title: 'Tráfico Web',
                  value: '45.2K',
                  subtitle: 'Visitantes únicos',
                  trend: _generateWebTrafficTrend(),
                  icon: Icons.language,
                  iconColor: Colors.blue,
                  style: DSMetricCardStyle(
                    sparklineStyle: DSMetricCardSparklineStyle(
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
                child: DSMetricCard.delta(
                  layout: DSMetricCardLayout.compact,
                  title: 'Conversión',
                  value: '3.8',
                  unit: '%',
                  delta: const DSMetricCardDelta(
                    value: 0.3,
                    type: DSMetricCardDeltaType.increase,
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
          const DSMetricCard(
            state: DSMetricCardState.skeleton,
            title: 'Cargando...',
            value: '---',
            icon: Icons.hourglass_empty,
          ),
          const DSMetricCard.delta(
            state: DSMetricCardState.skeleton,
            title: 'Cargando...',
            value: '---',
            delta: DSMetricCardDelta(
              value: 0,
              type: DSMetricCardDeltaType.neutral,
            ),
            icon: Icons.hourglass_empty,
          ),
          DSMetricCard.sparkline(
            state: DSMetricCardState.skeleton,
            title: 'Cargando...',
            value: '---',
            trend: const [],
            icon: Icons.hourglass_empty,
          ),
          const DSMetricCard(
            state: DSMetricCardState.loading,
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

  List<DSMetricCardDataPoint> _generateSampleTrend() {
    final now = DateTime.now();
    return List.generate(15, (index) {
      return DSMetricCardDataPoint(
        value: 50 + (index * 5) + (index % 3) * 10,
        timestamp: now.subtract(Duration(days: 14 - index)),
      );
    });
  }

  List<DSMetricCardDataPoint> _generateVolatileTrend() {
    final now = DateTime.now();
    return List.generate(20, (index) {
      final base = 30.0;
      final volatility = (index % 4) * 15 - 7.5;
      return DSMetricCardDataPoint(
        value: base + volatility,
        timestamp: now.subtract(Duration(hours: 19 - index)),
      );
    });
  }

  List<DSMetricCardDataPoint> _generateGrowthTrend() {
    final now = DateTime.now();
    return List.generate(12, (index) {
      return DSMetricCardDataPoint(
        value: 20 + (index * index * 0.8),
        timestamp: now.subtract(Duration(days: 11 - index)),
      );
    });
  }

  List<DSMetricCardDataPoint> _generateDeclineTrend() {
    final now = DateTime.now();
    return List.generate(10, (index) {
      return DSMetricCardDataPoint(
        value: 100 - (index * index * 1.2),
        timestamp: now.subtract(Duration(days: 9 - index)),
      );
    });
  }

  List<DSMetricCardDataPoint> _generateHighPerformanceTrend() {
    final now = DateTime.now();
    return List.generate(24, (index) {
      final base = 99.5;
      final noise = (index % 5) * 0.1;
      return DSMetricCardDataPoint(
        value: base + noise,
        timestamp: now.subtract(Duration(hours: 23 - index)),
      );
    });
  }

  List<DSMetricCardDataPoint> _generateWebTrafficTrend() {
    final now = DateTime.now();
    return List.generate(7, (index) {
      final weekend = (index == 0 || index == 6) ? 0.7 : 1.0;
      return DSMetricCardDataPoint(
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
    return const DSMetricCard(
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
    return const DSMetricCard.delta(
      title: 'Ingresos Mensuales',
      value: '\$24,567',
      delta: DSMetricCardDelta(
        value: 12.5,
        type: DSMetricCardDeltaType.increase,
        period: DSMetricCardDeltaPeriod.month,
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
      return DSMetricCardDataPoint(
        value: 50 + index * 5.0,
        timestamp: DateTime.now().subtract(Duration(days: 9 - index)),
      );
    });

    return DSMetricCard.sparkline(
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
    return const DSMetricCard(
      state: DSMetricCardState.skeleton,
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
    return DSMetricCard.delta(
      title: 'Métrica Premium',
      value: '\$89,123',
      subtitle: 'Ingresos especiales',
      delta: const DSMetricCardDelta(
        value: 23.5,
        type: DSMetricCardDeltaType.increase,
        label: 'Excelente',
      ),
      style: DSMetricCardStyle(
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
