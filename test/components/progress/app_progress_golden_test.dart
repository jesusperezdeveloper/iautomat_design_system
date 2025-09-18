import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/progress/app_progress.dart';

void main() {
  group('AppProgress Golden Tests', () {
    testWidgets('linear progress with default styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: AppProgress.linear(
                  value: 0.65,
                  label: 'Default Progress',
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/progress_linear_default.png'),
      );
    });

    testWidgets('circular progress with default styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppProgress.circular(
                value: 0.75,
                label: 'Circular Progress',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/progress_circular_default.png'),
      );
    });

    testWidgets('indeterminate linear progress', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 250,
                child: AppProgress.linear(
                  label: 'Loading...',
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/progress_linear_indeterminate.png'),
      );
    });

    testWidgets('indeterminate circular progress', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppProgress.circular(
                label: 'Processing...',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/progress_circular_indeterminate.png'),
      );
    });

    group('States', () {
      testWidgets('progress with default state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppProgress.circular(
                  value: 0.6,
                  state: AppProgressState.defaultState,
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/progress_state_default.png'),
        );
      });

      testWidgets('progress with hover state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppProgress.circular(
                  value: 0.6,
                  state: AppProgressState.hover,
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/progress_state_hover.png'),
        );
      });

      testWidgets('progress with pressed state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppProgress.circular(
                  value: 0.6,
                  state: AppProgressState.pressed,
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/progress_state_pressed.png'),
        );
      });

      testWidgets('progress with focus state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppProgress.circular(
                  value: 0.6,
                  state: AppProgressState.focus,
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/progress_state_focus.png'),
        );
      });

      testWidgets('progress with disabled state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppProgress.circular(
                  value: 0.6,
                  state: AppProgressState.disabled,
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/progress_state_disabled.png'),
        );
      });

      testWidgets('progress with selected state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppProgress.circular(
                  value: 0.6,
                  state: AppProgressState.selected,
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/progress_state_selected.png'),
        );
      });

      testWidgets('progress with loading state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppProgress.circular(
                  value: 0.6,
                  state: AppProgressState.loading,
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/progress_state_loading.png'),
        );
      });

      testWidgets('progress with skeleton state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: AppProgress.circular(
                  value: 0.6,
                  state: AppProgressState.skeleton,
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/progress_state_skeleton.png'),
        );
      });
    });

    testWidgets('progress with custom styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 280,
                child: AppProgress.linear(
                  value: 0.45,
                  label: 'Custom Styled',
                  backgroundColor: Colors.red.withValues(alpha: 0.2),
                  valueColor: Colors.green,
                  labelColor: Colors.blue,
                  strokeWidth: 8.0,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/progress_custom_styling.png'),
      );
    });

    testWidgets('circular progress with custom dimensions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppProgress.circular(
                value: 0.8,
                label: 'Large Progress',
                radius: 40.0,
                strokeWidth: 6.0,
                valueColor: Colors.purple,
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/progress_circular_large.png'),
      );
    });

    group('Dark Theme', () {
      testWidgets('progress with dark theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 300,
                  child: AppProgress.linear(
                    value: 0.7,
                    label: 'Dark Theme Progress',
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/progress_dark_theme.png'),
        );
      });

      testWidgets('circular progress dark theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: Center(
                child: AppProgress.circular(
                  value: 0.55,
                  label: 'Dark Circular',
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/progress_circular_dark.png'),
        );
      });
    });

    group('RTL Support', () {
      testWidgets('progress with RTL support', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Center(
                  child: SizedBox(
                    width: 300,
                    child: AppProgress.linear(
                      value: 0.6,
                      label: 'RTL Progress تقدم',
                      rtlSupport: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/progress_rtl.png'),
        );
      });
    });

    group('Multiple Progress Indicators', () {
      testWidgets('multiple progress with different variants', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 300,
                      child: AppProgress.linear(
                        value: 0.3,
                        label: 'Upload Progress',
                      ),
                    ),
                    AppProgress.circular(
                      value: 0.7,
                      label: 'Processing',
                    ),
                    SizedBox(
                      width: 280,
                      child: AppProgress.linear(
                        value: 0.9,
                        label: 'Nearly Complete',
                      ),
                    ),
                    AppProgress.circular(
                      label: 'Loading...',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/progress_multiple_variants.png'),
        );
      });
    });

    group('Platform Adaptive', () {
      testWidgets('progress optimized for different platforms', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Text('Desktop Style'),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 350,
                      child: AppProgress.linear(
                        value: 0.65,
                        label: 'File Transfer',
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text('Mobile Style'),
                    const SizedBox(height: 16),
                    AppProgress.circular(
                      value: 0.8,
                      label: 'Syncing',
                      radius: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/progress_platform_adaptive.png'),
        );
      });
    });
  });
}
