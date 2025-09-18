import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppChip Golden Tests', () {
    testWidgets('Basic chip variants', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                AppChip.input(
                  label: 'Input Chip',
                  selected: false,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                AppChip.filter(
                  label: 'Filter Chip',
                  selected: true,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                AppChip.choice(
                  label: 'Choice Chip',
                  selected: false,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                AppChip.assist(
                  label: 'Assist Chip',
                  onSelected: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('chip_variants.png'),
      );
    });

    testWidgets('Chip with avatars and icons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                AppChip.input(
                  label: 'With Avatar',
                  avatar: const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.blue,
                    child: Text('A', style: TextStyle(fontSize: 12)),
                  ),
                  selected: false,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                AppChip.filter(
                  label: 'With Icon',
                  icon: Icons.star,
                  selected: true,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                AppChip.choice(
                  label: 'Deletable',
                  deletable: true,
                  selected: false,
                  onSelected: (selected) {},
                  onDeleted: () {},
                ),
                const SizedBox(height: 8),
                AppChip.assist(
                  label: 'Icon + Action',
                  icon: Icons.add,
                  onSelected: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('chip_with_decorations.png'),
      );
    });

    testWidgets('Chip sizes', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                AppChip.filter(
                  label: 'Small',
                  selected: true,
                  onSelected: (selected) {},
                  size: AppChipSize.small,
                ),
                const SizedBox(height: 8),
                AppChip.filter(
                  label: 'Medium',
                  selected: true,
                  onSelected: (selected) {},
                  size: AppChipSize.medium,
                ),
                const SizedBox(height: 8),
                AppChip.filter(
                  label: 'Large',
                  selected: true,
                  onSelected: (selected) {},
                  size: AppChipSize.large,
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('chip_sizes.png'),
      );
    });

    testWidgets('Chip shapes', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                AppChip.choice(
                  label: 'Rounded',
                  selected: true,
                  onSelected: (selected) {},
                  shape: AppChipShape.rounded,
                ),
                const SizedBox(height: 8),
                AppChip.choice(
                  label: 'Circular',
                  selected: true,
                  onSelected: (selected) {},
                  shape: AppChipShape.circular,
                ),
                const SizedBox(height: 8),
                AppChip.choice(
                  label: 'Stadium',
                  selected: true,
                  onSelected: (selected) {},
                  shape: AppChipShape.stadium,
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('chip_shapes.png'),
      );
    });

    testWidgets('Chip states - enabled vs disabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                AppChip.filter(
                  label: 'Enabled',
                  selected: true,
                  onSelected: (selected) {},
                  enabled: true,
                ),
                const SizedBox(height: 8),
                AppChip.filter(
                  label: 'Disabled',
                  selected: true,
                  onSelected: (selected) {},
                  enabled: false,
                ),
                const SizedBox(height: 8),
                AppChip.input(
                  label: 'Enabled Input',
                  selected: false,
                  onSelected: (selected) {},
                  enabled: true,
                ),
                const SizedBox(height: 8),
                AppChip.input(
                  label: 'Disabled Input',
                  selected: false,
                  onSelected: (selected) {},
                  enabled: false,
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('chip_states_enabled_disabled.png'),
      );
    });

    testWidgets('Chip with loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                AppChip.filter(
                  label: 'Loading',
                  selected: true,
                  onSelected: (selected) {},
                  state: AppChipState.loading,
                ),
                const SizedBox(height: 8),
                AppChip.assist(
                  label: 'Loading Assist',
                  onSelected: (selected) {},
                  state: AppChipState.loading,
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('chip_loading_state.png'),
      );
    });

    testWidgets('Chip with skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                AppChip.filter(
                  label: 'Skeleton',
                  selected: false,
                  onSelected: (selected) {},
                  state: AppChipState.skeleton,
                ),
                const SizedBox(height: 8),
                AppChip.choice(
                  label: 'Skeleton Choice',
                  selected: false,
                  onSelected: (selected) {},
                  state: AppChipState.skeleton,
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('chip_skeleton_state.png'),
      );
    });

    testWidgets('Chip with custom colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                AppChip.choice(
                  label: 'Custom Selected',
                  selected: true,
                  onSelected: (selected) {},
                  color: Colors.green,
                ),
                const SizedBox(height: 8),
                AppChip.choice(
                  label: 'Custom Unselected',
                  selected: false,
                  onSelected: (selected) {},
                  backgroundColor: Colors.orange.shade100,
                ),
                const SizedBox(height: 8),
                AppChip.filter(
                  label: 'Custom Color',
                  selected: false,
                  onSelected: (selected) {},
                  color: Colors.purple,
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('chip_custom_colors.png'),
      );
    });

    testWidgets('Chip with custom padding and margin', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                AppChip.filter(
                  label: 'Default Padding',
                  selected: true,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                AppChip.filter(
                  label: 'Custom Padding',
                  selected: true,
                  onSelected: (selected) {},
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
                const SizedBox(height: 8),
                AppChip.choice(
                  label: 'With Margin',
                  selected: false,
                  onSelected: (selected) {},
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('chip_custom_padding.png'),
      );
    });

    testWidgets('Dark theme chips', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Column(
              children: [
                AppChip.input(
                  label: 'Dark Input',
                  selected: false,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                AppChip.filter(
                  label: 'Dark Filter',
                  selected: true,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                AppChip.choice(
                  label: 'Dark Choice',
                  selected: true,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                AppChip.assist(
                  label: 'Dark Assist',
                  onSelected: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('chip_dark_theme.png'),
      );
    });

    testWidgets('Chip complex combinations', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                AppChip.filter(
                  label: 'Complex 1',
                  icon: Icons.star,
                  deletable: true,
                  selected: true,
                  onSelected: (selected) {},
                  onDeleted: () {},
                  size: AppChipSize.large,
                  shape: AppChipShape.circular,
                ),
                const SizedBox(height: 8),
                AppChip.input(
                  label: 'Complex 2',
                  avatar: const CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text('B', style: TextStyle(fontSize: 10)),
                  ),
                  deletable: true,
                  selected: false,
                  onSelected: (selected) {},
                  onDeleted: () {},
                  size: AppChipSize.small,
                ),
                const SizedBox(height: 8),
                AppChip.choice(
                  label: 'Complex 3',
                  icon: Icons.check,
                  selected: true,
                  onSelected: (selected) {},
                  color: Colors.purple,
                  size: AppChipSize.medium,
                  shape: AppChipShape.stadium,
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('chip_complex_combinations.png'),
      );
    });
  });
}
