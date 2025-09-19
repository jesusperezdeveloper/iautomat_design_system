import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/drawer/app_drawer.dart';
import 'package:iautomat_design_system/src/components/drawer/drawer_story.dart';

void main() {
  group('Drawer Integration Tests', () {
    test('can import DSDrawer from components barrel', () {
      // Verify that DSDrawer and related classes are exported properly
      expect(DSDrawer, isNotNull);
      expect(DrawerVariant, isNotNull);
      expect(DSDrawerState, isNotNull);
      expect(DrawerSide, isNotNull);
      expect(DSDrawerController, isNotNull);
      expect(DSDrawerHelper, isNotNull);
    });

    test('DSDrawer enums contain expected values', () {
      // Test DrawerVariant enum
      expect(DrawerVariant.values.length, equals(2));
      expect(DrawerVariant.values, contains(DrawerVariant.modal));
      expect(DrawerVariant.values, contains(DrawerVariant.permanent));

      // Test DSDrawerState enum
      expect(DSDrawerState.values.length, equals(8));
      expect(DSDrawerState.values, contains(DSDrawerState.defaultState));
      expect(DSDrawerState.values, contains(DSDrawerState.hover));
      expect(DSDrawerState.values, contains(DSDrawerState.pressed));
      expect(DSDrawerState.values, contains(DSDrawerState.focus));
      expect(DSDrawerState.values, contains(DSDrawerState.selected));
      expect(DSDrawerState.values, contains(DSDrawerState.disabled));
      expect(DSDrawerState.values, contains(DSDrawerState.loading));
      expect(DSDrawerState.values, contains(DSDrawerState.skeleton));

      // Test DrawerSide enum
      expect(DrawerSide.values.length, equals(2));
      expect(DrawerSide.values, contains(DrawerSide.left));
      expect(DrawerSide.values, contains(DrawerSide.right));
    });

    test('DSDrawer factory constructors work correctly', () {
      const modalDrawer = DSDrawer.modal(
        content: Text('Modal Test'),
      );

      const permanentDrawer = DSDrawer.permanent(
        content: Text('Permanent Test'),
      );

      expect(modalDrawer.variant, equals(DrawerVariant.modal));
      expect(modalDrawer.side, equals(DrawerSide.left));
      expect(modalDrawer.width, equals(280.0));
      expect(modalDrawer.elevation, equals(16.0));
      expect(modalDrawer.enableDragGesture, isTrue);

      expect(permanentDrawer.variant, equals(DrawerVariant.permanent));
      expect(permanentDrawer.side, equals(DrawerSide.left));
      expect(permanentDrawer.width, equals(280.0));
      expect(permanentDrawer.elevation, equals(0.0));
      expect(permanentDrawer.enableDragGesture, isFalse);
    });

    test('DSDrawerController can be instantiated', () {
      final controller = DSDrawerController();
      expect(controller, isNotNull);
      expect(controller.key, isNotNull);
      // Note: isClosed and isOpen require widget binding, tested in widget tests
    });

    test('DSDrawerHelper can create drawers', () {
      final modalDrawer = DSDrawerHelper.createModalDrawer(
        content: const Text('Modal Test'),
      );

      final permanentDrawer = DSDrawerHelper.createPermanentDrawer(
        content: const Text('Permanent Test'),
      );

      expect(modalDrawer, isA<DSDrawer>());
      expect(permanentDrawer, isA<DSDrawer>());
    });

    test('can access DrawerStoryExample from exports', () {
      // Verify that DrawerStoryExample is exported and accessible
      expect(DrawerStoryExample, isNotNull);
    });
  });
}