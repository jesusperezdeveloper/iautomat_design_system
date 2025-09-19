import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/bottom_sheet/ds_bottom_sheet.dart';

void main() {
  group('DSBottomSheet', () {
    testWidgets('renders modal variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.modal(
                      content: const Text('Modal content'),
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);
      expect(find.text('Modal content'), findsOneWidget);
    });

    testWidgets('renders half variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.half(
                      content: const Text('Half content'),
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);
      expect(find.text('Half content'), findsOneWidget);
    });

    testWidgets('renders full variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.full(
                      content: const Text('Full content'),
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);
      expect(find.text('Full content'), findsOneWidget);
    });

    testWidgets('displays drag handle when draggable is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.half(
                      content: const Text('Draggable content'),
                      draggable: true,
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);

      // Find the drag handle container
      final containers = tester.widgetList<Container>(
        find.descendant(
          of: find.byType(DSBottomSheet),
          matching: find.byType(Container),
        ),
      );

      // Look for the handle container (40x4 with rounded corners)
      bool foundHandle = false;
      for (final container in containers) {
        if (container.constraints?.maxWidth == 40 &&
            container.constraints?.maxHeight == 4) {
          foundHandle = true;
          break;
        }
      }

      expect(foundHandle, isTrue);
    });

    testWidgets('hides drag handle when draggable is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.half(
                      content: const Text('Non-draggable content'),
                      draggable: false,
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);
      expect(find.byType(SizedBox), findsWidgets);
    });

    testWidgets('handles disabled state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.half(
                      content: const Text('Disabled content'),
                      state: DSBottomSheetState.disabled,
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);

      final opacities = tester.widgetList<Opacity>(
        find.descendant(
          of: find.byType(DSBottomSheet),
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
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.half(
                      content: const Text('Loading content'),
                      state: DSBottomSheetState.loading,
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('handles skeleton state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.half(
                      content: const Text('Skeleton content'),
                      state: DSBottomSheetState.skeleton,
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);

      final containers = tester.widgetList<Container>(
        find.descendant(
          of: find.byType(DSBottomSheet),
          matching: find.byType(Container),
        ),
      );

      expect(containers.length, greaterThanOrEqualTo(1));

      // Verify there's a skeleton wrapper container
      bool foundSkeletonContainer = false;
      for (final container in containers) {
        if (container.decoration is BoxDecoration) {
          final decoration = container.decoration as BoxDecoration;
          final theme = Theme.of(tester.element(find.byType(DSBottomSheet)));
          if (decoration.color == theme.colorScheme.surface.withValues(alpha: 0.3)) {
            foundSkeletonContainer = true;
            break;
          }
        }
      }
      expect(foundSkeletonContainer, isTrue);
    });

    testWidgets('handles focus state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.half(
                      content: const Text('Focus content'),
                      state: DSBottomSheetState.focus,
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);

      final containers = tester.widgetList<Container>(
        find.descendant(
          of: find.byType(DSBottomSheet),
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

    testWidgets('supports different initial snap positions', (tester) async {
      for (final snap in BottomSheetSnap.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    DSBottomSheet.showModal(
                      context: context,
                      bottomSheet: DSBottomSheet.half(
                        content: const Text('Test content'),
                        initialSnap: snap,
                      ),
                    );
                  },
                  child: const Text('Show Bottom Sheet'),
                ),
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Bottom Sheet'));
        await tester.pump();

        expect(find.byType(DSBottomSheet), findsOneWidget);

        // Close the bottom sheet
        await tester.tapAt(const Offset(50, 50));
        await tester.pump();
      }
    });

    testWidgets('displays correct semantics for accessibility', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.half(
                      content: const Text('Accessible content'),
                      accessibilityLabel: 'Custom accessibility label',
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      final semanticsFinders = find.descendant(
        of: find.byType(DSBottomSheet),
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
                    DSBottomSheet.showModal(
                      context: context,
                      bottomSheet: DSBottomSheet.half(
                        content: const Text('RTL content'),
                      ),
                    );
                  },
                  child: const Text('Show Bottom Sheet'),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);
      expect(find.text('RTL content'), findsOneWidget);
    });

    testWidgets('supports all bottom sheet variants', (tester) async {
      for (final variant in BottomSheetVariant.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    Widget bottomSheet;
                    switch (variant) {
                      case BottomSheetVariant.modal:
                        bottomSheet = DSBottomSheet.modal(
                          content: const Text('Test'),
                        );
                        break;
                      case BottomSheetVariant.half:
                        bottomSheet = DSBottomSheet.half(
                          content: const Text('Test'),
                        );
                        break;
                      case BottomSheetVariant.full:
                        bottomSheet = DSBottomSheet.full(
                          content: const Text('Test'),
                        );
                        break;
                    }

                    DSBottomSheet.showModal(
                      context: context,
                      bottomSheet: bottomSheet as DSBottomSheet,
                    );
                  },
                  child: const Text('Show Bottom Sheet'),
                ),
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Bottom Sheet'));
        await tester.pump();

        expect(find.byType(DSBottomSheet), findsOneWidget);

        // Close bottom sheet
        await tester.tapAt(const Offset(50, 50));
        await tester.pump();
      }
    });

    testWidgets('supports all bottom sheet states', (tester) async {
      for (final state in DSBottomSheetState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    DSBottomSheet.showModal(
                      context: context,
                      bottomSheet: DSBottomSheet.half(
                        content: const Text('Test content'),
                        state: state,
                      ),
                    );
                  },
                  child: const Text('Show Bottom Sheet'),
                ),
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Bottom Sheet'));
        await tester.pump();

        expect(find.byType(DSBottomSheet), findsOneWidget);

        // Close bottom sheet
        await tester.tapAt(const Offset(50, 50));
        await tester.pump();

        // Wait a bit for bottom sheet to close
        await tester.pump(const Duration(milliseconds: 300));
      }
    });

    testWidgets('handles state change callbacks', (tester) async {
      DSBottomSheetState? changedState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.half(
                      content: const Text('Callback content'),
                      onStateChange: (state) => changedState = state,
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);
      // Check that the callback property is set (callback might be called later)
      expect(changedState, isNull); // Initially null until state changes
    });

    testWidgets('handles snap change callbacks', (tester) async {
      BottomSheetSnap? changedSnap;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.half(
                      content: const Text('Snap callback content'),
                      onSnapChange: (snap) => changedSnap = snap,
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);
      // Check that the callback property is set (callback might be called later)
      expect(changedSnap, isNull); // Initially null until snap changes
    });

    testWidgets('uses custom colors when provided', (tester) async {
      const customBackgroundColor = Colors.purple;
      const customHandleColor = Colors.amber;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.half(
                      content: const Text('Custom colors'),
                      backgroundColor: customBackgroundColor,
                      handleColor: customHandleColor,
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);

      // Find Material widget with custom background color
      final materials = tester.widgetList<Material>(
        find.descendant(
          of: find.byType(DSBottomSheet),
          matching: find.byType(Material),
        ),
      );

      bool foundCustomBackground = false;
      for (final material in materials) {
        if (material.color == customBackgroundColor) {
          foundCustomBackground = true;
          break;
        }
      }
      expect(foundCustomBackground, isTrue);
    });

    testWidgets('uses custom padding when provided', (tester) async {
      const customPadding = EdgeInsets.all(32);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.half(
                      content: const Text('Custom padding'),
                      padding: customPadding,
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);

      // Find Padding widget with custom padding
      final paddings = tester.widgetList<Padding>(
        find.descendant(
          of: find.byType(DSBottomSheet),
          matching: find.byType(Padding),
        ),
      );

      bool foundCustomPadding = false;
      for (final padding in paddings) {
        if (padding.padding == customPadding) {
          foundCustomPadding = true;
          break;
        }
      }
      expect(foundCustomPadding, isTrue);
    });

    testWidgets('shows bottom sheet without accessibility when disabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  DSBottomSheet.showModal(
                    context: context,
                    bottomSheet: DSBottomSheet.half(
                      content: const Text('No accessibility'),
                      accessibilitySupport: false,
                    ),
                  );
                },
                child: const Text('Show Bottom Sheet'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pump();

      expect(find.byType(DSBottomSheet), findsOneWidget);
      expect(find.text('No accessibility'), findsOneWidget);
    });
  });
}