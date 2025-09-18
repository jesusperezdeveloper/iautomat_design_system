import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/status_dot/app_status_dot.dart';

void main() {
  group('AppStatusDot Golden Tests', () {
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
                  AppStatusDot.success(label: 'Success'),
                  const SizedBox(height: 16),
                  AppStatusDot.success(
                    label: 'Success with custom size',
                    size: 12,
                  ),
                  const SizedBox(height: 16),
                  AppStatusDot.success(),
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
                  AppStatusDot.info(label: 'Info'),
                  const SizedBox(height: 16),
                  AppStatusDot.info(
                    label: 'Info with custom size',
                    size: 12,
                  ),
                  const SizedBox(height: 16),
                  AppStatusDot.info(),
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
                  AppStatusDot.warn(label: 'Warning'),
                  const SizedBox(height: 16),
                  AppStatusDot.warn(
                    label: 'Warning with custom size',
                    size: 12,
                  ),
                  const SizedBox(height: 16),
                  AppStatusDot.warn(),
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
                  AppStatusDot.error(label: 'Error'),
                  const SizedBox(height: 16),
                  AppStatusDot.error(
                    label: 'Error with custom size',
                    size: 12,
                  ),
                  const SizedBox(height: 16),
                  AppStatusDot.error(),
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
                  AppStatusDot.success(
                    label: 'Default',
                    state: AppStatusDotState.defaultState,
                  ),
                  const SizedBox(height: 16),
                  AppStatusDot.success(
                    label: 'Hover',
                    state: AppStatusDotState.hover,
                  ),
                  const SizedBox(height: 16),
                  AppStatusDot.success(
                    label: 'Pressed',
                    state: AppStatusDotState.pressed,
                  ),
                  const SizedBox(height: 16),
                  AppStatusDot.success(
                    label: 'Focus',
                    state: AppStatusDotState.focus,
                  ),
                  const SizedBox(height: 16),
                  AppStatusDot.success(
                    label: 'Selected',
                    state: AppStatusDotState.selected,
                  ),
                  const SizedBox(height: 16),
                  AppStatusDot.success(
                    label: 'Disabled',
                    state: AppStatusDotState.disabled,
                  ),
                  const SizedBox(height: 16),
                  AppStatusDot.success(
                    label: 'Loading',
                    state: AppStatusDotState.loading,
                  ),
                  const SizedBox(height: 16),
                  AppStatusDot.success(
                    label: 'Skeleton',
                    state: AppStatusDotState.skeleton,
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
                    AppStatusDot.success(label: 'نجاح'),
                    const SizedBox(height: 16),
                    AppStatusDot.info(label: 'معلومات'),
                    const SizedBox(height: 16),
                    AppStatusDot.warn(label: 'تحذير'),
                    const SizedBox(height: 16),
                    AppStatusDot.error(label: 'خطأ'),
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
                  AppStatusDot.success(
                    label: 'Custom dot color',
                    dotColor: Colors.purple,
                  ),
                  const SizedBox(height: 16),
                  AppStatusDot.info(
                    label: 'Custom label color',
                    labelColor: Colors.purple,
                  ),
                  const SizedBox(height: 16),
                  AppStatusDot.warn(
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
                  AppStatusDot.success(label: 'Success'),
                  const SizedBox(height: 16),
                  AppStatusDot.info(label: 'Info'),
                  const SizedBox(height: 16),
                  AppStatusDot.warn(label: 'Warning'),
                  const SizedBox(height: 16),
                  AppStatusDot.error(label: 'Error'),
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