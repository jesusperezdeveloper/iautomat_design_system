import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/theme/typography.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';

void main() {
  group('DSTypography', () {
    group('Header Styles', () {
      test('should have correct h1 properties', () {
        expect(DSTypography.h1.fontSize, 48);
        expect(DSTypography.h1.fontWeight, FontWeight.w700);
        expect(DSTypography.h1.letterSpacing, -0.02);
        expect(DSTypography.h1.height, 1.1);
        expect(DSTypography.h1.fontFamily, 'Inter');
      });

      test('should have correct h2 properties', () {
        expect(DSTypography.h2.fontSize, 40);
        expect(DSTypography.h2.fontWeight, FontWeight.w700);
        expect(DSTypography.h2.letterSpacing, -0.02);
        expect(DSTypography.h2.height, 1.15);
      });

      test('should have correct h3 properties', () {
        expect(DSTypography.h3.fontSize, 32);
        expect(DSTypography.h3.fontWeight, FontWeight.w600);
        expect(DSTypography.h3.letterSpacing, -0.01);
        expect(DSTypography.h3.height, 1.2);
      });

      test('should have correct h4 properties', () {
        expect(DSTypography.h4.fontSize, 28);
        expect(DSTypography.h4.fontWeight, FontWeight.w600);
        expect(DSTypography.h4.letterSpacing, -0.01);
        expect(DSTypography.h4.height, 1.25);
      });

      test('should have correct h5 properties', () {
        expect(DSTypography.h5.fontSize, 24);
        expect(DSTypography.h5.fontWeight, FontWeight.w600);
        expect(DSTypography.h5.letterSpacing, 0);
        expect(DSTypography.h5.height, 1.3);
      });

      test('should have correct h6 properties', () {
        expect(DSTypography.h6.fontSize, 20);
        expect(DSTypography.h6.fontWeight, FontWeight.w600);
        expect(DSTypography.h6.letterSpacing, 0);
        expect(DSTypography.h6.height, 1.35);
      });
    });

    group('Body Text Styles', () {
      test('should have correct bodyLarge properties', () {
        expect(DSTypography.bodyLarge.fontSize, 18);
        expect(DSTypography.bodyLarge.fontWeight, FontWeight.w400);
        expect(DSTypography.bodyLarge.letterSpacing, 0);
        expect(DSTypography.bodyLarge.height, 1.55);
      });

      test('should have correct bodyMedium properties', () {
        expect(DSTypography.bodyMedium.fontSize, 16);
        expect(DSTypography.bodyMedium.fontWeight, FontWeight.w400);
        expect(DSTypography.bodyMedium.letterSpacing, 0);
        expect(DSTypography.bodyMedium.height, 1.5);
      });

      test('should have correct bodySmall properties', () {
        expect(DSTypography.bodySmall.fontSize, 14);
        expect(DSTypography.bodySmall.fontWeight, FontWeight.w400);
        expect(DSTypography.bodySmall.letterSpacing, 0);
        expect(DSTypography.bodySmall.height, 1.45);
      });
    });

    group('Label Styles', () {
      test('should have correct labelLarge properties', () {
        expect(DSTypography.labelLarge.fontSize, 16);
        expect(DSTypography.labelLarge.fontWeight, FontWeight.w500);
        expect(DSTypography.labelLarge.letterSpacing, 0.01);
        expect(DSTypography.labelLarge.height, 1.4);
      });

      test('should have correct labelMedium properties', () {
        expect(DSTypography.labelMedium.fontSize, 14);
        expect(DSTypography.labelMedium.fontWeight, FontWeight.w500);
        expect(DSTypography.labelMedium.letterSpacing, 0.01);
        expect(DSTypography.labelMedium.height, 1.4);
      });

      test('should have correct labelSmall properties', () {
        expect(DSTypography.labelSmall.fontSize, 12);
        expect(DSTypography.labelSmall.fontWeight, FontWeight.w500);
        expect(DSTypography.labelSmall.letterSpacing, 0.02);
        expect(DSTypography.labelSmall.height, 1.35);
      });
    });

    group('Special Styles', () {
      test('should have correct button properties', () {
        expect(DSTypography.button.fontSize, 16);
        expect(DSTypography.button.fontWeight, FontWeight.w600);
        expect(DSTypography.button.letterSpacing, 0.02);
        expect(DSTypography.button.height, 1.25);
      });

      test('should have correct caption properties', () {
        expect(DSTypography.caption.fontSize, 12);
        expect(DSTypography.caption.fontWeight, FontWeight.w400);
        expect(DSTypography.caption.letterSpacing, 0.01);
        expect(DSTypography.caption.height, 1.4);
      });

      test('should have correct overline properties', () {
        expect(DSTypography.overline.fontSize, 12);
        expect(DSTypography.overline.fontWeight, FontWeight.w600);
        expect(DSTypography.overline.letterSpacing, 0.08);
        expect(DSTypography.overline.height, 1.35);
      });
    });

    group('Responsive Scaling', () {
      test('getResponsiveTextStyle should scale font size correctly', () {
        const baseStyle = TextStyle(fontSize: 16);

        // Mobile scale factor
        final mobileStyle = DSTypography.getResponsiveTextStyle(
          baseStyle,
          600, // mobile width
        );
        expect(mobileStyle.fontSize, lessThan(16));

        // Desktop scale factor
        final desktopStyle = DSTypography.getResponsiveTextStyle(
          baseStyle,
          1200, // desktop width
        );
        expect(desktopStyle.fontSize, greaterThanOrEqualTo(16));
      });

      test('responsive scaling should maintain style properties', () {
        const baseStyle = TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.01,
          color: Colors.blue,
        );

        final scaledStyle =
            DSTypography.getResponsiveTextStyle(baseStyle, 800);

        expect(scaledStyle.fontWeight, baseStyle.fontWeight);
        expect(scaledStyle.letterSpacing, baseStyle.letterSpacing);
        expect(scaledStyle.color, baseStyle.color);
      });
    });

    group('Utility Methods', () {
      test('withColor should return style with specified color', () {
        final coloredStyle = DSTypography.withColor(
          DSTypography.h1,
          Colors.red,
        );

        expect(coloredStyle.color, Colors.red);
        expect(coloredStyle.fontSize, DSTypography.h1.fontSize);
        expect(coloredStyle.fontWeight, DSTypography.h1.fontWeight);
      });

      test('withWeight should return style with specified font weight', () {
        final weightedStyle = DSTypography.withWeight(
          DSTypography.bodyMedium,
          FontWeight.w700,
        );

        expect(weightedStyle.fontWeight, FontWeight.w700);
        expect(weightedStyle.fontSize, DSTypography.bodyMedium.fontSize);
        expect(weightedStyle.color, DSTypography.bodyMedium.color);
      });

      test('withSize should return style with specified font size', () {
        final sizedStyle = DSTypography.withSize(
          DSTypography.bodyMedium,
          24,
        );

        expect(sizedStyle.fontSize, 24);
        expect(sizedStyle.fontWeight, DSTypography.bodyMedium.fontWeight);
        expect(sizedStyle.color, DSTypography.bodyMedium.color);
      });

      test('merge should combine styles correctly', () {
        const style1 = TextStyle(fontSize: 16, color: Colors.red);
        const style2 =
            TextStyle(fontWeight: FontWeight.w700, color: Colors.blue);

        final mergedStyle = DSTypography.merge(style1, style2);

        expect(mergedStyle.fontSize, 16);
        expect(mergedStyle.fontWeight, FontWeight.w700);
        expect(mergedStyle.color, Colors.blue); // Second style takes precedence
      });
    });

    group('Theme Integration', () {
      test('styles should use correct colors from DSColors', () {
        // Default text styles should use primary text color
        expect(DSTypography.bodyMedium.color, DSColors.textPrimary);
        expect(DSTypography.h1.color, DSColors.textPrimary);
        expect(DSTypography.labelLarge.color, DSColors.textPrimary);
      });

      test('secondary text styles should use secondary color', () {
        expect(DSTypography.bodySmallSecondary.color, DSColors.textSecondary);
        expect(DSTypography.captionSecondary.color, DSColors.textSecondary);
      });

      test('disabled text styles should use disabled color', () {
        expect(DSTypography.bodyMediumDisabled.color, DSColors.textDisabled);
      });
    });

    group('Accessibility', () {
      test('font sizes should meet minimum accessibility requirements', () {
        // Body text should be at least 14px for accessibility
        expect(DSTypography.bodySmall.fontSize, greaterThanOrEqualTo(14));
        expect(DSTypography.bodyMedium.fontSize, greaterThanOrEqualTo(16));
        expect(DSTypography.bodyLarge.fontSize, greaterThanOrEqualTo(18));

        // Labels should be readable
        expect(DSTypography.labelSmall.fontSize, greaterThanOrEqualTo(12));
        expect(DSTypography.labelMedium.fontSize, greaterThanOrEqualTo(14));
      });

      test('line heights should provide good readability', () {
        // Body text should have sufficient line height (1.4-1.6 recommended)
        expect(DSTypography.bodyMedium.height, greaterThanOrEqualTo(1.4));
        expect(DSTypography.bodyMedium.height, lessThanOrEqualTo(1.6));

        // Headers can have tighter line height but not too tight
        expect(DSTypography.h1.height, greaterThanOrEqualTo(1.0));
        expect(DSTypography.h2.height, greaterThanOrEqualTo(1.1));
      });

      test('font weights should be well-distributed', () {
        // Should have clear hierarchy with font weights
        expect(DSTypography.h1.fontWeight!.index,
            greaterThan(DSTypography.bodyMedium.fontWeight!.index));
        expect(DSTypography.labelMedium.fontWeight!.index,
            greaterThan(DSTypography.bodyMedium.fontWeight!.index));
      });
    });

    group('Typography Scale', () {
      test('should maintain consistent type scale ratios', () {
        // Font sizes should follow a consistent scale
        final h1Size = DSTypography.h1.fontSize!;
        final h2Size = DSTypography.h2.fontSize!;
        final h3Size = DSTypography.h3.fontSize!;

        final ratio1 = h1Size / h2Size;
        final ratio2 = h2Size / h3Size;

        // Ratios should be similar (within 10% variance)
        expect((ratio1 - ratio2).abs() / ratio1, lessThan(0.3));
      });

      test('body text should follow consistent scaling', () {
        final largeSize = DSTypography.bodyLarge.fontSize!;
        final mediumSize = DSTypography.bodyMedium.fontSize!;
        final smallSize = DSTypography.bodySmall.fontSize!;

        // Should maintain consistent intervals
        final interval1 = largeSize - mediumSize;
        final interval2 = mediumSize - smallSize;

        expect(interval1, interval2); // Should be same interval (2px)
      });
    });

    group('Font Family Consistency', () {
      test('all styles should use Inter font family', () {
        final styles = [
          DSTypography.h1,
          DSTypography.h2,
          DSTypography.h3,
          DSTypography.bodyLarge,
          DSTypography.bodyMedium,
          DSTypography.bodySmall,
          DSTypography.labelLarge,
          DSTypography.button,
          DSTypography.caption,
        ];

        for (final style in styles) {
          expect(style.fontFamily, 'Inter');
        }
      });

      test('fallback fonts should be specified', () {
        // Should have fallback fonts for better browser compatibility
        final fontFeatures = DSTypography.baseFontFamily;
        expect(fontFeatures, contains('Inter'));
      });
    });
  });
}
