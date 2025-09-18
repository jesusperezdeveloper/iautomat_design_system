import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/toggle_view/app_toggle_view.dart';
import 'package:iautomat_design_system/src/components/toggle_view/toggle_view_config.dart';

void main() {
  group('AppToggleView Golden Tests', () {
    testWidgets('Basic toggle view variants', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Column(
              children: [
                const Text('List Variant:'),
                AppToggleView.list(
                  value: const ['option1'],
                  options: const [
                    AppToggleViewOption(id: 'option1', label: 'Option 1'),
                    AppToggleViewOption(id: 'option2', label: 'Option 2'),
                    AppToggleViewOption(id: 'option3', label: 'Option 3'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Grid Variant:'),
                AppToggleView.grid(
                  value: const ['grid1'],
                  config: const AppToggleViewConfig(
                    gridCrossAxisCount: 2,
                  ),
                  options: const [
                    AppToggleViewOption(id: 'grid1', label: 'Grid 1'),
                    AppToggleViewOption(id: 'grid2', label: 'Grid 2'),
                    AppToggleViewOption(id: 'grid3', label: 'Grid 3'),
                    AppToggleViewOption(id: 'grid4', label: 'Grid 4'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Compact Variant:'),
                AppToggleView.compact(
                  value: const ['tag1'],
                  options: const [
                    AppToggleViewOption(id: 'tag1', label: 'Tag 1'),
                    AppToggleViewOption(id: 'tag2', label: 'Tag 2'),
                    AppToggleViewOption(id: 'tag3', label: 'Tag 3'),
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
                AppToggleView(
                  value: const ['home'],
                  options: const [
                    AppToggleViewOption(
                      id: 'home',
                      label: 'Home',
                      icon: Icons.home,
                    ),
                    AppToggleViewOption(
                      id: 'work',
                      label: 'Work',
                      icon: Icons.work,
                    ),
                    AppToggleViewOption(
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
                AppToggleView(
                  value: const ['small'],
                  size: AppToggleViewSize.small,
                  options: const [
                    AppToggleViewOption(id: 'small', label: 'Small'),
                    AppToggleViewOption(id: 'option', label: 'Option'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Medium Size:'),
                AppToggleView(
                  value: const ['medium'],
                  size: AppToggleViewSize.medium,
                  options: const [
                    AppToggleViewOption(id: 'medium', label: 'Medium'),
                    AppToggleViewOption(id: 'option', label: 'Option'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Large Size:'),
                AppToggleView(
                  value: const ['large'],
                  size: AppToggleViewSize.large,
                  options: const [
                    AppToggleViewOption(id: 'large', label: 'Large'),
                    AppToggleViewOption(id: 'option', label: 'Option'),
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
                AppToggleView(
                  value: const ['enabled'],
                  enabled: true,
                  options: const [
                    AppToggleViewOption(id: 'enabled', label: 'Enabled'),
                    AppToggleViewOption(id: 'option', label: 'Option'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Disabled:'),
                AppToggleView(
                  value: const ['disabled'],
                  enabled: false,
                  options: const [
                    AppToggleViewOption(id: 'disabled', label: 'Disabled'),
                    AppToggleViewOption(id: 'option', label: 'Option'),
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
                const AppToggleView(
                  value: [],
                  state: AppToggleViewState.loading,
                  options: [
                    AppToggleViewOption(id: 'loading1', label: 'Loading 1'),
                    AppToggleViewOption(id: 'loading2', label: 'Loading 2'),
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
                const AppToggleView(
                  value: [],
                  state: AppToggleViewState.skeleton,
                  options: [
                    AppToggleViewOption(id: 'skeleton1', label: 'Skeleton 1'),
                    AppToggleViewOption(id: 'skeleton2', label: 'Skeleton 2'),
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
                AppToggleView(
                  value: const ['option1', 'option3'],
                  allowMultipleSelection: true,
                  options: const [
                    AppToggleViewOption(id: 'option1', label: 'Option 1'),
                    AppToggleViewOption(id: 'option2', label: 'Option 2'),
                    AppToggleViewOption(id: 'option3', label: 'Option 3'),
                    AppToggleViewOption(id: 'option4', label: 'Option 4'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Single Selection:'),
                AppToggleView(
                  value: const ['single1'],
                  allowMultipleSelection: false,
                  options: const [
                    AppToggleViewOption(id: 'single1', label: 'Single 1'),
                    AppToggleViewOption(id: 'single2', label: 'Single 2'),
                    AppToggleViewOption(id: 'single3', label: 'Single 3'),
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
                AppToggleView(
                  value: const ['custom1'],
                  config: const AppToggleViewConfig(
                    backgroundColor: Colors.grey,
                    selectedBackgroundColor: Colors.purple,
                    selectedTextColor: Colors.white,
                    borderColor: Colors.purple,
                    selectedBorderColor: Colors.purple,
                    borderRadius: 20,
                  ),
                  options: const [
                    AppToggleViewOption(id: 'custom1', label: 'Custom 1'),
                    AppToggleViewOption(id: 'custom2', label: 'Custom 2'),
                    AppToggleViewOption(id: 'custom3', label: 'Custom 3'),
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
                AppToggleView(
                  value: const ['spacing1'],
                  config: const AppToggleViewConfig(
                    itemPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    itemSpacing: 16,
                    borderRadius: 8,
                    fontSize: 16,
                    iconSize: 20,
                  ),
                  options: const [
                    AppToggleViewOption(
                      id: 'spacing1',
                      label: 'Large Spacing 1',
                      icon: Icons.star,
                    ),
                    AppToggleViewOption(
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
                AppToggleView.grid(
                  value: const ['grid1'],
                  config: const AppToggleViewConfig(
                    gridCrossAxisCount: 2,
                    gridChildAspectRatio: 2.5,
                  ),
                  options: const [
                    AppToggleViewOption(id: 'grid1', label: 'Grid 1'),
                    AppToggleViewOption(id: 'grid2', label: 'Grid 2'),
                    AppToggleViewOption(id: 'grid3', label: 'Grid 3'),
                    AppToggleViewOption(id: 'grid4', label: 'Grid 4'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('3 Columns Grid:'),
                AppToggleView.grid(
                  value: const ['grid1'],
                  config: const AppToggleViewConfig(
                    gridCrossAxisCount: 3,
                    gridChildAspectRatio: 1.5,
                  ),
                  options: const [
                    AppToggleViewOption(id: 'grid1', label: 'Item 1'),
                    AppToggleViewOption(id: 'grid2', label: 'Item 2'),
                    AppToggleViewOption(id: 'grid3', label: 'Item 3'),
                    AppToggleViewOption(id: 'grid4', label: 'Item 4'),
                    AppToggleViewOption(id: 'grid5', label: 'Item 5'),
                    AppToggleViewOption(id: 'grid6', label: 'Item 6'),
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
                AppToggleView.compact(
                  value: const ['tag1'],
                  config: const AppToggleViewConfig(
                    compactWrapItems: true,
                  ),
                  options: const [
                    AppToggleViewOption(id: 'tag1', label: 'JavaScript'),
                    AppToggleViewOption(id: 'tag2', label: 'Flutter'),
                    AppToggleViewOption(id: 'tag3', label: 'React'),
                    AppToggleViewOption(id: 'tag4', label: 'Vue.js'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Horizontal Scrolling:'),
                AppToggleView.compact(
                  value: const ['scroll1'],
                  config: const AppToggleViewConfig(
                    compactWrapItems: false,
                  ),
                  options: const [
                    AppToggleViewOption(id: 'scroll1', label: 'Technology'),
                    AppToggleViewOption(id: 'scroll2', label: 'Programming'),
                    AppToggleViewOption(id: 'scroll3', label: 'Mobile Dev'),
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
                AppToggleView(
                  value: const ['dark1'],
                  options: const [
                    AppToggleViewOption(id: 'dark1', label: 'Dark 1'),
                    AppToggleViewOption(id: 'dark2', label: 'Dark 2'),
                    AppToggleViewOption(id: 'dark3', label: 'Dark 3'),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                AppToggleView(
                  value: const ['icon1'],
                  options: const [
                    AppToggleViewOption(
                      id: 'icon1',
                      label: 'With Icon',
                      icon: Icons.star,
                    ),
                    AppToggleViewOption(
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
                AppToggleView(
                  value: const ['ltr1'],
                  textDirection: TextDirection.ltr,
                  options: const [
                    AppToggleViewOption(
                      id: 'ltr1',
                      label: 'English 1',
                      icon: Icons.language,
                    ),
                    AppToggleViewOption(
                      id: 'ltr2',
                      label: 'English 2',
                      icon: Icons.translate,
                    ),
                  ],
                  onChanged: (selected) {},
                ),
                const SizedBox(height: 16),
                const Text('Right-to-Left (RTL):'),
                AppToggleView(
                  value: const ['rtl1'],
                  textDirection: TextDirection.rtl,
                  options: const [
                    AppToggleViewOption(
                      id: 'rtl1',
                      label: 'عربي ١',
                      icon: Icons.language,
                    ),
                    AppToggleViewOption(
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
