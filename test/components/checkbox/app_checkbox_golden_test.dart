import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/checkbox/app_checkbox.dart';
import 'package:iautomat_design_system/src/components/checkbox/checkbox_config.dart';

void main() {
  group('DSCheckbox Golden Tests', () {
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
                  DSCheckbox(
                    value: DSCheckboxValue.unchecked,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Checked'),
                  DSCheckbox(
                    value: DSCheckboxValue.checked,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Indeterminate'),
                  DSCheckbox(
                    value: DSCheckboxValue.indeterminate,
                    onChanged: (_) {},
                    tristate: true,
                  ),
                  const SizedBox(height: 16),
                  const Text('Disabled Unchecked'),
                  const DSCheckbox(
                    value: DSCheckboxValue.unchecked,
                    onChanged: null,
                  ),
                  const SizedBox(height: 16),
                  const Text('Disabled Checked'),
                  const DSCheckbox(
                    value: DSCheckboxValue.checked,
                    onChanged: null,
                  ),
                  const SizedBox(height: 16),
                  const Text('Loading'),
                  const DSCheckbox(
                    value: null,
                    onChanged: null,
                    overrideState: DSCheckboxState.loading,
                  ),
                  const SizedBox(height: 16),
                  const Text('Skeleton'),
                  const DSCheckbox(
                    value: null,
                    onChanged: null,
                    overrideState: DSCheckboxState.skeleton,
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
                  DSCheckbox(
                    value: DSCheckboxValue.unchecked,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Checked'),
                  DSCheckbox(
                    value: DSCheckboxValue.checked,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Indeterminate'),
                  DSCheckbox(
                    value: DSCheckboxValue.indeterminate,
                    onChanged: (_) {},
                    tristate: true,
                  ),
                  const SizedBox(height: 16),
                  const Text('Disabled Unchecked'),
                  const DSCheckbox(
                    value: DSCheckboxValue.unchecked,
                    onChanged: null,
                  ),
                  const SizedBox(height: 16),
                  const Text('Disabled Checked'),
                  const DSCheckbox(
                    value: DSCheckboxValue.checked,
                    onChanged: null,
                  ),
                  const SizedBox(height: 16),
                  const Text('Loading'),
                  const DSCheckbox(
                    value: null,
                    onChanged: null,
                    overrideState: DSCheckboxState.loading,
                  ),
                  const SizedBox(height: 16),
                  const Text('Skeleton'),
                  const DSCheckbox(
                    value: null,
                    onChanged: null,
                    overrideState: DSCheckboxState.skeleton,
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
                  DSCheckbox(
                    value: DSCheckboxValue.unchecked,
                    onChanged: (_) {},
                    label: 'Accept terms and conditions',
                  ),
                  const SizedBox(height: 16),
                  DSCheckbox(
                    value: DSCheckboxValue.checked,
                    onChanged: (_) {},
                    label: 'Subscribe to newsletter',
                  ),
                  const SizedBox(height: 16),
                  const DSCheckbox(
                    value: DSCheckboxValue.unchecked,
                    onChanged: null,
                    label: 'Disabled option',
                  ),
                  const SizedBox(height: 16),
                  DSCheckbox(
                    value: DSCheckboxValue.indeterminate,
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
                  DSCheckbox(
                    value: DSCheckboxValue.checked,
                    onChanged: (_) {},
                    config: const DSCheckboxConfig(
                      size: 28,
                      borderWidth: 3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Small (16px)'),
                  DSCheckbox(
                    value: DSCheckboxValue.checked,
                    onChanged: (_) {},
                    config: const DSCheckboxConfig(
                      size: 16,
                      borderWidth: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Custom Colors'),
                  DSCheckbox(
                    value: DSCheckboxValue.checked,
                    onChanged: (_) {},
                    colors: DSCheckboxColors(
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
                  DSCheckbox(
                    value: DSCheckboxValue.checked,
                    onChanged: (_) {},
                    config: const DSCheckboxConfig(
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
                  DSCheckbox(
                    value: DSCheckboxValue.checked,
                    onChanged: (_) {},
                    label: 'Left to right text',
                    textDirection: TextDirection.ltr,
                  ),
                  const SizedBox(height: 24),
                  const Text('RTL Layout'),
                  DSCheckbox(
                    value: DSCheckboxValue.checked,
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
                  DSCheckbox(
                    value: DSCheckboxValue.unchecked,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Hover'),
                  DSCheckbox(
                    value: DSCheckboxValue.unchecked,
                    onChanged: (_) {},
                    overrideState: DSCheckboxState.hover,
                  ),
                  const SizedBox(height: 16),
                  const Text('Pressed'),
                  DSCheckbox(
                    value: DSCheckboxValue.unchecked,
                    onChanged: (_) {},
                    overrideState: DSCheckboxState.pressed,
                  ),
                  const SizedBox(height: 16),
                  const Text('Focus'),
                  DSCheckbox(
                    value: DSCheckboxValue.unchecked,
                    onChanged: (_) {},
                    overrideState: DSCheckboxState.focus,
                  ),
                  const SizedBox(height: 16),
                  const Text('Selected'),
                  DSCheckbox(
                    value: DSCheckboxValue.checked,
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
