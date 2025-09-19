import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/empty_state/ds_empty_state.dart';

void main() {
  group('DSEmptyState', () {
    testWidgets('renders basic empty state with title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Test Empty State',
            ),
          ),
        ),
      );

      expect(find.text('Test Empty State'), findsOneWidget);
      expect(find.byIcon(Icons.inbox_outlined), findsOneWidget);
    });

    testWidgets('renders empty state with description', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'No Items',
              description: 'There are no items to display.',
            ),
          ),
        ),
      );

      expect(find.text('No Items'), findsOneWidget);
      expect(find.text('There are no items to display.'), findsOneWidget);
    });

    testWidgets('renders empty state with actions', (tester) async {
      bool primaryActionCalled = false;
      bool secondaryActionCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Empty State',
              actions: [
                EmptyStateAction(
                  text: 'Primary Action',
                  isPrimary: true,
                  onPressed: () => primaryActionCalled = true,
                ),
                EmptyStateAction(
                  text: 'Secondary Action',
                  onPressed: () => secondaryActionCalled = true,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Primary Action'), findsOneWidget);
      expect(find.text('Secondary Action'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);

      // Test primary action
      await tester.tap(find.text('Primary Action'));
      await tester.pump();
      expect(primaryActionCalled, isTrue);

      // Test secondary action
      await tester.tap(find.text('Secondary Action'));
      await tester.pump();
      expect(secondaryActionCalled, isTrue);
    });

    testWidgets('creates correct factory constructors', (tester) async {
      // Test illustration factory
      final illustrationEmpty = DSEmptyState.illustration(
        title: 'Illustration Test',
        description: 'Test description',
      );
      expect(illustrationEmpty.variant, EmptyStateVariant.illustration);
      expect(illustrationEmpty.title, 'Illustration Test');
      expect(illustrationEmpty.defaultIcon, Icons.inbox_outlined);

      // Test CTA factory
      final ctaEmpty = DSEmptyState.cta(
        title: 'CTA Test',
        actions: const [
          EmptyStateAction(text: 'Action', isPrimary: true),
        ],
      );
      expect(ctaEmpty.variant, EmptyStateVariant.cta);
      expect(ctaEmpty.title, 'CTA Test');
      expect(ctaEmpty.defaultIcon, Icons.add_circle_outline);
    });

    testWidgets('applies different states correctly', (tester) async {
      for (final state in DSEmptyStateState.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSEmptyState(
                title: 'State Test',
                state: state,
              ),
            ),
          ),
        );

        // Verificar que el widget se renderiza sin errores
        expect(find.byType(DSEmptyState), findsOneWidget);
        expect(find.text('State Test'), findsOneWidget);
        await tester.pump();
      }
    });

    testWidgets('handles custom styling properties', (tester) async {
      const customTitleColor = Colors.red;
      const customDescColor = Colors.blue;
      const customBgColor = Colors.green;
      const customSpacing = 24.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Custom Styled',
              description: 'Custom description',
              titleColor: customTitleColor,
              descriptionColor: customDescColor,
              backgroundColor: customBgColor,
              spacing: customSpacing,
            ),
          ),
        ),
      );

      final emptyState =
          tester.widget<DSEmptyState>(find.byType(DSEmptyState));
      expect(emptyState.titleColor, customTitleColor);
      expect(emptyState.descriptionColor, customDescColor);
      expect(emptyState.backgroundColor, customBgColor);
      expect(emptyState.spacing, customSpacing);
    });

    testWidgets('copyWith creates correct copy', (tester) async {
      const original = DSEmptyState(
        title: 'Original Title',
        description: 'Original description',
        variant: EmptyStateVariant.illustration,
      );

      final copy = original.copyWith(
        title: 'Updated Title',
        variant: EmptyStateVariant.cta,
      );

      expect(copy.title, 'Updated Title');
      expect(copy.variant, EmptyStateVariant.cta);
      expect(copy.description, original.description); // Should remain the same
    });

    testWidgets('supports RTL layout', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: DSEmptyState(
                title: 'RTL Empty State',
                description: 'RTL description',
                rtlSupport: true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('RTL Empty State'), findsOneWidget);
      expect(find.text('RTL description'), findsOneWidget);

      final emptyState =
          tester.widget<DSEmptyState>(find.byType(DSEmptyState));
      expect(emptyState.rtlSupport, isTrue);
    });

    testWidgets('has proper accessibility semantics', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Accessible Empty State',
              description: 'Accessible description',
              accessibilityLabel: 'Custom accessibility label',
              accessibilityHint: 'Custom hint',
              accessibilitySupport: true,
            ),
          ),
        ),
      );

      expect(find.text('Accessible Empty State'), findsOneWidget);

      final emptyState =
          tester.widget<DSEmptyState>(find.byType(DSEmptyState));
      expect(emptyState.accessibilitySupport, isTrue);
      expect(emptyState.accessibilityLabel, 'Custom accessibility label');
      expect(emptyState.accessibilityHint, 'Custom hint');
    });

    testWidgets('handles tap interaction', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Tappable Empty State',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSEmptyState));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('handles hover interaction on desktop', (tester) async {
      bool hovered = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Hoverable Empty State',
              onHover: () => hovered = true,
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);
      await gesture.moveTo(tester.getCenter(find.byType(DSEmptyState)));
      await tester.pump();

      expect(hovered, isTrue);
    });

    testWidgets('handles keyboard navigation', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Keyboard Navigation',
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      // Focus the widget
      await tester.tap(find.byType(DSEmptyState));
      await tester.pump();

      // Press Enter key
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('respects custom icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Custom Icon',
              defaultIcon: Icons.star,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.inbox_outlined), findsNothing);
    });

    testWidgets('respects custom illustration', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Custom Illustration',
              illustration: Icon(Icons.palette, size: 100),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.palette), findsOneWidget);
      expect(find.byIcon(Icons.inbox_outlined), findsNothing);
    });

    testWidgets('handles loading state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Loading State',
              state: DSEmptyStateState.loading,
            ),
          ),
        ),
      );

      // Should show loading indicator
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('handles skeleton state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Skeleton State',
              state: DSEmptyStateState.skeleton,
            ),
          ),
        ),
      );

      // Should render with skeleton styling
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('handles disabled state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Disabled State',
              state: DSEmptyStateState.disabled,
            ),
          ),
        ),
      );

      // Should be rendered but disabled
      expect(find.text('Disabled State'), findsOneWidget);
    });

    testWidgets('handles focus state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Focus State',
              state: DSEmptyStateState.focus,
              onTap: () {},
            ),
          ),
        ),
      );

      // Should render focus border
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('handles pressed state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Pressed State',
              state: DSEmptyStateState.pressed,
            ),
          ),
        ),
      );

      // Should apply pressed transform
      expect(find.byType(Transform), findsWidgets);
    });

    testWidgets('handles hover state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Hover State',
              state: DSEmptyStateState.hover,
            ),
          ),
        ),
      );

      // Should apply hover transform
      expect(find.byType(Transform), findsWidgets);
    });

    testWidgets('handles selected state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Selected State',
              state: DSEmptyStateState.selected,
            ),
          ),
        ),
      );

      // Should render selection background
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('supports different alignments', (tester) async {
      for (final alignment in [
        CrossAxisAlignment.start,
        CrossAxisAlignment.center,
        CrossAxisAlignment.end,
      ]) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSEmptyState(
                title: 'Alignment Test',
                alignment: alignment,
              ),
            ),
          ),
        );

        final emptyState =
            tester.widget<DSEmptyState>(find.byType(DSEmptyState));
        expect(emptyState.alignment, alignment);
        await tester.pump();
      }
    });

    testWidgets('supports custom max width', (tester) async {
      const customMaxWidth = 300.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Max Width Test',
              maxWidth: customMaxWidth,
            ),
          ),
        ),
      );

      final emptyState =
          tester.widget<DSEmptyState>(find.byType(DSEmptyState));
      expect(emptyState.maxWidth, customMaxWidth);
    });

    testWidgets('supports custom animation duration', (tester) async {
      const customDuration = Duration(milliseconds: 500);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Animation Test',
              animationDuration: customDuration,
            ),
          ),
        ),
      );

      final emptyState =
          tester.widget<DSEmptyState>(find.byType(DSEmptyState));
      expect(emptyState.animationDuration, customDuration);
    });

    testWidgets('supports padding', (tester) async {
      const customPadding = EdgeInsets.all(24.0);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Padding Test',
              padding: customPadding,
            ),
          ),
        ),
      );

      final emptyState =
          tester.widget<DSEmptyState>(find.byType(DSEmptyState));
      expect(emptyState.padding, customPadding);
      expect(find.byType(Padding), findsWidgets);
    });

    testWidgets('handles actions with icons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Actions with Icons',
              actions: const [
                EmptyStateAction(
                  text: 'Primary with Icon',
                  isPrimary: true,
                  icon: Icons.add,
                ),
                EmptyStateAction(
                  text: 'Secondary with Icon',
                  icon: Icons.help,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.help), findsOneWidget);
      expect(find.text('Primary with Icon'), findsOneWidget);
      expect(find.text('Secondary with Icon'), findsOneWidget);
    });

    testWidgets('handles disabled actions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSEmptyState(
              title: 'Disabled Actions',
              actions: const [
                EmptyStateAction(
                  text: 'Disabled Action',
                  isPrimary: true,
                  isEnabled: false,
                ),
              ],
            ),
          ),
        ),
      );

      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, isNull);
    });
  });

  group('EmptyStateVariant', () {
    test('has correct values', () {
      expect(EmptyStateVariant.values.length, 2);
      expect(
          EmptyStateVariant.values, contains(EmptyStateVariant.illustration));
      expect(EmptyStateVariant.values, contains(EmptyStateVariant.cta));
    });
  });

  group('DSEmptyStateState', () {
    test('has correct values', () {
      expect(DSEmptyStateState.values.length, 8);
      expect(
          DSEmptyStateState.values, contains(DSEmptyStateState.defaultState));
      expect(DSEmptyStateState.values, contains(DSEmptyStateState.hover));
      expect(DSEmptyStateState.values, contains(DSEmptyStateState.pressed));
      expect(DSEmptyStateState.values, contains(DSEmptyStateState.focus));
      expect(DSEmptyStateState.values, contains(DSEmptyStateState.selected));
      expect(DSEmptyStateState.values, contains(DSEmptyStateState.disabled));
      expect(DSEmptyStateState.values, contains(DSEmptyStateState.loading));
      expect(DSEmptyStateState.values, contains(DSEmptyStateState.skeleton));
    });

    test('canInteract extension works correctly', () {
      expect(DSEmptyStateState.defaultState.canInteract, isTrue);
      expect(DSEmptyStateState.hover.canInteract, isTrue);
      expect(DSEmptyStateState.pressed.canInteract, isTrue);
      expect(DSEmptyStateState.focus.canInteract, isTrue);
      expect(DSEmptyStateState.selected.canInteract, isTrue);
      expect(DSEmptyStateState.disabled.canInteract, isFalse);
      expect(DSEmptyStateState.loading.canInteract, isFalse);
      expect(DSEmptyStateState.skeleton.canInteract, isTrue);
    });
  });

  group('EmptyStateAction', () {
    test('creates action correctly', () {
      const action = EmptyStateAction(
        text: 'Test Action',
        isPrimary: true,
        icon: Icons.add,
        isEnabled: false,
      );

      expect(action.text, 'Test Action');
      expect(action.isPrimary, isTrue);
      expect(action.icon, Icons.add);
      expect(action.isEnabled, isFalse);
    });
  });
}
