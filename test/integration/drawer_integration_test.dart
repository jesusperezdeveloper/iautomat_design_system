import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/drawer/app_drawer.dart';
import 'package:iautomat_design_system/src/components/drawer/drawer_story.dart';

void main() {
  group('Drawer Integration Tests', () {
    test('can import AppDrawer from components barrel', () {
      // Verify that AppDrawer and related classes are exported properly
      expect(AppDrawer, isNotNull);
      expect(DrawerVariant, isNotNull);
      expect(AppDrawerState, isNotNull);
      expect(DrawerSide, isNotNull);
      expect(AppDrawerController, isNotNull);
      expect(AppDrawerHelper, isNotNull);
    });

    test('AppDrawer enums contain expected values', () {
      // Test DrawerVariant enum
      expect(DrawerVariant.values.length, equals(2));
      expect(DrawerVariant.values, contains(DrawerVariant.modal));
      expect(DrawerVariant.values, contains(DrawerVariant.permanent));

      // Test AppDrawerState enum
      expect(AppDrawerState.values.length, equals(8));
      expect(AppDrawerState.values, contains(AppDrawerState.defaultState));
      expect(AppDrawerState.values, contains(AppDrawerState.hover));
      expect(AppDrawerState.values, contains(AppDrawerState.pressed));
      expect(AppDrawerState.values, contains(AppDrawerState.focus));
      expect(AppDrawerState.values, contains(AppDrawerState.selected));
      expect(AppDrawerState.values, contains(AppDrawerState.disabled));
      expect(AppDrawerState.values, contains(AppDrawerState.loading));
      expect(AppDrawerState.values, contains(AppDrawerState.skeleton));

      // Test DrawerSide enum
      expect(DrawerSide.values.length, equals(2));
      expect(DrawerSide.values, contains(DrawerSide.left));
      expect(DrawerSide.values, contains(DrawerSide.right));
    });

    test('AppDrawer factory constructors work correctly', () {
      const modalDrawer = AppDrawer.modal(
        content: Text('Modal Test'),
      );

      const permanentDrawer = AppDrawer.permanent(
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

    test('AppDrawerController can be instantiated', () {
      final controller = AppDrawerController();
      expect(controller, isNotNull);
      expect(controller.key, isNotNull);
      // Note: isClosed and isOpen require widget binding, tested in widget tests
    });

    test('AppDrawerHelper can create drawers', () {
      final modalDrawer = AppDrawerHelper.createModalDrawer(
        content: const Text('Modal Test'),
      );

      final permanentDrawer = AppDrawerHelper.createPermanentDrawer(
        content: const Text('Permanent Test'),
      );

      expect(modalDrawer, isA<AppDrawer>());
      expect(permanentDrawer, isA<AppDrawer>());
    });

    test('can access DrawerStoryExample from exports', () {
      // Verify that DrawerStoryExample is exported and accessible
      expect(DrawerStoryExample, isNotNull);
    });
  });
}