import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSTag Golden Tests', () {
    testWidgets('should render default semantic tag correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: DSTag.semantic(
              label: 'Default Tag',
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_tag_default.png'),
      );
    });

    testWidgets('should render all semantic colors correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DSTag.semantic(
                  label: 'Primary',
                  semanticColor: DSTagSemanticColor.primary,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Secondary',
                  semanticColor: DSTagSemanticColor.secondary,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Success',
                  semanticColor: DSTagSemanticColor.success,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Warning',
                  semanticColor: DSTagSemanticColor.warning,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Error',
                  semanticColor: DSTagSemanticColor.error,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Info',
                  semanticColor: DSTagSemanticColor.info,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Neutral',
                  semanticColor: DSTagSemanticColor.neutral,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_tag_semantic_colors.png'),
      );
    });

    testWidgets('should render all sizes correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DSTag.semantic(
                  label: 'Small Tag',
                  size: DSTagSize.small,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Medium Tag',
                  size: DSTagSize.medium,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Large Tag',
                  size: DSTagSize.large,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_tag_sizes.png'),
      );
    });

    testWidgets('should render all shapes correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DSTag.semantic(
                  label: 'Rounded Tag',
                  shape: DSTagShape.rounded,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Pill Tag',
                  shape: DSTagShape.pill,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Square Tag',
                  shape: DSTagShape.square,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_tag_shapes.png'),
      );
    });

    testWidgets('should render outlined tags correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DSTag.semantic(
                  label: 'Filled Primary',
                  semanticColor: DSTagSemanticColor.primary,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Outlined Primary',
                  semanticColor: DSTagSemanticColor.primary,
                  outlined: true,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Filled Success',
                  semanticColor: DSTagSemanticColor.success,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Outlined Success',
                  semanticColor: DSTagSemanticColor.success,
                  outlined: true,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_tag_outlined.png'),
      );
    });

    testWidgets('should render tags with icons correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DSTag.semantic(
                  label: 'Leading Icon',
                  leadingIcon: Icons.star,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Trailing Icon',
                  trailingIcon: Icons.arrow_forward,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Both Icons',
                  leadingIcon: Icons.star,
                  trailingIcon: Icons.arrow_forward,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Removable',
                  removable: true,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_tag_icons.png'),
      );
    });

    testWidgets('should render selected state correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DSTag.semantic(
                  label: 'Default State',
                  semanticColor: DSTagSemanticColor.primary,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Selected State',
                  semanticColor: DSTagSemanticColor.primary,
                  selected: true,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_tag_selected.png'),
      );
    });

    testWidgets('should render disabled state correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DSTag.semantic(
                  label: 'Enabled Tag',
                  semanticColor: DSTagSemanticColor.primary,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Disabled Tag',
                  semanticColor: DSTagSemanticColor.primary,
                  enabled: false,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_tag_disabled.png'),
      );
    });

    testWidgets('should render skeleton state correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DSTag.semantic(
                  label: 'Normal Tag',
                  semanticColor: DSTagSemanticColor.primary,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Skeleton Tag',
                  semanticColor: DSTagSemanticColor.primary,
                  skeleton: true,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Loading Tag',
                  semanticColor: DSTagSemanticColor.primary,
                  loading: true,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_tag_skeleton.png'),
      );
    });

    testWidgets('should render dark theme correctly', (tester) async {
      final widget = MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DSTag.semantic(
                  label: 'Primary Dark',
                  semanticColor: DSTagSemanticColor.primary,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Success Dark',
                  semanticColor: DSTagSemanticColor.success,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Error Dark',
                  semanticColor: DSTagSemanticColor.error,
                ),
                const SizedBox(height: 8),
                DSTag.semantic(
                  label: 'Outlined Dark',
                  semanticColor: DSTagSemanticColor.primary,
                  outlined: true,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_tag_dark_theme.png'),
      );
    });

    testWidgets('should render complex combinations correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                DSTag.semantic(
                  label: 'Small Selected',
                  size: DSTagSize.small,
                  semanticColor: DSTagSemanticColor.primary,
                  selected: true,
                ),
                DSTag.semantic(
                  label: 'Large Outlined',
                  size: DSTagSize.large,
                  semanticColor: DSTagSemanticColor.success,
                  outlined: true,
                  leadingIcon: Icons.check_circle,
                ),
                DSTag.semantic(
                  label: 'Pill Removable',
                  shape: DSTagShape.pill,
                  semanticColor: DSTagSemanticColor.warning,
                  removable: true,
                ),
                DSTag.semantic(
                  label: 'Square Icon',
                  shape: DSTagShape.square,
                  semanticColor: DSTagSemanticColor.info,
                  leadingIcon: Icons.info,
                  trailingIcon: Icons.arrow_forward,
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/app_tag_combinations.png'),
      );
    });
  });
}
