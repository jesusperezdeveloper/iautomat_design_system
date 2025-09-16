import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/theme/typography.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';

void main() {
  group('AppTypography', () {
    group('Header Styles', () {
      test('should have correct h1 properties', () {
        expect(AppTypography.h1.fontSize, 48);
        expect(AppTypography.h1.fontWeight, FontWeight.w700);
        expect(AppTypography.h1.letterSpacing, -0.02);
        expect(AppTypography.h1.height, 1.1);
        expect(AppTypography.h1.fontFamily, 'Inter');
      });

      test('should have correct h2 properties', () {
        expect(AppTypography.h2.fontSize, 40);
        expect(AppTypography.h2.fontWeight, FontWeight.w700);
        expect(AppTypography.h2.letterSpacing, -0.02);
        expect(AppTypography.h2.height, 1.15);
      });

      test('should have correct h3 properties', () {
        expect(AppTypography.h3.fontSize, 32);
        expect(AppTypography.h3.fontWeight, FontWeight.w600);
        expect(AppTypography.h3.letterSpacing, -0.01);
        expect(AppTypography.h3.height, 1.2);
      });

      test('should have correct h4 properties', () {
        expect(AppTypography.h4.fontSize, 28);
        expect(AppTypography.h4.fontWeight, FontWeight.w600);
        expect(AppTypography.h4.letterSpacing, -0.01);
        expect(AppTypography.h4.height, 1.25);
      });

      test('should have correct h5 properties', () {
        expect(AppTypography.h5.fontSize, 24);
        expect(AppTypography.h5.fontWeight, FontWeight.w600);
        expect(AppTypography.h5.letterSpacing, 0);
        expect(AppTypography.h5.height, 1.3);
      });

      test('should have correct h6 properties', () {
        expect(AppTypography.h6.fontSize, 20);
        expect(AppTypography.h6.fontWeight, FontWeight.w600);
        expect(AppTypography.h6.letterSpacing, 0);
        expect(AppTypography.h6.height, 1.35);
      });
    });

    group('Body Text Styles', () {
      test('should have correct bodyLarge properties', () {
        expect(AppTypography.bodyLarge.fontSize, 18);
        expect(AppTypography.bodyLarge.fontWeight, FontWeight.w400);
        expect(AppTypography.bodyLarge.letterSpacing, 0);
        expect(AppTypography.bodyLarge.height, 1.55);
      });

      test('should have correct bodyMedium properties', () {
        expect(AppTypography.bodyMedium.fontSize, 16);
        expect(AppTypography.bodyMedium.fontWeight, FontWeight.w400);
        expect(AppTypography.bodyMedium.letterSpacing, 0);
        expect(AppTypography.bodyMedium.height, 1.5);
      });

      test('should have correct bodySmall properties', () {
        expect(AppTypography.bodySmall.fontSize, 14);
        expect(AppTypography.bodySmall.fontWeight, FontWeight.w400);
        expect(AppTypography.bodySmall.letterSpacing, 0);
        expect(AppTypography.bodySmall.height, 1.45);
      });
    });

    group('Label Styles', () {
      test('should have correct labelLarge properties', () {
        expect(AppTypography.labelLarge.fontSize, 16);
        expect(AppTypography.labelLarge.fontWeight, FontWeight.w500);
        expect(AppTypography.labelLarge.letterSpacing, 0.01);
        expect(AppTypography.labelLarge.height, 1.4);
      });

      test('should have correct labelMedium properties', () {
        expect(AppTypography.labelMedium.fontSize, 14);
        expect(AppTypography.labelMedium.fontWeight, FontWeight.w500);
        expect(AppTypography.labelMedium.letterSpacing, 0.01);
        expect(AppTypography.labelMedium.height, 1.4);
      });

      test('should have correct labelSmall properties', () {
        expect(AppTypography.labelSmall.fontSize, 12);
        expect(AppTypography.labelSmall.fontWeight, FontWeight.w500);
        expect(AppTypography.labelSmall.letterSpacing, 0.02);
        expect(AppTypography.labelSmall.height, 1.35);
      });
    });

    group('Special Styles', () {
      test('should have correct button properties', () {
        expect(AppTypography.button.fontSize, 16);
        expect(AppTypography.button.fontWeight, FontWeight.w600);
        expect(AppTypography.button.letterSpacing, 0.02);
        expect(AppTypography.button.height, 1.25);
      });

      test('should have correct caption properties', () {
        expect(AppTypography.caption.fontSize, 12);
        expect(AppTypography.caption.fontWeight, FontWeight.w400);
        expect(AppTypography.caption.letterSpacing, 0.01);
        expect(AppTypography.caption.height, 1.4);
      });

      test('should have correct overline properties', () {
        expect(AppTypography.overline.fontSize, 12);
        expect(AppTypography.overline.fontWeight, FontWeight.w600);
        expect(AppTypography.overline.letterSpacing, 0.08);
        expect(AppTypography.overline.height, 1.35);
      });
    });

    group('Responsive Scaling', () {
      test('getResponsiveTextStyle should scale font size correctly', () {
        const baseStyle = TextStyle(fontSize: 16);

        // Mobile scale factor
        final mobileStyle = AppTypography.getResponsiveTextStyle(
          baseStyle,
          600, // mobile width
        );
        expect(mobileStyle.fontSize, lessThan(16));

        // Desktop scale factor
        final desktopStyle = AppTypography.getResponsiveTextStyle(
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

        final scaledStyle = AppTypography.getResponsiveTextStyle(baseStyle, 800);

        expect(scaledStyle.fontWeight, baseStyle.fontWeight);
        expect(scaledStyle.letterSpacing, baseStyle.letterSpacing);
        expect(scaledStyle.color, baseStyle.color);
      });
    });

    group('Utility Methods', () {
      test('withColor should return style with specified color', () {
        final coloredStyle = AppTypography.withColor(
          AppTypography.h1,
          Colors.red,
        );

        expect(coloredStyle.color, Colors.red);
        expect(coloredStyle.fontSize, AppTypography.h1.fontSize);
        expect(coloredStyle.fontWeight, AppTypography.h1.fontWeight);
      });

      test('withWeight should return style with specified font weight', () {
        final weightedStyle = AppTypography.withWeight(
          AppTypography.bodyMedium,
          FontWeight.w700,
        );

        expect(weightedStyle.fontWeight, FontWeight.w700);
        expect(weightedStyle.fontSize, AppTypography.bodyMedium.fontSize);
        expect(weightedStyle.color, AppTypography.bodyMedium.color);
      });

      test('withSize should return style with specified font size', () {
        final sizedStyle = AppTypography.withSize(
          AppTypography.bodyMedium,
          24,
        );

        expect(sizedStyle.fontSize, 24);
        expect(sizedStyle.fontWeight, AppTypography.bodyMedium.fontWeight);
        expect(sizedStyle.color, AppTypography.bodyMedium.color);
      });

      test('merge should combine styles correctly', () {
        const style1 = TextStyle(fontSize: 16, color: Colors.red);
        const style2 = TextStyle(fontWeight: FontWeight.w700, color: Colors.blue);

        final mergedStyle = AppTypography.merge(style1, style2);

        expect(mergedStyle.fontSize, 16);
        expect(mergedStyle.fontWeight, FontWeight.w700);
        expect(mergedStyle.color, Colors.blue); // Second style takes precedence
      });
    });

    group('Theme Integration', () {
      test('styles should use correct colors from AppColors', () {
        // Default text styles should use primary text color
        expect(AppTypography.bodyMedium.color, AppColors.textPrimary);
        expect(AppTypography.h1.color, AppColors.textPrimary);
        expect(AppTypography.labelLarge.color, AppColors.textPrimary);
      });

      test('secondary text styles should use secondary color', () {
        expect(AppTypography.bodySmallSecondary.color, AppColors.textSecondary);
        expect(AppTypography.captionSecondary.color, AppColors.textSecondary);
      });

      test('disabled text styles should use disabled color', () {
        expect(AppTypography.bodyMediumDisabled.color, AppColors.textDisabled);
      });
    });

    group('Accessibility', () {
      test('font sizes should meet minimum accessibility requirements', () {
        // Body text should be at least 14px for accessibility
        expect(AppTypography.bodySmall.fontSize, greaterThanOrEqualTo(14));
        expect(AppTypography.bodyMedium.fontSize, greaterThanOrEqualTo(16));
        expect(AppTypography.bodyLarge.fontSize, greaterThanOrEqualTo(18));

        // Labels should be readable
        expect(AppTypography.labelSmall.fontSize, greaterThanOrEqualTo(12));
        expect(AppTypography.labelMedium.fontSize, greaterThanOrEqualTo(14));
      });

      test('line heights should provide good readability', () {
        // Body text should have sufficient line height (1.4-1.6 recommended)
        expect(AppTypography.bodyMedium.height, greaterThanOrEqualTo(1.4));
        expect(AppTypography.bodyMedium.height, lessThanOrEqualTo(1.6));

        // Headers can have tighter line height but not too tight
        expect(AppTypography.h1.height, greaterThanOrEqualTo(1.0));
        expect(AppTypography.h2.height, greaterThanOrEqualTo(1.1));
      });

      test('font weights should be well-distributed', () {
        // Should have clear hierarchy with font weights
        expect(AppTypography.h1.fontWeight!.index,
               greaterThan(AppTypography.bodyMedium.fontWeight!.index));
        expect(AppTypography.labelMedium.fontWeight!.index,
               greaterThan(AppTypography.bodyMedium.fontWeight!.index));
      });
    });

    group('Typography Scale', () {
      test('should maintain consistent type scale ratios', () {
        // Font sizes should follow a consistent scale
        final h1Size = AppTypography.h1.fontSize!;
        final h2Size = AppTypography.h2.fontSize!;
        final h3Size = AppTypography.h3.fontSize!;

        final ratio1 = h1Size / h2Size;
        final ratio2 = h2Size / h3Size;

        // Ratios should be similar (within 10% variance)
        expect((ratio1 - ratio2).abs() / ratio1, lessThan(0.3));
      });

      test('body text should follow consistent scaling', () {
        final largeSize = AppTypography.bodyLarge.fontSize!;
        final mediumSize = AppTypography.bodyMedium.fontSize!;
        final smallSize = AppTypography.bodySmall.fontSize!;

        // Should maintain consistent intervals
        final interval1 = largeSize - mediumSize;
        final interval2 = mediumSize - smallSize;

        expect(interval1, interval2); // Should be same interval (2px)
      });
    });

    group('Font Family Consistency', () {
      test('all styles should use Inter font family', () {
        final styles = [
          AppTypography.h1,
          AppTypography.h2,
          AppTypography.h3,
          AppTypography.bodyLarge,
          AppTypography.bodyMedium,
          AppTypography.bodySmall,
          AppTypography.labelLarge,
          AppTypography.button,
          AppTypography.caption,
        ];

        for (final style in styles) {
          expect(style.fontFamily, 'Inter');
        }
      });

      test('fallback fonts should be specified', () {
        // Should have fallback fonts for better browser compatibility
        final fontFeatures = AppTypography.baseFontFamily;
        expect(fontFeatures, contains('Inter'));
      });
    });
  });
}