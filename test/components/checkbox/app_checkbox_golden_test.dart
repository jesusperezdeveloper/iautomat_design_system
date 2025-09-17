import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/checkbox/app_checkbox.dart';
import 'package:iautomat_design_system/src/components/checkbox/checkbox_config.dart';

void main() {
  group('AppCheckbox Golden Tests', () {
    testWidgets('checkbox states light theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Unchecked'),
                  AppCheckbox(
                    value: AppCheckboxValue.unchecked,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Checked'),
                  AppCheckbox(
                    value: AppCheckboxValue.checked,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Indeterminate'),
                  AppCheckbox(
                    value: AppCheckboxValue.indeterminate,
                    onChanged: (_) {},
                    tristate: true,
                  ),
                  const SizedBox(height: 16),
                  const Text('Disabled Unchecked'),
                  const AppCheckbox(
                    value: AppCheckboxValue.unchecked,
                    onChanged: null,
                  ),
                  const SizedBox(height: 16),
                  const Text('Disabled Checked'),
                  const AppCheckbox(
                    value: AppCheckboxValue.checked,
                    onChanged: null,
                  ),
                  const SizedBox(height: 16),
                  const Text('Loading'),
                  const AppCheckbox(
                    value: null,
                    onChanged: null,
                    overrideState: AppCheckboxState.loading,
                  ),
                  const SizedBox(height: 16),
                  const Text('Skeleton'),
                  const AppCheckbox(
                    value: null,
                    onChanged: null,
                    overrideState: AppCheckboxState.skeleton,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/checkbox_states_light.png'),
      );
    });

    testWidgets('checkbox states dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(useMaterial3: true),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Unchecked'),
                  AppCheckbox(
                    value: AppCheckboxValue.unchecked,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Checked'),
                  AppCheckbox(
                    value: AppCheckboxValue.checked,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Indeterminate'),
                  AppCheckbox(
                    value: AppCheckboxValue.indeterminate,
                    onChanged: (_) {},
                    tristate: true,
                  ),
                  const SizedBox(height: 16),
                  const Text('Disabled Unchecked'),
                  const AppCheckbox(
                    value: AppCheckboxValue.unchecked,
                    onChanged: null,
                  ),
                  const SizedBox(height: 16),
                  const Text('Disabled Checked'),
                  const AppCheckbox(
                    value: AppCheckboxValue.checked,
                    onChanged: null,
                  ),
                  const SizedBox(height: 16),
                  const Text('Loading'),
                  const AppCheckbox(
                    value: null,
                    onChanged: null,
                    overrideState: AppCheckboxState.loading,
                  ),
                  const SizedBox(height: 16),
                  const Text('Skeleton'),
                  const AppCheckbox(
                    value: null,
                    onChanged: null,
                    overrideState: AppCheckboxState.skeleton,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/checkbox_states_dark.png'),
      );
    });

    testWidgets('checkbox with labels', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppCheckbox(
                    value: AppCheckboxValue.unchecked,
                    onChanged: (_) {},
                    label: 'Accept terms and conditions',
                  ),
                  const SizedBox(height: 16),
                  AppCheckbox(
                    value: AppCheckboxValue.checked,
                    onChanged: (_) {},
                    label: 'Subscribe to newsletter',
                  ),
                  const SizedBox(height: 16),
                  const AppCheckbox(
                    value: AppCheckboxValue.unchecked,
                    onChanged: null,
                    label: 'Disabled option',
                  ),
                  const SizedBox(height: 16),
                  AppCheckbox(
                    value: AppCheckboxValue.indeterminate,
                    onChanged: (_) {},
                    label: 'Select all items',
                    tristate: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/checkbox_with_labels.png'),
      );
    });

    testWidgets('checkbox custom styles', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Large (28px)'),
                  AppCheckbox(
                    value: AppCheckboxValue.checked,
                    onChanged: (_) {},
                    config: const AppCheckboxConfig(
                      size: 28,
                      borderWidth: 3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Small (16px)'),
                  AppCheckbox(
                    value: AppCheckboxValue.checked,
                    onChanged: (_) {},
                    config: const AppCheckboxConfig(
                      size: 16,
                      borderWidth: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Custom Colors'),
                  AppCheckbox(
                    value: AppCheckboxValue.checked,
                    onChanged: (_) {},
                    colors: AppCheckboxColors(
                      borderColor: Colors.purple,
                      fillColor: Colors.purple,
                      checkColor: Colors.white,
                      disabledBorderColor: Colors.purple.withValues(alpha: 0.3),
                      disabledFillColor: Colors.purple.withValues(alpha: 0.3),
                      disabledCheckColor: Colors.white,
                      hoverOverlay: Colors.purple.withValues(alpha: 0.08),
                      focusOverlay: Colors.purple.withValues(alpha: 0.12),
                      pressedOverlay: Colors.purple.withValues(alpha: 0.12),
                      labelColor: Colors.black,
                      disabledLabelColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Circular'),
                  AppCheckbox(
                    value: AppCheckboxValue.checked,
                    onChanged: (_) {},
                    config: const AppCheckboxConfig(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/checkbox_custom_styles.png'),
      );
    });

    testWidgets('checkbox RTL support', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('LTR Layout'),
                  AppCheckbox(
                    value: AppCheckboxValue.checked,
                    onChanged: (_) {},
                    label: 'Left to right text',
                    textDirection: TextDirection.ltr,
                  ),
                  const SizedBox(height: 24),
                  const Text('RTL Layout'),
                  AppCheckbox(
                    value: AppCheckboxValue.checked,
                    onChanged: (_) {},
                    label: 'نص من اليمين إلى اليسار',
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/checkbox_rtl_support.png'),
      );
    });

    testWidgets('checkbox interactive states', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Default'),
                  AppCheckbox(
                    value: AppCheckboxValue.unchecked,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Hover'),
                  AppCheckbox(
                    value: AppCheckboxValue.unchecked,
                    onChanged: (_) {},
                    overrideState: AppCheckboxState.hover,
                  ),
                  const SizedBox(height: 16),
                  const Text('Pressed'),
                  AppCheckbox(
                    value: AppCheckboxValue.unchecked,
                    onChanged: (_) {},
                    overrideState: AppCheckboxState.pressed,
                  ),
                  const SizedBox(height: 16),
                  const Text('Focus'),
                  AppCheckbox(
                    value: AppCheckboxValue.unchecked,
                    onChanged: (_) {},
                    overrideState: AppCheckboxState.focus,
                  ),
                  const SizedBox(height: 16),
                  const Text('Selected'),
                  AppCheckbox(
                    value: AppCheckboxValue.checked,
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/checkbox_interactive_states.png'),
      );
    });
  });
}