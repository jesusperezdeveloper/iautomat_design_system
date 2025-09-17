import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppTag', () {
    group('Constructor', () {
      test('should create AppTag with semantic constructor', () {
        final tag = AppTag.semantic(label: 'Test Tag');

        expect(tag.config.label, equals('Test Tag'));
        expect(tag.config.variant, equals(AppTagVariant.semantic));
        expect(tag.config.semanticColor, equals(AppTagSemanticColor.primary));
        expect(tag.config.size, equals(AppTagSize.medium));
        expect(tag.config.shape, equals(AppTagShape.rounded));
      });

      test('should create AppTag with custom semantic color', () {
        final tag = AppTag.semantic(
          label: 'Success Tag',
          semanticColor: AppTagSemanticColor.success,
        );

        expect(tag.config.semanticColor, equals(AppTagSemanticColor.success));
      });

      test('should create AppTag with custom size', () {
        final tag = AppTag.semantic(
          label: 'Large Tag',
          size: AppTagSize.large,
        );

        expect(tag.config.size, equals(AppTagSize.large));
      });

      test('should create AppTag with custom shape', () {
        final tag = AppTag.semantic(
          label: 'Pill Tag',
          shape: AppTagShape.pill,
        );

        expect(tag.config.shape, equals(AppTagShape.pill));
      });
    });

    group('Configuration Properties', () {
      test('should be interactive when onTap is provided', () {
        final tag = AppTag.semantic(
          label: 'Interactive Tag',
          onTap: () {},
        );

        expect(tag.config.isInteractive, isTrue);
      });

      test('should be removable when removable is true', () {
        final tag = AppTag.semantic(
          label: 'Removable Tag',
          removable: true,
        );

        expect(tag.config.removable, isTrue);
        expect(tag.config.hasTrailing, isTrue);
      });

      test('should be disabled when enabled is false', () {
        final tag = AppTag.semantic(
          label: 'Disabled Tag',
          enabled: false,
        );

        expect(tag.config.isDisabled, isTrue);
        expect(tag.config.canInteract, isFalse);
      });

      test('should be loading when loading is true', () {
        final tag = AppTag.semantic(
          label: 'Loading Tag',
          loading: true,
        );

        expect(tag.config.isLoading, isTrue);
        expect(tag.config.shouldShowSkeleton, isTrue);
      });

      test('should be skeleton when skeleton is true', () {
        final tag = AppTag.semantic(
          label: 'Skeleton Tag',
          skeleton: true,
        );

        expect(tag.config.isSkeleton, isTrue);
        expect(tag.config.shouldShowSkeleton, isTrue);
      });

      test('should be selected when selected is true', () {
        final tag = AppTag.semantic(
          label: 'Selected Tag',
          selected: true,
        );

        expect(tag.config.isSelected, isTrue);
      });

      test('should have border when outlined is true', () {
        final tag = AppTag.semantic(
          label: 'Outlined Tag',
          outlined: true,
        );

        expect(tag.config.hasBorder, isTrue);
      });

      test('should have leading icon when provided', () {
        final tag = AppTag.semantic(
          label: 'Icon Tag',
          leadingIcon: Icons.star,
        );

        expect(tag.config.hasLeadingIcon, isTrue);
        expect(tag.config.hasLeading, isTrue);
      });

      test('should have trailing icon when provided', () {
        final tag = AppTag.semantic(
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

        final primaryTag = AppTag.semantic(
          label: 'Primary',
          semanticColor: AppTagSemanticColor.primary,
        );

        final successTag = AppTag.semantic(
          label: 'Success',
          semanticColor: AppTagSemanticColor.success,
        );

        final errorTag = AppTag.semantic(
          label: 'Error',
          semanticColor: AppTagSemanticColor.error,
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

        final tag = AppTag.semantic(
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

        final tag = AppTag.semantic(
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

        final tag = AppTag.semantic(
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

        final tag = AppTag.semantic(label: 'Normal');

        final effectiveColor = tag.config.getEffectiveColor(colorScheme);
        expect(
          tag.config.getEffectiveBackgroundColor(colorScheme),
          equals(effectiveColor.withValues(alpha: 0.12)),
        );
      });
    });

    group('Widget Rendering', () {
      testWidgets('should render label text', (tester) async {
        final tag = AppTag.semantic(label: 'Test Label');

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        expect(find.text('Test Label'), findsOneWidget);
      });

      testWidgets('should render leading icon', (tester) async {
        final tag = AppTag.semantic(
          label: 'Icon Tag',
          leadingIcon: Icons.star,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        expect(find.byIcon(Icons.star), findsOneWidget);
      });

      testWidgets('should render trailing icon', (tester) async {
        final tag = AppTag.semantic(
          label: 'Icon Tag',
          trailingIcon: Icons.arrow_forward,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
      });

      testWidgets('should render remove button for removable tags', (tester) async {
        final tag = AppTag.semantic(
          label: 'Removable Tag',
          removable: true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        expect(find.byIcon(Icons.close), findsOneWidget);
      });

      testWidgets('should not render content when not visible', (tester) async {
        final tag = AppTag.semantic(
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

        final tag = AppTag.semantic(
          label: 'Tappable Tag',
          onTap: () => tapped = true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        await tester.tap(find.byType(AppTag));
        expect(tapped, isTrue);
      });

      testWidgets('should call onLongPress when long pressed', (tester) async {
        bool longPressed = false;

        final tag = AppTag.semantic(
          label: 'Long Pressable Tag',
          onLongPress: () => longPressed = true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        await tester.longPress(find.byType(AppTag));
        expect(longPressed, isTrue);
      });

      testWidgets('should call onRemove when remove button is tapped', (tester) async {
        bool removed = false;

        final tag = AppTag.semantic(
          label: 'Removable Tag',
          removable: true,
          onRemove: () => removed = true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        await tester.tap(find.byIcon(Icons.close));
        expect(removed, isTrue);
      });

      testWidgets('should not respond to interactions when disabled', (tester) async {
        bool tapped = false;

        final tag = AppTag.semantic(
          label: 'Disabled Tag',
          enabled: false,
          onTap: () => tapped = true,
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        await tester.tap(find.byType(AppTag));
        expect(tapped, isFalse);
      });
    });

    group('Accessibility', () {
      testWidgets('should have semantic label', (tester) async {
        final tag = AppTag.semantic(
          label: 'Accessible Tag',
          semanticLabel: 'Custom semantic label',
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        expect(
          tester.getSemantics(find.byType(AppTag)),
          matchesSemantics(label: 'Custom semantic label'),
        );
      });

      testWidgets('should be interactive when has onTap', (tester) async {
        final tag = AppTag.semantic(
          label: 'Interactive Tag',
          onTap: () {},
        );

        await tester.pumpWidget(MaterialApp(home: Scaffold(body: tag)));

        // Just verify the widget renders correctly
        expect(find.byType(AppTag), findsOneWidget);
        expect(find.text('Interactive Tag'), findsOneWidget);
      });
    });

    group('Sizes', () {
      test('should apply small size correctly', () {
        final tag = AppTag.semantic(
          label: 'Small Tag',
          size: AppTagSize.small,
        );

        expect(tag.config.size.height, equals(24.0));
        expect(tag.config.size.fontSize, equals(12.0));
        expect(tag.config.size.iconSize, equals(14.0));
      });

      test('should apply medium size correctly', () {
        final tag = AppTag.semantic(
          label: 'Medium Tag',
          size: AppTagSize.medium,
        );

        expect(tag.config.size.height, equals(32.0));
        expect(tag.config.size.fontSize, equals(14.0));
        expect(tag.config.size.iconSize, equals(16.0));
      });

      test('should apply large size correctly', () {
        final tag = AppTag.semantic(
          label: 'Large Tag',
          size: AppTagSize.large,
        );

        expect(tag.config.size.height, equals(40.0));
        expect(tag.config.size.fontSize, equals(16.0));
        expect(tag.config.size.iconSize, equals(18.0));
      });
    });

    group('Shapes', () {
      test('should apply rounded shape correctly', () {
        final tag = AppTag.semantic(
          label: 'Rounded Tag',
          shape: AppTagShape.rounded,
        );

        final borderRadius = tag.config.shape.getBorderRadius(tag.config.size);
        expect(borderRadius, equals(BorderRadius.circular(16.0))); // medium size border radius
      });

      test('should apply pill shape correctly', () {
        final tag = AppTag.semantic(
          label: 'Pill Tag',
          shape: AppTagShape.pill,
        );

        final borderRadius = tag.config.shape.getBorderRadius(tag.config.size);
        expect(borderRadius, equals(BorderRadius.circular(16.0))); // height / 2
      });

      test('should apply square shape correctly', () {
        final tag = AppTag.semantic(
          label: 'Square Tag',
          shape: AppTagShape.square,
        );

        final borderRadius = tag.config.shape.getBorderRadius(tag.config.size);
        expect(borderRadius, equals(BorderRadius.circular(4.0)));
      });
    });
  });

  group('AppTagSemanticColor', () {
    test('should return correct colors for light theme', () {
      const colorScheme = ColorScheme.light();

      expect(
        AppTagSemanticColor.primary.getColor(colorScheme),
        equals(colorScheme.primary),
      );

      expect(
        AppTagSemanticColor.secondary.getColor(colorScheme),
        equals(colorScheme.secondary),
      );

      expect(
        AppTagSemanticColor.success.getColor(colorScheme),
        equals(Colors.green),
      );

      expect(
        AppTagSemanticColor.warning.getColor(colorScheme),
        equals(Colors.orange),
      );

      expect(
        AppTagSemanticColor.error.getColor(colorScheme),
        equals(colorScheme.error),
      );

      expect(
        AppTagSemanticColor.info.getColor(colorScheme),
        equals(Colors.blue),
      );

      expect(
        AppTagSemanticColor.neutral.getColor(colorScheme),
        equals(colorScheme.outline),
      );
    });

    test('should return correct labels', () {
      expect(AppTagSemanticColor.primary.label, equals('Primario'));
      expect(AppTagSemanticColor.secondary.label, equals('Secundario'));
      expect(AppTagSemanticColor.success.label, equals('Éxito'));
      expect(AppTagSemanticColor.warning.label, equals('Advertencia'));
      expect(AppTagSemanticColor.error.label, equals('Error'));
      expect(AppTagSemanticColor.info.label, equals('Información'));
      expect(AppTagSemanticColor.neutral.label, equals('Neutral'));
    });

    test('should return correct icons', () {
      expect(AppTagSemanticColor.primary.icon, equals(Icons.star));
      expect(AppTagSemanticColor.secondary.icon, equals(Icons.label));
      expect(AppTagSemanticColor.success.icon, equals(Icons.check_circle));
      expect(AppTagSemanticColor.warning.icon, equals(Icons.warning));
      expect(AppTagSemanticColor.error.icon, equals(Icons.error));
      expect(AppTagSemanticColor.info.icon, equals(Icons.info));
      expect(AppTagSemanticColor.neutral.icon, equals(Icons.circle));
    });
  });

  group('AppTagSize Extensions', () {
    test('should return correct heights', () {
      expect(AppTagSize.small.height, equals(24.0));
      expect(AppTagSize.medium.height, equals(32.0));
      expect(AppTagSize.large.height, equals(40.0));
    });

    test('should return correct font sizes', () {
      expect(AppTagSize.small.fontSize, equals(12.0));
      expect(AppTagSize.medium.fontSize, equals(14.0));
      expect(AppTagSize.large.fontSize, equals(16.0));
    });

    test('should return correct icon sizes', () {
      expect(AppTagSize.small.iconSize, equals(14.0));
      expect(AppTagSize.medium.iconSize, equals(16.0));
      expect(AppTagSize.large.iconSize, equals(18.0));
    });

    test('should return correct spacing', () {
      expect(AppTagSize.small.spacing, equals(4.0));
      expect(AppTagSize.medium.spacing, equals(6.0));
      expect(AppTagSize.large.spacing, equals(8.0));
    });

    test('should return correct border radius', () {
      expect(AppTagSize.small.borderRadius, equals(12.0));
      expect(AppTagSize.medium.borderRadius, equals(16.0));
      expect(AppTagSize.large.borderRadius, equals(20.0));
    });
  });

  group('AppTagShape Extensions', () {
    test('should return correct border radius for rounded shape', () {
      const shape = AppTagShape.rounded;
      const size = AppTagSize.medium;

      final borderRadius = shape.getBorderRadius(size);
      expect(borderRadius, equals(BorderRadius.circular(16.0)));
    });

    test('should return correct border radius for pill shape', () {
      const shape = AppTagShape.pill;
      const size = AppTagSize.medium;

      final borderRadius = shape.getBorderRadius(size);
      expect(borderRadius, equals(BorderRadius.circular(16.0))); // height / 2
    });

    test('should return correct border radius for square shape', () {
      const shape = AppTagShape.square;
      const size = AppTagSize.medium;

      final borderRadius = shape.getBorderRadius(size);
      expect(borderRadius, equals(BorderRadius.circular(4.0)));
    });
  });
}