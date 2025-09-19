import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/dialog/ds_dialog.dart';

void main() {
  group('DSDialog Golden Tests', () {
    testWidgets('sm variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 400,
                height: 300,
                child: Stack(
                  children: [
                    Dialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: DSDialog.sm(
                        title: 'Small Dialog',
                        content: const Text('This is a small dialog for quick confirmations.'),
                        actions: [
                          DialogAction(
                            label: 'Cancel',
                            onPressed: () {},
                          ),
                          DialogAction(
                            label: 'OK',
                            isPrimary: true,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_dialog_sm.png'),
      );
    });

    testWidgets('md variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 600,
                height: 400,
                child: Stack(
                  children: [
                    Dialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: DSDialog.md(
                        title: 'Medium Dialog',
                        content: const Text(
                          'This is a medium dialog with standard content. '
                          'It provides more space for detailed information '
                          'while maintaining good readability.',
                        ),
                        actions: [
                          DialogAction(
                            label: 'Cancel',
                            onPressed: () {},
                          ),
                          DialogAction(
                            label: 'Continue',
                            isPrimary: true,
                            icon: Icons.arrow_forward,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_dialog_md.png'),
      );
    });

    testWidgets('lg variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 800,
                height: 600,
                child: Stack(
                  children: [
                    Dialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: DSDialog.lg(
                        title: 'Large Dialog',
                        content: const SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'This is a large dialog designed for extensive content. '
                                'It provides ample space for detailed information, forms, '
                                'or complex layouts.',
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Features:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('• Responsive layout'),
                              Text('• Scrollable content'),
                              Text('• Multiple action buttons'),
                              Text('• Accessibility support'),
                              SizedBox(height: 16),
                              Text(
                                'This dialog variant is perfect for detailed forms, '
                                'settings panels, or information displays that require '
                                'more space than standard dialogs.',
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          DialogAction(
                            label: 'Help',
                            icon: Icons.help,
                            onPressed: () {},
                          ),
                          DialogAction(
                            label: 'Cancel',
                            onPressed: () {},
                          ),
                          DialogAction(
                            label: 'Save',
                            isPrimary: true,
                            icon: Icons.save,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_dialog_lg.png'),
      );
    });

    testWidgets('destructive variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 500,
                height: 300,
                child: Stack(
                  children: [
                    Dialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: DSDialog.destructive(
                        title: 'Delete Item',
                        content: const Text(
                          'This action cannot be undone. Are you sure you want to '
                          'permanently delete this item? All associated data will '
                          'be lost.',
                        ),
                        actions: [
                          DialogAction(
                            label: 'Cancel',
                            onPressed: () {},
                          ),
                          DialogAction(
                            label: 'Delete',
                            isPrimary: true,
                            isDestructive: true,
                            icon: Icons.delete,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_dialog_destructive.png'),
      );
    });

    testWidgets('form variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 600,
                height: 500,
                child: Stack(
                  children: [
                    Dialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: DSDialog.form(
                        title: 'Contact Form',
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Name',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Message',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.message),
                              ),
                              maxLines: 3,
                            ),
                          ],
                        ),
                        actions: [
                          DialogAction(
                            label: 'Cancel',
                            onPressed: () {},
                          ),
                          DialogAction(
                            label: 'Send',
                            isPrimary: true,
                            icon: Icons.send,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_dialog_form.png'),
      );
    });

    testWidgets('states golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 1000,
                height: 700,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 250,
                          height: 200,
                          child: Dialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: DSDialog.md(
                              title: 'Default State',
                              content: const Text('Normal dialog'),
                              state: DSDialogState.defaultState,
                              actions: [
                                DialogAction(label: 'OK', onPressed: () {}),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          height: 200,
                          child: Dialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: DSDialog.md(
                              title: 'Focus State',
                              content: const Text('Focused dialog'),
                              state: DSDialogState.focus,
                              actions: [
                                DialogAction(label: 'OK', onPressed: () {}),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          height: 200,
                          child: Dialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: DSDialog.md(
                              title: 'Disabled State',
                              content: const Text('Disabled dialog'),
                              state: DSDialogState.disabled,
                              actions: [
                                DialogAction(label: 'OK', onPressed: () {}),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 250,
                          height: 200,
                          child: Dialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: DSDialog.md(
                              title: 'Loading State',
                              content: const Text('Loading dialog'),
                              state: DSDialogState.loading,
                              actions: [
                                DialogAction(label: 'OK', onPressed: () {}),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          height: 200,
                          child: Dialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: DSDialog.md(
                              title: 'Skeleton State',
                              content: const Text('Skeleton dialog'),
                              state: DSDialogState.skeleton,
                              actions: [
                                DialogAction(label: 'OK', onPressed: () {}),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_dialog_states.png'),
      );
    });

    testWidgets('rtl layout golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SizedBox(
                  width: 500,
                  height: 350,
                  child: Stack(
                    children: [
                      Dialog(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        child: DSDialog.md(
                          title: 'نموذج اتصال',
                          content: const Text(
                            'هذا مثال على مربع حوار يدعم اتجاه الكتابة من اليمين إلى اليسار. '
                            'يتم عرض النص والعناصر بشكل صحيح باللغة العربية.',
                          ),
                          actions: [
                            DialogAction(
                              label: 'إلغاء',
                              onPressed: () {},
                            ),
                            DialogAction(
                              label: 'إرسال',
                              isPrimary: true,
                              icon: Icons.send,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_dialog_rtl.png'),
      );
    });

    testWidgets('dark theme golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.grey[900],
            body: Center(
              child: SizedBox(
                width: 500,
                height: 350,
                child: Stack(
                  children: [
                    Dialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: DSDialog.md(
                        title: 'Dark Theme Dialog',
                        content: const Text(
                          'This dialog demonstrates the dark theme appearance. '
                          'All colors and contrasts are optimized for dark mode.',
                        ),
                        actions: [
                          DialogAction(
                            label: 'Settings',
                            icon: Icons.settings,
                            onPressed: () {},
                          ),
                          DialogAction(
                            label: 'Close',
                            isPrimary: true,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_dialog_dark.png'),
      );
    });

    testWidgets('action variations golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 600,
                height: 400,
                child: Stack(
                  children: [
                    Dialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: DSDialog.md(
                        title: 'Action Variations',
                        content: const Text(
                          'This dialog shows different types of action buttons: '
                          'primary, secondary, destructive, with icons, and disabled.',
                        ),
                        actions: [
                          DialogAction(
                            label: 'Help',
                            icon: Icons.help,
                            onPressed: () {},
                          ),
                          DialogAction(
                            label: 'Disabled',
                            isEnabled: false,
                            onPressed: () {},
                          ),
                          DialogAction(
                            label: 'Delete',
                            isDestructive: true,
                            icon: Icons.delete,
                            onPressed: () {},
                          ),
                          DialogAction(
                            label: 'Save',
                            isPrimary: true,
                            icon: Icons.save,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('golden/app_dialog_actions.png'),
      );
    });
  });
}