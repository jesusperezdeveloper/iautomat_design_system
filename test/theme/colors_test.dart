import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';

void main() {
  group('AppColors', () {
    group('Primary Colors', () {
      test('should have correct primary color values', () {
        expect(AppColors.primary, const Color(0xFF2563EB));
        expect(AppColors.primaryLight, const Color(0xFF60A5FA));
        expect(AppColors.primaryDark, const Color(0xFF1D4ED8));
      });

      test('should have correct dark mode primary colors', () {
        expect(AppColors.primaryDarkMode, const Color(0xFF60A5FA));
        expect(AppColors.primaryLightDarkMode, const Color(0xFF93C5FD));
        expect(AppColors.primaryDarkDarkMode, const Color(0xFF3B82F6));
      });
    });

    group('Secondary Colors', () {
      test('should have correct secondary color values', () {
        expect(AppColors.secondary, const Color(0xFF7C3AED));
        expect(AppColors.secondaryLight, const Color(0xFFA855F7));
        expect(AppColors.secondaryDark, const Color(0xFF6D28D9));
      });

      test('should have correct dark mode secondary colors', () {
        expect(AppColors.secondaryDarkMode, const Color(0xFFA855F7));
        expect(AppColors.secondaryLightDarkMode, const Color(0xFFC084FC));
        expect(AppColors.secondaryDarkDarkMode, const Color(0xFF8B5CF6));
      });
    });

    group('Semantic Colors', () {
      test('should have correct semantic color values', () {
        expect(AppColors.success, const Color(0xFF10B981));
        expect(AppColors.successLight, const Color(0xFF34D399));
        expect(AppColors.successDark, const Color(0xFF059669));

        expect(AppColors.warning, const Color(0xFFF59E0B));
        expect(AppColors.warningLight, const Color(0xFFFBBF24));
        expect(AppColors.warningDark, const Color(0xFFD97706));

        expect(AppColors.error, const Color(0xFFEF4444));
        expect(AppColors.errorLight, const Color(0xFFF87171));
        expect(AppColors.errorDark, const Color(0xFFDC2626));

        expect(AppColors.info, const Color(0xFF3B82F6));
        expect(AppColors.infoLight, const Color(0xFF60A5FA));
        expect(AppColors.infoDark, const Color(0xFF2563EB));
      });
    });

    group('Gray Scale', () {
      test('should have correct gray scale values', () {
        expect(AppColors.gray50, const Color(0xFFF9FAFB));
        expect(AppColors.gray100, const Color(0xFFF3F4F6));
        expect(AppColors.gray200, const Color(0xFFE5E7EB));
        expect(AppColors.gray300, const Color(0xFFD1D5DB));
        expect(AppColors.gray400, const Color(0xFF9CA3AF));
        expect(AppColors.gray500, const Color(0xFF6B7280));
        expect(AppColors.gray600, const Color(0xFF4B5563));
        expect(AppColors.gray700, const Color(0xFF374151));
        expect(AppColors.gray800, const Color(0xFF1F2937));
        expect(AppColors.gray900, const Color(0xFF111827));
      });
    });

    group('Surface Colors', () {
      test('should have correct surface colors for light mode', () {
        expect(AppColors.surface, const Color(0xFFFFFFFF));
        expect(AppColors.surfaceVariant, const Color(0xFFF9FAFB));
        expect(AppColors.surfaceContainer, const Color(0xFFF3F4F6));
        expect(AppColors.surfaceContainerHigh, const Color(0xFFE5E7EB));
      });

      test('should have correct surface colors for dark mode', () {
        expect(AppColors.surfaceDark, const Color(0xFF111827));
        expect(AppColors.surfaceVariantDark, const Color(0xFF1F2937));
        expect(AppColors.surfaceContainerDark, const Color(0xFF374151));
        expect(AppColors.surfaceContainerHighDark, const Color(0xFF4B5563));
      });
    });

    group('Utility Methods', () {
      test('withOpacity should return color with correct opacity', () {
        final transparentPrimary = AppColors.withOpacity(
          AppColors.primary,
          0.5,
        );
        expect(transparentPrimary.alpha, (255 * 0.5).round());
        expect(transparentPrimary.red, AppColors.primary.red);
        expect(transparentPrimary.green, AppColors.primary.green);
        expect(transparentPrimary.blue, AppColors.primary.blue);
      });

      test('lighten should return lighter color', () {
        final lighterPrimary = AppColors.lighten(AppColors.primary, 0.2);

        // Should be lighter than original
        final originalBrightness = AppColors.primary.computeLuminance();
        final lighterBrightness = lighterPrimary.computeLuminance();
        expect(lighterBrightness, greaterThan(originalBrightness));
      });

      test('darken should return darker color', () {
        final darkerPrimary = AppColors.darken(AppColors.primary, 0.2);

        // Should be darker than original
        final originalBrightness = AppColors.primary.computeLuminance();
        final darkerBrightness = darkerPrimary.computeLuminance();
        expect(darkerBrightness, lessThan(originalBrightness));
      });

      test('getContrastingTextColor should return correct text color', () {
        // Light backgrounds should return dark text
        final darkText = AppColors.getContrastingTextColor(Colors.white);
        expect(darkText, AppColors.textPrimary);

        // Dark backgrounds should return light text
        final lightText = AppColors.getContrastingTextColor(Colors.black);
        expect(lightText, AppColors.textPrimaryDark);
      });

      test('isLight should correctly identify light colors', () {
        expect(AppColors.isLight(Colors.white), isTrue);
        expect(AppColors.isLight(AppColors.gray50), isTrue);
        expect(AppColors.isLight(Colors.black), isFalse);
        expect(AppColors.isLight(AppColors.gray900), isFalse);
      });

      test('isDark should correctly identify dark colors', () {
        expect(AppColors.isDark(Colors.black), isTrue);
        expect(AppColors.isDark(AppColors.gray900), isTrue);
        expect(AppColors.isDark(Colors.white), isFalse);
        expect(AppColors.isDark(AppColors.gray50), isFalse);
      });
    });

    group('Accessibility', () {
      test('primary colors should have sufficient contrast', () {
        // Test contrast ratio between primary color and white text
        final contrast = _calculateContrastRatio(
          AppColors.primary,
          Colors.white,
        );
        expect(contrast, greaterThanOrEqualTo(4.5)); // WCAG AA standard
      });

      test('error color should have sufficient contrast', () {
        final contrast = _calculateContrastRatio(AppColors.error, Colors.white);
        expect(contrast, greaterThanOrEqualTo(4.5));
      });

      test('text colors should have sufficient contrast on surfaces', () {
        // Primary text on light surface
        final lightContrast = _calculateContrastRatio(
          AppColors.textPrimary,
          AppColors.surface,
        );
        expect(lightContrast, greaterThanOrEqualTo(7.0)); // WCAG AAA standard

        // Primary text on dark surface
        final darkContrast = _calculateContrastRatio(
          AppColors.textPrimaryDark,
          AppColors.surfaceDark,
        );
        expect(darkContrast, greaterThanOrEqualTo(7.0));
      });
    });

    group('Color Consistency', () {
      test('color variants should maintain hue consistency', () {
        // Primary variants should have similar hue
        final primaryHSV = HSVColor.fromColor(AppColors.primary);
        final primaryLightHSV = HSVColor.fromColor(AppColors.primaryLight);
        final primaryDarkHSV = HSVColor.fromColor(AppColors.primaryDark);

        // Hue difference should be minimal (within 10 degrees)
        expect((primaryLightHSV.hue - primaryHSV.hue).abs(), lessThan(10));
        expect((primaryDarkHSV.hue - primaryHSV.hue).abs(), lessThan(10));
      });

      test('gray scale should be truly neutral', () {
        // Gray colors should have minimal saturation
        final grayColors = [
          AppColors.gray100,
          AppColors.gray300,
          AppColors.gray500,
          AppColors.gray700,
          AppColors.gray900,
        ];

        for (final color in grayColors) {
          final hsv = HSVColor.fromColor(color);
          expect(hsv.saturation, lessThan(0.1)); // Very low saturation
        }
      });
    });

    group('Brand Colors', () {
      test('should maintain brand color integrity', () {
        // IAutomat primary brand color should be blue (#2563EB)
        expect(AppColors.primary.value, 0xFF2563EB);

        // IAutomat secondary brand color should be purple (#7C3AED)
        expect(AppColors.secondary.value, 0xFF7C3AED);
      });

      test('brand colors should work well together', () {
        // Test that primary and secondary have good contrast when used together
        final contrast = _calculateContrastRatio(
          AppColors.primary,
          AppColors.secondary,
        );
        expect(contrast, greaterThan(1.5)); // Should be distinguishable
      });
    });
  });
}

/// Calculate contrast ratio between two colors
/// Returns a value from 1 (no contrast) to 21 (maximum contrast)
double _calculateContrastRatio(Color color1, Color color2) {
  final luminance1 = color1.computeLuminance();
  final luminance2 = color2.computeLuminance();

  final lighter = luminance1 > luminance2 ? luminance1 : luminance2;
  final darker = luminance1 > luminance2 ? luminance2 : luminance1;

  return (lighter + 0.05) / (darker + 0.05);
}
