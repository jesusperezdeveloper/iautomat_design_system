import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/menu/ds_menu.dart';
import 'package:iautomat_design_system/src/components/menu/menu_story.dart';

void main() {
  group('Menu Integration Tests', () {
    test('can import DSMenu from components barrel', () {
      // Verify that DSMenu and related classes are exported properly
      expect(DSMenu, isNotNull);
      expect(DSMenuItem, isNotNull);
      expect(MenuVariant, isNotNull);
      expect(DSMenuState, isNotNull);
      expect(MenuAlignment, isNotNull);
    });

    test('DSMenu enums contain expected values', () {
      // Test MenuVariant enum
      expect(MenuVariant.values.length, equals(3));
      expect(MenuVariant.values, contains(MenuVariant.context));
      expect(MenuVariant.values, contains(MenuVariant.submenu));
      expect(MenuVariant.values, contains(MenuVariant.typeahead));

      // Test DSMenuState enum
      expect(DSMenuState.values.length, equals(8));
      expect(DSMenuState.values, contains(DSMenuState.defaultState));
      expect(DSMenuState.values, contains(DSMenuState.hover));
      expect(DSMenuState.values, contains(DSMenuState.pressed));
      expect(DSMenuState.values, contains(DSMenuState.focus));
      expect(DSMenuState.values, contains(DSMenuState.selected));
      expect(DSMenuState.values, contains(DSMenuState.disabled));
      expect(DSMenuState.values, contains(DSMenuState.loading));
      expect(DSMenuState.values, contains(DSMenuState.skeleton));

      // Test MenuAlignment enum
      expect(MenuAlignment.values.length, equals(5));
      expect(MenuAlignment.values, contains(MenuAlignment.topLeft));
      expect(MenuAlignment.values, contains(MenuAlignment.topRight));
      expect(MenuAlignment.values, contains(MenuAlignment.bottomLeft));
      expect(MenuAlignment.values, contains(MenuAlignment.bottomRight));
      expect(MenuAlignment.values, contains(MenuAlignment.center));
    });

    test('DSMenuItem can be instantiated with required properties', () {
      const item = DSMenuItem(
        id: 'test-item',
        label: 'Test Item',
      );

      expect(item.id, equals('test-item'));
      expect(item.label, equals('Test Item'));
      expect(item.enabled, isTrue);
      expect(item.selected, isFalse);
      expect(item.destructive, isFalse);
      expect(item.hasChildren, isFalse);
      expect(item.children, isEmpty);
    });

    test('DSMenuItem with children has correct hasChildren value', () {
      const item = DSMenuItem(
        id: 'parent',
        label: 'Parent Item',
        children: [
          DSMenuItem(id: 'child1', label: 'Child 1'),
          DSMenuItem(id: 'child2', label: 'Child 2'),
        ],
      );

      expect(item.hasChildren, isTrue);
      expect(item.children.length, equals(2));
      expect(item.children[0].label, equals('Child 1'));
      expect(item.children[1].label, equals('Child 2'));
    });

    test('can access MenuStoryExample from exports', () {
      // Verify that MenuStoryExample is exported and accessible
      expect(MenuStoryExample, isNotNull);
    });
  });
}