import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSAccordion', () {
    late List<DSAccordionItem> testItems;

    setUp(() {
      testItems = [
        const DSAccordionItem(
          key: 'item1',
          title: 'Título 1',
          subtitle: 'Subtítulo 1',
          content: Text('Contenido 1'),
        ),
        const DSAccordionItem(
          key: 'item2',
          title: 'Título 2',
          subtitle: 'Subtítulo 2',
          content: Text('Contenido 2'),
        ),
        const DSAccordionItem(
          key: 'item3',
          title: 'Título 3',
          content: Text('Contenido 3'),
        ),
      ];
    });

    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAccordion(
              items: testItems,
            ),
          ),
        ),
      );

      expect(find.text('Título 1'), findsOneWidget);
      expect(find.text('Título 2'), findsOneWidget);
      expect(find.text('Título 3'), findsOneWidget);
      expect(find.text('Subtítulo 1'), findsOneWidget);
      expect(find.text('Subtítulo 2'), findsOneWidget);
    });

    testWidgets('shows expanded content when item is in expandedKeys', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAccordion(
              items: testItems,
              expandedKeys: const {'item1'},
            ),
          ),
        ),
      );

      expect(find.text('Contenido 1'), findsOneWidget);
      expect(find.text('Contenido 2'), findsNothing);
      expect(find.text('Contenido 3'), findsNothing);
    });

    testWidgets('expands item when tapped (single variant)', (tester) async {
      Set<String> expandedKeys = {};

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAccordion(
              items: testItems,
              expandedKeys: expandedKeys,
              onChanged: (keys) => expandedKeys = keys,
              config: const DSAccordionConfig(
                variant: DSAccordionVariant.single,
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Título 1'));
      await tester.pumpAndSettle();

      expect(expandedKeys, contains('item1'));
      expect(expandedKeys.length, equals(1));
    });

    testWidgets('allows multiple expanded items (multiple variant)', (tester) async {
      Set<String> expandedKeys = {};

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAccordion(
              items: testItems,
              expandedKeys: expandedKeys,
              onChanged: (keys) => expandedKeys = keys,
              config: const DSAccordionConfig(
                variant: DSAccordionVariant.multiple,
                allowMultiple: true,
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Título 1'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Título 2'));
      await tester.pumpAndSettle();

      expect(expandedKeys, contains('item1'));
      expect(expandedKeys, contains('item2'));
      expect(expandedKeys.length, equals(2));
    });

    testWidgets('displays loading state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAccordion(
              items: testItems,
              config: const DSAccordionConfig(
                state: DSAccordionState.loading,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays skeleton state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAccordion(
              items: testItems,
              config: const DSAccordionConfig(
                state: DSAccordionState.skeleton,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TweenAnimationBuilder<double>), findsWidgets);
    });

    testWidgets('does not respond to taps when interactive is false', (tester) async {
      Set<String> expandedKeys = {};

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAccordion(
              items: testItems,
              expandedKeys: expandedKeys,
              onChanged: (keys) => expandedKeys = keys,
              interactive: false,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Título 1'));
      await tester.pumpAndSettle();

      expect(expandedKeys, isEmpty);
    });

    testWidgets('shows dividers when showDividers is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAccordion(
              items: testItems,
              config: const DSAccordionConfig(
                showDividers: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Divider), findsNWidgets(2)); // n-1 dividers for n items
    });

    testWidgets('hides dividers when showDividers is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAccordion(
              items: testItems,
              config: const DSAccordionConfig(
                showDividers: false,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Divider), findsNothing);
    });

    testWidgets('displays material icons when useMaterialIcons is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAccordion(
              items: testItems,
              config: const DSAccordionConfig(
                useMaterialIcons: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.expand_more), findsNWidgets(testItems.length));
    });

    testWidgets('displays keyboard arrow icons when useMaterialIcons is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAccordion(
              items: testItems,
              config: const DSAccordionConfig(
                useMaterialIcons: false,
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.keyboard_arrow_down), findsNWidgets(testItems.length));
    });

    testWidgets('calls onStateChanged when state changes', (tester) async {
      DSAccordionState? capturedState;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAccordion(
              items: testItems,
              onStateChanged: (state) => capturedState = state,
            ),
          ),
        ),
      );

      await tester.longPress(find.text('Título 1'));
      await tester.pumpAndSettle();

      expect(capturedState, equals(DSAccordionState.pressed));
    });

    testWidgets('supports semantic labels correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSAccordion(
              items: testItems,
              config: const DSAccordionConfig(
                accessibility: DSAccordionAccessibilityConfig(
                  enabled: true,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.bySemanticsLabel('Componente acordeón simple'), findsOneWidget);
    });

    group('DSAccordionConfig', () {
      test('has correct default values', () {
        const config = DSAccordionConfig();

        expect(config.variant, equals(DSAccordionVariant.single));
        expect(config.state, equals(DSAccordionState.defaultState));
        expect(config.allowMultiple, equals(false));
        expect(config.showDividers, equals(true));
        expect(config.useMaterialIcons, equals(true));
      });

      test('copyWith works correctly', () {
        const original = DSAccordionConfig(
          variant: DSAccordionVariant.single,
          allowMultiple: false,
        );

        final updated = original.copyWith(
          variant: DSAccordionVariant.multiple,
          allowMultiple: true,
        );

        expect(updated.variant, equals(DSAccordionVariant.multiple));
        expect(updated.allowMultiple, equals(true));
        expect(updated.showDividers, equals(original.showDividers));
      });
    });

    group('DSAccordionItem', () {
      test('has correct required properties', () {
        const item = DSAccordionItem(
          key: 'test',
          title: 'Test Title',
          content: Text('Test Content'),
        );

        expect(item.title, equals('Test Title'));
        expect(item.content, isA<Text>());
      });

      test('supports optional properties', () {
        const item = DSAccordionItem(
          key: 'test_key',
          title: 'Test Title',
          subtitle: 'Test Subtitle',
          content: Text('Test Content'),
        );

        expect(item.key, equals('test_key'));
        expect(item.subtitle, equals('Test Subtitle'));
      });
    });
  });
}