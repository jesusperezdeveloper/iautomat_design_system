import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/toggle_view/ds_toggle_view.dart';
import 'package:iautomat_design_system/src/components/toggle_view/toggle_view_config.dart';

void main() {
  group('DSToggleView Golden Tests', () {
    testWidgets('Basic toggle view variants', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                const Text('List Variant:'),
                DSToggleView.list(
                  value: const ['option1'],
                  options: const [
                    DSToggleViewOption(id: 'option1', label: 'Option 1'),
                    DSToggleViewOption(id: 'option2', label: 'Option 2'),
                    DSToggleViewOption(id: 'option3', label: 'Option 3'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Grid Variant:'),
                DSToggleView.grid(
                  value: const ['grid1'],
                  config: const DSToggleViewConfig(
                    gridCrossAxisCount: 2,
                  ),
                  options: const [
                    DSToggleViewOption(id: 'grid1', label: 'Grid 1'),
                    DSToggleViewOption(id: 'grid2', label: 'Grid 2'),
                    DSToggleViewOption(id: 'grid3', label: 'Grid 3'),
                    DSToggleViewOption(id: 'grid4', label: 'Grid 4'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Compact Variant:'),
                DSToggleView.compact(
                  value: const ['tag1'],
                  options: const [
                    DSToggleViewOption(id: 'tag1', label: 'Tag 1'),
                    DSToggleViewOption(id: 'tag2', label: 'Tag 2'),
                    DSToggleViewOption(id: 'tag3', label: 'Tag 3'),
                  ],
                  onChanged: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('toggle_view_variants.png'),
      );
    });

    testWidgets('Toggle view with icons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                DSToggleView(
                  value: const ['home'],
                  options: const [
                    DSToggleViewOption(
                      id: 'home',
                      label: 'Home',
                      icon: Icons.home,
                    ),
                    DSToggleViewOption(
                      id: 'work',
                      label: 'Work',
                      icon: Icons.work,
                    ),
                    DSToggleViewOption(
                      id: 'school',
                      label: 'School',
                      icon: Icons.school,
                    ),
                  ],
                  onChanged: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('toggle_view_with_icons.png'),
      );
    });

    testWidgets('Toggle view sizes', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                const Text('Small Size:'),
                DSToggleView(
                  value: const ['small'],
                  size: DSToggleViewSize.small,
                  options: const [
                    DSToggleViewOption(id: 'small', label: 'Small'),
                    DSToggleViewOption(id: 'option', label: 'Option'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Medium Size:'),
                DSToggleView(
                  value: const ['medium'],
                  size: DSToggleViewSize.medium,
                  options: const [
                    DSToggleViewOption(id: 'medium', label: 'Medium'),
                    DSToggleViewOption(id: 'option', label: 'Option'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Large Size:'),
                DSToggleView(
                  value: const ['large'],
                  size: DSToggleViewSize.large,
                  options: const [
                    DSToggleViewOption(id: 'large', label: 'Large'),
                    DSToggleViewOption(id: 'option', label: 'Option'),
                  ],
                  onChanged: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('toggle_view_sizes.png'),
      );
    });

    testWidgets('Toggle view states - enabled vs disabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                const Text('Enabled:'),
                DSToggleView(
                  value: const ['enabled'],
                  enabled: true,
                  options: const [
                    DSToggleViewOption(id: 'enabled', label: 'Enabled'),
                    DSToggleViewOption(id: 'option', label: 'Option'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Disabled:'),
                DSToggleView(
                  value: const ['disabled'],
                  enabled: false,
                  options: const [
                    DSToggleViewOption(id: 'disabled', label: 'Disabled'),
                    DSToggleViewOption(id: 'option', label: 'Option'),
                  ],
                  onChanged: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('toggle_view_enabled_disabled.png'),
      );
    });

    testWidgets('Toggle view with loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                const DSToggleView(
                  value: [],
                  state: DSToggleViewState.loading,
                  options: [
                    DSToggleViewOption(id: 'loading1', label: 'Loading 1'),
                    DSToggleViewOption(id: 'loading2', label: 'Loading 2'),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('toggle_view_loading_state.png'),
      );
    });

    testWidgets('Toggle view with skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                const DSToggleView(
                  value: [],
                  state: DSToggleViewState.skeleton,
                  options: [
                    DSToggleViewOption(id: 'skeleton1', label: 'Skeleton 1'),
                    DSToggleViewOption(id: 'skeleton2', label: 'Skeleton 2'),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('toggle_view_skeleton_state.png'),
      );
    });

    testWidgets('Toggle view with multiple selection', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                const Text('Multiple Selection:'),
                DSToggleView(
                  value: const ['option1', 'option3'],
                  allowMultipleSelection: true,
                  options: const [
                    DSToggleViewOption(id: 'option1', label: 'Option 1'),
                    DSToggleViewOption(id: 'option2', label: 'Option 2'),
                    DSToggleViewOption(id: 'option3', label: 'Option 3'),
                    DSToggleViewOption(id: 'option4', label: 'Option 4'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Single Selection:'),
                DSToggleView(
                  value: const ['single1'],
                  allowMultipleSelection: false,
                  options: const [
                    DSToggleViewOption(id: 'single1', label: 'Single 1'),
                    DSToggleViewOption(id: 'single2', label: 'Single 2'),
                    DSToggleViewOption(id: 'single3', label: 'Single 3'),
                  ],
                  onChanged: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('toggle_view_selection_modes.png'),
      );
    });

    testWidgets('Toggle view with custom colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                DSToggleView(
                  value: const ['custom1'],
                  config: const DSToggleViewConfig(
                    backgroundColor: Colors.grey,
                    selectedBackgroundColor: Colors.purple,
                    selectedTextColor: Colors.white,
                    borderColor: Colors.purple,
                    selectedBorderColor: Colors.purple,
                    borderRadius: 20,
                  ),
                  options: const [
                    DSToggleViewOption(id: 'custom1', label: 'Custom 1'),
                    DSToggleViewOption(id: 'custom2', label: 'Custom 2'),
                    DSToggleViewOption(id: 'custom3', label: 'Custom 3'),
                  ],
                  onChanged: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('toggle_view_custom_colors.png'),
      );
    });

    testWidgets('Toggle view with custom spacing and padding', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                DSToggleView(
                  value: const ['spacing1'],
                  config: const DSToggleViewConfig(
                    itemPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    itemSpacing: 16,
                    borderRadius: 8,
                    fontSize: 16,
                    iconSize: 20,
                  ),
                  options: const [
                    DSToggleViewOption(
                      id: 'spacing1',
                      label: 'Large Spacing 1',
                      icon: Icons.star,
                    ),
                    DSToggleViewOption(
                      id: 'spacing2',
                      label: 'Large Spacing 2',
                      icon: Icons.favorite,
                    ),
                  ],
                  onChanged: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('toggle_view_custom_spacing.png'),
      );
    });

    testWidgets('Toggle view grid layout configurations', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                const Text('2 Columns Grid:'),
                DSToggleView.grid(
                  value: const ['grid1'],
                  config: const DSToggleViewConfig(
                    gridCrossAxisCount: 2,
                    gridChildAspectRatio: 2.5,
                  ),
                  options: const [
                    DSToggleViewOption(id: 'grid1', label: 'Grid 1'),
                    DSToggleViewOption(id: 'grid2', label: 'Grid 2'),
                    DSToggleViewOption(id: 'grid3', label: 'Grid 3'),
                    DSToggleViewOption(id: 'grid4', label: 'Grid 4'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('3 Columns Grid:'),
                DSToggleView.grid(
                  value: const ['grid1'],
                  config: const DSToggleViewConfig(
                    gridCrossAxisCount: 3,
                    gridChildAspectRatio: 1.5,
                  ),
                  options: const [
                    DSToggleViewOption(id: 'grid1', label: 'Item 1'),
                    DSToggleViewOption(id: 'grid2', label: 'Item 2'),
                    DSToggleViewOption(id: 'grid3', label: 'Item 3'),
                    DSToggleViewOption(id: 'grid4', label: 'Item 4'),
                    DSToggleViewOption(id: 'grid5', label: 'Item 5'),
                    DSToggleViewOption(id: 'grid6', label: 'Item 6'),
                  ],
                  onChanged: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('toggle_view_grid_layouts.png'),
      );
    });

    testWidgets('Toggle view compact layout configurations', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                const Text('Wrapped Compact:'),
                DSToggleView.compact(
                  value: const ['tag1'],
                  config: const DSToggleViewConfig(
                    compactWrapItems: true,
                  ),
                  options: const [
                    DSToggleViewOption(id: 'tag1', label: 'JavaScript'),
                    DSToggleViewOption(id: 'tag2', label: 'Flutter'),
                    DSToggleViewOption(id: 'tag3', label: 'React'),
                    DSToggleViewOption(id: 'tag4', label: 'Vue.js'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Horizontal Scrolling:'),
                DSToggleView.compact(
                  value: const ['scroll1'],
                  config: const DSToggleViewConfig(
                    compactWrapItems: false,
                  ),
                  options: const [
                    DSToggleViewOption(id: 'scroll1', label: 'Technology'),
                    DSToggleViewOption(id: 'scroll2', label: 'Programming'),
                    DSToggleViewOption(id: 'scroll3', label: 'Mobile Dev'),
                  ],
                  onChanged: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('toggle_view_compact_layouts.png'),
      );
    });

    testWidgets('Dark theme toggle views', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Column(
              children: [
                DSToggleView(
                  value: const ['dark1'],
                  options: const [
                    DSToggleViewOption(id: 'dark1', label: 'Dark 1'),
                    DSToggleViewOption(id: 'dark2', label: 'Dark 2'),
                    DSToggleViewOption(id: 'dark3', label: 'Dark 3'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                DSToggleView(
                  value: const ['icon1'],
                  options: const [
                    DSToggleViewOption(
                      id: 'icon1',
                      label: 'With Icon',
                      icon: Icons.star,
                    ),
                    DSToggleViewOption(
                      id: 'icon2',
                      label: 'Another',
                      icon: Icons.favorite,
                    ),
                  ],
                  onChanged: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('toggle_view_dark_theme.png'),
      );
    });

    testWidgets('RTL support toggle views', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                const Text('Left-to-Right (LTR):'),
                DSToggleView(
                  value: const ['ltr1'],
                  textDirection: TextDirection.ltr,
                  options: const [
                    DSToggleViewOption(
                      id: 'ltr1',
                      label: 'English 1',
                      icon: Icons.language,
                    ),
                    DSToggleViewOption(
                      id: 'ltr2',
                      label: 'English 2',
                      icon: Icons.translate,
                    ),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Right-to-Left (RTL):'),
                DSToggleView(
                  value: const ['rtl1'],
                  textDirection: TextDirection.rtl,
                  options: const [
                    DSToggleViewOption(
                      id: 'rtl1',
                      label: 'عربي ١',
                      icon: Icons.language,
                    ),
                    DSToggleViewOption(
                      id: 'rtl2',
                      label: 'عربي ٢',
                      icon: Icons.translate,
                    ),
                  ],
                  onChanged: (selected) {},
                ),
              ],
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('toggle_view_rtl_support.png'),
      );
    });
  });
}
