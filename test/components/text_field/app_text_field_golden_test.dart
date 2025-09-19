import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/text_field/app_text_field.dart';
import 'package:iautomat_design_system/src/components/text_field/text_field_config.dart';

void main() {
  group('DSTextField Golden Tests', () {
    testWidgets('default text field', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  label: 'Default Text Field',
                  hint: 'Enter text here',
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_default.png'),
      );
    });

    testWidgets('focused text field', (tester) async {
      final focusNode = FocusNode();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  label: 'Focused Text Field',
                  hint: 'Enter text here',
                  focusNode: focusNode,
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
        matchesGoldenFile('text_field_focused.png'),
      );

      focusNode.dispose();
    });

    testWidgets('text field with text', (tester) async {
      final controller = TextEditingController(text: 'Hello World');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  controller: controller,
                  label: 'Text Field with Content',
                  hint: 'Enter text here',
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_with_text.png'),
      );

      controller.dispose();
    });

    testWidgets('disabled text field', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  label: 'Disabled Text Field',
                  hint: 'This field is disabled',
                  enabled: false,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_disabled.png'),
      );
    });

    testWidgets('error text field', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  label: 'Error Text Field',
                  hint: 'This field has an error',
                  errorText: 'This field is required',
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_error.png'),
      );
    });

    testWidgets('password variant hidden', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  label: 'Password Field',
                  hint: 'Enter your password',
                  variant: DSTextFieldVariant.password,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_password_hidden.png'),
      );
    });

    testWidgets('password variant visible', (tester) async {
      final controller = TextEditingController(text: 'secret123');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  controller: controller,
                  label: 'Password Field',
                  hint: 'Enter your password',
                  variant: DSTextFieldVariant.password,
                ),
              ),
            ),
          ),
        ),
      );

      // Tap the visibility toggle to show password
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_password_visible.png'),
      );

      controller.dispose();
    });

    testWidgets('multiline variant', (tester) async {
      final controller = TextEditingController(
        text:
            'This is a multiline text field.\nIt supports multiple lines of text.\nLike this third line.',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  controller: controller,
                  label: 'Multiline Text Field',
                  hint: 'Enter multiple lines here',
                  variant: DSTextFieldVariant.multiline,
                  maxLines: 4,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_multiline.png'),
      );

      controller.dispose();
    });

    testWidgets('text field with helper text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  label: 'Text Field with Helper',
                  hint: 'Enter text here',
                  helperText: 'This is helpful information',
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_helper.png'),
      );
    });

    testWidgets('text field with prefix and suffix icons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  label: 'Text Field with Icons',
                  hint: 'Search here',
                  prefixIcon: Icons.search,
                  suffixIcon: Icons.clear,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_icons.png'),
      );
    });

    testWidgets('text field with character counter', (tester) async {
      final controller = TextEditingController(text: 'Hello');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  controller: controller,
                  label: 'Text Field with Counter',
                  hint: 'Type here',
                  helperText: 'Character limit applies',
                  maxLength: 50,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_counter.png'),
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
                child: DSTextField(
                  label: 'Loading Text Field',
                  hint: 'Loading...',
                  overrideState: DSTextFieldState.loading,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_loading.png'),
      );
    });

    testWidgets('skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  label: 'Skeleton Text Field',
                  hint: 'Loading...',
                  helperText: 'Loading helper',
                  overrideState: DSTextFieldState.skeleton,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_skeleton.png'),
      );
    });

    testWidgets('custom configuration', (tester) async {
      const customConfig = DSTextFieldConfig(
        borderRadius: 16,
        contentPadding: EdgeInsets.all(20),
        minimumHeight: 60,
        borderWidth: 3,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  label: 'Custom Config Field',
                  hint: 'Custom styling',
                  config: customConfig,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_custom_config.png'),
      );
    });

    testWidgets('dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: DSTextField(
                  label: 'Dark Theme Field',
                  hint: 'Dark mode styling',
                  helperText: 'Helper text in dark theme',
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('text_field_dark_theme.png'),
      );
    });
  });
}
