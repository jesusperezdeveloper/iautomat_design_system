import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/metric_card/app_metric_card.dart';
import 'package:iautomat_design_system/src/components/metric_card/metric_card_config.dart';

void main() {
  group('AppMetricCard', () {
    testWidgets('renderiza correctamente con propiedades básicas', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test Metric',
              value: '1,234',
            ),
          ),
        ),
      );

      expect(find.text('Test Metric'), findsOneWidget);
      expect(find.text('1,234'), findsOneWidget);
    });

    testWidgets('muestra icono cuando está especificado', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test Metric',
              value: '1,234',
              icon: Icons.star,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('muestra subtítulo cuando está presente', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test Metric',
              value: '1,234',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      expect(find.text('Test Subtitle'), findsOneWidget);
    });

    testWidgets('muestra unidad cuando está presente', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test Metric',
              value: '1,234',
              unit: 'USD',
            ),
          ),
        ),
      );

      expect(find.text('USD'), findsOneWidget);
    });

    testWidgets('maneja interacciones de tap correctamente', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test Metric',
              value: '1,234',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppMetricCard));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('respeta el estado disabled', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test Metric',
              value: '1,234',
              enabled: false,
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppMetricCard));
      await tester.pump();

      expect(tapped, isFalse);
    });

    testWidgets('muestra skeleton cuando está en estado loading', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test Metric',
              value: '1,234',
              state: AppMetricCardState.skeleton,
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsAtLeastNWidgets(1));
    });

    group('Variante Delta', () {
      testWidgets('renderiza correctamente con delta positiva', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppMetricCard.delta(
                title: 'Sales',
                value: '\$1,234',
                delta: AppMetricCardDelta(
                  value: 12.5,
                  type: AppMetricCardDeltaType.increase,
                ),
              ),
            ),
          ),
        );

        expect(find.text('Sales'), findsOneWidget);
        expect(find.text('\$1,234'), findsOneWidget);
        expect(find.text('+12.5%'), findsOneWidget);
        expect(find.byIcon(Icons.trending_up), findsOneWidget);
      });

      testWidgets('renderiza correctamente con delta negativa', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppMetricCard.delta(
                title: 'Expenses',
                value: '\$567',
                delta: AppMetricCardDelta(
                  value: -8.3,
                  type: AppMetricCardDeltaType.decrease,
                ),
              ),
            ),
          ),
        );

        expect(find.text('Expenses'), findsOneWidget);
        expect(find.text('\$567'), findsOneWidget);
        expect(find.text('-8.3%'), findsOneWidget);
        expect(find.byIcon(Icons.trending_down), findsOneWidget);
      });

      testWidgets('renderiza correctamente con delta neutral', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppMetricCard.delta(
                title: 'Balance',
                value: '\$1,000',
                delta: AppMetricCardDelta(
                  value: 0.0,
                  type: AppMetricCardDeltaType.neutral,
                ),
              ),
            ),
          ),
        );

        expect(find.text('Balance'), findsOneWidget);
        expect(find.text('\$1,000'), findsOneWidget);
        expect(find.text('+0.0%'), findsOneWidget);
        expect(find.byIcon(Icons.trending_flat), findsOneWidget);
      });

      testWidgets('muestra etiqueta personalizada en delta', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppMetricCard.delta(
                title: 'Revenue',
                value: '\$2,345',
                delta: AppMetricCardDelta(
                  value: 15.7,
                  type: AppMetricCardDeltaType.increase,
                  label: 'vs last month',
                ),
              ),
            ),
          ),
        );

        expect(find.text('vs last month'), findsOneWidget);
      });
    });

    group('Variante Sparkline', () {
      testWidgets('renderiza correctamente con datos de tendencia', (tester) async {
        final trend = List.generate(5, (index) {
          return AppMetricCardDataPoint(
            value: 50.0 + index * 10,
            timestamp: DateTime.now().subtract(Duration(days: 4 - index)),
          );
        });

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppMetricCard.sparkline(
                title: 'Website Traffic',
                value: '12,847',
                trend: trend,
              ),
            ),
          ),
        );

        expect(find.text('Website Traffic'), findsOneWidget);
        expect(find.text('12,847'), findsOneWidget);
        expect(find.byType(CustomPaint), findsOneWidget);
      });

      testWidgets('maneja datos de tendencia vacíos', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppMetricCard.sparkline(
                title: 'Empty Trend',
                value: '0',
                trend: [],
              ),
            ),
          ),
        );

        expect(find.text('Empty Trend'), findsOneWidget);
        expect(find.text('0'), findsOneWidget);
      });
    });

    group('Tamaños', () {
      testWidgets('aplica constraints correctos para cada tamaño', (tester) async {
        for (final size in AppMetricCardSize.values) {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AppMetricCard(
                  title: 'Test',
                  value: '123',
                  size: size,
                ),
              ),
            ),
          );

          final container = tester.widget<Container>(
            find.byType(Container).first,
          );

          expect(container.constraints, isNotNull);
        }
      });
    });

    group('Layouts', () {
      testWidgets('aplica layout vertical correctamente', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppMetricCard(
                title: 'Vertical Layout',
                value: '1,234',
                layout: AppMetricCardLayout.vertical,
                icon: Icons.star,
              ),
            ),
          ),
        );

        expect(find.byType(Column), findsAtLeastNWidgets(1));
      });

      testWidgets('aplica layout horizontal correctamente', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppMetricCard(
                title: 'Horizontal Layout',
                value: '1,234',
                layout: AppMetricCardLayout.horizontal,
                icon: Icons.star,
              ),
            ),
          ),
        );

        expect(find.byType(Row), findsAtLeastNWidgets(1));
      });

      testWidgets('aplica layout compacto correctamente', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppMetricCard(
                title: 'Compact Layout',
                value: '1,234',
                layout: AppMetricCardLayout.compact,
                icon: Icons.star,
              ),
            ),
          ),
        );

        expect(find.byType(Row), findsAtLeastNWidgets(1));
      });
    });

    testWidgets('aplica estilos personalizados correctamente', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Custom Style',
              value: '1,234',
              style: AppMetricCardStyle(
                backgroundColor: Colors.blue,
                borderRadius: 16,
                padding: const EdgeInsets.all(20),
              ),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration?;

      expect(decoration?.color, equals(Colors.blue));
      expect(container.padding, equals(const EdgeInsets.all(20)));
    });

    testWidgets('muestra widgets prefix y suffix cuando están presentes', (tester) async {
      const prefixIcon = Icon(Icons.star, key: Key('prefix'));
      const suffixIcon = Icon(Icons.arrow_forward, key: Key('suffix'));

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test',
              value: '1,234',
              prefix: prefixIcon,
              suffix: suffixIcon,
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('prefix')), findsOneWidget);
      expect(find.byKey(const Key('suffix')), findsOneWidget);
    });

    testWidgets('usa widget personalizado de valor cuando está proporcionado', (tester) async {
      const customValueWidget = Text('Custom Value', key: Key('custom-value'));

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test',
              value: 'Original Value',
              customValueWidget: customValueWidget,
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('custom-value')), findsOneWidget);
      expect(find.text('Original Value'), findsNothing);
    });

    testWidgets('maneja animaciones cuando están habilitadas', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Animated',
              value: '1,234',
              animation: AppMetricCardAnimation(
                enabled: true,
                type: AppMetricCardAnimationType.fade,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(FadeTransition), findsOneWidget);
    });

    testWidgets('maneja tooltip cuando está presente', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test',
              value: '1,234',
              tooltip: 'Test tooltip',
            ),
          ),
        ),
      );

      expect(find.byType(Tooltip), findsOneWidget);
    });

    testWidgets('oculta el widget cuando visible es false', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test',
              value: '1,234',
              visible: false,
            ),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.text('Test'), findsNothing);
    });

    testWidgets('mantiene el foco correctamente', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test',
              value: '1,234',
              onTap: () {},
            ),
          ),
        ),
      );

      final focusNode = tester.widget<Focus>(find.byType(Focus)).focusNode;
      expect(focusNode, isNotNull);
    });

    testWidgets('maneja gestos de hover correctamente', (tester) async {
      bool hovered = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test',
              value: '1,234',
              onHover: () {
                hovered = true;
              },
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      final mouseRegion = find.byType(MouseRegion);
      await gesture.moveTo(tester.getCenter(mouseRegion));
      await tester.pump();

      expect(hovered, isTrue);
    });

    testWidgets('aplica semántica correctamente', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppMetricCard(
              title: 'Test',
              value: '1,234',
              semanticLabel: 'Test metric card',
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(Semantics), findsAtLeastNWidgets(1));
    });

    group('AppMetricCardConfig', () {
      test('isInteractive devuelve true cuando hay callbacks', () {
        const config = AppMetricCardConfig(
          title: 'Test',
          value: '123',
          onTap: _mockCallback,
        );

        expect(config.isInteractive, isTrue);
      });

      test('isDisabled devuelve true cuando enabled es false', () {
        const config = AppMetricCardConfig(
          title: 'Test',
          value: '123',
          enabled: false,
        );

        expect(config.isDisabled, isTrue);
      });

      test('isLoading devuelve true cuando loading es true', () {
        const config = AppMetricCardConfig(
          title: 'Test',
          value: '123',
          loading: true,
        );

        expect(config.isLoading, isTrue);
      });

      test('shouldShowSkeleton devuelve true cuando skeleton es true', () {
        const config = AppMetricCardConfig(
          title: 'Test',
          value: '123',
          skeleton: true,
        );

        expect(config.shouldShowSkeleton, isTrue);
      });

      test('hasDelta devuelve true cuando delta está presente', () {
        const config = AppMetricCardConfig(
          title: 'Test',
          value: '123',
          delta: AppMetricCardDelta(
            value: 5.0,
            type: AppMetricCardDeltaType.increase,
          ),
        );

        expect(config.hasDelta, isTrue);
      });

      test('hasTrend devuelve true cuando trend está presente', () {
        final config = AppMetricCardConfig(
          title: 'Test',
          value: '123',
          trend: [
            AppMetricCardDataPoint(
              value: 10,
              timestamp: DateTime.now(),
            ),
          ],
        );

        expect(config.hasTrend, isTrue);
      });
    });

    group('AppMetricCardDelta', () {
      test('isPositive devuelve true para valores positivos', () {
        const delta = AppMetricCardDelta(
          value: 5.0,
          type: AppMetricCardDeltaType.increase,
        );

        expect(delta.isPositive, isTrue);
        expect(delta.isNegative, isFalse);
        expect(delta.isNeutral, isFalse);
      });

      test('isNegative devuelve true para valores negativos', () {
        const delta = AppMetricCardDelta(
          value: -3.0,
          type: AppMetricCardDeltaType.decrease,
        );

        expect(delta.isPositive, isFalse);
        expect(delta.isNegative, isTrue);
        expect(delta.isNeutral, isFalse);
      });

      test('isNeutral devuelve true para valor cero', () {
        const delta = AppMetricCardDelta(
          value: 0.0,
          type: AppMetricCardDeltaType.neutral,
        );

        expect(delta.isPositive, isFalse);
        expect(delta.isNegative, isFalse);
        expect(delta.isNeutral, isTrue);
      });

      test('formattedValue formatea correctamente con porcentaje', () {
        const delta = AppMetricCardDelta(
          value: 12.5,
          type: AppMetricCardDeltaType.increase,
          showPercentage: true,
        );

        expect(delta.formattedValue, equals('+12.5%'));
      });

      test('formattedValue formatea correctamente sin porcentaje', () {
        const delta = AppMetricCardDelta(
          value: -5.0,
          type: AppMetricCardDeltaType.decrease,
          showPercentage: false,
        );

        expect(delta.formattedValue, equals('-5'));
      });

      test('formattedValue formatea correctamente con unidad', () {
        const delta = AppMetricCardDelta(
          value: 10.0,
          type: AppMetricCardDeltaType.increase,
          showPercentage: false,
          unit: 'USD',
        );

        expect(delta.formattedValue, equals('+10.0 USD'));
      });

      test('defaultIcon devuelve icono correcto para cada tipo', () {
        const increaseDelta = AppMetricCardDelta(
          value: 5.0,
          type: AppMetricCardDeltaType.increase,
        );
        expect(increaseDelta.defaultIcon, equals(Icons.trending_up));

        const decreaseDelta = AppMetricCardDelta(
          value: -5.0,
          type: AppMetricCardDeltaType.decrease,
        );
        expect(decreaseDelta.defaultIcon, equals(Icons.trending_down));

        const neutralDelta = AppMetricCardDelta(
          value: 0.0,
          type: AppMetricCardDeltaType.neutral,
        );
        expect(neutralDelta.defaultIcon, equals(Icons.trending_flat));
      });
    });

    group('Extensions', () {
      test('AppMetricCardSize extensions funcionan correctamente', () {
        expect(AppMetricCardSize.small.height, equals(80.0));
        expect(AppMetricCardSize.medium.height, equals(120.0));
        expect(AppMetricCardSize.large.height, equals(160.0));

        expect(AppMetricCardSize.small.iconSize, equals(20.0));
        expect(AppMetricCardSize.medium.iconSize, equals(24.0));
        expect(AppMetricCardSize.large.iconSize, equals(28.0));
      });

      test('AppMetricCardSpacing extension funciona correctamente', () {
        expect(AppMetricCardSpacing.tight.value, equals(8.0));
        expect(AppMetricCardSpacing.normal.value, equals(12.0));
        expect(AppMetricCardSpacing.relaxed.value, equals(16.0));
      });

      test('AppMetricCardVariant extensions funcionan correctamente', () {
        expect(AppMetricCardVariant.delta.isDelta, isTrue);
        expect(AppMetricCardVariant.delta.isSparkline, isFalse);
        expect(AppMetricCardVariant.sparkline.isDelta, isFalse);
        expect(AppMetricCardVariant.sparkline.isSparkline, isTrue);
      });

      test('AppMetricCardLayout extensions funcionan correctamente', () {
        expect(AppMetricCardLayout.vertical.isVertical, isTrue);
        expect(AppMetricCardLayout.horizontal.isHorizontal, isTrue);
        expect(AppMetricCardLayout.compact.isCompact, isTrue);
      });

      test('AppMetricCardState extensions funcionan correctamente', () {
        expect(AppMetricCardState.hover.isInteractiveState, isTrue);
        expect(AppMetricCardState.pressed.isInteractiveState, isTrue);
        expect(AppMetricCardState.focus.isInteractiveState, isTrue);
        expect(AppMetricCardState.disabled.isDisabledState, isTrue);
        expect(AppMetricCardState.loading.isLoadingState, isTrue);
        expect(AppMetricCardState.skeleton.isSkeletonState, isTrue);
        expect(AppMetricCardState.selected.isSelectedState, isTrue);
      });

      test('AppMetricCardDeltaPeriod extensions funcionan correctamente', () {
        expect(AppMetricCardDeltaPeriod.day.label, equals('vs ayer'));
        expect(AppMetricCardDeltaPeriod.week.label, equals('vs semana pasada'));
        expect(AppMetricCardDeltaPeriod.month.label, equals('vs mes pasado'));

        expect(AppMetricCardDeltaPeriod.day.shortLabel, equals('1d'));
        expect(AppMetricCardDeltaPeriod.week.shortLabel, equals('1w'));
        expect(AppMetricCardDeltaPeriod.month.shortLabel, equals('1m'));
      });
    });

    group('Diferentes estados', () {
      for (final state in AppMetricCardState.values) {
        testWidgets('maneja estado $state correctamente', (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AppMetricCard(
                  title: 'Test',
                  value: '1,234',
                  state: state,
                ),
              ),
            ),
          );

          expect(find.text('Test'), findsOneWidget);
        });
      }
    });

    group('Diferentes tamaños', () {
      for (final size in AppMetricCardSize.values) {
        testWidgets('maneja tamaño $size correctamente', (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AppMetricCard(
                  title: 'Test',
                  value: '1,234',
                  size: size,
                ),
              ),
            ),
          );

          expect(find.text('Test'), findsOneWidget);
        });
      }
    });

    group('Diferentes layouts', () {
      for (final layout in AppMetricCardLayout.values) {
        testWidgets('maneja layout $layout correctamente', (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: AppMetricCard(
                  title: 'Test',
                  value: '1,234',
                  layout: layout,
                  icon: Icons.star,
                ),
              ),
            ),
          );

          expect(find.text('Test'), findsOneWidget);
        });
      }
    });

    group('Widget personalizados', () {
      testWidgets('usa widget personalizado de delta cuando está proporcionado', (tester) async {
        const customDeltaWidget = Text('Custom Delta', key: Key('custom-delta'));

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppMetricCard.delta(
                title: 'Test',
                value: '1,234',
                delta: AppMetricCardDelta(
                  value: 5.0,
                  type: AppMetricCardDeltaType.increase,
                ),
                customDeltaWidget: customDeltaWidget,
              ),
            ),
          ),
        );

        expect(find.byKey(const Key('custom-delta')), findsOneWidget);
      });

      testWidgets('usa widget personalizado de sparkline cuando está proporcionado', (tester) async {
        const customSparklineWidget = Text('Custom Sparkline', key: Key('custom-sparkline'));

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppMetricCard.sparkline(
                title: 'Test',
                value: '1,234',
                trend: [
                  AppMetricCardDataPoint(
                    value: 10,
                    timestamp: DateTime.now(),
                  ),
                ],
                customSparklineWidget: customSparklineWidget,
              ),
            ),
          ),
        );

        expect(find.byKey(const Key('custom-sparkline')), findsOneWidget);
      });
    });
  });
}

void _mockCallback() {
  // Mock callback para testing
}