import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('Main Package Exports', () {
    test('can import AppDrawer from main package', () {
      // Verify that AppDrawer and related classes are exported through main barrel
      expect(AppDrawer, isNotNull);
      expect(DrawerVariant, isNotNull);
      expect(AppDrawerState, isNotNull);
      expect(DrawerSide, isNotNull);
      expect(AppDrawerController, isNotNull);
      expect(AppDrawerHelper, isNotNull);
    });

    test('AppDrawer is accessible through main export', () {
      // Test that we can create drawer instances from main package
      const modalDrawer = AppDrawer.modal(
        content: SizedBox(),
      );

      const permanentDrawer = AppDrawer.permanent(
        content: SizedBox(),
      );

      expect(modalDrawer.variant, equals(DrawerVariant.modal));
      expect(permanentDrawer.variant, equals(DrawerVariant.permanent));
    });
  });
}