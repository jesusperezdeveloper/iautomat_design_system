import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSBadge Golden Tests', () {
    testWidgets('dot badge standalone', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSBadge.dot(),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSBadge),
        matchesGoldenFile('badge/dot_standalone.png'),
      );
    });

    testWidgets('dot badge with child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSBadge.dot(
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
              child: DSBadge.counter(value: 5),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSBadge),
        matchesGoldenFile('badge/counter_small_value.png'),
      );
    });

    testWidgets('counter badge with large value', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSBadge.counter(value: 150, maxValue: 99),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSBadge),
        matchesGoldenFile('badge/counter_large_value.png'),
      );
    });

    testWidgets('counter badge with child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSBadge.counter(
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
              child: DSBadge.status(
                status: DSBadgeStatus.success,
                label: 'Activo',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSBadge),
        matchesGoldenFile('badge/status_success.png'),
      );
    });

    testWidgets('status badge warning', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSBadge.status(
                status: DSBadgeStatus.warning,
                label: 'Advertencia',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSBadge),
        matchesGoldenFile('badge/status_warning.png'),
      );
    });

    testWidgets('status badge error', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSBadge.status(
                status: DSBadgeStatus.error,
                label: 'Error',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSBadge),
        matchesGoldenFile('badge/status_error.png'),
      );
    });

    testWidgets('status badge info', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSBadge.status(
                status: DSBadgeStatus.info,
                label: 'Información',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSBadge),
        matchesGoldenFile('badge/status_info.png'),
      );
    });

    testWidgets('status badge neutral', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSBadge.status(
                status: DSBadgeStatus.neutral,
                label: 'Neutral',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSBadge),
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
                  DSBadge.counter(
                    value: 1,
                    size: DSBadgeSize.small,
                  ),
                  DSBadge.counter(
                    value: 2,
                    size: DSBadgeSize.medium,
                  ),
                  DSBadge.counter(
                    value: 3,
                    size: DSBadgeSize.large,
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
                  DSBadge.counter(
                    value: 1,
                    position: DSBadgePosition.topLeft,
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
                  DSBadge.counter(
                    value: 2,
                    position: DSBadgePosition.topRight,
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
                  DSBadge.counter(
                    value: 3,
                    position: DSBadgePosition.bottomLeft,
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
                  DSBadge.counter(
                    value: 4,
                    position: DSBadgePosition.bottomRight,
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
                  DSBadge.counter(
                    value: 1,
                    shape: DSBadgeShape.circle,
                  ),
                  DSBadge.counter(
                    value: 22,
                    shape: DSBadgeShape.square,
                  ),
                  DSBadge.counter(
                    value: 333,
                    shape: DSBadgeShape.rounded,
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
              child: DSBadge.counter(
                value: 5,
                enabled: false,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSBadge),
        matchesGoldenFile('badge/disabled_state.png'),
      );
    });

    testWidgets('badge loading state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSBadge.counter(
                value: 5,
                loading: true,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSBadge),
        matchesGoldenFile('badge/loading_state.png'),
      );
    });

    testWidgets('badge skeleton state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: DSBadge.counter(
                value: 5,
                skeleton: true,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSBadge),
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
                  DSBadge.counter(
                    value: 1,
                    color: Colors.purple,
                  ),
                  DSBadge.counter(
                    value: 2,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                  ),
                  DSBadge.status(
                    status: DSBadgeStatus.success,
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
                  DSBadge.counter(
                    value: 0,
                    showZero: false,
                  ),
                  DSBadge.counter(
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
              child: DSBadge.status(
                status: DSBadgeStatus.warning,
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
                  DSBadge.status(status: DSBadgeStatus.success),
                  DSBadge.status(status: DSBadgeStatus.warning),
                  DSBadge.status(status: DSBadgeStatus.error),
                  DSBadge.status(status: DSBadgeStatus.info),
                  DSBadge.status(status: DSBadgeStatus.neutral),
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
                  DSBadge.dot(
                    child: Icon(Icons.notifications, size: 32),
                  ),
                  DSBadge.counter(
                    value: 42,
                    child: Icon(Icons.mail, size: 32),
                  ),
                  DSBadge.status(
                    status: DSBadgeStatus.success,
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
                DSBadge.counter(
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
                      leading: DSBadge.dot(
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
                      leading: DSBadge.status(
                        status: DSBadgeStatus.warning,
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
            floatingActionButton: DSBadge.counter(
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
                          DSBadge.dot(size: DSBadgeSize.small),
                          SizedBox(height: 8),
                          Text('Small Dot'),
                        ],
                      ),
                      Column(
                        children: [
                          DSBadge.dot(size: DSBadgeSize.medium),
                          SizedBox(height: 8),
                          Text('Medium Dot'),
                        ],
                      ),
                      Column(
                        children: [
                          DSBadge.dot(size: DSBadgeSize.large),
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
                          DSBadge.counter(value: 9, size: DSBadgeSize.small),
                          SizedBox(height: 8),
                          Text('Small Counter'),
                        ],
                      ),
                      Column(
                        children: [
                          DSBadge.counter(
                              value: 99, size: DSBadgeSize.medium),
                          SizedBox(height: 8),
                          Text('Medium Counter'),
                        ],
                      ),
                      Column(
                        children: [
                          DSBadge.counter(
                              value: 999, size: DSBadgeSize.large),
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
