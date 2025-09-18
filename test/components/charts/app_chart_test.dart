import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/charts/app_chart.dart';

void main() {
  group('AppChart', () {
    late List<ChartSeries> testSeries;

    setUp(() {
      testSeries = [
        ChartSeries(
          id: 'test-series',
          name: 'Test Series',
          data: [
            const ChartPoint(x: 0, y: 10),
            const ChartPoint(x: 1, y: 20),
            const ChartPoint(x: 2, y: 15),
            const ChartPoint(x: 3, y: 25),
          ],
        ),
      ];
    });

    testWidgets('renders correctly with line variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.line,
              series: testSeries,
            ),
          ),
        ),
      );

      expect(find.byType(AppChart), findsOneWidget);
    });

    testWidgets('renders correctly with area variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.area,
              series: testSeries,
            ),
          ),
        ),
      );

      expect(find.byType(AppChart), findsOneWidget);
    });

    testWidgets('renders correctly with bar variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.bar,
              series: testSeries,
            ),
          ),
        ),
      );

      expect(find.byType(AppChart), findsOneWidget);
    });

    testWidgets('renders correctly with pie variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.pie,
              series: testSeries,
            ),
          ),
        ),
      );

      expect(find.byType(AppChart), findsOneWidget);
    });

    testWidgets('renders correctly with heatmap variant',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.heatmap,
              series: testSeries,
            ),
          ),
        ),
      );

      expect(find.byType(AppChart), findsOneWidget);
    });

    testWidgets('shows loading state correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.line,
              series: testSeries,
              state: ChartState.loading,
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows skeleton state correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.line,
              series: testSeries,
              state: ChartState.skeleton,
            ),
          ),
        ),
      );

      expect(find.byType(CustomPaint), findsOneWidget);
    });

    testWidgets('applies disabled state correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.line,
              series: testSeries,
              state: ChartState.disabled,
            ),
          ),
        ),
      );

      final opacityWidget = find.byType(Opacity);
      expect(opacityWidget, findsOneWidget);

      final opacity = tester.widget<Opacity>(opacityWidget);
      expect(opacity.opacity, 0.5);
    });

    testWidgets('handles tap events', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.line,
              series: testSeries,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppChart));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('shows legend when configured', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.line,
              series: testSeries,
              legend: const ChartLegendConfig(show: true),
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.text('Test Series'), findsOneWidget);
    });

    testWidgets('hides legend when configured', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.line,
              series: testSeries,
              legend: const ChartLegendConfig(show: false),
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.text('Test Series'), findsNothing);
    });

    testWidgets('supports RTL direction', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: AppChart(
                variant: ChartVariant.line,
                series: testSeries,
                rtlSupport: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppChart), findsOneWidget);
    });

    testWidgets('applies accessibility label', (WidgetTester tester) async {
      const accessibilityLabel = 'Sales Chart';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.line,
              series: testSeries,
              accessibilitySupport: true,
              accessibilityLabel: accessibilityLabel,
            ),
          ),
        ),
      );

      final semantics = tester.getSemantics(find.byType(AppChart));
      expect(semantics.label, accessibilityLabel);
    });

    testWidgets('handles focus state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.line,
              series: testSeries,
            ),
          ),
        ),
      );

      final focusNode = Focus.of(
        tester.element(find.byType(AppChart)),
      );

      focusNode.requestFocus();
      await tester.pump();

      expect(focusNode.hasFocus, isTrue);
    });

    testWidgets('handles multiple series', (WidgetTester tester) async {
      final multipleSeries = [
        ChartSeries(
          id: 'series-1',
          name: 'Series 1',
          data: const [
            ChartPoint(x: 0, y: 10),
            ChartPoint(x: 1, y: 20),
          ],
        ),
        ChartSeries(
          id: 'series-2',
          name: 'Series 2',
          data: const [
            ChartPoint(x: 0, y: 15),
            ChartPoint(x: 1, y: 25),
          ],
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.line,
              series: multipleSeries,
              legend: const ChartLegendConfig(show: true),
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.text('Series 1'), findsOneWidget);
      expect(find.text('Series 2'), findsOneWidget);
    });

    testWidgets('animates when enabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.line,
              series: testSeries,
              animate: true,
              animationDuration: const Duration(milliseconds: 300),
            ),
          ),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 150));
      await tester.pump(const Duration(milliseconds: 150));

      expect(find.byType(AppChart), findsOneWidget);
    });

    testWidgets('does not animate when disabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.line,
              series: testSeries,
              animate: false,
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.byType(AppChart), findsOneWidget);
    });

    testWidgets('handles empty series gracefully', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.pie,
              series: const [],
            ),
          ),
        ),
      );

      expect(find.byType(AppChart), findsOneWidget);
      expect(find.text('No data'), findsOneWidget);
    });

    testWidgets('respects custom dimensions', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppChart(
              variant: ChartVariant.line,
              series: testSeries,
              width: 400,
              height: 200,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(AppChart),
              matching: find.byType(Container),
            )
            .first,
      );

      expect(container.constraints?.maxWidth, 400);
    });
  });
}
