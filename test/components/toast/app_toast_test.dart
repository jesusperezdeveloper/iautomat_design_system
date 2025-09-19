import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/toast/app_toast.dart';

void main() {
  group('DSToast', () {
    testWidgets('renders correctly with basic message',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSToast(
              message: 'Test message',
            ),
          ),
        ),
      );

      expect(find.text('Test message'), findsOneWidget);
    });

    testWidgets('renders correctly with action', (WidgetTester tester) async {
      bool actionPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSToast(
              message: 'Test message',
              action: ToastAction(
                label: 'Action',
                onPressed: () => actionPressed = true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Test message'), findsOneWidget);
      expect(find.text('Action'), findsOneWidget);

      await tester.tap(find.text('Action'));
      await tester.pump();

      expect(actionPressed, isTrue);
    });

    testWidgets('renders close button when enabled',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSToast(
              message: 'Test message',
              showCloseButton: true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('hides close button when disabled',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSToast(
              message: 'Test message',
              showCloseButton: false,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('shows correct icon for different toast types',
        (WidgetTester tester) async {
      // Test success type
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSToast(
              message: 'Success message',
              type: ToastType.success,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
      await tester.pumpAndSettle();

      // Test warning type
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSToast(
              message: 'Warning message',
              type: ToastType.warning,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.warning), findsOneWidget);
      await tester.pumpAndSettle();

      // Test error type
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSToast(
              message: 'Error message',
              type: ToastType.error,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('renders custom leading widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSToast(
              message: 'Test message',
              leading: Icon(Icons.star),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('handles skeleton state', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSToast(
              message: 'Test message',
              state: ToastState.skeleton,
            ),
          ),
        ),
      );

      // Should not show the actual message in skeleton state
      expect(find.text('Test message'), findsNothing);
    });

    testWidgets('applies accessibility label', (WidgetTester tester) async {
      const accessibilityLabel = 'Custom accessibility label';

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSToast(
              message: 'Test message',
              accessibilitySupport: true,
              accessibilityLabel: accessibilityLabel,
            ),
          ),
        ),
      );

      final semantics = tester.getSemantics(find.byType(DSToast));
      expect(semantics.label, accessibilityLabel);
    });

    testWidgets('generates default accessibility label',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSToast(
              message: 'Test message',
              accessibilitySupport: true,
              action: ToastAction(
                label: 'Test Action',
                onPressed: () {},
              ),
            ),
          ),
        ),
      );

      final semantics = tester.getSemantics(find.byType(DSToast));
      expect(semantics.label, contains('Toast: Test message'));
      expect(semantics.label, contains('with action Test Action'));
    });

    testWidgets('handles custom colors', (WidgetTester tester) async {
      const customBgColor = Colors.purple;
      const customTextColor = Colors.yellow;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSToast(
              message: 'Test message',
              backgroundColor: customBgColor,
              textColor: customTextColor,
            ),
          ),
        ),
      );

      final material = tester.widget<Material>(
        find
            .descendant(
              of: find.byType(DSToast),
              matching: find.byType(Material),
            )
            .first,
      );

      expect(material.color, customBgColor);
    });

    testWidgets('handles RTL direction', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: const Scaffold(
              body: DSToast(
                message: 'Test message',
                rtlSupport: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSToast), findsOneWidget);
    });

    testWidgets('calls onDismiss when close button is tapped',
        (WidgetTester tester) async {
      bool dismissCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSToast(
              message: 'Test message',
              showCloseButton: true,
              onDismiss: () => dismissCalled = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(dismissCalled, isTrue);
    });

    group('Static methods', () {
      testWidgets('info creates info toast', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () => DSToast.info(
                      context,
                      message: 'Info message',
                    ),
                    child: const Text('Show Info'),
                  );
                },
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Info'));
        await tester.pumpAndSettle();

        expect(find.text('Info message'), findsOneWidget);
      });

      testWidgets('success creates success toast', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () => DSToast.success(
                      context,
                      message: 'Success message',
                    ),
                    child: const Text('Show Success'),
                  );
                },
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Success'));
        await tester.pumpAndSettle();

        expect(find.text('Success message'), findsOneWidget);
        expect(find.byIcon(Icons.check_circle), findsOneWidget);
      });

      testWidgets('warning creates warning toast', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () => DSToast.warning(
                      context,
                      message: 'Warning message',
                    ),
                    child: const Text('Show Warning'),
                  );
                },
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Warning'));
        await tester.pumpAndSettle();

        expect(find.text('Warning message'), findsOneWidget);
        expect(find.byIcon(Icons.warning), findsOneWidget);
      });

      testWidgets('error creates error toast', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () => DSToast.error(
                      context,
                      message: 'Error message',
                    ),
                    child: const Text('Show Error'),
                  );
                },
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Error'));
        await tester.pumpAndSettle();

        expect(find.text('Error message'), findsOneWidget);
        expect(find.byIcon(Icons.error), findsOneWidget);
      });
    });

    group('DSToastManager', () {
      testWidgets('can remove all toasts', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          DSToast.info(context, message: 'Toast 1');
                          DSToast.info(context, message: 'Toast 2');
                        },
                        child: const Text('Show Toasts'),
                      ),
                      ElevatedButton(
                        onPressed: () => DSToastManager.removeAll(),
                        child: const Text('Remove All'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );

        // Show toasts
        await tester.tap(find.text('Show Toasts'));
        await tester.pumpAndSettle();

        expect(find.text('Toast 1'), findsOneWidget);
        expect(find.text('Toast 2'), findsOneWidget);

        // Remove all toasts
        await tester.tap(find.text('Remove All'));
        await tester.pumpAndSettle();

        expect(find.text('Toast 1'), findsNothing);
        expect(find.text('Toast 2'), findsNothing);
      });

      testWidgets('can remove toasts by position', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          DSToast.info(
                            context,
                            message: 'Top toast',
                            position: ToastPosition.top,
                          );
                          DSToast.info(
                            context,
                            message: 'Bottom toast',
                            position: ToastPosition.bottom,
                          );
                        },
                        child: const Text('Show Toasts'),
                      ),
                      ElevatedButton(
                        onPressed: () => DSToastManager.removeAllAtPosition(
                          ToastPosition.top,
                        ),
                        child: const Text('Remove Top'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );

        // Show toasts
        await tester.tap(find.text('Show Toasts'));
        await tester.pumpAndSettle();

        expect(find.text('Top toast'), findsOneWidget);
        expect(find.text('Bottom toast'), findsOneWidget);

        // Remove only top toasts
        await tester.tap(find.text('Remove Top'));
        await tester.pumpAndSettle();

        expect(find.text('Top toast'), findsNothing);
        expect(find.text('Bottom toast'), findsOneWidget);
      });
    });

    group('ToastAction', () {
      test('creates with required parameters', () {
        final action = ToastAction(
          label: 'Test Action',
          onPressed: () {},
        );

        expect(action.label, 'Test Action');
        expect(action.icon, isNull);
      });

      test('creates with icon', () {
        final action = ToastAction(
          label: 'Test Action',
          onPressed: () {},
          icon: Icons.star,
        );

        expect(action.label, 'Test Action');
        expect(action.icon, Icons.star);
      });
    });

    group('copyWith extension', () {
      test('copies toast with new values', () {
        final original = DSToast(
          message: 'Original message',
          type: ToastType.info,
          showCloseButton: true,
        );

        final copied = original.copyWith(
          message: 'New message',
          type: ToastType.success,
          showCloseButton: false,
        );

        expect(copied.message, 'New message');
        expect(copied.type, ToastType.success);
        expect(copied.showCloseButton, false);
      });

      test('retains original values when not specified', () {
        final original = DSToast(
          message: 'Original message',
          type: ToastType.warning,
          duration: Duration(seconds: 10),
        );

        final copied = original.copyWith(
          message: 'New message',
        );

        expect(copied.message, 'New message');
        expect(copied.type, ToastType.warning);
        expect(copied.duration, Duration(seconds: 10));
      });
    });
  });
}
