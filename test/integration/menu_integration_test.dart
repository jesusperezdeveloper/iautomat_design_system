import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/menu/app_menu.dart';
import 'package:iautomat_design_system/src/components/menu/menu_story.dart';

void main() {
  group('Menu Integration Tests', () {
    test('can import AppMenu from components barrel', () {
      // Verify that AppMenu and related classes are exported properly
      expect(AppMenu, isNotNull);
      expect(AppMenuItem, isNotNull);
      expect(MenuVariant, isNotNull);
      expect(AppMenuState, isNotNull);
      expect(MenuAlignment, isNotNull);
    });

    test('AppMenu enums contain expected values', () {
      // Test MenuVariant enum
      expect(MenuVariant.values.length, equals(3));
      expect(MenuVariant.values, contains(MenuVariant.context));
      expect(MenuVariant.values, contains(MenuVariant.submenu));
      expect(MenuVariant.values, contains(MenuVariant.typeahead));

      // Test AppMenuState enum
      expect(AppMenuState.values.length, equals(8));
      expect(AppMenuState.values, contains(AppMenuState.defaultState));
      expect(AppMenuState.values, contains(AppMenuState.hover));
      expect(AppMenuState.values, contains(AppMenuState.pressed));
      expect(AppMenuState.values, contains(AppMenuState.focus));
      expect(AppMenuState.values, contains(AppMenuState.selected));
      expect(AppMenuState.values, contains(AppMenuState.disabled));
      expect(AppMenuState.values, contains(AppMenuState.loading));
      expect(AppMenuState.values, contains(AppMenuState.skeleton));

      // Test MenuAlignment enum
      expect(MenuAlignment.values.length, equals(5));
      expect(MenuAlignment.values, contains(MenuAlignment.topLeft));
      expect(MenuAlignment.values, contains(MenuAlignment.topRight));
      expect(MenuAlignment.values, contains(MenuAlignment.bottomLeft));
      expect(MenuAlignment.values, contains(MenuAlignment.bottomRight));
      expect(MenuAlignment.values, contains(MenuAlignment.center));
    });

    test('AppMenuItem can be instantiated with required properties', () {
      const item = AppMenuItem(
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

    test('AppMenuItem with children has correct hasChildren value', () {
      const item = AppMenuItem(
        id: 'parent',
        label: 'Parent Item',
        children: [
          AppMenuItem(id: 'child1', label: 'Child 1'),
          AppMenuItem(id: 'child2', label: 'Child 2'),
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