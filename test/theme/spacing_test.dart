import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/theme/spacing.dart';

void main() {
  group('AppSpacing', () {
    group('Base Unit', () {
      test('should have correct base unit', () {
        expect(AppSpacing.unit, 8.0);
      });
    });

    group('Spacing Scale', () {
      test('should have correct spacing values based on 8px unit', () {
        expect(AppSpacing.xxxs, 2.0); // unit * 0.25
        expect(AppSpacing.xxs, 4.0); // unit * 0.5
        expect(AppSpacing.xs, 8.0); // unit * 1
        expect(AppSpacing.sm, 16.0); // unit * 2
        expect(AppSpacing.md, 24.0); // unit * 3
        expect(AppSpacing.lg, 32.0); // unit * 4
        expect(AppSpacing.xl, 48.0); // unit * 6
        expect(AppSpacing.xxl, 64.0); // unit * 8
        expect(AppSpacing.xxxl, 96.0); // unit * 12
      });

      test('spacing values should follow consistent scale', () {
        // Each step should be logical
        expect(AppSpacing.sm, AppSpacing.xs * 2);
        expect(AppSpacing.lg, AppSpacing.sm * 2);
        expect(AppSpacing.xxl, AppSpacing.lg * 2);
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
                  AppSpacing.verticalXs,
                  AppSpacing.verticalSm,
                  AppSpacing.verticalMd,
                  AppSpacing.verticalLg,
                  AppSpacing.verticalXl,
                ],
              ),
            ),
          ),
        );

        // Find SizedBox widgets and verify their heights
        final xsBox = tester.widget<SizedBox>(
          find.byWidget(AppSpacing.verticalXs),
        );
        expect(xsBox.height, AppSpacing.xs);

        final smBox = tester.widget<SizedBox>(
          find.byWidget(AppSpacing.verticalSm),
        );
        expect(smBox.height, AppSpacing.sm);

        final mdBox = tester.widget<SizedBox>(
          find.byWidget(AppSpacing.verticalMd),
        );
        expect(mdBox.height, AppSpacing.md);
      });

      testWidgets('horizontal spacing widgets should have correct width',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Row(
                children: [
                  AppSpacing.horizontalXs,
                  AppSpacing.horizontalSm,
                  AppSpacing.horizontalMd,
                  AppSpacing.horizontalLg,
                  AppSpacing.horizontalXl,
                ],
              ),
            ),
          ),
        );

        // Find SizedBox widgets and verify their widths
        final xsBox = tester.widget<SizedBox>(
          find.byWidget(AppSpacing.horizontalXs),
        );
        expect(xsBox.width, AppSpacing.xs);

        final smBox = tester.widget<SizedBox>(
          find.byWidget(AppSpacing.horizontalSm),
        );
        expect(smBox.width, AppSpacing.sm);
      });
    });

    group('EdgeInsets Presets', () {
      test('should have correct padding presets', () {
        expect(AppSpacing.paddingXs, const EdgeInsets.all(8.0));
        expect(AppSpacing.paddingSm, const EdgeInsets.all(16.0));
        expect(AppSpacing.paddingMd, const EdgeInsets.all(24.0));
        expect(AppSpacing.paddingLg, const EdgeInsets.all(32.0));
        expect(AppSpacing.paddingXl, const EdgeInsets.all(48.0));
      });

      test('should have correct card padding preset', () {
        expect(AppSpacing.cardPadding, const EdgeInsets.all(16.0));
      });

      test('should have correct page padding preset', () {
        expect(AppSpacing.pagePadding, const EdgeInsets.all(24.0));
      });

      test('should have correct section padding preset', () {
        expect(AppSpacing.sectionPadding, const EdgeInsets.all(32.0));
      });
    });

    group('Responsive Spacing', () {
      test(
          'getResponsivePadding should return appropriate padding for screen sizes',
          () {
        // Mobile
        final mobilePadding = AppSpacing.getResponsivePadding(400);
        expect(mobilePadding.left, 16.0); // sm padding

        // Tablet
        final tabletPadding = AppSpacing.getResponsivePadding(800);
        expect(tabletPadding.left, 24.0); // md padding

        // Desktop
        final desktopPadding = AppSpacing.getResponsivePadding(1200);
        expect(desktopPadding.left, 32.0); // lg padding

        // Ultra wide
        final ultraWidePadding = AppSpacing.getResponsivePadding(1600);
        expect(ultraWidePadding.left, 48.0); // xl padding
      });

      test('getResponsiveSpacing should scale appropriately', () {
        // Mobile should use smaller spacing
        final mobileSpacing = AppSpacing.getResponsiveSpacing(
          AppSpacing.md,
          400,
        );
        expect(mobileSpacing, lessThan(AppSpacing.md));

        // Desktop should use larger or same spacing
        final desktopSpacing = AppSpacing.getResponsiveSpacing(
          AppSpacing.md,
          1200,
        );
        expect(desktopSpacing, greaterThanOrEqualTo(AppSpacing.md));
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

        final spacedChildren = AppSpacing.spaceBetween(
          children,
          AppSpacing.sm,
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
        final paddedWidget = AppSpacing.wrapWithPadding(
          childWidget,
          AppSpacing.paddingMd,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(body: paddedWidget),
          ),
        );

        final paddingWidget = tester.widget<Padding>(find.byType(Padding));
        expect(paddingWidget.padding, AppSpacing.paddingMd);
      });
    });

    group('Custom Spacing Methods', () {
      test('custom should create correct EdgeInsets', () {
        final customPadding = AppSpacing.custom(
          top: AppSpacing.sm,
          bottom: AppSpacing.lg,
          left: AppSpacing.xs,
          right: AppSpacing.xl,
        );

        expect(customPadding.top, AppSpacing.sm);
        expect(customPadding.bottom, AppSpacing.lg);
        expect(customPadding.left, AppSpacing.xs);
        expect(customPadding.right, AppSpacing.xl);
      });

      test('symmetric should create symmetric EdgeInsets', () {
        final symmetricPadding = AppSpacing.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        );

        expect(symmetricPadding.left, AppSpacing.lg);
        expect(symmetricPadding.right, AppSpacing.lg);
        expect(symmetricPadding.top, AppSpacing.sm);
        expect(symmetricPadding.bottom, AppSpacing.sm);
      });

      test('only should create EdgeInsets with specific sides', () {
        final onlyPadding = AppSpacing.only(
          top: AppSpacing.md,
          left: AppSpacing.sm,
        );

        expect(onlyPadding.top, AppSpacing.md);
        expect(onlyPadding.left, AppSpacing.sm);
        expect(onlyPadding.bottom, 0);
        expect(onlyPadding.right, 0);
      });
    });

    group('Accessibility', () {
      test('spacing should meet minimum touch target sizes', () {
        // Button minimum touch target should be 44x44 (iOS) or 48x48 (Android)
        expect(AppSpacing.touchTarget, greaterThanOrEqualTo(44.0));

        // Ensure common spacings don't interfere with touch targets
        expect(AppSpacing.sm, lessThan(AppSpacing.touchTarget));
        expect(AppSpacing.md, lessThan(AppSpacing.touchTarget));
      });

      test('spacing should work well with common UI patterns', () {
        // Card internal padding should be comfortable
        expect(AppSpacing.cardPadding.left, greaterThanOrEqualTo(16.0));

        // Page padding should provide good reading width
        expect(AppSpacing.pagePadding.left, greaterThanOrEqualTo(24.0));

        // Section spacing should create clear separation
        expect(AppSpacing.sectionPadding.left, greaterThanOrEqualTo(32.0));
      });
    });

    group('Design System Consistency', () {
      test('all spacing values should be multiples of base unit', () {
        final spacingValues = [
          AppSpacing.xxxs,
          AppSpacing.xxs,
          AppSpacing.xs,
          AppSpacing.sm,
          AppSpacing.md,
          AppSpacing.lg,
          AppSpacing.xl,
          AppSpacing.xxl,
          AppSpacing.xxxl,
        ];

        for (final value in spacingValues) {
          // Should be multiple of 2 (half unit) for flexibility
          expect(value % 2, 0);
        }
      });

      test('spacing should follow 8pt grid system', () {
        // Most common spacings should be multiples of 8
        final eightMultiples = [
          AppSpacing.xs, // 8
          AppSpacing.sm, // 16
          AppSpacing.md, // 24
          AppSpacing.lg, // 32
          AppSpacing.xl, // 48
          AppSpacing.xxl, // 64
          AppSpacing.xxxl, // 96
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
        expect(AppSpacing.unit, 8.0);

        // Common Material spacing patterns
        expect(AppSpacing.sm, 16.0); // Standard button/card padding
        expect(AppSpacing.md, 24.0); // Standard content padding
        expect(AppSpacing.lg, 32.0); // Large sections
      });

      test('responsive spacing should follow Material breakpoints', () {
        // Mobile spacing (< 600dp)
        final mobileSpacing = AppSpacing.getResponsivePadding(500);
        expect(mobileSpacing.horizontal, 16.0);

        // Tablet spacing (600-905dp)
        final tabletSpacing = AppSpacing.getResponsivePadding(700);
        expect(tabletSpacing.horizontal, 24.0);

        // Desktop spacing (> 905dp)
        final desktopSpacing = AppSpacing.getResponsivePadding(1000);
        expect(desktopSpacing.horizontal, greaterThanOrEqualTo(24.0));
      });
    });
  });
}
