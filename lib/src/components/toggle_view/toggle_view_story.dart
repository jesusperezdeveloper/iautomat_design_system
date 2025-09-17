import 'package:flutter/material.dart';

import 'app_toggle_view.dart';
import 'toggle_view_config.dart';

/// Story examples for AppToggleView component
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
        title: const Text('AppToggleView Stories'),
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
        AppToggleView(
          value: _basicSelection,
          options: const [
            AppToggleViewOption(id: 'option1', label: 'Option 1'),
            AppToggleViewOption(id: 'option2', label: 'Option 2'),
            AppToggleViewOption(id: 'option3', label: 'Option 3'),
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
        AppToggleView.list(
          value: _basicSelection,
          options: const [
            AppToggleViewOption(id: 'option1', label: 'Option 1'),
            AppToggleViewOption(id: 'option2', label: 'Option 2'),
            AppToggleViewOption(id: 'option3', label: 'Option 3'),
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
        AppToggleView.grid(
          value: _gridSelection,
          options: const [
            AppToggleViewOption(id: 'grid1', label: 'Grid 1'),
            AppToggleViewOption(id: 'grid2', label: 'Grid 2'),
            AppToggleViewOption(id: 'grid3', label: 'Grid 3'),
            AppToggleViewOption(id: 'grid4', label: 'Grid 4'),
          ],
          config: const AppToggleViewConfig(
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
        AppToggleView.compact(
          value: _compactSelection,
          options: const [
            AppToggleViewOption(id: 'tag1', label: 'Tag 1'),
            AppToggleViewOption(id: 'tag2', label: 'Tag 2'),
            AppToggleViewOption(id: 'tag3', label: 'Tag 3'),
            AppToggleViewOption(id: 'tag4', label: 'Tag 4'),
            AppToggleViewOption(id: 'tag5', label: 'Tag 5'),
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
        AppToggleView(
          value: _stateSelection,
          state: AppToggleViewState.defaultState,
          options: const [
            AppToggleViewOption(id: 'default1', label: 'Default 1'),
            AppToggleViewOption(id: 'default2', label: 'Default 2'),
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
        AppToggleView(
          value: _stateSelection,
          enabled: false,
          options: const [
            AppToggleViewOption(id: 'disabled1', label: 'Disabled 1'),
            AppToggleViewOption(id: 'disabled2', label: 'Disabled 2'),
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
        const AppToggleView(
          value: [],
          state: AppToggleViewState.loading,
          options: [
            AppToggleViewOption(id: 'loading1', label: 'Loading 1'),
            AppToggleViewOption(id: 'loading2', label: 'Loading 2'),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Skeleton State:'),
        const SizedBox(height: 8),
        const AppToggleView(
          value: [],
          state: AppToggleViewState.skeleton,
          options: [
            AppToggleViewOption(id: 'skeleton1', label: 'Skeleton 1'),
            AppToggleViewOption(id: 'skeleton2', label: 'Skeleton 2'),
          ],
        ),
      ],
    );
  }

  Widget _buildMultiSelection() {
    return Column(
      children: [
        AppToggleView(
          value: _multiSelection,
          allowMultipleSelection: true,
          allowDeselection: true,
          options: const [
            AppToggleViewOption(id: 'option1', label: 'Option 1'),
            AppToggleViewOption(id: 'option2', label: 'Option 2'),
            AppToggleViewOption(id: 'option3', label: 'Option 3'),
            AppToggleViewOption(id: 'option4', label: 'Option 4'),
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
        AppToggleView(
          value: _basicSelection,
          allowMultipleSelection: false,
          allowDeselection: true,
          options: const [
            AppToggleViewOption(id: 'single1', label: 'Single 1'),
            AppToggleViewOption(id: 'single2', label: 'Single 2'),
            AppToggleViewOption(id: 'single3', label: 'Single 3'),
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
        AppToggleView(
          value: _iconSelection,
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
            AppToggleViewOption(
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
        AppToggleView(
          value: _sizeSelection,
          size: AppToggleViewSize.small,
          options: const [
            AppToggleViewOption(id: 'small', label: 'Small'),
            AppToggleViewOption(id: 'option', label: 'Option'),
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
        AppToggleView(
          value: _sizeSelection,
          size: AppToggleViewSize.medium,
          options: const [
            AppToggleViewOption(id: 'medium', label: 'Medium'),
            AppToggleViewOption(id: 'option', label: 'Option'),
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
        AppToggleView(
          value: _sizeSelection,
          size: AppToggleViewSize.large,
          options: const [
            AppToggleViewOption(id: 'large', label: 'Large'),
            AppToggleViewOption(id: 'option', label: 'Option'),
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
        AppToggleView.grid(
          value: _gridSelection,
          config: const AppToggleViewConfig(
            gridCrossAxisCount: 2,
            gridChildAspectRatio: 2.5,
            gridMainAxisSpacing: 8,
            gridCrossAxisSpacing: 8,
          ),
          options: const [
            AppToggleViewOption(id: 'grid1', label: 'Grid Item 1'),
            AppToggleViewOption(id: 'grid2', label: 'Grid Item 2'),
            AppToggleViewOption(id: 'grid3', label: 'Grid Item 3'),
            AppToggleViewOption(id: 'grid4', label: 'Grid Item 4'),
            AppToggleViewOption(id: 'grid5', label: 'Grid Item 5'),
            AppToggleViewOption(id: 'grid6', label: 'Grid Item 6'),
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
        AppToggleView.grid(
          value: _gridSelection,
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
        AppToggleView.compact(
          value: _compactSelection,
          config: const AppToggleViewConfig(
            compactWrapItems: true,
            compactAlignment: WrapAlignment.start,
          ),
          options: const [
            AppToggleViewOption(id: 'tag1', label: 'JavaScript'),
            AppToggleViewOption(id: 'tag2', label: 'Flutter'),
            AppToggleViewOption(id: 'tag3', label: 'React'),
            AppToggleViewOption(id: 'tag4', label: 'Vue.js'),
            AppToggleViewOption(id: 'tag5', label: 'Angular'),
            AppToggleViewOption(id: 'tag6', label: 'Svelte'),
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
        AppToggleView.compact(
          value: _compactSelection,
          config: const AppToggleViewConfig(
            compactWrapItems: false,
          ),
          options: const [
            AppToggleViewOption(id: 'scroll1', label: 'Technology'),
            AppToggleViewOption(id: 'scroll2', label: 'Programming'),
            AppToggleViewOption(id: 'scroll3', label: 'Mobile Development'),
            AppToggleViewOption(id: 'scroll4', label: 'Web Development'),
            AppToggleViewOption(id: 'scroll5', label: 'Desktop Applications'),
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
        AppToggleView(
          value: _customSelection,
          config: const AppToggleViewConfig(
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
            AppToggleViewOption(id: 'custom1', label: 'Custom 1'),
            AppToggleViewOption(id: 'custom2', label: 'Custom 2'),
            AppToggleViewOption(id: 'custom3', label: 'Custom 3'),
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
        AppToggleView(
          value: _customSelection,
          config: const AppToggleViewConfig(
            itemPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            itemSpacing: 12,
            borderRadius: 8,
            fontSize: 14,
            iconSize: 20,
            elevation: 4,
            showShadow: true,
          ),
          options: const [
            AppToggleViewOption(id: 'large1', label: 'Large Item 1', icon: Icons.star),
            AppToggleViewOption(id: 'large2', label: 'Large Item 2', icon: Icons.favorite),
            AppToggleViewOption(id: 'large3', label: 'Large Item 3', icon: Icons.thumb_up),
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
        AppToggleView(
          value: _keyboardSelection,
          config: const AppToggleViewConfig(
            enableKeyboardNavigation: true,
            showFocusIndicator: true,
            focusIndicatorColor: Colors.blue,
            focusIndicatorWidth: 2,
          ),
          options: const [
            AppToggleViewOption(id: 'key1', label: 'Keyboard 1'),
            AppToggleViewOption(id: 'key2', label: 'Keyboard 2'),
            AppToggleViewOption(id: 'key3', label: 'Keyboard 3'),
            AppToggleViewOption(id: 'key4', label: 'Keyboard 4'),
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
        AppToggleView(
          value: _rtlSelection,
          textDirection: TextDirection.ltr,
          options: const [
            AppToggleViewOption(id: 'ltr1', label: 'English 1', icon: Icons.language),
            AppToggleViewOption(id: 'ltr2', label: 'English 2', icon: Icons.translate),
            AppToggleViewOption(id: 'ltr3', label: 'English 3', icon: Icons.text_fields),
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
        AppToggleView(
          value: _rtlSelection,
          textDirection: TextDirection.rtl,
          options: const [
            AppToggleViewOption(id: 'rtl1', label: 'عربي ١', icon: Icons.language),
            AppToggleViewOption(id: 'rtl2', label: 'عربي ٢', icon: Icons.translate),
            AppToggleViewOption(id: 'rtl3', label: 'عربي ٣', icon: Icons.text_fields),
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
        AppToggleView(
          value: _adaptiveSelection,
          config: const AppToggleViewConfig(
            adaptToPlatform: true,
            useNativeScrolling: true,
          ),
          options: const [
            AppToggleViewOption(id: 'mobile', label: 'Mobile', icon: Icons.phone_android),
            AppToggleViewOption(id: 'tablet', label: 'Tablet', icon: Icons.tablet),
            AppToggleViewOption(id: 'desktop', label: 'Desktop', icon: Icons.desktop_windows),
            AppToggleViewOption(id: 'web', label: 'Web', icon: Icons.web),
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
        AppToggleView(
          value: _adaptiveSelection,
          orientation: AppToggleViewOrientation.auto,
          options: const [
            AppToggleViewOption(id: 'portrait', label: 'Portrait'),
            AppToggleViewOption(id: 'landscape', label: 'Landscape'),
            AppToggleViewOption(id: 'auto', label: 'Auto'),
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