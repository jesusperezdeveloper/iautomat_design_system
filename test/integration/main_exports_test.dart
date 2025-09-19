import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('Main Package Exports', () {
    test('can import DSDrawer from main package', () {
      // Verify that DSDrawer and related classes are exported through main barrel
      expect(DSDrawer, isNotNull);
      expect(DrawerVariant, isNotNull);
      expect(DSDrawerState, isNotNull);
      expect(DrawerSide, isNotNull);
      expect(DSDrawerController, isNotNull);
      expect(DSDrawerHelper, isNotNull);
    });

    test('DSDrawer is accessible through main export', () {
      // Test that we can create drawer instances from main package
      const modalDrawer = DSDrawer.modal(
        content: SizedBox(),
      );

      const permanentDrawer = DSDrawer.permanent(
        content: SizedBox(),
      );

      expect(modalDrawer.variant, equals(DrawerVariant.modal));
      expect(permanentDrawer.variant, equals(DrawerVariant.permanent));
    });
  });
}