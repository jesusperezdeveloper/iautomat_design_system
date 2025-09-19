import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/theme/colors.dart';

void main() {
  group('DSColors', () {
    group('Primary Colors', () {
      test('should have correct primary color values', () {
        expect(DSColors.primary, const Color(0xFF2563EB));
        expect(DSColors.primaryLight, const Color(0xFF60A5FA));
        expect(DSColors.primaryDark, const Color(0xFF1D4ED8));
      });

      test('should have correct dark mode primary colors', () {
        expect(DSColors.primaryDarkMode, const Color(0xFF60A5FA));
        expect(DSColors.primaryLightDarkMode, const Color(0xFF93C5FD));
        expect(DSColors.primaryDarkDarkMode, const Color(0xFF3B82F6));
      });
    });

    group('Secondary Colors', () {
      test('should have correct secondary color values', () {
        expect(DSColors.secondary, const Color(0xFFE879F9));
        expect(DSColors.secondaryLight, const Color(0xFFF0ABFC));
        expect(DSColors.secondaryDark, const Color(0xFFD946EF));
      });

      test('should have correct dark mode secondary colors', () {
        expect(DSColors.secondaryDarkMode, const Color(0xFFE879F9));
        expect(DSColors.secondaryLightDarkMode, const Color(0xFFC084FC));
        expect(DSColors.secondaryDarkDarkMode, const Color(0xFF8B5CF6));
      });
    });

    group('Semantic Colors', () {
      test('should have correct semantic color values', () {
        expect(DSColors.success, const Color(0xFF10B981));
        expect(DSColors.successLight, const Color(0xFF34D399));
        expect(DSColors.successDark, const Color(0xFF059669));

        expect(DSColors.warning, const Color(0xFFF59E0B));
        expect(DSColors.warningLight, const Color(0xFFFBBF24));
        expect(DSColors.warningDark, const Color(0xFFD97706));

        expect(DSColors.error, const Color(0xFFDC2626));
        expect(DSColors.errorLight, const Color(0xFFF87171));
        expect(DSColors.errorDark, const Color(0xFFB91C1C));

        expect(DSColors.info, const Color(0xFF3B82F6));
        expect(DSColors.infoLight, const Color(0xFF60A5FA));
        expect(DSColors.infoDark, const Color(0xFF2563EB));
      });
    });

    group('Gray Scale', () {
      test('should have correct gray scale values', () {
        expect(DSColors.gray50, const Color(0xFFFAFAFA));
        expect(DSColors.gray100, const Color(0xFFF5F5F5));
        expect(DSColors.gray200, const Color(0xFFE5E5E5));
        expect(DSColors.gray300, const Color(0xFFD4D4D4));
        expect(DSColors.gray400, const Color(0xFFA3A3A3));
        expect(DSColors.gray500, const Color(0xFF737373));
        expect(DSColors.gray600, const Color(0xFF525252));
        expect(DSColors.gray700, const Color(0xFF404040));
        expect(DSColors.gray800, const Color(0xFF262626));
        expect(DSColors.gray900, const Color(0xFF171717));
      });
    });

    group('Surface Colors', () {
      test('should have correct surface colors for light mode', () {
        expect(DSColors.surface, const Color(0xFFFFFFFF));
        expect(DSColors.surfaceVariant, const Color(0xFFFAFAFA));
        expect(DSColors.surfaceContainer, const Color(0xFFF5F5F5));
        expect(DSColors.surfaceContainerHigh, const Color(0xFFE5E5E5));
      });

      test('should have correct surface colors for dark mode', () {
        expect(DSColors.surfaceDark, const Color(0xFF111827));
        expect(DSColors.surfaceVariantDark, const Color(0xFF1F2937));
        expect(DSColors.surfaceContainerDark, const Color(0xFF374151));
        expect(DSColors.surfaceContainerHighDark, const Color(0xFF4B5563));
      });
    });

    group('Utility Methods', () {
      test('withOpacity should return color with correct opacity', () {
        final transparentPrimary = DSColors.withOpacity(
          DSColors.primary,
          0.5,
        );
        expect(
            (transparentPrimary.a * 255.0).round() & 0xff, (255 * 0.5).round());
        expect((transparentPrimary.r * 255.0).round() & 0xff,
            (DSColors.primary.r * 255.0).round() & 0xff);
        expect((transparentPrimary.g * 255.0).round() & 0xff,
            (DSColors.primary.g * 255.0).round() & 0xff);
        expect((transparentPrimary.b * 255.0).round() & 0xff,
            (DSColors.primary.b * 255.0).round() & 0xff);
      });

      test('lighten should return lighter color', () {
        final lighterPrimary = DSColors.lighten(DSColors.primary, 0.2);

        // Should be lighter than original
        final originalBrightness = DSColors.primary.computeLuminance();
        final lighterBrightness = lighterPrimary.computeLuminance();
        expect(lighterBrightness, greaterThan(originalBrightness));
      });

      test('darken should return darker color', () {
        final darkerPrimary = DSColors.darken(DSColors.primary, 0.2);

        // Should be darker than original
        final originalBrightness = DSColors.primary.computeLuminance();
        final darkerBrightness = darkerPrimary.computeLuminance();
        expect(darkerBrightness, lessThan(originalBrightness));
      });

      test('getContrastingTextColor should return correct text color', () {
        // Light backgrounds should return dark text
        final darkText = DSColors.getContrastingTextColor(Colors.white);
        expect(darkText, Colors.black);

        // Dark backgrounds should return light text
        final lightText = DSColors.getContrastingTextColor(Colors.black);
        expect(lightText, Colors.white);
      });

      test('isLight should correctly identify light colors', () {
        expect(DSColors.isLight(Colors.white), isTrue);
        expect(DSColors.isLight(DSColors.gray50), isTrue);
        expect(DSColors.isLight(Colors.black), isFalse);
        expect(DSColors.isLight(DSColors.gray900), isFalse);
      });

      test('isDark should correctly identify dark colors', () {
        expect(DSColors.isDark(Colors.black), isTrue);
        expect(DSColors.isDark(DSColors.gray900), isTrue);
        expect(DSColors.isDark(Colors.white), isFalse);
        expect(DSColors.isDark(DSColors.gray50), isFalse);
      });
    });

    group('Accessibility', () {
      test('primary colors should have sufficient contrast', () {
        // Test contrast ratio between primary color and white text
        final contrast = _calculateContrastRatio(
          DSColors.primary,
          Colors.white,
        );
        expect(contrast, greaterThanOrEqualTo(4.5)); // WCAG AA standard
      });

      test('error color should have sufficient contrast', () {
        final contrast = _calculateContrastRatio(DSColors.error, Colors.white);
        expect(contrast, greaterThanOrEqualTo(4.5));
      });

      test('text colors should have sufficient contrast on surfaces', () {
        // Primary text on light surface
        final lightContrast = _calculateContrastRatio(
          DSColors.textPrimary,
          DSColors.surface,
        );
        expect(lightContrast, greaterThanOrEqualTo(7.0)); // WCAG AAA standard

        // Primary text on dark surface
        final darkContrast = _calculateContrastRatio(
          DSColors.textPrimaryDark,
          DSColors.surfaceDark,
        );
        expect(darkContrast, greaterThanOrEqualTo(7.0));
      });
    });

    group('Color Consistency', () {
      test('color variants should maintain hue consistency', () {
        // Primary variants should have similar hue
        final primaryHSV = HSVColor.fromColor(DSColors.primary);
        final primaryLightHSV = HSVColor.fromColor(DSColors.primaryLight);
        final primaryDarkHSV = HSVColor.fromColor(DSColors.primaryDark);

        // Hue difference should be minimal (within 10 degrees)
        expect((primaryLightHSV.hue - primaryHSV.hue).abs(), lessThan(10));
        expect((primaryDarkHSV.hue - primaryHSV.hue).abs(), lessThan(10));
      });

      test('gray scale should be truly neutral', () {
        // Gray colors should have minimal saturation
        final grayColors = [
          DSColors.gray100,
          DSColors.gray300,
          DSColors.gray500,
          DSColors.gray700,
          DSColors.gray900,
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
        expect(DSColors.primary.toARGB32(), 0xFF2563EB);

        // IAutomat secondary brand color should be purple (#E879F9)
        expect(DSColors.secondary.toARGB32(), 0xFFE879F9);
      });

      test('brand colors should work well together', () {
        // Test that primary and secondary have good contrast when used together
        final contrast = _calculateContrastRatio(
          DSColors.primary,
          DSColors.secondary,
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
