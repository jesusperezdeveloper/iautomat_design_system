import 'package:flutter/material.dart';

import 'app_toggle_view.dart';
import 'toggle_view_config.dart';

/// Story examples for DSToggleView component
class ToggleViewStoryExample extends StatefulWidget {
  const ToggleViewStoryExample({super.key});

  @override
  State<ToggleViewStoryExample> createState() => _ToggleViewStoryExampleState();
}

class _ToggleViewStoryExampleState extends State<ToggleViewStoryExample> {
  List<String> _basicSelection = ['option1'];
  List<String> _multiSelection = ['option1', 'option3'];
  List<String> _iconSelection = ['home'];
  List<String> _sizeSelection = ['medium'];
  List<String> _stateSelection = [];
  List<String> _gridSelection = ['grid1', 'grid3'];
  List<String> _compactSelection = ['tag1'];
  List<String> _customSelection = ['custom1'];
  List<String> _keyboardSelection = ['key1'];
  List<String> _rtlSelection = ['rtl1'];
  List<String> _adaptiveSelection = ['mobile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSToggleView Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStorySection(
              'Basic Usage',
              'Simple toggle view with basic options',
              _buildBasicUsage(),
            ),
            _buildStorySection(
              'Variants',
              'Different layout variants: list, grid, compact',
              _buildVariants(),
            ),
            _buildStorySection(
              'States',
              'Different states: default, hover, pressed, focus, selected, disabled, loading, skeleton',
              _buildStates(),
            ),
            _buildStorySection(
              'Multiple Selection',
              'Toggle view with multiple selection enabled',
              _buildMultiSelection(),
            ),
            _buildStorySection(
              'With Icons',
              'Toggle options with icons',
              _buildWithIcons(),
            ),
            _buildStorySection(
              'Sizes',
              'Different sizes: small, medium, large',
              _buildSizes(),
            ),
            _buildStorySection(
              'Grid Layout',
              'Grid layout with different configurations',
              _buildGridLayout(),
            ),
            _buildStorySection(
              'Compact Layout',
              'Compact layout with wrapping and horizontal scrolling',
              _buildCompactLayout(),
            ),
            _buildStorySection(
              'Custom Styling',
              'Custom colors, fonts, and styling',
              _buildCustomStyling(),
            ),
            _buildStorySection(
              'Keyboard Navigation',
              'Keyboard navigation and accessibility',
              _buildKeyboardNavigation(),
            ),
            _buildStorySection(
              'RTL Support',
              'Right-to-left text direction support',
              _buildRTLSupport(),
            ),
            _buildStorySection(
              'Platform Adaptive',
              'Platform-adaptive behavior',
              _buildPlatformAdaptive(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStorySection(String title, String description, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          child: content,
        ),
      ],
    );
  }

  Widget _buildBasicUsage() {
    return Column(
      children: [
        DSToggleView(
          value: _basicSelection,
          options: const [
            DSToggleViewOption(id: 'option1', label: 'Option 1'),
            DSToggleViewOption(id: 'option2', label: 'Option 2'),
            DSToggleViewOption(id: 'option3', label: 'Option 3'),
          ],
          onChanged: (value) {
            setState(() {
              _basicSelection = value;
            });
          },
        ),
        const SizedBox(height: 16),
        Text('Selected: ${_basicSelection.join(', ')}'),
      ],
    );
  }

  Widget _buildVariants() {
    return Column(
      children: [
        const Text('List Variant:'),
        const SizedBox(height: 8),
        DSToggleView.list(
          value: _basicSelection,
          options: const [
            DSToggleViewOption(id: 'option1', label: 'Option 1'),
            DSToggleViewOption(id: 'option2', label: 'Option 2'),
            DSToggleViewOption(id: 'option3', label: 'Option 3'),
          ],
          onChanged: (value) {
            setState(() {
              _basicSelection = value;
            });
          },
        ),
        const SizedBox(height: 24),
        const Text('Grid Variant:'),
        const SizedBox(height: 8),
        DSToggleView.grid(
          value: _gridSelection,
          options: const [
            DSToggleViewOption(id: 'grid1', label: 'Grid 1'),
            DSToggleViewOption(id: 'grid2', label: 'Grid 2'),
            DSToggleViewOption(id: 'grid3', label: 'Grid 3'),
            DSToggleViewOption(id: 'grid4', label: 'Grid 4'),
          ],
          config: const DSToggleViewConfig(
            gridCrossAxisCount: 2,
          ),
          onChanged: (value) {
            setState(() {
              _gridSelection = value;
            });
          },
        ),
        const SizedBox(height: 24),
        const Text('Compact Variant:'),
        const SizedBox(height: 8),
        DSToggleView.compact(
          value: _compactSelection,
          options: const [
            DSToggleViewOption(id: 'tag1', label: 'Tag 1'),
            DSToggleViewOption(id: 'tag2', label: 'Tag 2'),
            DSToggleViewOption(id: 'tag3', label: 'Tag 3'),
            DSToggleViewOption(id: 'tag4', label: 'Tag 4'),
            DSToggleViewOption(id: 'tag5', label: 'Tag 5'),
          ],
          onChanged: (value) {
            setState(() {
              _compactSelection = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildStates() {
    return Column(
      children: [
        const Text('Default State:'),
        const SizedBox(height: 8),
        DSToggleView(
          value: _stateSelection,
          state: DSToggleViewState.defaultState,
          options: const [
            DSToggleViewOption(id: 'default1', label: 'Default 1'),
            DSToggleViewOption(id: 'default2', label: 'Default 2'),
          ],
          onChanged: (value) {
            setState(() {
              _stateSelection = value;
            });
          },
        ),
        const SizedBox(height: 16),
        const Text('Disabled State:'),
        const SizedBox(height: 8),
        DSToggleView(
          value: _stateSelection,
          enabled: false,
          options: const [
            DSToggleViewOption(id: 'disabled1', label: 'Disabled 1'),
            DSToggleViewOption(id: 'disabled2', label: 'Disabled 2'),
          ],
          onChanged: (value) {
            setState(() {
              _stateSelection = value;
            });
          },
        ),
        const SizedBox(height: 16),
        const Text('Loading State:'),
        const SizedBox(height: 8),
        const DSToggleView(
          value: [],
          state: DSToggleViewState.loading,
          options: [
            DSToggleViewOption(id: 'loading1', label: 'Loading 1'),
            DSToggleViewOption(id: 'loading2', label: 'Loading 2'),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Skeleton State:'),
        const SizedBox(height: 8),
        const DSToggleView(
          value: [],
          state: DSToggleViewState.skeleton,
          options: [
            DSToggleViewOption(id: 'skeleton1', label: 'Skeleton 1'),
            DSToggleViewOption(id: 'skeleton2', label: 'Skeleton 2'),
          ],
        ),
      ],
    );
  }

  Widget _buildMultiSelection() {
    return Column(
      children: [
        DSToggleView(
          value: _multiSelection,
          allowMultipleSelection: true,
          allowDeselection: true,
          options: const [
            DSToggleViewOption(id: 'option1', label: 'Option 1'),
            DSToggleViewOption(id: 'option2', label: 'Option 2'),
            DSToggleViewOption(id: 'option3', label: 'Option 3'),
            DSToggleViewOption(id: 'option4', label: 'Option 4'),
          ],
          onChanged: (value) {
            setState(() {
              _multiSelection = value;
            });
          },
        ),
        const SizedBox(height: 16),
        Text('Selected: ${_multiSelection.join(', ')}'),
        const SizedBox(height: 16),
        const Text('Single Selection Only:'),
        const SizedBox(height: 8),
        DSToggleView(
          value: _basicSelection,
          allowMultipleSelection: false,
          allowDeselection: true,
          options: const [
            DSToggleViewOption(id: 'single1', label: 'Single 1'),
            DSToggleViewOption(id: 'single2', label: 'Single 2'),
            DSToggleViewOption(id: 'single3', label: 'Single 3'),
          ],
          onChanged: (value) {
            setState(() {
              _basicSelection = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildWithIcons() {
    return Column(
      children: [
        DSToggleView(
          value: _iconSelection,
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
            DSToggleViewOption(
              id: 'shopping',
              label: 'Shopping',
              icon: Icons.shopping_cart,
            ),
          ],
          onChanged: (value) {
            setState(() {
              _iconSelection = value;
            });
          },
        ),
        const SizedBox(height: 16),
        Text('Selected: ${_iconSelection.join(', ')}'),
      ],
    );
  }

  Widget _buildSizes() {
    return Column(
      children: [
        const Text('Small Size:'),
        const SizedBox(height: 8),
        DSToggleView(
          value: _sizeSelection,
          size: DSToggleViewSize.small,
          options: const [
            DSToggleViewOption(id: 'small', label: 'Small'),
            DSToggleViewOption(id: 'option', label: 'Option'),
          ],
          onChanged: (value) {
            setState(() {
              _sizeSelection = value;
            });
          },
        ),
        const SizedBox(height: 16),
        const Text('Medium Size:'),
        const SizedBox(height: 8),
        DSToggleView(
          value: _sizeSelection,
          size: DSToggleViewSize.medium,
          options: const [
            DSToggleViewOption(id: 'medium', label: 'Medium'),
            DSToggleViewOption(id: 'option', label: 'Option'),
          ],
          onChanged: (value) {
            setState(() {
              _sizeSelection = value;
            });
          },
        ),
        const SizedBox(height: 16),
        const Text('Large Size:'),
        const SizedBox(height: 8),
        DSToggleView(
          value: _sizeSelection,
          size: DSToggleViewSize.large,
          options: const [
            DSToggleViewOption(id: 'large', label: 'Large'),
            DSToggleViewOption(id: 'option', label: 'Option'),
          ],
          onChanged: (value) {
            setState(() {
              _sizeSelection = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildGridLayout() {
    return Column(
      children: [
        const Text('2 Columns Grid:'),
        const SizedBox(height: 8),
        DSToggleView.grid(
          value: _gridSelection,
          config: const DSToggleViewConfig(
            gridCrossAxisCount: 2,
            gridChildAspectRatio: 2.5,
            gridMainAxisSpacing: 8,
            gridCrossAxisSpacing: 8,
          ),
          options: const [
            DSToggleViewOption(id: 'grid1', label: 'Grid Item 1'),
            DSToggleViewOption(id: 'grid2', label: 'Grid Item 2'),
            DSToggleViewOption(id: 'grid3', label: 'Grid Item 3'),
            DSToggleViewOption(id: 'grid4', label: 'Grid Item 4'),
            DSToggleViewOption(id: 'grid5', label: 'Grid Item 5'),
            DSToggleViewOption(id: 'grid6', label: 'Grid Item 6'),
          ],
          onChanged: (value) {
            setState(() {
              _gridSelection = value;
            });
          },
        ),
        const SizedBox(height: 24),
        const Text('3 Columns Grid:'),
        const SizedBox(height: 8),
        DSToggleView.grid(
          value: _gridSelection,
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
          onChanged: (value) {
            setState(() {
              _gridSelection = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildCompactLayout() {
    return Column(
      children: [
        const Text('Wrapped Compact:'),
        const SizedBox(height: 8),
        DSToggleView.compact(
          value: _compactSelection,
          config: const DSToggleViewConfig(
            compactWrapItems: true,
            compactAlignment: WrapAlignment.start,
          ),
          options: const [
            DSToggleViewOption(id: 'tag1', label: 'JavaScript'),
            DSToggleViewOption(id: 'tag2', label: 'Flutter'),
            DSToggleViewOption(id: 'tag3', label: 'React'),
            DSToggleViewOption(id: 'tag4', label: 'Vue.js'),
            DSToggleViewOption(id: 'tag5', label: 'Angular'),
            DSToggleViewOption(id: 'tag6', label: 'Svelte'),
          ],
          onChanged: (value) {
            setState(() {
              _compactSelection = value;
            });
          },
        ),
        const SizedBox(height: 24),
        const Text('Horizontal Scrolling Compact:'),
        const SizedBox(height: 8),
        DSToggleView.compact(
          value: _compactSelection,
          config: const DSToggleViewConfig(
            compactWrapItems: false,
          ),
          options: const [
            DSToggleViewOption(id: 'scroll1', label: 'Technology'),
            DSToggleViewOption(id: 'scroll2', label: 'Programming'),
            DSToggleViewOption(id: 'scroll3', label: 'Mobile Development'),
            DSToggleViewOption(id: 'scroll4', label: 'Web Development'),
            DSToggleViewOption(id: 'scroll5', label: 'Desktop Applications'),
          ],
          onChanged: (value) {
            setState(() {
              _compactSelection = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildCustomStyling() {
    return Column(
      children: [
        const Text('Custom Colors:'),
        const SizedBox(height: 8),
        DSToggleView(
          value: _customSelection,
          config: const DSToggleViewConfig(
            backgroundColor: Colors.grey,
            selectedBackgroundColor: Colors.purple,
            selectedTextColor: Colors.white,
            borderColor: Colors.purple,
            selectedBorderColor: Colors.purple,
            borderRadius: 20,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          options: const [
            DSToggleViewOption(id: 'custom1', label: 'Custom 1'),
            DSToggleViewOption(id: 'custom2', label: 'Custom 2'),
            DSToggleViewOption(id: 'custom3', label: 'Custom 3'),
          ],
          onChanged: (value) {
            setState(() {
              _customSelection = value;
            });
          },
        ),
        const SizedBox(height: 24),
        const Text('Custom Size and Spacing:'),
        const SizedBox(height: 8),
        DSToggleView(
          value: _customSelection,
          config: const DSToggleViewConfig(
            itemPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            itemSpacing: 12,
            borderRadius: 8,
            fontSize: 14,
            iconSize: 20,
            elevation: 4,
            showShadow: true,
          ),
          options: const [
            DSToggleViewOption(
                id: 'large1', label: 'Large Item 1', icon: Icons.star),
            DSToggleViewOption(
                id: 'large2', label: 'Large Item 2', icon: Icons.favorite),
            DSToggleViewOption(
                id: 'large3', label: 'Large Item 3', icon: Icons.thumb_up),
          ],
          onChanged: (value) {
            setState(() {
              _customSelection = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildKeyboardNavigation() {
    return Column(
      children: [
        const Text('Use arrow keys to navigate, Enter/Space to select:'),
        const SizedBox(height: 8),
        DSToggleView(
          value: _keyboardSelection,
          config: const DSToggleViewConfig(
            enableKeyboardNavigation: true,
            showFocusIndicator: true,
            focusIndicatorColor: Colors.blue,
            focusIndicatorWidth: 2,
          ),
          options: const [
            DSToggleViewOption(id: 'key1', label: 'Keyboard 1'),
            DSToggleViewOption(id: 'key2', label: 'Keyboard 2'),
            DSToggleViewOption(id: 'key3', label: 'Keyboard 3'),
            DSToggleViewOption(id: 'key4', label: 'Keyboard 4'),
          ],
          onChanged: (value) {
            setState(() {
              _keyboardSelection = value;
            });
          },
        ),
        const SizedBox(height: 16),
        Text('Selected: ${_keyboardSelection.join(', ')}'),
      ],
    );
  }

  Widget _buildRTLSupport() {
    return Column(
      children: [
        const Text('Left-to-Right (LTR):'),
        const SizedBox(height: 8),
        DSToggleView(
          value: _rtlSelection,
          textDirection: TextDirection.ltr,
          options: const [
            DSToggleViewOption(
                id: 'ltr1', label: 'English 1', icon: Icons.language),
            DSToggleViewOption(
                id: 'ltr2', label: 'English 2', icon: Icons.translate),
            DSToggleViewOption(
                id: 'ltr3', label: 'English 3', icon: Icons.text_fields),
          ],
          onChanged: (value) {
            setState(() {
              _rtlSelection = value;
            });
          },
        ),
        const SizedBox(height: 16),
        const Text('Right-to-Left (RTL):'),
        const SizedBox(height: 8),
        DSToggleView(
          value: _rtlSelection,
          textDirection: TextDirection.rtl,
          options: const [
            DSToggleViewOption(
                id: 'rtl1', label: 'عربي ١', icon: Icons.language),
            DSToggleViewOption(
                id: 'rtl2', label: 'عربي ٢', icon: Icons.translate),
            DSToggleViewOption(
                id: 'rtl3', label: 'عربي ٣', icon: Icons.text_fields),
          ],
          onChanged: (value) {
            setState(() {
              _rtlSelection = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildPlatformAdaptive() {
    return Column(
      children: [
        const Text('Platform Adaptive Behavior:'),
        const SizedBox(height: 8),
        DSToggleView(
          value: _adaptiveSelection,
          config: const DSToggleViewConfig(
            adaptToPlatform: true,
            useNativeScrolling: true,
          ),
          options: const [
            DSToggleViewOption(
                id: 'mobile', label: 'Mobile', icon: Icons.phone_android),
            DSToggleViewOption(
                id: 'tablet', label: 'Tablet', icon: Icons.tablet),
            DSToggleViewOption(
                id: 'desktop', label: 'Desktop', icon: Icons.desktop_windows),
            DSToggleViewOption(id: 'web', label: 'Web', icon: Icons.web),
          ],
          onChanged: (value) {
            setState(() {
              _adaptiveSelection = value;
            });
          },
        ),
        const SizedBox(height: 16),
        Text('Selected: ${_adaptiveSelection.join(', ')}'),
        const SizedBox(height: 16),
        const Text('Auto Orientation (changes based on screen orientation):'),
        const SizedBox(height: 8),
        DSToggleView(
          value: _adaptiveSelection,
          orientation: DSToggleViewOrientation.auto,
          options: const [
            DSToggleViewOption(id: 'portrait', label: 'Portrait'),
            DSToggleViewOption(id: 'landscape', label: 'Landscape'),
            DSToggleViewOption(id: 'auto', label: 'Auto'),
          ],
          onChanged: (value) {
            setState(() {
              _adaptiveSelection = value;
            });
          },
        ),
      ],
    );
  }
}
