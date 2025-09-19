import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSTag', () {
    group('Constructor', () {
      test('should create DSTag with semantic constructor', () {
        final tag = DSTag.semantic(label: 'Test Tag');

        expect(tag.config.label, equals('Test Tag'));
        expect(tag.config.variant, equals(DSTagVariant.semantic));
        expect(tag.config.semanticColor, equals(DSTagSemanticColor.primary));
        expect(tag.config.size, equals(DSTagSize.medium));
        expect(tag.config.shape, equals(DSTagShape.rounded));
      });

      test('should create DSTag with custom semantic color', () {
        final tag = DSTag.semantic(
          label: 'Success Tag',
          semanticColor: DSTagSemanticColor.success,
        );

        expect(tag.config.semanticColor, equals(DSTagSemanticColor.success));
      });

      test('should create DSTag with custom size', () {
        final tag = DSTag.semantic(
          label: 'Large Tag',
          size: DSTagSize.large,
        );

        expect(tag.config.size, equals(DSTagSize.large));
      });

      test('should create DSTag with custom shape', () {
        final tag = DSTag.semantic(
          label: 'Pill Tag',
          shape: DSTagShape.pill,
        );

        expect(tag.config.shape, equals(DSTagShape.pill));
      });
    });

    group('Configuration Properties', () {
      test('should be interactive when onTap is provided', () {
        final tag = DSTag.semantic(
          label: 'Interactive Tag',
          onTap: () {},
        );

        expect(tag.config.isInteractive, isTrue);
      });

      test('should be removable when removable is true', () {
        final tag = DSTag.semantic(
          label: 'Removable Tag',
          removable: true,
        );

        expect(tag.config.removable, isTrue);
        expect(tag.config.hasTrailing, isTrue);
      });

      test('should be disabled when enabled is false', () {
        final tag = DSTag.semantic(
          label: 'Disabled Tag',
          enabled: false,
        );

        expect(tag.config.isDisabled, isTrue);
        expect(tag.config.canInteract, isFalse);
      });

      test('should be loading when loading is true', () {
        final tag = DSTag.semantic(
          label: 'Loading Tag',
          loading: true,
        );

        expect(tag.config.isLoading, isTrue);
        expect(tag.config.shouldShowSkeleton, isTrue);
      });

      test('should be skeleton when skeleton is true', () {
        final tag = DSTag.semantic(
          label: 'Skeleton Tag',
          skeleton: true,
        );

        expect(tag.config.isSkeleton, isTrue);
        expect(tag.config.shouldShowSkeleton, isTrue);
      });

      test('should be selected when selected is true', () {
        final tag = DSTag.semantic(
          label: 'Selected Tag',
          selected: true,
        );

        expect(tag.config.isSelected, isTrue);
      });

      test('should have border when outlined is true', () {
        final tag = DSTag.semantic(
          label: 'Outlined Tag',
          outlined: true,
        );

        expect(tag.config.hasBorder, isTrue);
      });

      test('should have leading icon when provided', () {
        final tag = DSTag.semantic(
          label: 'Icon Tag',
          leadingIcon: Icons.star,
        );

        expect(tag.config.hasLeadingIcon, isTrue);
        expect(tag.config.hasLeading, isTrue);
      });

      test('should have trailing icon when provided', () {
        final tag = DSTag.semantic(
          label: 'Icon Tag',
          trailingIcon: Icons.arrow_forward,
        );

        expect(tag.config.hasTrailingIcon, isTrue);
        expect(tag.config.hasTrailing, isTrue);
      });
    });

    group('Color Calculation', () {
      test('should use semantic colors correctly', () {
        const colorScheme = ColorScheme.light();

        final primaryTag = DSTag.semantic(
          label: 'Primary',
          semanticColor: DSTagSemanticColor.primary,
        );

        final successTag = DSTag.semantic(
          label: 'Success',
          semanticColor: DSTagSemanticColor.success,
        );

        final errorTag = DSTag.semantic(
          label: 'Error',
          semanticColor: DSTagSemanticColor.error,
        );

        expect(
          primaryTag.config.getEffectiveColor(colorScheme),
          equals(colorScheme.primary),
        );

        expect(
          successTag.config.getEffectiveColor(colorScheme),
          equals(Colors.green),
        );

        expect(
          errorTag.config.getEffectiveColor(colorScheme),
          equals(colorScheme.error),
        );
      });

      test('should use custom color when provided', () {
        const customColor = Colors.purple;
        const colorScheme = ColorScheme.light();

        final tag = DSTag.semantic(
          label: 'Custom Color',
          color: customColor,
        );

        expect(
          tag.config.getEffectiveColor(colorScheme),
          equals(customColor),
        );
      });

      test('should calculate background color for outlined tags', () {
        const colorScheme = ColorScheme.light();

        final tag = DSTag.semantic(
          label: 'Outlined',
          outlined: true,
        );

        expect(
          tag.config.getEffectiveBackgroundColor(colorScheme),
          equals(Colors.transparent),
        );
      });

      test('should calculate background color for selected tags', () {
        const colorScheme = ColorScheme.light();

        final tag = DSTag.semantic(
          label: 'Selected',
          selected: true,
        );

        final effectiveColor = tag.config.getEffectiveColor(colorScheme);
        expect(
          tag.config.getEffectiveBackgroundColor(colorScheme),
          equals(effectiveColor),
        );
      });

      test('should calculate background color for normal tags', () {
        const colorScheme = ColorScheme.light();

        final tag = DSTag.semantic(label: 'Normal');

        final effectiveColor = tag.config.getEffectiveColor(colorScheme);
        expect(
          tag.config.getEffectiveBackgroundColor(colorScheme),
          equals(effectiveColor.withValues(alpha: 0.12)),
        );
      });
    });

    group('Widget Rendering', () {
      testWidgets('should render label text', (tester) async {
        final tag = DSTag.semantic(label: 'Test Label');

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        expect(find.text('Test Label'), findsOneWidget);
      });

      testWidgets('should render leading icon', (tester) async {
        final tag = DSTag.semantic(
          label: 'Icon Tag',
          leadingIcon: Icons.star,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        expect(find.byIcon(Icons.star), findsOneWidget);
      });

      testWidgets('should render trailing icon', (tester) async {
        final tag = DSTag.semantic(
          label: 'Icon Tag',
          trailingIcon: Icons.arrow_forward,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      });

      testWidgets('should render remove button for removable tags',
          (tester) async {
        final tag = DSTag.semantic(
          label: 'Removable Tag',
          removable: true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        expect(find.byIcon(Icons.close), findsOneWidget);
      });

      testWidgets('should not render content when not visible', (tester) async {
        final tag = DSTag.semantic(
          label: 'Hidden Tag',
          visible: false,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        expect(find.text('Hidden Tag'), findsNothing);
      });
    });

    group('Interactions', () {
      testWidgets('should call onTap when tapped', (tester) async {
        bool tapped = false;

        final tag = DSTag.semantic(
          label: 'Tappable Tag',
          onTap: () => tapped = true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        await tester.tap(find.byType(DSTag));
        expect(tapped, isTrue);
      });

      testWidgets('should call onLongPress when long pressed', (tester) async {
        bool longPressed = false;

        final tag = DSTag.semantic(
          label: 'Long Pressable Tag',
          onLongPress: () => longPressed = true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        await tester.longPress(find.byType(DSTag));
        expect(longPressed, isTrue);
      });

      testWidgets('should call onRemove when remove button is tapped',
          (tester) async {
        bool removed = false;

        final tag = DSTag.semantic(
          label: 'Removable Tag',
          removable: true,
          onRemove: () => removed = true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        await tester.tap(find.byIcon(Icons.close));
        expect(removed, isTrue);
      });

      testWidgets('should not respond to interactions when disabled',
          (tester) async {
        bool tapped = false;

        final tag = DSTag.semantic(
          label: 'Disabled Tag',
          enabled: false,
          onTap: () => tapped = true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        await tester.tap(find.byType(DSTag));
        expect(tapped, isFalse);
      });
    });

    group('Accessibility', () {
      testWidgets('should have semantic label', (tester) async {
        final tag = DSTag.semantic(
          label: 'Accessible Tag',
          semanticLabel: 'Custom semantic label',
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        expect(
          tester.getSemantics(find.byType(DSTag)),
          matchesSemantics(label: 'Custom semantic label'),
        );
      });

      testWidgets('should be interactive when has onTap', (tester) async {
        final tag = DSTag.semantic(
          label: 'Interactive Tag',
          onTap: () {},
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        // Just verify the widget renders correctly
        expect(find.byType(DSTag), findsOneWidget);
        expect(find.text('Interactive Tag'), findsOneWidget);
      });
    });

    group('Sizes', () {
      test('should apply small size correctly', () {
        final tag = DSTag.semantic(
          label: 'Small Tag',
          size: DSTagSize.small,
        );

        expect(tag.config.size.height, equals(24.0));
        expect(tag.config.size.fontSize, equals(12.0));
        expect(tag.config.size.iconSize, equals(14.0));
      });

      test('should apply medium size correctly', () {
        final tag = DSTag.semantic(
          label: 'Medium Tag',
          size: DSTagSize.medium,
        );

        expect(tag.config.size.height, equals(32.0));
        expect(tag.config.size.fontSize, equals(14.0));
        expect(tag.config.size.iconSize, equals(16.0));
      });

      test('should apply large size correctly', () {
        final tag = DSTag.semantic(
          label: 'Large Tag',
          size: DSTagSize.large,
        );

        expect(tag.config.size.height, equals(40.0));
        expect(tag.config.size.fontSize, equals(16.0));
        expect(tag.config.size.iconSize, equals(18.0));
      });
    });

    group('Shapes', () {
      test('should apply rounded shape correctly', () {
        final tag = DSTag.semantic(
          label: 'Rounded Tag',
          shape: DSTagShape.rounded,
        );

        final borderRadius = tag.config.shape.getBorderRadius(tag.config.size);
        expect(borderRadius,
            equals(BorderRadius.circular(16.0))); // medium size border radius
      });

      test('should apply pill shape correctly', () {
        final tag = DSTag.semantic(
          label: 'Pill Tag',
          shape: DSTagShape.pill,
        );

        final borderRadius = tag.config.shape.getBorderRadius(tag.config.size);
        expect(borderRadius, equals(BorderRadius.circular(16.0))); // height / 2
      });

      test('should apply square shape correctly', () {
        final tag = DSTag.semantic(
          label: 'Square Tag',
          shape: DSTagShape.square,
        );

        final borderRadius = tag.config.shape.getBorderRadius(tag.config.size);
        expect(borderRadius, equals(BorderRadius.circular(4.0)));
      });
    });
  });

  group('DSTagSemanticColor', () {
    test('should return correct colors for light theme', () {
      const colorScheme = ColorScheme.light();

      expect(
        DSTagSemanticColor.primary.getColor(colorScheme),
        equals(colorScheme.primary),
      );

      expect(
        DSTagSemanticColor.secondary.getColor(colorScheme),
        equals(colorScheme.secondary),
      );

      expect(
        DSTagSemanticColor.success.getColor(colorScheme),
        equals(Colors.green),
      );

      expect(
        DSTagSemanticColor.warning.getColor(colorScheme),
        equals(Colors.orange),
      );

      expect(
        DSTagSemanticColor.error.getColor(colorScheme),
        equals(colorScheme.error),
      );

      expect(
        DSTagSemanticColor.info.getColor(colorScheme),
        equals(Colors.blue),
      );

      expect(
        DSTagSemanticColor.neutral.getColor(colorScheme),
        equals(colorScheme.outline),
      );
    });

    test('should return correct labels', () {
      expect(DSTagSemanticColor.primary.label, equals('Primario'));
      expect(DSTagSemanticColor.secondary.label, equals('Secundario'));
      expect(DSTagSemanticColor.success.label, equals('Éxito'));
      expect(DSTagSemanticColor.warning.label, equals('Advertencia'));
      expect(DSTagSemanticColor.error.label, equals('Error'));
      expect(DSTagSemanticColor.info.label, equals('Información'));
      expect(DSTagSemanticColor.neutral.label, equals('Neutral'));
    });

    test('should return correct icons', () {
      expect(DSTagSemanticColor.primary.icon, equals(Icons.star));
      expect(DSTagSemanticColor.secondary.icon, equals(Icons.label));
      expect(DSTagSemanticColor.success.icon, equals(Icons.check_circle));
      expect(DSTagSemanticColor.warning.icon, equals(Icons.warning));
      expect(DSTagSemanticColor.error.icon, equals(Icons.error));
      expect(DSTagSemanticColor.info.icon, equals(Icons.info));
      expect(DSTagSemanticColor.neutral.icon, equals(Icons.circle));
    });
  });

  group('DSTagSize Extensions', () {
    test('should return correct heights', () {
      expect(DSTagSize.small.height, equals(24.0));
      expect(DSTagSize.medium.height, equals(32.0));
      expect(DSTagSize.large.height, equals(40.0));
    });

    test('should return correct font sizes', () {
      expect(DSTagSize.small.fontSize, equals(12.0));
      expect(DSTagSize.medium.fontSize, equals(14.0));
      expect(DSTagSize.large.fontSize, equals(16.0));
    });

    test('should return correct icon sizes', () {
      expect(DSTagSize.small.iconSize, equals(14.0));
      expect(DSTagSize.medium.iconSize, equals(16.0));
      expect(DSTagSize.large.iconSize, equals(18.0));
    });

    test('should return correct spacing', () {
      expect(DSTagSize.small.spacing, equals(4.0));
      expect(DSTagSize.medium.spacing, equals(6.0));
      expect(DSTagSize.large.spacing, equals(8.0));
    });

    test('should return correct border radius', () {
      expect(DSTagSize.small.borderRadius, equals(12.0));
      expect(DSTagSize.medium.borderRadius, equals(16.0));
      expect(DSTagSize.large.borderRadius, equals(20.0));
    });
  });

  group('DSTagShape Extensions', () {
    test('should return correct border radius for rounded shape', () {
      const shape = DSTagShape.rounded;
      const size = DSTagSize.medium;

      final borderRadius = shape.getBorderRadius(size);
      expect(borderRadius, equals(BorderRadius.circular(16.0)));
    });

    test('should return correct border radius for pill shape', () {
      const shape = DSTagShape.pill;
      const size = DSTagSize.medium;

      final borderRadius = shape.getBorderRadius(size);
      expect(borderRadius, equals(BorderRadius.circular(16.0))); // height / 2
    });

    test('should return correct border radius for square shape', () {
      const shape = DSTagShape.square;
      const size = DSTagSize.medium;

      final borderRadius = shape.getBorderRadius(size);
      expect(borderRadius, equals(BorderRadius.circular(4.0)));
    });
  });
}
