import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/text_area/ds_text_area.dart';
import 'package:iautomat_design_system/src/components/text_area/text_area_config.dart';

void main() {
  group('DSTextArea Golden Tests', () {
    testWidgets('default text area', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  label: 'Default Text Area',
                  hint: 'Enter your message here',
                  minLines: 3,
                  maxLines: 6,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_default.png'),
      );
    });

    testWidgets('auto-resize variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  label: 'Auto-Resize Text Area',
                  hint: 'Starts with 3 lines, grows to 8',
                  variant: DSTextAreaVariant.autoResize,
                  minLines: 3,
                  maxLines: 8,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_auto_resize.png'),
      );
    });

    testWidgets('focused text area', (tester) async {
      final focusNode = FocusNode();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  label: 'Focused Text Area',
                  hint: 'This area is focused',
                  focusNode: focusNode,
                  minLines: 3,
                ),
              ),
            ),
          ),
        ),
      );

      focusNode.requestFocus();
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_focused.png'),
      );

      focusNode.dispose();
    });

    testWidgets('text area with content', (tester) async {
      final controller = TextEditingController(
        text:
            'This is a multi-line text area\nwith some content\nthat spans multiple lines.',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  controller: controller,
                  label: 'Text Area with Content',
                  hint: 'Enter text here',
                  minLines: 3,
                  maxLines: 6,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_with_content.png'),
      );

      controller.dispose();
    });

    testWidgets('disabled text area', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  label: 'Disabled Text Area',
                  hint: 'This area is disabled',
                  enabled: false,
                  minLines: 3,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_disabled.png'),
      );
    });

    testWidgets('error text area', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  label: 'Error Text Area',
                  hint: 'This area has an error',
                  errorText: 'This field is required',
                  minLines: 3,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_error.png'),
      );
    });

    testWidgets('text area with helper text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  label: 'Text Area with Helper',
                  hint: 'Enter your message',
                  helperText: 'Please provide detailed information',
                  minLines: 3,
                  maxLines: 5,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_helper.png'),
      );
    });

    testWidgets('text area with icons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  label: 'Text Area with Icons',
                  hint: 'Message with icons',
                  prefixIcon: Icons.message,
                  suffixIcon: Icons.send,
                  minLines: 3,
                  maxLines: 5,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_icons.png'),
      );
    });

    testWidgets('text area with character counter', (tester) async {
      final controller = TextEditingController(text: 'Hello World');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  controller: controller,
                  label: 'Text Area with Counter',
                  hint: 'Type here',
                  helperText: 'Character limit applies',
                  maxLength: 200,
                  minLines: 3,
                  maxLines: 5,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_counter.png'),
      );

      controller.dispose();
    });

    testWidgets('long content with scrollbar', (tester) async {
      final controller = TextEditingController(
        text:
            'This is a very long text that will definitely exceed the maximum height of the text area. '
            'It should show a scrollbar when the content is longer than the available space. '
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
            'nisi ut aliquip ex ea commodo consequat.',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  controller: controller,
                  label: 'Long Content Area',
                  hint: 'Scroll to see more',
                  minLines: 3,
                  maxLines: 6,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_long_content.png'),
      );

      controller.dispose();
    });

    testWidgets('loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  label: 'Loading Text Area',
                  hint: 'Loading...',
                  overrideState: DSTextAreaState.loading,
                  helperText: 'Please wait',
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_loading.png'),
      );
    });

    testWidgets('skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  label: 'Skeleton Text Area',
                  hint: 'Loading...',
                  helperText: 'Loading content',
                  overrideState: DSTextAreaState.skeleton,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_skeleton.png'),
      );
    });

    testWidgets('custom configuration', (tester) async {
      const customConfig = DSTextAreaConfig(
        borderRadius: 16,
        contentPadding: EdgeInsets.all(20),
        minimumHeight: 120,
        borderWidth: 3,
        lineHeight: 24,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  label: 'Custom Config Area',
                  hint: 'Custom styling',
                  config: customConfig,
                  minLines: 3,
                  maxLines: 5,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_custom_config.png'),
      );
    });

    testWidgets('read-only state', (tester) async {
      final controller = TextEditingController(
        text: 'This is read-only content that cannot be modified.\n'
            'Users can select and copy this text but cannot edit it.',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  controller: controller,
                  label: 'Read-Only Text Area',
                  readOnly: true,
                  minLines: 3,
                  maxLines: 5,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_readonly.png'),
      );

      controller.dispose();
    });

    testWidgets('dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  label: 'Dark Theme Area',
                  hint: 'Dark mode styling',
                  helperText: 'Helper text in dark theme',
                  minLines: 3,
                  maxLines: 5,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_dark_theme.png'),
      );
    });

    testWidgets('RTL support', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextArea(
                  label: 'منطقة النص',
                  hint: 'اكتب رسالتك هنا',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  minLines: 3,
                  maxLines: 5,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_area_rtl.png'),
      );
    });
  });
}
