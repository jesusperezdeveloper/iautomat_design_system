import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/charts/app_chart.dart';

void main() {
  group('AppChart Golden Tests', () {
    final testSeries = [
      ChartSeries(
        id: 'sales',
        name: 'Sales',
        data: const [
          ChartPoint(x: 0, y: 30, label: 'Jan'),
          ChartPoint(x: 1, y: 45, label: 'Feb'),
          ChartPoint(x: 2, y: 38, label: 'Mar'),
          ChartPoint(x: 3, y: 52, label: 'Apr'),
          ChartPoint(x: 4, y: 48, label: 'May'),
          ChartPoint(x: 5, y: 61, label: 'Jun'),
        ],
        color: Colors.blue,
      ),
      ChartSeries(
        id: 'revenue',
        name: 'Revenue',
        data: const [
          ChartPoint(x: 0, y: 25, label: 'Jan'),
          ChartPoint(x: 1, y: 40, label: 'Feb'),
          ChartPoint(x: 2, y: 35, label: 'Mar'),
          ChartPoint(x: 3, y: 48, label: 'Apr'),
          ChartPoint(x: 4, y: 42, label: 'May'),
          ChartPoint(x: 5, y: 55, label: 'Jun'),
        ],
        color: Colors.green,
      ),
    ];

    final pieData = [
      ChartSeries(
        id: 'categories',
        name: 'Categories',
        data: const [
          ChartPoint(x: 0, y: 35, label: 'Technology', color: Colors.blue),
          ChartPoint(x: 1, y: 25, label: 'Finance', color: Colors.green),
          ChartPoint(x: 2, y: 20, label: 'Healthcare', color: Colors.orange),
          ChartPoint(x: 3, y: 12, label: 'Retail', color: Colors.purple),
          ChartPoint(x: 4, y: 8, label: 'Other', color: Colors.grey),
        ],
      ),
    ];

    testWidgets('Line Chart - Default State', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: AppChart(
                  variant: ChartVariant.line,
                  series: testSeries,
                  animate: false,
                  legend: const ChartLegendConfig(show: true),
                  axes: const ChartAxesConfig(
                    xAxis: ChartAxisConfig(title: 'Month'),
                    yAxis: ChartAxisConfig(title: 'Value'),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppChart),
        matchesGoldenFile('goldens/app_chart_line_default.png'),
      );
    });

    testWidgets('Area Chart - Default State', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: AppChart(
                  variant: ChartVariant.area,
                  series: testSeries.map((s) {
                    return ChartSeries(
                      id: s.id,
                      name: s.name,
                      data: s.data,
                      color: s.color,
                      showArea: true,
                      areaOpacity: 0.3,
                    );
                  }).toList(),
                  animate: false,
                  legend: const ChartLegendConfig(show: true),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppChart),
        matchesGoldenFile('goldens/app_chart_area_default.png'),
      );
    });

    testWidgets('Bar Chart - Default State', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: AppChart(
                  variant: ChartVariant.bar,
                  series: testSeries,
                  animate: false,
                  legend: const ChartLegendConfig(show: true),
                  axes: const ChartAxesConfig(
                    xAxis: ChartAxisConfig(title: 'Month'),
                    yAxis: ChartAxisConfig(title: 'Value'),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppChart),
        matchesGoldenFile('goldens/app_chart_bar_default.png'),
      );
    });

    testWidgets('Pie Chart - Default State', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                height: 400,
                child: AppChart(
                  variant: ChartVariant.pie,
                  series: pieData,
                  animate: false,
                  legend: const ChartLegendConfig(
                    show: true,
                    position: LegendPosition.bottom,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppChart),
        matchesGoldenFile('goldens/app_chart_pie_default.png'),
      );
    });

    testWidgets('Heatmap Chart - Default State', (WidgetTester tester) async {
      final heatmapData = [
        ChartSeries(
          id: 'heatmap',
          name: 'Activity',
          data: List.generate(
            28,
            (index) => ChartPoint(
              x: (index % 7).toDouble(),
              y: 10.0 + (index * 3 % 50),
              label: 'Day ${index + 1}',
            ),
          ),
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: AppChart(
                  variant: ChartVariant.heatmap,
                  series: heatmapData,
                  animate: false,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppChart),
        matchesGoldenFile('goldens/app_chart_heatmap_default.png'),
      );
    });

    testWidgets('Chart - Loading State', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: AppChart(
                  variant: ChartVariant.line,
                  series: testSeries,
                  state: ChartState.loading,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppChart),
        matchesGoldenFile('goldens/app_chart_loading.png'),
      );
    });

    testWidgets('Chart - Skeleton State', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: AppChart(
                  variant: ChartVariant.line,
                  series: testSeries,
                  state: ChartState.skeleton,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppChart),
        matchesGoldenFile('goldens/app_chart_skeleton.png'),
      );
    });

    testWidgets('Chart - Disabled State', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: AppChart(
                  variant: ChartVariant.bar,
                  series: testSeries,
                  state: ChartState.disabled,
                  animate: false,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppChart),
        matchesGoldenFile('goldens/app_chart_disabled.png'),
      );
    });

    testWidgets('Chart - Dark Theme', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: AppChart(
                  variant: ChartVariant.line,
                  series: testSeries,
                  animate: false,
                  legend: const ChartLegendConfig(show: true),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppChart),
        matchesGoldenFile('goldens/app_chart_dark_theme.png'),
      );
    });

    testWidgets('Chart - RTL Layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  height: 300,
                  child: AppChart(
                    variant: ChartVariant.bar,
                    series: testSeries,
                    animate: false,
                    rtlSupport: true,
                    legend: const ChartLegendConfig(
                      show: true,
                      position: LegendPosition.right,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppChart),
        matchesGoldenFile('goldens/app_chart_rtl.png'),
      );
    });
  });
}
