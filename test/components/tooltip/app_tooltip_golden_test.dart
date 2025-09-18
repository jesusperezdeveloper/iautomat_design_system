import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/tooltip/app_tooltip.dart';

void main() {
  group('AppTooltip Golden Tests', () {
    testWidgets('hover tooltip with default styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppTooltip.hover(
                message: 'This is a hover tooltip',
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Hover me'),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/tooltip_hover.png'),
      );
    });

    testWidgets('focus tooltip with button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppTooltip.focus(
                message: 'Focus tooltip message',
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Focus Button'),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/tooltip_focus.png'),
      );
    });

    testWidgets('long press tooltip', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppTooltip.longPress(
                message: 'Long press to show tooltip',
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('Long Press Me'),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/tooltip_long_press.png'),
      );
    });

    testWidgets('tooltip with different states - default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppTooltip(
                message: 'Default state tooltip',
                state: AppTooltipState.defaultState,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('Default State'),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/tooltip_state_default.png'),
      );
    });

    testWidgets('tooltip with hover state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppTooltip(
                message: 'Hover state tooltip',
                state: AppTooltipState.hover,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('Hover State'),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/tooltip_state_hover.png'),
      );
    });

    testWidgets('tooltip with pressed state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppTooltip(
                message: 'Pressed state tooltip',
                state: AppTooltipState.pressed,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('Pressed State'),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/tooltip_state_pressed.png'),
      );
    });

    testWidgets('tooltip with focus state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppTooltip(
                message: 'Focus state tooltip',
                state: AppTooltipState.focus,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('Focus State'),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/tooltip_state_focus.png'),
      );
    });

    testWidgets('tooltip with disabled state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppTooltip(
                message: 'Disabled state tooltip',
                state: AppTooltipState.disabled,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('Disabled State'),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/tooltip_state_disabled.png'),
      );
    });

    testWidgets('tooltip with selected state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppTooltip(
                message: 'Selected state tooltip',
                state: AppTooltipState.selected,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('Selected State'),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/tooltip_state_selected.png'),
      );
    });

    testWidgets('tooltip with loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppTooltip(
                message: 'Loading state tooltip',
                state: AppTooltipState.loading,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('Loading State'),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/tooltip_state_loading.png'),
      );
    });

    testWidgets('tooltip with skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppTooltip(
                message: 'Skeleton state tooltip',
                state: AppTooltipState.skeleton,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('Skeleton State'),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/tooltip_state_skeleton.png'),
      );
    });

    testWidgets('tooltip with custom styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppTooltip(
                message: 'Custom styled tooltip',
                backgroundColor: Colors.purple.shade700,
                textColor: Colors.white,
                padding: const EdgeInsets.all(16),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('Custom Styled'),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/tooltip_custom_style.png'),
      );
    });

    testWidgets('tooltip with long message', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AppTooltip(
                message:
                    'This is a very long tooltip message that demonstrates how the tooltip handles text wrapping and maintains proper readability across multiple lines.',
                maxWidth: 200,
                maxLines: 3,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Long Message'),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/tooltip_long_message.png'),
      );
    });

    group('Dark Theme', () {
      testWidgets('tooltip with dark theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: Center(
                child: AppTooltip(
                  message: 'Dark theme tooltip',
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('Dark Theme'),
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/tooltip_dark_theme.png'),
        );
      });

      testWidgets('hover tooltip dark theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: Center(
                child: AppTooltip.hover(
                  message: 'Dark hover tooltip',
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Dark Hover'),
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/tooltip_hover_dark.png'),
        );
      });
    });

    group('RTL Support', () {
      testWidgets('tooltip with RTL support', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: Center(
                  child: AppTooltip(
                    message: 'RTL tooltip message',
                    rtlSupport: true,
                    child: Text('RTL Test'),
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/tooltip_rtl.png'),
        );
      });
    });

    group('Multiple Tooltips', () {
      testWidgets('multiple tooltips with different variants', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppTooltip.hover(
                      message: 'Hover tooltip',
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Hover'),
                      ),
                    ),
                    AppTooltip.focus(
                      message: 'Focus tooltip',
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Focus'),
                      ),
                    ),
                    AppTooltip.longPress(
                      message: 'Long press tooltip',
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Long Press'),
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
          matchesGoldenFile('goldens/tooltip_multiple_variants.png'),
        );
      });
    });

    group('Platform Adaptive', () {
      testWidgets('tooltip optimized for different platforms', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppTooltip.hover(
                    message: 'Desktop optimized',
                    showDelay: const Duration(milliseconds: 300),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Desktop'),
                    ),
                  ),
                  AppTooltip.longPress(
                    message: 'Mobile optimized',
                    showDelay: const Duration(milliseconds: 750),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Mobile'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/tooltip_platform_adaptive.png'),
        );
      });
    });
  });
}
