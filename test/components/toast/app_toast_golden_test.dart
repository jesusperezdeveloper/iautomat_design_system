import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/toast/app_toast.dart';

void main() {
  group('DSToast Golden Tests', () {
    testWidgets('Toast - Info Type Default', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                child: const DSToast(
                  message: 'This is an info toast message',
                  type: ToastType.info,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSToast),
        matchesGoldenFile('goldens/app_toast_info_default.png'),
      );
    });

    testWidgets('Toast - Success Type', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                child: const DSToast(
                  message: 'Operation completed successfully!',
                  type: ToastType.success,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSToast),
        matchesGoldenFile('goldens/app_toast_success.png'),
      );
    });

    testWidgets('Toast - Warning Type', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                child: const DSToast(
                  message: 'Warning: Please review your settings',
                  type: ToastType.warning,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSToast),
        matchesGoldenFile('goldens/app_toast_warning.png'),
      );
    });

    testWidgets('Toast - Error Type', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                child: const DSToast(
                  message: 'Error: Something went wrong',
                  type: ToastType.error,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSToast),
        matchesGoldenFile('goldens/app_toast_error.png'),
      );
    });

    testWidgets('Toast - With Action', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                child: DSToast(
                  message: 'Toast with action button',
                  type: ToastType.success,
                  action: ToastAction(
                    label: 'View',
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSToast),
        matchesGoldenFile('goldens/app_toast_with_action.png'),
      );
    });

    testWidgets('Toast - With Action and Icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                child: DSToast(
                  message: 'Toast with action and icon',
                  type: ToastType.error,
                  action: ToastAction(
                    label: 'Retry',
                    icon: Icons.refresh,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSToast),
        matchesGoldenFile('goldens/app_toast_with_action_icon.png'),
      );
    });

    testWidgets('Toast - Custom Leading Widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                child: const DSToast(
                  message: 'Toast with custom leading widget',
                  type: ToastType.custom,
                  leading: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSToast),
        matchesGoldenFile('goldens/app_toast_custom_leading.png'),
      );
    });

    testWidgets('Toast - Without Close Button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                child: const DSToast(
                  message: 'Toast without close button',
                  type: ToastType.info,
                  showCloseButton: false,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSToast),
        matchesGoldenFile('goldens/app_toast_no_close_button.png'),
      );
    });

    testWidgets('Toast - Long Message', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                child: const DSToast(
                  message:
                      'This is a very long toast message that might span multiple lines to test text wrapping behavior in the toast component',
                  type: ToastType.info,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSToast),
        matchesGoldenFile('goldens/app_toast_long_message.png'),
      );
    });

    testWidgets('Toast - Custom Colors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                child: const DSToast(
                  message: 'Toast with custom colors',
                  type: ToastType.custom,
                  backgroundColor: Colors.purple,
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSToast),
        matchesGoldenFile('goldens/app_toast_custom_colors.png'),
      );
    });

    testWidgets('Toast - Skeleton State', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                child: const DSToast(
                  message: 'This message will not be shown',
                  state: ToastState.skeleton,
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSToast),
        matchesGoldenFile('goldens/app_toast_skeleton.png'),
      );
    });

    testWidgets('Toast - Dark Theme', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.grey[900],
            body: Center(
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(16),
                child: DSToast(
                  message: 'Toast in dark theme',
                  type: ToastType.success,
                  action: ToastAction(
                    label: 'Action',
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSToast),
        matchesGoldenFile('goldens/app_toast_dark_theme.png'),
      );
    });

    testWidgets('Toast - RTL Layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.grey[100],
              body: Center(
                child: Container(
                  width: 320,
                  padding: const EdgeInsets.all(16),
                  child: DSToast(
                    message: 'Toast في RTL layout مع عمل',
                    type: ToastType.warning,
                    rtlSupport: true,
                    action: ToastAction(
                      label: 'عمل',
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(DSToast),
        matchesGoldenFile('goldens/app_toast_rtl.png'),
      );
    });
  });
}
