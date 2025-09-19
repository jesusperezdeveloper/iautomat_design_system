import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/radio/ds_radio.dart';
import 'package:iautomat_design_system/src/components/radio/radio_config.dart';

void main() {
  group('DSRadio Golden Tests', () {
    testWidgets('standard radio states light theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Unselected'),
                  DSRadio<String>(
                    value: 'option1',
                    groupValue: null,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Selected'),
                  DSRadio<String>(
                    value: 'option2',
                    groupValue: 'option2',
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Disabled Unselected'),
                  const DSRadio<String>(
                    value: 'option3',
                    groupValue: null,
                    onChanged: null,
                  ),
                  const SizedBox(height: 16),
                  const Text('Disabled Selected'),
                  const DSRadio<String>(
                    value: 'option4',
                    groupValue: 'option4',
                    onChanged: null,
                  ),
                  const SizedBox(height: 16),
                  const Text('Loading'),
                  const DSRadio<String>(
                    value: 'loading',
                    groupValue: null,
                    onChanged: null,
                    overrideState: DSRadioState.loading,
                  ),
                  const SizedBox(height: 16),
                  const Text('Skeleton'),
                  const DSRadio<String>(
                    value: 'skeleton',
                    groupValue: null,
                    onChanged: null,
                    overrideState: DSRadioState.skeleton,
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
        matchesGoldenFile('goldens/radio_standard_states_light.png'),
      );
    });

    testWidgets('standard radio states dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(useMaterial3: true),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Unselected'),
                  DSRadio<String>(
                    value: 'option1',
                    groupValue: null,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Selected'),
                  DSRadio<String>(
                    value: 'option2',
                    groupValue: 'option2',
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Disabled Unselected'),
                  const DSRadio<String>(
                    value: 'option3',
                    groupValue: null,
                    onChanged: null,
                  ),
                  const SizedBox(height: 16),
                  const Text('Disabled Selected'),
                  const DSRadio<String>(
                    value: 'option4',
                    groupValue: 'option4',
                    onChanged: null,
                  ),
                  const SizedBox(height: 16),
                  const Text('Loading'),
                  const DSRadio<String>(
                    value: 'loading',
                    groupValue: null,
                    onChanged: null,
                    overrideState: DSRadioState.loading,
                  ),
                  const SizedBox(height: 16),
                  const Text('Skeleton'),
                  const DSRadio<String>(
                    value: 'skeleton',
                    groupValue: null,
                    onChanged: null,
                    overrideState: DSRadioState.skeleton,
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
        matchesGoldenFile('goldens/radio_standard_states_dark.png'),
      );
    });

    testWidgets('standard radio with labels', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DSRadio<String>(
                    value: 'small',
                    groupValue: null,
                    onChanged: (_) {},
                    label: 'Small (8oz)',
                  ),
                  const SizedBox(height: 16),
                  DSRadio<String>(
                    value: 'medium',
                    groupValue: 'medium',
                    onChanged: (_) {},
                    label: 'Medium (12oz)',
                  ),
                  const SizedBox(height: 16),
                  DSRadio<String>(
                    value: 'large',
                    groupValue: null,
                    onChanged: (_) {},
                    label: 'Large (16oz)',
                  ),
                  const SizedBox(height: 16),
                  const DSRadio<String>(
                    value: 'extra_large',
                    groupValue: null,
                    onChanged: null,
                    label: 'Extra Large (20oz) - Disabled',
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
        matchesGoldenFile('goldens/radio_standard_with_labels.png'),
      );
    });

    testWidgets('segmented radio basic', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('View Mode'),
                  const SizedBox(height: 12),
                  DSRadio<String>(
                    value: 'list',
                    groupValue: 'list',
                    onChanged: (_) {},
                    variant: DSRadioVariant.segmented,
                    options: const [
                      DSRadioValue(value: 'list', label: 'List'),
                      DSRadioValue(value: 'grid', label: 'Grid'),
                      DSRadioValue(value: 'card', label: 'Card'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text('File Format'),
                  const SizedBox(height: 12),
                  DSRadio<String>(
                    value: 'pdf',
                    groupValue: 'pdf',
                    onChanged: (_) {},
                    variant: DSRadioVariant.segmented,
                    options: const [
                      DSRadioValue(value: 'pdf', label: 'PDF'),
                      DSRadioValue(value: 'docx', label: 'DOCX'),
                      DSRadioValue(value: 'txt', label: 'TXT'),
                      DSRadioValue(value: 'csv', label: 'CSV', enabled: false),
                    ],
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
        matchesGoldenFile('goldens/radio_segmented_basic.png'),
      );
    });

    testWidgets('segmented radio with icons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Text Alignment'),
                  const SizedBox(height: 12),
                  DSRadio<String>(
                    value: 'left',
                    groupValue: 'left',
                    onChanged: (_) {},
                    variant: DSRadioVariant.segmented,
                    options: const [
                      DSRadioValue(
                          value: 'left',
                          label: 'Left',
                          icon: Icons.format_align_left),
                      DSRadioValue(
                          value: 'center',
                          label: 'Center',
                          icon: Icons.format_align_center),
                      DSRadioValue(
                          value: 'right',
                          label: 'Right',
                          icon: Icons.format_align_right),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text('Theme'),
                  const SizedBox(height: 12),
                  DSRadio<String>(
                    value: 'dark',
                    groupValue: 'dark',
                    onChanged: (_) {},
                    variant: DSRadioVariant.segmented,
                    options: const [
                      DSRadioValue(
                          value: 'light',
                          label: 'Light',
                          icon: Icons.light_mode),
                      DSRadioValue(
                          value: 'dark', label: 'Dark', icon: Icons.dark_mode),
                      DSRadioValue(
                          value: 'auto',
                          label: 'Auto',
                          icon: Icons.brightness_auto),
                    ],
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
        matchesGoldenFile('goldens/radio_segmented_with_icons.png'),
      );
    });

    testWidgets('custom styles', (tester) async {
      final theme = ThemeData.light(useMaterial3: true);

      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Large (28px)'),
                  DSRadio<String>(
                    value: 'large',
                    groupValue: 'large',
                    onChanged: (_) {},
                    config: const DSRadioConfig(
                      size: 28,
                      borderWidth: 3,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Small (16px)'),
                  DSRadio<String>(
                    value: 'small',
                    groupValue: 'small',
                    onChanged: (_) {},
                    config: const DSRadioConfig(
                      size: 16,
                      borderWidth: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Custom Colors'),
                  DSRadio<String>(
                    value: 'purple',
                    groupValue: 'purple',
                    onChanged: (_) {},
                    colors: DSRadioColors(
                      borderColor: Colors.purple,
                      fillColor: Colors.purple,
                      dotColor: Colors.white,
                      disabledBorderColor: Colors.purple.withValues(alpha: 0.3),
                      disabledFillColor: Colors.purple.withValues(alpha: 0.3),
                      disabledDotColor: Colors.white,
                      hoverOverlay: Colors.purple.withValues(alpha: 0.08),
                      focusOverlay: Colors.purple.withValues(alpha: 0.12),
                      pressedOverlay: Colors.purple.withValues(alpha: 0.12),
                      labelColor: Colors.black,
                      disabledLabelColor: Colors.grey,
                      segmentBackgroundColor:
                          Colors.purple.withValues(alpha: 0.1),
                      segmentSelectedBackgroundColor: Colors.purple,
                      segmentBorderColor: Colors.purple,
                      segmentSelectedBorderColor: Colors.purple,
                      segmentTextColor: Colors.purple,
                      segmentSelectedTextColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text('Custom Segmented Style'),
                  const SizedBox(height: 12),
                  DSRadio<String>(
                    value: 'rounded',
                    groupValue: 'rounded',
                    onChanged: (_) {},
                    variant: DSRadioVariant.segmented,
                    config: const DSRadioConfig(
                      segmentBorderRadius: 16,
                      segmentBorderWidth: 2,
                    ),
                    colors: DSRadioColors(
                      borderColor: Colors.orange,
                      fillColor: Colors.orange,
                      dotColor: Colors.white,
                      disabledBorderColor: Colors.orange.withValues(alpha: 0.3),
                      disabledFillColor: Colors.orange.withValues(alpha: 0.3),
                      disabledDotColor: Colors.white,
                      hoverOverlay: Colors.orange.withValues(alpha: 0.08),
                      focusOverlay: Colors.orange.withValues(alpha: 0.12),
                      pressedOverlay: Colors.orange.withValues(alpha: 0.12),
                      labelColor: theme.colorScheme.onSurface,
                      disabledLabelColor:
                          theme.colorScheme.onSurface.withValues(alpha: 0.38),
                      segmentBackgroundColor:
                          Colors.orange.withValues(alpha: 0.1),
                      segmentSelectedBackgroundColor: Colors.orange,
                      segmentBorderColor: Colors.orange,
                      segmentSelectedBorderColor: Colors.orange,
                      segmentTextColor: Colors.orange,
                      segmentSelectedTextColor: Colors.white,
                    ),
                    options: const [
                      DSRadioValue(value: 'rounded', label: 'Rounded'),
                      DSRadioValue(value: 'style', label: 'Style'),
                      DSRadioValue(value: 'custom', label: 'Custom'),
                    ],
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
        matchesGoldenFile('goldens/radio_custom_styles.png'),
      );
    });

    testWidgets('RTL support', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(useMaterial3: true),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Left-to-Right (LTR)'),
                  DSRadio<String>(
                    value: 'ltr',
                    groupValue: 'ltr',
                    onChanged: (_) {},
                    label: 'Left to right text',
                    textDirection: TextDirection.ltr,
                  ),
                  const SizedBox(height: 24),
                  const Text('Right-to-Left (RTL)'),
                  DSRadio<String>(
                    value: 'rtl',
                    groupValue: 'rtl',
                    onChanged: (_) {},
                    label: 'نص من اليمين إلى اليسار',
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 24),
                  const Text('Segmented RTL'),
                  DSRadio<String>(
                    value: 'option2',
                    groupValue: 'option2',
                    onChanged: (_) {},
                    variant: DSRadioVariant.segmented,
                    textDirection: TextDirection.rtl,
                    options: const [
                      DSRadioValue(value: 'option1', label: 'خيار 1'),
                      DSRadioValue(value: 'option2', label: 'خيار 2'),
                      DSRadioValue(value: 'option3', label: 'خيار 3'),
                    ],
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
        matchesGoldenFile('goldens/radio_rtl_support.png'),
      );
    });

    testWidgets('interactive states', (tester) async {
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
                  DSRadio<String>(
                    value: 'default',
                    groupValue: null,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: 16),
                  const Text('Hover'),
                  DSRadio<String>(
                    value: 'hover',
                    groupValue: null,
                    onChanged: (_) {},
                    overrideState: DSRadioState.hover,
                  ),
                  const SizedBox(height: 16),
                  const Text('Pressed'),
                  DSRadio<String>(
                    value: 'pressed',
                    groupValue: null,
                    onChanged: (_) {},
                    overrideState: DSRadioState.pressed,
                  ),
                  const SizedBox(height: 16),
                  const Text('Focus'),
                  DSRadio<String>(
                    value: 'focus',
                    groupValue: null,
                    onChanged: (_) {},
                    overrideState: DSRadioState.focus,
                  ),
                  const SizedBox(height: 16),
                  const Text('Selected'),
                  DSRadio<String>(
                    value: 'selected',
                    groupValue: 'selected',
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
        matchesGoldenFile('goldens/radio_interactive_states.png'),
      );
    });
  });
}
