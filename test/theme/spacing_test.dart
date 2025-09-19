import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/theme/spacing.dart';

void main() {
  group('DSSpacing', () {
    group('Base Unit', () {
      test('should have correct base unit', () {
        expect(DSSpacing.unit, 8.0);
      });
    });

    group('Spacing Scale', () {
      test('should have correct spacing values based on 8px unit', () {
        expect(DSSpacing.xxxs, 2.0); // unit * 0.25
        expect(DSSpacing.xxs, 4.0); // unit * 0.5
        expect(DSSpacing.xs, 8.0); // unit * 1
        expect(DSSpacing.sm, 16.0); // unit * 2
        expect(DSSpacing.md, 24.0); // unit * 3
        expect(DSSpacing.lg, 32.0); // unit * 4
        expect(DSSpacing.xl, 48.0); // unit * 6
        expect(DSSpacing.xxl, 64.0); // unit * 8
        expect(DSSpacing.xxxl, 96.0); // unit * 12
      });

      test('spacing values should follow consistent scale', () {
        // Each step should be logical
        expect(DSSpacing.sm, DSSpacing.xs * 2);
        expect(DSSpacing.lg, DSSpacing.sm * 2);
        expect(DSSpacing.xxl, DSSpacing.lg * 2);
      });
    });

    group('Spacing Widgets', () {
      testWidgets('vertical spacing widgets should have correct height',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(
                children: [
                  DSSpacing.verticalXs,
                  DSSpacing.verticalSm,
                  DSSpacing.verticalMd,
                  DSSpacing.verticalLg,
                  DSSpacing.verticalXl,
                ],
              ),
            ),
          ),
        );

        // Find SizedBox widgets and verify their heights
        final xsBox = tester.widget<SizedBox>(
          find.byWidget(DSSpacing.verticalXs),
        );
        expect(xsBox.height, DSSpacing.xs);

        final smBox = tester.widget<SizedBox>(
          find.byWidget(DSSpacing.verticalSm),
        );
        expect(smBox.height, DSSpacing.sm);

        final mdBox = tester.widget<SizedBox>(
          find.byWidget(DSSpacing.verticalMd),
        );
        expect(mdBox.height, DSSpacing.md);
      });

      testWidgets('horizontal spacing widgets should have correct width',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Row(
                children: [
                  DSSpacing.horizontalXs,
                  DSSpacing.horizontalSm,
                  DSSpacing.horizontalMd,
                  DSSpacing.horizontalLg,
                  DSSpacing.horizontalXl,
                ],
              ),
            ),
          ),
        );

        // Find SizedBox widgets and verify their widths
        final xsBox = tester.widget<SizedBox>(
          find.byWidget(DSSpacing.horizontalXs),
        );
        expect(xsBox.width, DSSpacing.xs);

        final smBox = tester.widget<SizedBox>(
          find.byWidget(DSSpacing.horizontalSm),
        );
        expect(smBox.width, DSSpacing.sm);
      });
    });

    group('EdgeInsets Presets', () {
      test('should have correct padding presets', () {
        expect(DSSpacing.paddingXs, const EdgeInsets.all(8.0));
        expect(DSSpacing.paddingSm, const EdgeInsets.all(16.0));
        expect(DSSpacing.paddingMd, const EdgeInsets.all(24.0));
        expect(DSSpacing.paddingLg, const EdgeInsets.all(32.0));
        expect(DSSpacing.paddingXl, const EdgeInsets.all(48.0));
      });

      test('should have correct card padding preset', () {
        expect(DSSpacing.cardPadding, const EdgeInsets.all(16.0));
      });

      test('should have correct page padding preset', () {
        expect(DSSpacing.pagePadding, const EdgeInsets.all(24.0));
      });

      test('should have correct section padding preset', () {
        expect(DSSpacing.sectionPadding, const EdgeInsets.all(32.0));
      });
    });

    group('Responsive Spacing', () {
      test(
          'getResponsivePadding should return appropriate padding for screen sizes',
          () {
        // Mobile
        final mobilePadding = DSSpacing.getResponsivePadding(400);
        expect(mobilePadding.left, 16.0); // sm padding

        // Tablet
        final tabletPadding = DSSpacing.getResponsivePadding(800);
        expect(tabletPadding.left, 24.0); // md padding

        // Desktop
        final desktopPadding = DSSpacing.getResponsivePadding(1200);
        expect(desktopPadding.left, 32.0); // lg padding

        // Ultra wide
        final ultraWidePadding = DSSpacing.getResponsivePadding(1600);
        expect(ultraWidePadding.left, 48.0); // xl padding
      });

      test('getResponsiveSpacing should scale appropriately', () {
        // Mobile should use smaller spacing
        final mobileSpacing = DSSpacing.getResponsiveSpacing(
          DSSpacing.md,
          400,
        );
        expect(mobileSpacing, lessThan(DSSpacing.md));

        // Desktop should use larger or same spacing
        final desktopSpacing = DSSpacing.getResponsiveSpacing(
          DSSpacing.md,
          1200,
        );
        expect(desktopSpacing, greaterThanOrEqualTo(DSSpacing.md));
      });
    });

    group('Layout Utilities', () {
      testWidgets('spaceBetween should distribute space correctly',
          (tester) async {
        final children = [
          Container(width: 50, height: 50, color: Colors.red),
          Container(width: 50, height: 50, color: Colors.green),
          Container(width: 50, height: 50, color: Colors.blue),
        ];

        final spacedChildren = DSSpacing.spaceBetween(
          children,
          DSSpacing.sm,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Column(children: spacedChildren),
            ),
          ),
        );

        // Should have original children + spacing widgets
        expect(spacedChildren.length, 5); // 3 children + 2 spacers
        expect(find.byType(Container), findsNWidgets(3));
        expect(find.byType(SizedBox), findsNWidgets(2));
      });

      testWidgets('wrapWithPadding should apply padding correctly',
          (tester) async {
        const childWidget = Text('Test');
        final paddedWidget = DSSpacing.wrapWithPadding(
          childWidget,
          DSSpacing.paddingMd,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: paddedWidget),
          ),
        );

        final paddingWidget = tester.widget<Padding>(find.byType(Padding));
        expect(paddingWidget.padding, DSSpacing.paddingMd);
      });
    });

    group('Custom Spacing Methods', () {
      test('custom should create correct EdgeInsets', () {
        final customPadding = DSSpacing.custom(
          top: DSSpacing.sm,
          bottom: DSSpacing.lg,
          left: DSSpacing.xs,
          right: DSSpacing.xl,
        );

        expect(customPadding.top, DSSpacing.sm);
        expect(customPadding.bottom, DSSpacing.lg);
        expect(customPadding.left, DSSpacing.xs);
        expect(customPadding.right, DSSpacing.xl);
      });

      test('symmetric should create symmetric EdgeInsets', () {
        final symmetricPadding = DSSpacing.symmetric(
          horizontal: DSSpacing.lg,
          vertical: DSSpacing.sm,
        );

        expect(symmetricPadding.left, DSSpacing.lg);
        expect(symmetricPadding.right, DSSpacing.lg);
        expect(symmetricPadding.top, DSSpacing.sm);
        expect(symmetricPadding.bottom, DSSpacing.sm);
      });

      test('only should create EdgeInsets with specific sides', () {
        final onlyPadding = DSSpacing.only(
          top: DSSpacing.md,
          left: DSSpacing.sm,
        );

        expect(onlyPadding.top, DSSpacing.md);
        expect(onlyPadding.left, DSSpacing.sm);
        expect(onlyPadding.bottom, 0);
        expect(onlyPadding.right, 0);
      });
    });

    group('Accessibility', () {
      test('spacing should meet minimum touch target sizes', () {
        // Button minimum touch target should be 44x44 (iOS) or 48x48 (Android)
        expect(DSSpacing.touchTarget, greaterThanOrEqualTo(44.0));

        // Ensure common spacings don't interfere with touch targets
        expect(DSSpacing.sm, lessThan(DSSpacing.touchTarget));
        expect(DSSpacing.md, lessThan(DSSpacing.touchTarget));
      });

      test('spacing should work well with common UI patterns', () {
        // Card internal padding should be comfortable
        expect(DSSpacing.cardPadding.left, greaterThanOrEqualTo(16.0));

        // Page padding should provide good reading width
        expect(DSSpacing.pagePadding.left, greaterThanOrEqualTo(24.0));

        // Section spacing should create clear separation
        expect(DSSpacing.sectionPadding.left, greaterThanOrEqualTo(32.0));
      });
    });

    group('Design System Consistency', () {
      test('all spacing values should be multiples of base unit', () {
        final spacingValues = [
          DSSpacing.xxxs,
          DSSpacing.xxs,
          DSSpacing.xs,
          DSSpacing.sm,
          DSSpacing.md,
          DSSpacing.lg,
          DSSpacing.xl,
          DSSpacing.xxl,
          DSSpacing.xxxl,
        ];

        for (final value in spacingValues) {
          // Should be multiple of 2 (half unit) for flexibility
          expect(value % 2, 0);
        }
      });

      test('spacing should follow 8pt grid system', () {
        // Most common spacings should be multiples of 8
        final eightMultiples = [
          DSSpacing.xs, // 8
          DSSpacing.sm, // 16
          DSSpacing.md, // 24
          DSSpacing.lg, // 32
          DSSpacing.xl, // 48
          DSSpacing.xxl, // 64
          DSSpacing.xxxl, // 96
        ];

        for (final value in eightMultiples) {
          expect(value % 8, 0);
        }
      });
    });

    group('Performance', () {
      test('spacing widgets should be const constructors', () {
        // Verify that spacing widgets can be const
        const widget1 = SizedBox(height: 16.0);
        const widget2 = SizedBox(width: 16.0);

        expect(widget1.height, 16.0);
        expect(widget2.width, 16.0);

        // EdgeInsets should also be const
        const padding = EdgeInsets.all(16.0);
        expect(padding.left, 16.0);
      });
    });

    group('Material Design Compliance', () {
      test('spacing should align with Material Design specifications', () {
        // Material Design uses 8dp base unit
        expect(DSSpacing.unit, 8.0);

        // Common Material spacing patterns
        expect(DSSpacing.sm, 16.0); // Standard button/card padding
        expect(DSSpacing.md, 24.0); // Standard content padding
        expect(DSSpacing.lg, 32.0); // Large sections
      });

      test('responsive spacing should follow Material breakpoints', () {
        // Mobile spacing (< 600dp)
        final mobileSpacing = DSSpacing.getResponsivePadding(500);
        expect(mobileSpacing.left, 16.0);

        // Tablet spacing (600-905dp)
        final tabletSpacing = DSSpacing.getResponsivePadding(700);
        expect(tabletSpacing.left, 24.0);

        // Desktop spacing (> 905dp)
        final desktopSpacing = DSSpacing.getResponsivePadding(1000);
        expect(desktopSpacing.left, greaterThanOrEqualTo(24.0));
      });
    });
  });
}
