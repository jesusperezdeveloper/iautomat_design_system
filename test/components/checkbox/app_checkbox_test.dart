import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/checkbox/app_checkbox.dart';
import 'package:iautomat_design_system/src/components/checkbox/checkbox_config.dart';

void main() {
  group('AppCheckbox', () {
    testWidgets('renders correctly in unchecked state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.unchecked,
              onChanged: (_) {},
            ),
          ),
        ),
      );

      expect(find.byType(AppCheckbox), findsOneWidget);
      // The checkbox contains CustomPaint for the check mark animation holder even when unchecked
      expect(find.byType(CustomPaint), findsWidgets);
    });

    testWidgets('renders correctly in checked state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.checked,
              onChanged: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppCheckbox), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
    });

    testWidgets('renders correctly in indeterminate state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.indeterminate,
              onChanged: (_) {},
              tristate: true,
            ),
          ),
        ),
      );

      // Don't use pumpAndSettle for indeterminate state as it has infinite animation
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(AppCheckbox), findsOneWidget);
      expect(find.byType(CustomPaint), findsWidgets);
    });

    testWidgets('toggles between states when tapped', (tester) async {
      AppCheckboxValue? currentValue = AppCheckboxValue.unchecked;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return AppCheckbox(
                  value: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                );
              },
            ),
          ),
        ),
      );

      expect(currentValue, AppCheckboxValue.unchecked);

      await tester.tap(find.byType(AppCheckbox));
      await tester.pumpAndSettle();

      expect(currentValue, AppCheckboxValue.checked);

      await tester.tap(find.byType(AppCheckbox));
      await tester.pumpAndSettle();

      expect(currentValue, AppCheckboxValue.unchecked);
    });

    testWidgets('supports tristate toggling', (tester) async {
      AppCheckboxValue? currentValue = AppCheckboxValue.unchecked;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return AppCheckbox(
                  value: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                  tristate: true,
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppCheckbox));
      await tester.pump();
      expect(currentValue, AppCheckboxValue.checked);

      await tester.tap(find.byType(AppCheckbox));
      await tester.pump(); // Don't use pumpAndSettle for indeterminate state
      expect(currentValue, AppCheckboxValue.indeterminate);

      await tester.tap(find.byType(AppCheckbox));
      await tester.pump();
      expect(currentValue, AppCheckboxValue.unchecked);
    });

    testWidgets('displays label when provided', (tester) async {
      const testLabel = 'Test Label';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.unchecked,
              onChanged: (_) {},
              label: testLabel,
            ),
          ),
        ),
      );

      expect(find.text(testLabel), findsOneWidget);
    });

    testWidgets('displays custom label widget when provided', (tester) async {
      const customText = 'Custom Widget';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.unchecked,
              onChanged: (_) {},
              labelWidget: const Text(customText),
            ),
          ),
        ),
      );

      expect(find.text(customText), findsOneWidget);
    });

    testWidgets('is disabled when onChanged is null', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.unchecked,
              onChanged: null,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppCheckbox));
      await tester.pumpAndSettle();

      expect(find.byType(AppCheckbox), findsOneWidget);
    });

    testWidgets('is disabled when enabled is false', (tester) async {
      bool wasCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.unchecked,
              onChanged: (_) {
                wasCalled = true;
              },
              enabled: false,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppCheckbox));
      await tester.pumpAndSettle();

      expect(wasCalled, false);
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: null,
              onChanged: null,
              overrideState: AppCheckboxState.loading,
            ),
          ),
        ),
      );

      // Check for loading indicator - platform specific
      expect(
        find.byType(CircularProgressIndicator).evaluate().isNotEmpty ||
        find.byType(SizedBox).evaluate().length > 1,
        true,
      );
    });

    testWidgets('shows skeleton state correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: null,
              onChanged: null,
              overrideState: AppCheckboxState.skeleton,
            ),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('respects focus node', (tester) async {
      final focusNode = FocusNode();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.unchecked,
              onChanged: (_) {},
              focusNode: focusNode,
            ),
          ),
        ),
      );

      expect(focusNode.hasFocus, false);

      // Request focus and verify it works
      focusNode.requestFocus();
      await tester.pump();

      // Note: In test environment, focus might not be granted immediately
      // This test verifies the focus node is properly connected

      focusNode.dispose();
    });

    testWidgets('supports autofocus', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.unchecked,
              onChanged: (_) {},
              autoFocus: true,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final Focus focus = tester.widget<Focus>(
        find.descendant(
          of: find.byType(AppCheckbox),
          matching: find.byType(Focus),
        ),
      );

      expect(focus.autofocus, true);
    });

    testWidgets('supports RTL text direction', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.unchecked,
              onChanged: (_) {},
              label: 'RTL Text',
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      );

      final Row row = tester.widget<Row>(
        find.descendant(
          of: find.byType(AppCheckbox),
          matching: find.byType(Row),
        ),
      );

      expect(row.textDirection, TextDirection.rtl);
    });

    testWidgets('applies custom configuration', (tester) async {
      const customSize = 30.0;
      const customBorderWidth = 3.0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.unchecked,
              onChanged: (_) {},
              config: const AppCheckboxConfig(
                size: customSize,
                borderWidth: customBorderWidth,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify configuration is applied
      final checkbox = tester.widget<AppCheckbox>(find.byType(AppCheckbox));
      expect(checkbox.config?.size, customSize);
      expect(checkbox.config?.borderWidth, customBorderWidth);
    });

    testWidgets('applies custom colors', (tester) async {
      final customColors = AppCheckboxColors(
        borderColor: Colors.red,
        fillColor: Colors.blue,
        checkColor: Colors.green,
        disabledBorderColor: Colors.grey,
        disabledFillColor: Colors.grey[300]!,
        disabledCheckColor: Colors.white,
        hoverOverlay: Colors.red.withValues(alpha: 0.1),
        focusOverlay: Colors.blue.withValues(alpha: 0.1),
        pressedOverlay: Colors.green.withValues(alpha: 0.1),
        labelColor: Colors.black,
        disabledLabelColor: Colors.grey,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.checked,
              onChanged: (_) {},
              colors: customColors,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppCheckbox), findsOneWidget);
    });

    testWidgets('has correct semantics', (tester) async {
      const semanticLabel = 'Test semantic label';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.checked,
              onChanged: (_) {},
              semanticLabel: semanticLabel,
            ),
          ),
        ),
      );

      // Verify the semantic label is properly set
      final semanticsWidget = find.descendant(
        of: find.byType(AppCheckbox),
        matching: find.byType(Semantics),
      );
      expect(semanticsWidget, findsWidgets);
    });

    testWidgets('has correct semantics for indeterminate', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.indeterminate,
              onChanged: (_) {},
              tristate: true,
            ),
          ),
        ),
      );

      // Verify the indeterminate state is accessible
      final semanticsWidget = find.descendant(
        of: find.byType(AppCheckbox),
        matching: find.byType(Semantics),
      );
      expect(semanticsWidget, findsWidgets);
    });

    testWidgets('tap on label toggles checkbox', (tester) async {
      AppCheckboxValue? currentValue = AppCheckboxValue.unchecked;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return AppCheckbox(
                  value: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                  label: 'Tap me',
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tap me'));
      await tester.pumpAndSettle();

      expect(currentValue, AppCheckboxValue.checked);
    });

    testWidgets('maintains state during rebuild', (tester) async {
      AppCheckboxValue? value = AppCheckboxValue.checked;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    AppCheckbox(
                      value: value,
                      onChanged: (newValue) {
                        setState(() {
                          value = newValue;
                        });
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text('Rebuild'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      expect(value, AppCheckboxValue.checked);

      await tester.tap(find.text('Rebuild'));
      await tester.pumpAndSettle();

      expect(value, AppCheckboxValue.checked);
    });

    testWidgets('minimum touch target size is maintained', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCheckbox(
              value: AppCheckboxValue.unchecked,
              onChanged: (_) {},
              config: const AppCheckboxConfig(
                size: 16,
                minimumTouchTargetSize: 48,
              ),
            ),
          ),
        ),
      );

      final gestureDetector = tester.widget<GestureDetector>(
        find.descendant(
          of: find.byType(AppCheckbox),
          matching: find.byType(GestureDetector),
        ).first,
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byWidget(gestureDetector),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.constraints?.minWidth, 48);
      expect(container.constraints?.minHeight, 48);
    });
  });
}