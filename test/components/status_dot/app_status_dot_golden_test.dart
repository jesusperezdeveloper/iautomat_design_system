import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/status_dot/app_status_dot.dart';

void main() {
  group('DSStatusDot Golden Tests', () {
    testWidgets('success variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DSStatusDot.success(label: 'Success'),
                  const SizedBox(height: 16),
                  DSStatusDot.success(
                    label: 'Success with custom size',
                    size: 12,
                  ),
                  const SizedBox(height: 16),
                  DSStatusDot.success(),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_status_dot_success.png'),
      );
    });

    testWidgets('info variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DSStatusDot.info(label: 'Info'),
                  const SizedBox(height: 16),
                  DSStatusDot.info(
                    label: 'Info with custom size',
                    size: 12,
                  ),
                  const SizedBox(height: 16),
                  DSStatusDot.info(),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_status_dot_info.png'),
      );
    });

    testWidgets('warn variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DSStatusDot.warn(label: 'Warning'),
                  const SizedBox(height: 16),
                  DSStatusDot.warn(
                    label: 'Warning with custom size',
                    size: 12,
                  ),
                  const SizedBox(height: 16),
                  DSStatusDot.warn(),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_status_dot_warn.png'),
      );
    });

    testWidgets('error variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DSStatusDot.error(label: 'Error'),
                  const SizedBox(height: 16),
                  DSStatusDot.error(
                    label: 'Error with custom size',
                    size: 12,
                  ),
                  const SizedBox(height: 16),
                  DSStatusDot.error(),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_status_dot_error.png'),
      );
    });

    testWidgets('states golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DSStatusDot.success(
                    label: 'Default',
                    state: DSStatusDotState.defaultState,
                  ),
                  const SizedBox(height: 16),
                  DSStatusDot.success(
                    label: 'Hover',
                    state: DSStatusDotState.hover,
                  ),
                  const SizedBox(height: 16),
                  DSStatusDot.success(
                    label: 'Pressed',
                    state: DSStatusDotState.pressed,
                  ),
                  const SizedBox(height: 16),
                  DSStatusDot.success(
                    label: 'Focus',
                    state: DSStatusDotState.focus,
                  ),
                  const SizedBox(height: 16),
                  DSStatusDot.success(
                    label: 'Selected',
                    state: DSStatusDotState.selected,
                  ),
                  const SizedBox(height: 16),
                  DSStatusDot.success(
                    label: 'Disabled',
                    state: DSStatusDotState.disabled,
                  ),
                  const SizedBox(height: 16),
                  DSStatusDot.success(
                    label: 'Loading',
                    state: DSStatusDotState.loading,
                  ),
                  const SizedBox(height: 16),
                  DSStatusDot.success(
                    label: 'Skeleton',
                    state: DSStatusDotState.skeleton,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_status_dot_states.png'),
      );
    });

    testWidgets('rtl layout golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DSStatusDot.success(label: 'نجاح'),
                    const SizedBox(height: 16),
                    DSStatusDot.info(label: 'معلومات'),
                    const SizedBox(height: 16),
                    DSStatusDot.warn(label: 'تحذير'),
                    const SizedBox(height: 16),
                    DSStatusDot.error(label: 'خطأ'),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_status_dot_rtl.png'),
      );
    });

    testWidgets('custom colors golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DSStatusDot.success(
                    label: 'Custom dot color',
                    dotColor: Colors.purple,
                  ),
                  const SizedBox(height: 16),
                  DSStatusDot.info(
                    label: 'Custom label color',
                    labelColor: Colors.purple,
                  ),
                  const SizedBox(height: 16),
                  DSStatusDot.warn(
                    label: 'Custom both',
                    dotColor: Colors.teal,
                    labelColor: Colors.teal,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_status_dot_custom_colors.png'),
      );
    });

    testWidgets('dark theme golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.grey[900],
            body: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DSStatusDot.success(label: 'Success'),
                  const SizedBox(height: 16),
                  DSStatusDot.info(label: 'Info'),
                  const SizedBox(height: 16),
                  DSStatusDot.warn(label: 'Warning'),
                  const SizedBox(height: 16),
                  DSStatusDot.error(label: 'Error'),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_status_dot_dark.png'),
      );
    });
  });
}