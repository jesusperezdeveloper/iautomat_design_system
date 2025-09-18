import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppTag Golden Tests', () {
    testWidgets('should render default semantic tag correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: AppTag.semantic(
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
                AppTag.semantic(
                  label: 'Primary',
                  semanticColor: AppTagSemanticColor.primary,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Secondary',
                  semanticColor: AppTagSemanticColor.secondary,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Success',
                  semanticColor: AppTagSemanticColor.success,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Warning',
                  semanticColor: AppTagSemanticColor.warning,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Error',
                  semanticColor: AppTagSemanticColor.error,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Info',
                  semanticColor: AppTagSemanticColor.info,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Neutral',
                  semanticColor: AppTagSemanticColor.neutral,
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
                AppTag.semantic(
                  label: 'Small Tag',
                  size: AppTagSize.small,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Medium Tag',
                  size: AppTagSize.medium,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Large Tag',
                  size: AppTagSize.large,
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
                AppTag.semantic(
                  label: 'Rounded Tag',
                  shape: AppTagShape.rounded,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Pill Tag',
                  shape: AppTagShape.pill,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Square Tag',
                  shape: AppTagShape.square,
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
                AppTag.semantic(
                  label: 'Filled Primary',
                  semanticColor: AppTagSemanticColor.primary,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Outlined Primary',
                  semanticColor: AppTagSemanticColor.primary,
                  outlined: true,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Filled Success',
                  semanticColor: AppTagSemanticColor.success,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Outlined Success',
                  semanticColor: AppTagSemanticColor.success,
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
                AppTag.semantic(
                  label: 'Leading Icon',
                  leadingIcon: Icons.star,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Trailing Icon',
                  trailingIcon: Icons.arrow_forward,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Both Icons',
                  leadingIcon: Icons.star,
                  trailingIcon: Icons.arrow_forward,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
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
                AppTag.semantic(
                  label: 'Default State',
                  semanticColor: AppTagSemanticColor.primary,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Selected State',
                  semanticColor: AppTagSemanticColor.primary,
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
                AppTag.semantic(
                  label: 'Enabled Tag',
                  semanticColor: AppTagSemanticColor.primary,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Disabled Tag',
                  semanticColor: AppTagSemanticColor.primary,
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
                AppTag.semantic(
                  label: 'Normal Tag',
                  semanticColor: AppTagSemanticColor.primary,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Skeleton Tag',
                  semanticColor: AppTagSemanticColor.primary,
                  skeleton: true,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Loading Tag',
                  semanticColor: AppTagSemanticColor.primary,
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
                AppTag.semantic(
                  label: 'Primary Dark',
                  semanticColor: AppTagSemanticColor.primary,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Success Dark',
                  semanticColor: AppTagSemanticColor.success,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Error Dark',
                  semanticColor: AppTagSemanticColor.error,
                ),
                const SizedBox(height: 8),
                AppTag.semantic(
                  label: 'Outlined Dark',
                  semanticColor: AppTagSemanticColor.primary,
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
                AppTag.semantic(
                  label: 'Small Selected',
                  size: AppTagSize.small,
                  semanticColor: AppTagSemanticColor.primary,
                  selected: true,
                ),
                AppTag.semantic(
                  label: 'Large Outlined',
                  size: AppTagSize.large,
                  semanticColor: AppTagSemanticColor.success,
                  outlined: true,
                  leadingIcon: Icons.check_circle,
                ),
                AppTag.semantic(
                  label: 'Pill Removable',
                  shape: AppTagShape.pill,
                  semanticColor: AppTagSemanticColor.warning,
                  removable: true,
                ),
                AppTag.semantic(
                  label: 'Square Icon',
                  shape: AppTagShape.square,
                  semanticColor: AppTagSemanticColor.info,
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
