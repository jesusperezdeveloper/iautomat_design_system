import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppBadge Golden Tests', () {
    testWidgets('dot badge standalone', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.dot(),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppBadge),
        matchesGoldenFile('badge/dot_standalone.png'),
      );
    });

    testWidgets('dot badge with child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.dot(
                child: Icon(Icons.notifications, size: 32),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('badge/dot_with_child.png'),
      );
    });

    testWidgets('counter badge with small value', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.counter(value: 5),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppBadge),
        matchesGoldenFile('badge/counter_small_value.png'),
      );
    });

    testWidgets('counter badge with large value', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.counter(value: 150, maxValue: 99),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppBadge),
        matchesGoldenFile('badge/counter_large_value.png'),
      );
    });

    testWidgets('counter badge with child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.counter(
                value: 42,
                child: Icon(Icons.mail, size: 32),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('badge/counter_with_child.png'),
      );
    });

    testWidgets('status badge success', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.status(
                status: AppBadgeStatus.success,
                label: 'Activo',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppBadge),
        matchesGoldenFile('badge/status_success.png'),
      );
    });

    testWidgets('status badge warning', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.status(
                status: AppBadgeStatus.warning,
                label: 'Advertencia',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppBadge),
        matchesGoldenFile('badge/status_warning.png'),
      );
    });

    testWidgets('status badge error', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.status(
                status: AppBadgeStatus.error,
                label: 'Error',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppBadge),
        matchesGoldenFile('badge/status_error.png'),
      );
    });

    testWidgets('status badge info', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.status(
                status: AppBadgeStatus.info,
                label: 'Información',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppBadge),
        matchesGoldenFile('badge/status_info.png'),
      );
    });

    testWidgets('status badge neutral', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.status(
                status: AppBadgeStatus.neutral,
                label: 'Neutral',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppBadge),
        matchesGoldenFile('badge/status_neutral.png'),
      );
    });

    testWidgets('badge sizes comparison', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppBadge.counter(
                    value: 1,
                    size: AppBadgeSize.small,
                  ),
                  AppBadge.counter(
                    value: 2,
                    size: AppBadgeSize.medium,
                  ),
                  AppBadge.counter(
                    value: 3,
                    size: AppBadgeSize.large,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('badge/sizes_comparison.png'),
      );
    });

    testWidgets('badge positions with child', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Wrap(
                spacing: 32.0,
                runSpacing: 32.0,
                children: [
                  AppBadge.counter(
                    value: 1,
                    position: AppBadgePosition.topLeft,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.notifications),
                    ),
                  ),
                  AppBadge.counter(
                    value: 2,
                    position: AppBadgePosition.topRight,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.notifications),
                    ),
                  ),
                  AppBadge.counter(
                    value: 3,
                    position: AppBadgePosition.bottomLeft,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.notifications),
                    ),
                  ),
                  AppBadge.counter(
                    value: 4,
                    position: AppBadgePosition.bottomRight,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.notifications),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('badge/positions_comparison.png'),
      );
    });

    testWidgets('badge shapes comparison', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppBadge.counter(
                    value: 1,
                    shape: AppBadgeShape.circle,
                  ),
                  AppBadge.counter(
                    value: 22,
                    shape: AppBadgeShape.square,
                  ),
                  AppBadge.counter(
                    value: 333,
                    shape: AppBadgeShape.rounded,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('badge/shapes_comparison.png'),
      );
    });

    testWidgets('badge disabled state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.counter(
                value: 5,
                enabled: false,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppBadge),
        matchesGoldenFile('badge/disabled_state.png'),
      );
    });

    testWidgets('badge loading state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.counter(
                value: 5,
                loading: true,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppBadge),
        matchesGoldenFile('badge/loading_state.png'),
      );
    });

    testWidgets('badge skeleton state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.counter(
                value: 5,
                skeleton: true,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppBadge),
        matchesGoldenFile('badge/skeleton_state.png'),
      );
    });

    testWidgets('badge with custom colors', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppBadge.counter(
                    value: 1,
                    color: Colors.purple,
                  ),
                  AppBadge.counter(
                    value: 2,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                  ),
                  AppBadge.status(
                    status: AppBadgeStatus.success,
                    label: 'Custom',
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('badge/custom_colors.png'),
      );
    });

    testWidgets('badge zero value with showZero', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppBadge.counter(
                    value: 0,
                    showZero: false,
                  ),
                  AppBadge.counter(
                    value: 0,
                    showZero: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('badge/zero_value_comparison.png'),
      );
    });

    testWidgets('status badge with child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppBadge.status(
                status: AppBadgeStatus.warning,
                label: 'Pendiente',
                child: Icon(Icons.task, size: 32),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('badge/status_with_child.png'),
      );
    });

    testWidgets('status badge icon only', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppBadge.status(status: AppBadgeStatus.success),
                  AppBadge.status(status: AppBadgeStatus.warning),
                  AppBadge.status(status: AppBadgeStatus.error),
                  AppBadge.status(status: AppBadgeStatus.info),
                  AppBadge.status(status: AppBadgeStatus.neutral),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('badge/status_icons_only.png'),
      );
    });

    testWidgets('badge in dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppBadge.dot(
                    child: Icon(Icons.notifications, size: 32),
                  ),
                  AppBadge.counter(
                    value: 42,
                    child: Icon(Icons.mail, size: 32),
                  ),
                  AppBadge.status(
                    status: AppBadgeStatus.success,
                    label: 'Activo',
                    child: Icon(Icons.person, size: 32),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('badge/dark_theme.png'),
      );
    });

    testWidgets('badge complex layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Badge Examples'),
              actions: [
                AppBadge.counter(
                  value: 3,
                  child: IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: AppBadge.dot(
                        child: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                      ),
                      title: const Text('Usuario en línea'),
                      subtitle: const Text('Activo hace 2 minutos'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: ListTile(
                      leading: AppBadge.status(
                        status: AppBadgeStatus.warning,
                        label: 'Pendiente',
                        child: const Icon(Icons.task),
                      ),
                      title: const Text('Tarea pendiente'),
                      subtitle: const Text('Revisión requerida'),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: AppBadge.counter(
              value: 5,
              child: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('badge/complex_layout.png'),
      );
    });

    testWidgets('badge responsive sizes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          AppBadge.dot(size: AppBadgeSize.small),
                          SizedBox(height: 8),
                          Text('Small Dot'),
                        ],
                      ),
                      Column(
                        children: [
                          AppBadge.dot(size: AppBadgeSize.medium),
                          SizedBox(height: 8),
                          Text('Medium Dot'),
                        ],
                      ),
                      Column(
                        children: [
                          AppBadge.dot(size: AppBadgeSize.large),
                          SizedBox(height: 8),
                          Text('Large Dot'),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          AppBadge.counter(value: 9, size: AppBadgeSize.small),
                          SizedBox(height: 8),
                          Text('Small Counter'),
                        ],
                      ),
                      Column(
                        children: [
                          AppBadge.counter(value: 99, size: AppBadgeSize.medium),
                          SizedBox(height: 8),
                          Text('Medium Counter'),
                        ],
                      ),
                      Column(
                        children: [
                          AppBadge.counter(value: 999, size: AppBadgeSize.large),
                          SizedBox(height: 8),
                          Text('Large Counter'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('badge/responsive_sizes.png'),
      );
    });
  });
}