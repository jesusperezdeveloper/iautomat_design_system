import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/metric_card/ds_metric_card.dart';
import 'package:iautomat_design_system/src/components/metric_card/metric_card_config.dart';

void main() {
  group('DSMetricCard Golden Tests', () {
    testWidgets('métrica básica simple', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard(
                title: 'Usuarios Activos',
                value: '2,847',
                icon: Icons.people,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_basic.png'),
      );
    });

    testWidgets('métrica con subtítulo y unidad', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard(
                title: 'Ingresos Mensuales',
                value: '45,234',
                unit: 'USD',
                subtitle: 'Facturación del mes actual',
                icon: Icons.attach_money,
                iconColor: Colors.green,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_with_subtitle_unit.png'),
      );
    });

    testWidgets('variante delta con incremento', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                title: 'Ventas Mensuales',
                value: '\$24,567',
                delta: DSMetricCardDelta(
                  value: 12.5,
                  type: DSMetricCardDeltaType.increase,
                  period: DSMetricCardDeltaPeriod.month,
                ),
                icon: Icons.shopping_cart,
                iconColor: Colors.green,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_delta_increase.png'),
      );
    });

    testWidgets('variante delta con disminución', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                title: 'Gastos Operativos',
                value: '\$8,234',
                delta: DSMetricCardDelta(
                  value: -5.2,
                  type: DSMetricCardDeltaType.decrease,
                  period: DSMetricCardDeltaPeriod.month,
                  label: 'Reducción',
                ),
                icon: Icons.trending_down,
                iconColor: Colors.red,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_delta_decrease.png'),
      );
    });

    testWidgets('variante delta neutral', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                title: 'Tiempo de Carga',
                value: '2.34',
                unit: 's',
                delta: DSMetricCardDelta(
                  value: 0.0,
                  type: DSMetricCardDeltaType.neutral,
                  period: DSMetricCardDeltaPeriod.day,
                  label: 'Sin cambios',
                ),
                icon: Icons.speed,
                iconColor: Colors.grey,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_delta_neutral.png'),
      );
    });

    testWidgets('variante sparkline', (tester) async {
      final trend = List.generate(10, (index) {
        return DSMetricCardDataPoint(
          value: 50.0 + index * 5 + (index % 3) * 10,
          timestamp: DateTime.now().subtract(Duration(days: 9 - index)),
        );
      });

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DSMetricCard.sparkline(
                title: 'Visitas del Sitio',
                value: '12,847',
                trend: trend,
                icon: Icons.visibility,
                iconColor: Colors.blue,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_sparkline.png'),
      );
    });

    testWidgets('tamaño pequeño', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                size: DSMetricCardSize.small,
                layout: DSMetricCardLayout.compact,
                title: 'Métrica Pequeña',
                value: '123',
                delta: DSMetricCardDelta(
                  value: 5.2,
                  type: DSMetricCardDeltaType.increase,
                ),
                icon: Icons.star,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_small_size.png'),
      );
    });

    testWidgets('tamaño mediano', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                size: DSMetricCardSize.medium,
                title: 'Métrica Mediana',
                value: '4,567',
                delta: DSMetricCardDelta(
                  value: -2.1,
                  type: DSMetricCardDeltaType.decrease,
                ),
                icon: Icons.favorite,
                iconColor: Colors.red,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_medium_size.png'),
      );
    });

    testWidgets('tamaño grande', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                size: DSMetricCardSize.large,
                title: 'Métrica Grande',
                value: '\$89,123',
                subtitle: 'Ingresos totales',
                delta: DSMetricCardDelta(
                  value: 15.7,
                  type: DSMetricCardDeltaType.increase,
                  label: 'Crecimiento',
                ),
                icon: Icons.account_balance,
                iconColor: Colors.green,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_large_size.png'),
      );
    });

    testWidgets('layout vertical', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                layout: DSMetricCardLayout.vertical,
                title: 'Layout Vertical',
                value: '1,234',
                delta: DSMetricCardDelta(
                  value: 8.5,
                  type: DSMetricCardDeltaType.increase,
                ),
                icon: Icons.vertical_align_top,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_vertical_layout.png'),
      );
    });

    testWidgets('layout horizontal', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                layout: DSMetricCardLayout.horizontal,
                title: 'Layout Horizontal',
                value: '5,678',
                delta: DSMetricCardDelta(
                  value: -3.2,
                  type: DSMetricCardDeltaType.decrease,
                ),
                icon: Icons.horizontal_rule,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_horizontal_layout.png'),
      );
    });

    testWidgets('layout compacto', (tester) async {
      final trend = List.generate(8, (index) {
        return DSMetricCardDataPoint(
          value: 40.0 + index * 8,
          timestamp: DateTime.now().subtract(Duration(days: 7 - index)),
        );
      });

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DSMetricCard.sparkline(
                layout: DSMetricCardLayout.compact,
                title: 'Layout Compacto',
                value: '9,876',
                trend: trend,
                icon: Icons.compress,
                iconColor: Colors.purple,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_compact_layout.png'),
      );
    });

    testWidgets('estado hover', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                state: DSMetricCardState.hover,
                title: 'Estado Hover',
                value: '2,345',
                delta: DSMetricCardDelta(
                  value: 3.2,
                  type: DSMetricCardDeltaType.increase,
                ),
                icon: Icons.mouse,
                iconColor: Colors.blue,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_hover_state.png'),
      );
    });

    testWidgets('estado pressed', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                state: DSMetricCardState.pressed,
                title: 'Estado Pressed',
                value: '3,456',
                delta: DSMetricCardDelta(
                  value: -1.5,
                  type: DSMetricCardDeltaType.decrease,
                ),
                icon: Icons.touch_app,
                iconColor: Colors.orange,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_pressed_state.png'),
      );
    });

    testWidgets('estado focus', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                state: DSMetricCardState.focus,
                title: 'Estado Focus',
                value: '4,567',
                delta: DSMetricCardDelta(
                  value: 7.8,
                  type: DSMetricCardDeltaType.increase,
                ),
                icon: Icons.center_focus_strong,
                iconColor: Colors.purple,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_focus_state.png'),
      );
    });

    testWidgets('estado selected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                state: DSMetricCardState.selected,
                title: 'Estado Selected',
                value: '5,678',
                delta: DSMetricCardDelta(
                  value: 2.1,
                  type: DSMetricCardDeltaType.increase,
                ),
                icon: Icons.radio_button_checked,
                iconColor: Colors.green,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_selected_state.png'),
      );
    });

    testWidgets('estado disabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                state: DSMetricCardState.disabled,
                title: 'Estado Disabled',
                value: '6,789',
                delta: DSMetricCardDelta(
                  value: 0.0,
                  type: DSMetricCardDeltaType.neutral,
                ),
                icon: Icons.block,
                iconColor: Colors.grey,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_disabled_state.png'),
      );
    });

    testWidgets('estado skeleton', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard(
                state: DSMetricCardState.skeleton,
                title: 'Cargando...',
                value: '---',
                icon: Icons.hourglass_empty,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_skeleton_state.png'),
      );
    });

    testWidgets('con widgets prefix y suffix', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                title: 'Ventas Premium',
                value: '\$156,789',
                delta: const DSMetricCardDelta(
                  value: 23.5,
                  type: DSMetricCardDeltaType.increase,
                  label: 'Este mes',
                ),
                prefix: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.diamond, color: Colors.blue),
                ),
                suffix: const Icon(Icons.more_vert),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_prefix_suffix.png'),
      );
    });

    testWidgets('estilo personalizado azul', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                title: 'Métrica Personalizada',
                value: '\$24,567',
                delta: const DSMetricCardDelta(
                  value: 12.5,
                  type: DSMetricCardDeltaType.increase,
                  label: 'Crecimiento',
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
                icon: Icons.trending_up,
                iconColor: Colors.blue,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_custom_blue_style.png'),
      );
    });

    testWidgets('sparkline con estilo personalizado', (tester) async {
      final trend = List.generate(15, (index) {
        return DSMetricCardDataPoint(
          value: 90.0 + index * 0.5 + (index % 4) * 2,
          timestamp: DateTime.now().subtract(Duration(hours: 14 - index)),
        );
      });

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DSMetricCard.sparkline(
                title: 'Rendimiento del Servidor',
                value: '99.9',
                unit: '%',
                subtitle: 'Tiempo de actividad',
                trend: trend,
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
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_custom_sparkline_style.png'),
      );
    });

    testWidgets('tema oscuro', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                title: 'Tema Oscuro',
                value: '\$45,234',
                delta: DSMetricCardDelta(
                  value: 8.7,
                  type: DSMetricCardDeltaType.increase,
                  period: DSMetricCardDeltaPeriod.week,
                ),
                icon: Icons.dark_mode,
                iconColor: Colors.amber,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_dark_theme.png'),
      );
    });

    testWidgets('widget personalizado de valor', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DSMetricCard(
                title: 'Estado del Sistema',
                value: 'N/A',
                customValueWidget: Row(
                  mainAxisSize: MainAxisSize.min,
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
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                icon: Icons.check_circle,
                iconColor: Colors.green,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_custom_value_widget.png'),
      );
    });

    testWidgets('ejemplo complejo con múltiples elementos', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
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
                suffix: const Icon(Icons.more_vert),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_complex_example.png'),
      );
    });

    testWidgets('sparkline horizontal layout', (tester) async {
      final trend = List.generate(12, (index) {
        return DSMetricCardDataPoint(
          value: 1000 + index * 200 + (index % 3) * 100,
          timestamp: DateTime.now().subtract(Duration(days: 11 - index)),
        );
      });

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DSMetricCard.sparkline(
                layout: DSMetricCardLayout.horizontal,
                title: 'Tráfico Web',
                value: '45.2K',
                subtitle: 'Visitantes únicos',
                trend: trend,
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
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_sparkline_horizontal.png'),
      );
    });

    testWidgets('diferentes espaciados', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSMetricCard.delta(
                spacing: DSMetricCardSpacing.relaxed,
                title: 'Espaciado Relajado',
                value: '12,345',
                delta: DSMetricCardDelta(
                  value: 6.8,
                  type: DSMetricCardDeltaType.increase,
                ),
                icon: Icons.space_bar,
                iconColor: Colors.indigo,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSMetricCard),
        matchesGoldenFile('metric_card_relaxed_spacing.png'),
      );
    });
  });
}
