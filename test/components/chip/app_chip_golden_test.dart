import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSChip Golden Tests', () {
    testWidgets('Basic chip variants', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                DSChip.input(
                  label: 'Input Chip',
                  selected: false,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                DSChip.filter(
                  label: 'Filter Chip',
                  selected: true,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                DSChip.choice(
                  label: 'Choice Chip',
                  selected: false,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                DSChip.assist(
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
                DSChip.input(
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
                DSChip.filter(
                  label: 'With Icon',
                  icon: Icons.star,
                  selected: true,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                DSChip.choice(
                  label: 'Deletable',
                  deletable: true,
                  selected: false,
                  onSelected: (selected) {},
                  onDeleted: () {},
                ),
                const SizedBox(height: 8),
                DSChip.assist(
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
                DSChip.filter(
                  label: 'Small',
                  selected: true,
                  onSelected: (selected) {},
                  size: DSChipSize.small,
                ),
                const SizedBox(height: 8),
                DSChip.filter(
                  label: 'Medium',
                  selected: true,
                  onSelected: (selected) {},
                  size: DSChipSize.medium,
                ),
                const SizedBox(height: 8),
                DSChip.filter(
                  label: 'Large',
                  selected: true,
                  onSelected: (selected) {},
                  size: DSChipSize.large,
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
                DSChip.choice(
                  label: 'Rounded',
                  selected: true,
                  onSelected: (selected) {},
                  shape: DSChipShape.rounded,
                ),
                const SizedBox(height: 8),
                DSChip.choice(
                  label: 'Circular',
                  selected: true,
                  onSelected: (selected) {},
                  shape: DSChipShape.circular,
                ),
                const SizedBox(height: 8),
                DSChip.choice(
                  label: 'Stadium',
                  selected: true,
                  onSelected: (selected) {},
                  shape: DSChipShape.stadium,
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
                DSChip.filter(
                  label: 'Enabled',
                  selected: true,
                  onSelected: (selected) {},
                  enabled: true,
                ),
                const SizedBox(height: 8),
                DSChip.filter(
                  label: 'Disabled',
                  selected: true,
                  onSelected: (selected) {},
                  enabled: false,
                ),
                const SizedBox(height: 8),
                DSChip.input(
                  label: 'Enabled Input',
                  selected: false,
                  onSelected: (selected) {},
                  enabled: true,
                ),
                const SizedBox(height: 8),
                DSChip.input(
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
                DSChip.filter(
                  label: 'Loading',
                  selected: true,
                  onSelected: (selected) {},
                  state: DSChipState.loading,
                ),
                const SizedBox(height: 8),
                DSChip.assist(
                  label: 'Loading Assist',
                  onSelected: (selected) {},
                  state: DSChipState.loading,
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
                DSChip.filter(
                  label: 'Skeleton',
                  selected: false,
                  onSelected: (selected) {},
                  state: DSChipState.skeleton,
                ),
                const SizedBox(height: 8),
                DSChip.choice(
                  label: 'Skeleton Choice',
                  selected: false,
                  onSelected: (selected) {},
                  state: DSChipState.skeleton,
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
                DSChip.choice(
                  label: 'Custom Selected',
                  selected: true,
                  onSelected: (selected) {},
                  color: Colors.green,
                ),
                const SizedBox(height: 8),
                DSChip.choice(
                  label: 'Custom Unselected',
                  selected: false,
                  onSelected: (selected) {},
                  backgroundColor: Colors.orange.shade100,
                ),
                const SizedBox(height: 8),
                DSChip.filter(
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
                DSChip.filter(
                  label: 'Default Padding',
                  selected: true,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                DSChip.filter(
                  label: 'Custom Padding',
                  selected: true,
                  onSelected: (selected) {},
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
                const SizedBox(height: 8),
                DSChip.choice(
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
                DSChip.input(
                  label: 'Dark Input',
                  selected: false,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                DSChip.filter(
                  label: 'Dark Filter',
                  selected: true,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                DSChip.choice(
                  label: 'Dark Choice',
                  selected: true,
                  onSelected: (selected) {},
                ),
                const SizedBox(height: 8),
                DSChip.assist(
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
                DSChip.filter(
                  label: 'Complex 1',
                  icon: Icons.star,
                  deletable: true,
                  selected: true,
                  onSelected: (selected) {},
                  onDeleted: () {},
                  size: DSChipSize.large,
                  shape: DSChipShape.circular,
                ),
                const SizedBox(height: 8),
                DSChip.input(
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
                  size: DSChipSize.small,
                ),
                const SizedBox(height: 8),
                DSChip.choice(
                  label: 'Complex 3',
                  icon: Icons.check,
                  selected: true,
                  onSelected: (selected) {},
                  color: Colors.purple,
                  size: DSChipSize.medium,
                  shape: DSChipShape.stadium,
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
