import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/dialog/app_dialog.dart';

void main() {
  group('AppDialog', () {
    testWidgets('renders sm variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.sm(
                      title: 'Small Dialog',
                      content: const Text('Small content'),
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);
      expect(find.text('Small Dialog'), findsOneWidget);
      expect(find.text('Small content'), findsOneWidget);
    });

    testWidgets('renders md variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Medium Dialog',
                      content: const Text('Medium content'),
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);
      expect(find.text('Medium Dialog'), findsOneWidget);
      expect(find.text('Medium content'), findsOneWidget);
    });

    testWidgets('renders lg variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.lg(
                      title: 'Large Dialog',
                      content: const Text('Large content'),
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);
      expect(find.text('Large Dialog'), findsOneWidget);
      expect(find.text('Large content'), findsOneWidget);
    });

    testWidgets('renders destructive variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.destructive(
                      title: 'Destructive Dialog',
                      content: const Text('Destructive content'),
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);
      expect(find.text('Destructive Dialog'), findsOneWidget);
      expect(find.text('Destructive content'), findsOneWidget);
    });

    testWidgets('renders form variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.form(
                      title: 'Form Dialog',
                      content: const Text('Form content'),
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);
      expect(find.text('Form Dialog'), findsOneWidget);
      expect(find.text('Form content'), findsOneWidget);
    });

    testWidgets('renders without title when title is null', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      content: const Text('Content only'),
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);
      expect(find.text('Content only'), findsOneWidget);
    });

    testWidgets('renders without content when content is null', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Title only',
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);
      expect(find.text('Title only'), findsOneWidget);
    });

    testWidgets('renders actions correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Dialog with actions',
                      content: const Text('Content'),
                      actions: [
                        DialogAction(
                          label: 'Cancel',
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        DialogAction(
                          label: 'Confirm',
                          isPrimary: true,
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Confirm'), findsOneWidget);
    });

    testWidgets('handles disabled state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Disabled Dialog',
                      content: const Text('Disabled content'),
                      state: AppDialogState.disabled,
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);

      final opacities = tester.widgetList<Opacity>(
        find.descendant(
          of: find.byType(AppDialog),
          matching: find.byType(Opacity),
        ),
      );

      // Find the opacity widget with 0.5 value (disabled state)
      final disabledOpacity = opacities.firstWhere(
        (opacity) => opacity.opacity == 0.5,
        orElse: () => const Opacity(opacity: 0.0, child: SizedBox()),
      );
      expect(disabledOpacity.opacity, equals(0.5));
    });

    testWidgets('handles loading state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Loading Dialog',
                      content: const Text('Loading content'),
                      state: AppDialogState.loading,
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pump();

      expect(find.byType(AppDialog), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('handles skeleton state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Skeleton Dialog',
                      content: const Text('Skeleton content'),
                      state: AppDialogState.skeleton,
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);

      final containers = tester.widgetList<Container>(
        find.descendant(
          of: find.byType(AppDialog),
          matching: find.byType(Container),
        ),
      );

      expect(containers.length, greaterThanOrEqualTo(1));

      // Verify there's a skeleton wrapper container
      bool foundSkeletonContainer = false;
      for (final container in containers) {
        if (container.decoration is BoxDecoration) {
          final decoration = container.decoration as BoxDecoration;
          final theme = Theme.of(tester.element(find.byType(AppDialog)));
          if (decoration.color == theme.colorScheme.surface.withValues(alpha: 0.3)) {
            foundSkeletonContainer = true;
            break;
          }
        }
      }
      expect(foundSkeletonContainer, isTrue);
    });

    testWidgets('responds to action button taps', (tester) async {
      bool actionTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Action Dialog',
                      content: const Text('Content'),
                      actions: [
                        DialogAction(
                          label: 'Test Action',
                          onPressed: () => actionTapped = true,
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Test Action'));
      await tester.pump();

      expect(actionTapped, isTrue);
    });

    testWidgets('handles barrier dismissible correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Dismissible Dialog',
                      content: const Text('Content'),
                      barrierDismissible: true,
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);

      // Tap outside the dialog to dismiss it
      await tester.tapAt(const Offset(50, 50));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsNothing);
    });

    testWidgets('handles non-barrier dismissible correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Non-Dismissible Dialog',
                      content: const Text('Content'),
                      barrierDismissible: false,
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);

      // Tap outside the dialog - should not dismiss
      await tester.tapAt(const Offset(50, 50));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);
    });

    testWidgets('handles escape key when barrier dismissible', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Escape Dialog',
                      content: const Text('Content'),
                      barrierDismissible: true,
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsNothing);
    });

    testWidgets('handles focus state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Focus Dialog',
                      content: const Text('Content'),
                      state: AppDialogState.focus,
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);

      final containers = tester.widgetList<Container>(
        find.descendant(
          of: find.byType(AppDialog),
          matching: find.byType(Container),
        ),
      );

      // Check for focus border
      bool foundFocusBorder = false;
      for (final container in containers) {
        if (container.decoration is BoxDecoration) {
          final decoration = container.decoration as BoxDecoration;
          if (decoration.border != null) {
            foundFocusBorder = true;
            break;
          }
        }
      }
      expect(foundFocusBorder, isTrue);
    });

    testWidgets('displays correct semantics for accessibility', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Accessible Dialog',
                      content: const Text('Accessible content'),
                      accessibilityLabel: 'Custom accessibility label',
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      final semanticsFinders = find.descendant(
        of: find.byType(AppDialog),
        matching: find.byType(Semantics),
      );

      expect(semanticsFinders, findsAtLeastNWidgets(1));

      bool foundAccessibilityLabel = false;
      for (int i = 0; i < semanticsFinders.evaluate().length; i++) {
        try {
          final semantics = tester.getSemantics(semanticsFinders.at(i));
          if (semantics.label.contains('Custom accessibility label')) {
            foundAccessibilityLabel = true;
            break;
          }
        } catch (e) {
          // Skip if semantics data is not available
        }
      }
      expect(foundAccessibilityLabel, isTrue);
    });

    testWidgets('handles RTL layout correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    AppDialog.show(
                      context: context,
                      dialog: AppDialog.md(
                        title: 'RTL Dialog',
                        content: const Text('RTL content'),
                      ),
                    );
                  },
                  child: const Text('Show Dialog'),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);
      expect(find.text('RTL Dialog'), findsOneWidget);
      expect(find.text('RTL content'), findsOneWidget);
    });

    testWidgets('supports all dialog variants', (tester) async {
      for (final variant in DialogVariant.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    Widget dialog;
                    switch (variant) {
                      case DialogVariant.sm:
                        dialog = AppDialog.sm(title: 'Test');
                        break;
                      case DialogVariant.md:
                        dialog = AppDialog.md(title: 'Test');
                        break;
                      case DialogVariant.lg:
                        dialog = AppDialog.lg(title: 'Test');
                        break;
                      case DialogVariant.destructive:
                        dialog = AppDialog.destructive(title: 'Test');
                        break;
                      case DialogVariant.form:
                        dialog = AppDialog.form(title: 'Test');
                        break;
                    }

                    AppDialog.show(context: context, dialog: dialog as AppDialog);
                  },
                  child: const Text('Show Dialog'),
                ),
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Dialog'));
        await tester.pumpAndSettle();

        expect(find.byType(AppDialog), findsOneWidget);

        // Close dialog
        await tester.sendKeyEvent(LogicalKeyboardKey.escape);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('supports all dialog states', (tester) async {
      for (final state in AppDialogState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    AppDialog.show(
                      context: context,
                      dialog: AppDialog.md(
                        title: 'Test Dialog',
                        content: const Text('Test content'),
                        state: state,
                      ),
                    );
                  },
                  child: const Text('Show Dialog'),
                ),
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Dialog'));
        await tester.pump(); // Use pump instead of pumpAndSettle for loading/skeleton states

        expect(find.byType(AppDialog), findsOneWidget);

        // Close dialog
        await tester.sendKeyEvent(LogicalKeyboardKey.escape);
        await tester.pump(); // Use pump instead of pumpAndSettle

        // Wait a bit for dialog to close
        await tester.pump(const Duration(milliseconds: 300));
      }
    });

    testWidgets('handles destructive action styling correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Destructive Action Dialog',
                      content: const Text('Content'),
                      actions: [
                        DialogAction(
                          label: 'Delete',
                          isPrimary: true,
                          isDestructive: true,
                          icon: Icons.delete,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);
      expect(find.text('Delete'), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);
    });

    testWidgets('handles disabled action correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  AppDialog.show(
                    context: context,
                    dialog: AppDialog.md(
                      title: 'Disabled Action Dialog',
                      content: const Text('Content'),
                      actions: [
                        DialogAction(
                          label: 'Disabled Action',
                          isEnabled: false,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Show Dialog'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AppDialog), findsOneWidget);

      final button = tester.widget<TextButton>(
        find.descendant(
          of: find.byType(AppDialog),
          matching: find.byType(TextButton),
        ),
      );

      expect(button.onPressed, isNull);
    });
  });
}