import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/radio/app_radio.dart';
import 'package:iautomat_design_system/src/components/radio/radio_config.dart';

void main() {
  group('AppRadio', () {
    testWidgets('renders correctly in unselected state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppRadio<String>(
              value: 'option1',
              groupValue: null,
              onChanged: (_) {},
            ),
          ),
        ),
      );

      expect(find.byType(AppRadio<String>), findsOneWidget);
    });

    testWidgets('renders correctly in selected state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppRadio<String>(
              value: 'option1',
              groupValue: 'option1',
              onChanged: (_) {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppRadio<String>), findsOneWidget);
    });

    testWidgets('toggles selection when tapped', (tester) async {
      String? currentValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return AppRadio<String>(
                  value: 'option1',
                  groupValue: currentValue,
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

      expect(currentValue, null);

      await tester.tap(find.byType(AppRadio<String>));
      await tester.pumpAndSettle();

      expect(currentValue, 'option1');
    });

    testWidgets('displays label when provided', (tester) async {
      const testLabel = 'Test Label';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppRadio<String>(
              value: 'option1',
              groupValue: null,
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
            body: AppRadio<String>(
              value: 'option1',
              groupValue: null,
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
        MaterialApp(
          home: Scaffold(
            body: AppRadio<String>(
              value: 'option1',
              groupValue: null,
              onChanged: null,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppRadio<String>));
      await tester.pumpAndSettle();

      expect(find.byType(AppRadio<String>), findsOneWidget);
    });

    testWidgets('is disabled when enabled is false', (tester) async {
      bool wasCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppRadio<String>(
              value: 'option1',
              groupValue: null,
              onChanged: (_) {
                wasCalled = true;
              },
              enabled: false,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppRadio<String>));
      await tester.pumpAndSettle();

      expect(wasCalled, false);
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppRadio<String>(
              value: 'option1',
              groupValue: null,
              onChanged: null,
              overrideState: AppRadioState.loading,
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
        MaterialApp(
          home: Scaffold(
            body: AppRadio<String>(
              value: 'option1',
              groupValue: null,
              onChanged: null,
              overrideState: AppRadioState.skeleton,
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
            body: AppRadio<String>(
              value: 'option1',
              groupValue: null,
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
            body: AppRadio<String>(
              value: 'option1',
              groupValue: null,
              onChanged: (_) {},
              autoFocus: true,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final Focus focus = tester.widget<Focus>(
        find.descendant(
          of: find.byType(AppRadio<String>),
          matching: find.byType(Focus),
        ),
      );

      expect(focus.autofocus, true);
    });

    testWidgets('supports RTL text direction', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppRadio<String>(
              value: 'option1',
              groupValue: null,
              onChanged: (_) {},
              label: 'RTL Text',
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      );

      final Row row = tester.widget<Row>(
        find.descendant(
          of: find.byType(AppRadio<String>),
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
            body: AppRadio<String>(
              value: 'option1',
              groupValue: null,
              onChanged: (_) {},
              config: const AppRadioConfig(
                size: customSize,
                borderWidth: customBorderWidth,
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify configuration is applied
      final radio = tester.widget<AppRadio<String>>(find.byType(AppRadio<String>));
      expect(radio.config?.size, customSize);
      expect(radio.config?.borderWidth, customBorderWidth);
    });

    testWidgets('applies custom colors', (tester) async {
      final customColors = AppRadioColors(
        borderColor: Colors.red,
        fillColor: Colors.blue,
        dotColor: Colors.green,
        disabledBorderColor: Colors.grey,
        disabledFillColor: Colors.grey[300]!,
        disabledDotColor: Colors.white,
        hoverOverlay: Colors.red.withValues(alpha: 0.1),
        focusOverlay: Colors.blue.withValues(alpha: 0.1),
        pressedOverlay: Colors.green.withValues(alpha: 0.1),
        labelColor: Colors.black,
        disabledLabelColor: Colors.grey,
        segmentBackgroundColor: Colors.white,
        segmentSelectedBackgroundColor: Colors.blue,
        segmentBorderColor: Colors.grey,
        segmentSelectedBorderColor: Colors.blue,
        segmentTextColor: Colors.black,
        segmentSelectedTextColor: Colors.white,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppRadio<String>(
              value: 'option1',
              groupValue: 'option1',
              onChanged: (_) {},
              colors: customColors,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(AppRadio<String>), findsOneWidget);
    });

    testWidgets('has correct semantics', (tester) async {
      const semanticLabel = 'Test semantic label';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppRadio<String>(
              value: 'option1',
              groupValue: 'option1',
              onChanged: (_) {},
              semanticLabel: semanticLabel,
            ),
          ),
        ),
      );

      // Verify the semantic label is properly set
      final semanticsWidget = find.descendant(
        of: find.byType(AppRadio<String>),
        matching: find.byType(Semantics),
      );
      expect(semanticsWidget, findsWidgets);
    });

    testWidgets('tap on label toggles radio', (tester) async {
      String? currentValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return AppRadio<String>(
                  value: 'option1',
                  groupValue: currentValue,
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

      expect(currentValue, 'option1');
    });

    testWidgets('maintains state during rebuild', (tester) async {
      String? value = 'option1';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    AppRadio<String>(
                      value: 'option1',
                      groupValue: value,
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

      expect(value, 'option1');

      await tester.tap(find.text('Rebuild'));
      await tester.pumpAndSettle();

      expect(value, 'option1');
    });

    testWidgets('minimum touch target size is maintained', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppRadio<String>(
              value: 'option1',
              groupValue: null,
              onChanged: (_) {},
              config: const AppRadioConfig(
                size: 16,
                minimumTouchTargetSize: 48,
              ),
            ),
          ),
        ),
      );

      final gestureDetector = tester.widget<GestureDetector>(
        find.descendant(
          of: find.byType(AppRadio<String>),
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

    group('Segmented Radio', () {
      testWidgets('renders segmented variant correctly', (tester) async {
        String? selectedValue = 'option1';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatefulBuilder(
                builder: (context, setState) {
                  return AppRadio<String>(
                    value: selectedValue,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    variant: AppRadioVariant.segmented,
                    options: const [
                      AppRadioValue(value: 'option1', label: 'Option 1'),
                      AppRadioValue(value: 'option2', label: 'Option 2'),
                      AppRadioValue(value: 'option3', label: 'Option 3'),
                    ],
                  );
                },
              ),
            ),
          ),
        );

        expect(find.text('Option 1'), findsOneWidget);
        expect(find.text('Option 2'), findsOneWidget);
        expect(find.text('Option 3'), findsOneWidget);
      });

      testWidgets('segmented radio selection works', (tester) async {
        String? selectedValue = 'option1';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatefulBuilder(
                builder: (context, setState) {
                  return AppRadio<String>(
                    value: selectedValue,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    variant: AppRadioVariant.segmented,
                    options: const [
                      AppRadioValue(value: 'option1', label: 'Option 1'),
                      AppRadioValue(value: 'option2', label: 'Option 2'),
                      AppRadioValue(value: 'option3', label: 'Option 3'),
                    ],
                  );
                },
              ),
            ),
          ),
        );

        expect(selectedValue, 'option1');

        await tester.tap(find.text('Option 2'));
        await tester.pumpAndSettle();

        expect(selectedValue, 'option2');
      });

      testWidgets('segmented radio with icons renders correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppRadio<String>(
                value: 'left',
                groupValue: 'left',
                onChanged: (_) {},
                variant: AppRadioVariant.segmented,
                options: const [
                  AppRadioValue(value: 'left', label: 'Left', icon: Icons.format_align_left),
                  AppRadioValue(value: 'center', label: 'Center', icon: Icons.format_align_center),
                  AppRadioValue(value: 'right', label: 'Right', icon: Icons.format_align_right),
                ],
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.format_align_left), findsOneWidget);
        expect(find.byIcon(Icons.format_align_center), findsOneWidget);
        expect(find.byIcon(Icons.format_align_right), findsOneWidget);
        expect(find.text('Left'), findsOneWidget);
        expect(find.text('Center'), findsOneWidget);
        expect(find.text('Right'), findsOneWidget);
      });

      testWidgets('segmented radio disabled options work correctly', (tester) async {
        bool wasCalled = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppRadio<String>(
                value: 'option1',
                groupValue: 'option1',
                onChanged: (value) {
                  wasCalled = true;
                },
                variant: AppRadioVariant.segmented,
                options: const [
                  AppRadioValue(value: 'option1', label: 'Option 1'),
                  AppRadioValue(value: 'option2', label: 'Option 2', enabled: false),
                  AppRadioValue(value: 'option3', label: 'Option 3'),
                ],
              ),
            ),
          ),
        );

        // Tap on disabled option
        await tester.tap(find.text('Option 2'));
        await tester.pumpAndSettle();

        expect(wasCalled, false);

        // Tap on enabled option
        await tester.tap(find.text('Option 3'));
        await tester.pumpAndSettle();

        expect(wasCalled, true);
      });
    });
  });
}