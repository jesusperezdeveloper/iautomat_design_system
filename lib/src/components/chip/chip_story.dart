import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/chip/app_chip.dart';
import 'package:iautomat_design_system/src/components/chip/chip_config.dart';

/// Storybook examples for AppChip component
///
/// This file contains various configurations and usage examples
/// of the AppChip component for demonstration and testing purposes.
class AppChipStory {
  static Widget get title => const Text(
        'AppChip',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      );

  static Widget get description => const Text(
        'A comprehensive chip component with input, filter, choice, and assist variants, supporting avatars, icons, selection, and deletion with platform-adaptive behavior.',
      );

  /// Basic chip examples
  static List<ChipStoryExample> get basicExamples => [
        ChipStoryExample(
          name: 'Input Chip - Default',
          description: 'Basic input chip with deletable functionality',
          widget: _InputChipExample(),
        ),
        ChipStoryExample(
          name: 'Filter Chip - Default',
          description: 'Basic filter chip with selection state',
          widget: _FilterChipExample(),
        ),
        ChipStoryExample(
          name: 'Choice Chip - Default',
          description: 'Basic choice chip for single selection',
          widget: _ChoiceChipExample(),
        ),
        ChipStoryExample(
          name: 'Assist Chip - Default',
          description: 'Basic assist chip for actions',
          widget: _AssistChipExample(),
        ),
      ];

  /// Variant examples
  static List<ChipStoryExample> get variantExamples => [
        ChipStoryExample(
          name: 'All Variants',
          description: 'Showcase of all chip variants together',
          widget: _AllVariantsExample(),
        ),
        ChipStoryExample(
          name: 'Input Chips Collection',
          description: 'Multiple input chips for tag management',
          widget: _InputChipsCollectionExample(),
        ),
        ChipStoryExample(
          name: 'Filter Chips Collection',
          description: 'Multiple filter chips for content filtering',
          widget: _FilterChipsCollectionExample(),
        ),
        ChipStoryExample(
          name: 'Choice Chips Collection',
          description: 'Multiple choice chips for single selection',
          widget: _ChoiceChipsCollectionExample(),
        ),
      ];

  /// State examples
  static List<ChipStoryExample> get stateExamples => [
        ChipStoryExample(
          name: 'All States',
          description: 'Chips showing all possible states',
          widget: _StateExamplesWidget(),
        ),
        ChipStoryExample(
          name: 'Selected vs Unselected',
          description: 'Comparison of selected and unselected states',
          widget: _SelectionStatesExample(),
        ),
        ChipStoryExample(
          name: 'Disabled State',
          description: 'Chips in disabled state',
          widget: _DisabledExample(),
        ),
        ChipStoryExample(
          name: 'Loading State',
          description: 'Chips in loading state',
          widget: _LoadingExample(),
        ),
        ChipStoryExample(
          name: 'Skeleton State',
          description: 'Chips in skeleton loading state',
          widget: _SkeletonExample(),
        ),
      ];

  /// Avatar and icon examples
  static List<ChipStoryExample> get avatarIconExamples => [
        ChipStoryExample(
          name: 'With Avatars',
          description: 'Chips with text and image avatars',
          widget: _AvatarChipsExample(),
        ),
        ChipStoryExample(
          name: 'With Icons',
          description: 'Chips with various icons',
          widget: _IconChipsExample(),
        ),
        ChipStoryExample(
          name: 'Mixed Avatar and Icons',
          description: 'Combination of avatars and icons',
          widget: _MixedAvatarIconExample(),
        ),
        ChipStoryExample(
          name: 'Custom Avatar Colors',
          description: 'Chips with custom avatar background colors',
          widget: _CustomAvatarColorsExample(),
        ),
      ];

  /// Size examples
  static List<ChipStoryExample> get sizeExamples => [
        ChipStoryExample(
          name: 'All Sizes',
          description: 'Chips in small, medium, and large sizes',
          widget: _SizeExamplesWidget(),
        ),
        ChipStoryExample(
          name: 'Small Chips',
          description: 'Collection of small chips',
          widget: _SmallChipsExample(),
        ),
        ChipStoryExample(
          name: 'Large Chips',
          description: 'Collection of large chips',
          widget: _LargeChipsExample(),
        ),
      ];

  /// Shape examples
  static List<ChipStoryExample> get shapeExamples => [
        ChipStoryExample(
          name: 'All Shapes',
          description: 'Chips with different border radius configurations',
          widget: _ShapeExamplesWidget(),
        ),
        ChipStoryExample(
          name: 'Stadium Shape',
          description: 'Chips with fully rounded stadium shape',
          widget: _StadiumShapeExample(),
        ),
        ChipStoryExample(
          name: 'Custom Border Radius',
          description: 'Chips with custom border radius',
          widget: _CustomBorderRadiusExample(),
        ),
      ];

  /// Customization examples
  static List<ChipStoryExample> get customizationExamples => [
        ChipStoryExample(
          name: 'Custom Colors',
          description: 'Chips with custom color schemes',
          widget: _CustomColorsExample(),
        ),
        ChipStoryExample(
          name: 'Custom Configuration',
          description: 'Chips with custom styling configuration',
          widget: _CustomConfigExample(),
        ),
        ChipStoryExample(
          name: 'Custom Typography',
          description: 'Chips with custom text styles',
          widget: _CustomTypographyExample(),
        ),
        ChipStoryExample(
          name: 'Custom Spacing',
          description: 'Chips with custom padding and spacing',
          widget: _CustomSpacingExample(),
        ),
      ];

  /// Interaction examples
  static List<ChipStoryExample> get interactionExamples => [
        ChipStoryExample(
          name: 'Deletable Chips',
          description: 'Chips that can be deleted with animation',
          widget: _DeletableChipsExample(),
        ),
        ChipStoryExample(
          name: 'Selectable Chips',
          description: 'Chips with selection functionality',
          widget: _SelectableChipsExample(),
        ),
        ChipStoryExample(
          name: 'Action Chips',
          description: 'Chips that trigger actions',
          widget: _ActionChipsExample(),
        ),
        ChipStoryExample(
          name: 'Chip Groups',
          description: 'Managing groups of related chips',
          widget: _ChipGroupsExample(),
        ),
      ];

  /// Accessibility examples
  static List<ChipStoryExample> get accessibilityExamples => [
        ChipStoryExample(
          name: 'With Semantic Labels',
          description: 'Chips with proper semantic labels for accessibility',
          widget: _AccessibilityExample(),
        ),
        ChipStoryExample(
          name: 'Keyboard Navigation',
          description: 'Chips optimized for keyboard navigation',
          widget: _KeyboardNavigationExample(),
        ),
        ChipStoryExample(
          name: 'High Contrast',
          description: 'Chips with high contrast colors',
          widget: _HighContrastExample(),
        ),
      ];

  /// RTL examples
  static List<ChipStoryExample> get rtlExamples => [
        ChipStoryExample(
          name: 'RTL Support',
          description: 'Chips with Right-to-Left text direction',
          widget: _RTLExample(),
        ),
        ChipStoryExample(
          name: 'RTL with Avatars',
          description: 'Chips with avatars in RTL layout',
          widget: _RTLWithAvatarsExample(),
        ),
        ChipStoryExample(
          name: 'RTL with Delete Buttons',
          description: 'Deletable chips in RTL layout',
          widget: _RTLWithDeleteExample(),
        ),
      ];

  /// Platform examples
  static List<ChipStoryExample> get platformExamples => [
        ChipStoryExample(
          name: 'Platform Adaptive',
          description: 'Chips that adapt to platform conventions',
          widget: _PlatformAdaptiveExample(),
        ),
        ChipStoryExample(
          name: 'Material Design',
          description: 'Chips following Material Design guidelines',
          widget: _MaterialDesignExample(),
        ),
        ChipStoryExample(
          name: 'Cross-platform Consistency',
          description: 'Consistent chip behavior across platforms',
          widget: _CrossPlatformExample(),
        ),
      ];

  /// All examples grouped by category
  static Map<String, List<ChipStoryExample>> get allExamples => {
        'Basic Usage': basicExamples,
        'Variants': variantExamples,
        'States': stateExamples,
        'Avatars & Icons': avatarIconExamples,
        'Sizes': sizeExamples,
        'Shapes': shapeExamples,
        'Customization': customizationExamples,
        'Interactions': interactionExamples,
        'Accessibility': accessibilityExamples,
        'RTL Support': rtlExamples,
        'Platform Adaptive': platformExamples,
      };
}

/// Data class for story examples
class ChipStoryExample {
  final String name;
  final String description;
  final Widget widget;

  const ChipStoryExample({
    required this.name,
    required this.description,
    required this.widget,
  });
}

// Example Widgets

class _InputChipExample extends StatefulWidget {
  @override
  _InputChipExampleState createState() => _InputChipExampleState();
}

class _InputChipExampleState extends State<_InputChipExample> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          AppChip.input(
            label: 'Flutter',
            onDeleted: () {},
          ),
          AppChip.input(
            label: 'Dart',
            avatar: const CircleAvatar(
              child: Text('D'),
            ),
            onDeleted: () {},
          ),
          AppChip.input(
            label: 'Material Design',
            selected: true,
            onDeleted: () {},
          ),
        ],
      ),
    );
  }
}

class _FilterChipExample extends StatefulWidget {
  @override
  _FilterChipExampleState createState() => _FilterChipExampleState();
}

class _FilterChipExampleState extends State<_FilterChipExample> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          AppChip.filter(
            label: 'Programming',
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                isSelected = selected;
              });
            },
          ),
          AppChip.filter(
            label: 'Mobile Development',
            selected: true,
            icon: Icons.phone_android,
            onSelected: (selected) {},
          ),
          AppChip.filter(
            label: 'Web Development',
            selected: false,
            icon: Icons.web,
            onSelected: (selected) {},
          ),
        ],
      ),
    );
  }
}

class _ChoiceChipExample extends StatefulWidget {
  @override
  _ChoiceChipExampleState createState() => _ChoiceChipExampleState();
}

class _ChoiceChipExampleState extends State<_ChoiceChipExample> {
  String selectedChoice = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          AppChip.choice(
            label: 'Option 1',
            selected: selectedChoice == 'Option 1',
            onSelected: (selected) {
              setState(() {
                selectedChoice = 'Option 1';
              });
            },
          ),
          AppChip.choice(
            label: 'Option 2',
            selected: selectedChoice == 'Option 2',
            onSelected: (selected) {
              setState(() {
                selectedChoice = 'Option 2';
              });
            },
          ),
          AppChip.choice(
            label: 'Option 3',
            selected: selectedChoice == 'Option 3',
            onSelected: (selected) {
              setState(() {
                selectedChoice = 'Option 3';
              });
            },
          ),
        ],
      ),
    );
  }
}

class _AssistChipExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          AppChip.assist(
            label: 'Share',
            icon: Icons.share,
            onSelected: (selected) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Share action triggered')),
              );
            },
          ),
          AppChip.assist(
            label: 'Copy',
            icon: Icons.copy,
            onSelected: (selected) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Copy action triggered')),
              );
            },
          ),
          AppChip.assist(
            label: 'Download',
            icon: Icons.download,
            onSelected: (selected) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Download action triggered')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _AllVariantsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Input Chips',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              AppChip.input(label: 'Tag 1', onDeleted: () {}),
              AppChip.input(label: 'Tag 2', selected: true, onDeleted: () {}),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Filter Chips',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              AppChip.filter(
                  label: 'Active', selected: true, onSelected: (s) {}),
              AppChip.filter(
                  label: 'Inactive', selected: false, onSelected: (s) {}),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Choice Chips',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              AppChip.choice(
                  label: 'Small', selected: true, onSelected: (s) {}),
              AppChip.choice(label: 'Medium', onSelected: (s) {}),
              AppChip.choice(label: 'Large', onSelected: (s) {}),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Assist Chips',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              AppChip.assist(
                  label: 'Edit', icon: Icons.edit, onSelected: (s) {}),
              AppChip.assist(
                  label: 'Delete', icon: Icons.delete, onSelected: (s) {}),
            ],
          ),
        ],
      ),
    );
  }
}

class _InputChipsCollectionExample extends StatefulWidget {
  @override
  _InputChipsCollectionExampleState createState() =>
      _InputChipsCollectionExampleState();
}

class _InputChipsCollectionExampleState
    extends State<_InputChipsCollectionExample> {
  List<String> tags = [
    'Flutter',
    'Dart',
    'Mobile',
    'Cross-platform',
    'UI Framework'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Tags:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: tags
                .map((tag) => AppChip.input(
                      label: tag,
                      onDeleted: () {
                        setState(() {
                          tags.remove(tag);
                        });
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _FilterChipsCollectionExample extends StatefulWidget {
  @override
  _FilterChipsCollectionExampleState createState() =>
      _FilterChipsCollectionExampleState();
}

class _FilterChipsCollectionExampleState
    extends State<_FilterChipsCollectionExample> {
  Set<String> selectedFilters = {'Programming'};
  final filters = [
    'Programming',
    'Design',
    'Testing',
    'DevOps',
    'Documentation'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Filters:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: filters
                .map((filter) => AppChip.filter(
                      label: filter,
                      selected: selectedFilters.contains(filter),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedFilters.add(filter);
                          } else {
                            selectedFilters.remove(filter);
                          }
                        });
                      },
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          Text('Selected: ${selectedFilters.join(', ')}'),
        ],
      ),
    );
  }
}

class _ChoiceChipsCollectionExample extends StatefulWidget {
  @override
  _ChoiceChipsCollectionExampleState createState() =>
      _ChoiceChipsCollectionExampleState();
}

class _ChoiceChipsCollectionExampleState
    extends State<_ChoiceChipsCollectionExample> {
  String selectedSize = 'Medium';
  final sizes = ['Small', 'Medium', 'Large', 'Extra Large'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Size Selection:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: sizes
                .map((size) => AppChip.choice(
                      label: size,
                      selected: selectedSize == size,
                      onSelected: (selected) {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          Text('Selected size: $selectedSize'),
        ],
      ),
    );
  }
}

class _StateExamplesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildStateExample('Default', AppChipState.defaultState),
          const SizedBox(height: 8),
          _buildStateExample('Selected', AppChipState.selected, selected: true),
          const SizedBox(height: 8),
          _buildStateExample('Disabled', AppChipState.defaultState,
              enabled: false),
          const SizedBox(height: 8),
          _buildStateExample('Loading', AppChipState.loading),
          const SizedBox(height: 8),
          _buildStateExample('Skeleton', AppChipState.skeleton),
        ],
      ),
    );
  }

  Widget _buildStateExample(String label, AppChipState state,
      {bool enabled = true, bool selected = false}) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        AppChip(
          label: 'State: $label',
          state: state,
          enabled: enabled,
          selected: selected,
          onSelected: enabled ? (s) {} : null,
        ),
      ],
    );
  }
}

class _SelectionStatesExample extends StatefulWidget {
  @override
  _SelectionStatesExampleState createState() => _SelectionStatesExampleState();
}

class _SelectionStatesExampleState extends State<_SelectionStatesExample> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text('Unselected'),
                  AppChip.filter(
                    label: 'Filter',
                    selected: false,
                    onSelected: (s) {},
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('Selected'),
                  AppChip.filter(
                    label: 'Filter',
                    selected: true,
                    onSelected: (s) {},
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppChip.filter(
            label: 'Toggle Me',
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                isSelected = selected;
              });
            },
          ),
        ],
      ),
    );
  }
}

class _DisabledExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          AppChip.input(
            label: 'Disabled Input',
            enabled: false,
            onDeleted: () {},
          ),
          AppChip.filter(
            label: 'Disabled Filter',
            enabled: false,
            onSelected: (s) {},
          ),
          AppChip.choice(
            label: 'Disabled Choice',
            enabled: false,
            onSelected: (s) {},
          ),
          AppChip.assist(
            label: 'Disabled Assist',
            enabled: false,
            icon: Icons.help,
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _LoadingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          AppChip(
            label: 'Loading...',
            state: AppChipState.loading,
            onSelected: (s) {},
          ),
          AppChip.filter(
            label: 'Processing...',
            state: AppChipState.loading,
            onSelected: (s) {},
          ),
          AppChip.input(
            label: 'Uploading...',
            state: AppChipState.loading,
            onDeleted: () {},
          ),
        ],
      ),
    );
  }
}

class _SkeletonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        children: [
          AppChip(
            label: 'Skeleton',
            state: AppChipState.skeleton,
            onSelected: (s) {},
          ),
          AppChip(
            label: 'Loading',
            state: AppChipState.skeleton,
            size: AppChipSize.small,
            onSelected: (s) {},
          ),
          AppChip(
            label: 'Content',
            state: AppChipState.skeleton,
            size: AppChipSize.large,
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _AvatarChipsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          AppChip.input(
            label: 'John Doe',
            avatarText: 'JD',
            onDeleted: () {},
          ),
          AppChip.filter(
            label: 'Flutter Team',
            avatar: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('F', style: TextStyle(color: Colors.white)),
            ),
            onSelected: (s) {},
          ),
          AppChip.choice(
            label: 'Design System',
            avatarText: 'DS',
            avatarBackgroundColor: Colors.purple,
            onSelected: (s) {},
          ),
          AppChip.assist(
            label: 'Support',
            avatarText: 'S',
            avatarBackgroundColor: Colors.green,
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _IconChipsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          AppChip.assist(
            label: 'Home',
            icon: Icons.home,
            onSelected: (s) {},
          ),
          AppChip.assist(
            label: 'Settings',
            icon: Icons.settings,
            onSelected: (s) {},
          ),
          AppChip.filter(
            label: 'Favorites',
            icon: Icons.favorite,
            onSelected: (s) {},
          ),
          AppChip.input(
            label: 'Location',
            icon: Icons.location_on,
            onDeleted: () {},
          ),
          AppChip.choice(
            label: 'Camera',
            icon: Icons.camera_alt,
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _MixedAvatarIconExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          AppChip.input(
            label: 'Person',
            avatarText: 'P',
            onDeleted: () {},
          ),
          AppChip.input(
            label: 'Location',
            icon: Icons.location_on,
            onDeleted: () {},
          ),
          AppChip.filter(
            label: 'Team',
            avatar: const CircleAvatar(child: Text('T')),
            onSelected: (s) {},
          ),
          AppChip.filter(
            label: 'Projects',
            icon: Icons.folder,
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _CustomAvatarColorsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          AppChip.input(
            label: 'Red Team',
            avatarText: 'R',
            avatarBackgroundColor: Colors.red,
            onDeleted: () {},
          ),
          AppChip.filter(
            label: 'Blue Team',
            avatarText: 'B',
            avatarBackgroundColor: Colors.blue,
            onSelected: (s) {},
          ),
          AppChip.choice(
            label: 'Green Team',
            avatarText: 'G',
            avatarBackgroundColor: Colors.green,
            onSelected: (s) {},
          ),
          AppChip.assist(
            label: 'Purple Team',
            avatarText: 'P',
            avatarBackgroundColor: Colors.purple,
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _SizeExamplesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Small Chips',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              AppChip(
                  label: 'Small', size: AppChipSize.small, onSelected: (s) {}),
              AppChip.filter(
                  label: 'Small Filter',
                  size: AppChipSize.small,
                  onSelected: (s) {}),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Medium Chips',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              AppChip(
                  label: 'Medium',
                  size: AppChipSize.medium,
                  onSelected: (s) {}),
              AppChip.filter(
                  label: 'Medium Filter',
                  size: AppChipSize.medium,
                  onSelected: (s) {}),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Large Chips',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              AppChip(
                  label: 'Large', size: AppChipSize.large, onSelected: (s) {}),
              AppChip.filter(
                  label: 'Large Filter',
                  size: AppChipSize.large,
                  onSelected: (s) {}),
            ],
          ),
        ],
      ),
    );
  }
}

class _SmallChipsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 6.0,
        runSpacing: 6.0,
        children: [
          AppChip.input(
              label: 'Tag 1', size: AppChipSize.small, onDeleted: () {}),
          AppChip.input(
              label: 'Tag 2', size: AppChipSize.small, onDeleted: () {}),
          AppChip.filter(
              label: 'Filter 1', size: AppChipSize.small, onSelected: (s) {}),
          AppChip.filter(
              label: 'Filter 2',
              size: AppChipSize.small,
              selected: true,
              onSelected: (s) {}),
          AppChip.choice(
              label: 'Choice 1', size: AppChipSize.small, onSelected: (s) {}),
          AppChip.assist(
              label: 'Action',
              size: AppChipSize.small,
              icon: Icons.add,
              onSelected: (s) {}),
        ],
      ),
    );
  }
}

class _LargeChipsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 12.0,
        runSpacing: 12.0,
        children: [
          AppChip.input(
            label: 'Large Input Tag',
            size: AppChipSize.large,
            avatarText: 'L',
            onDeleted: () {},
          ),
          AppChip.filter(
            label: 'Large Filter',
            size: AppChipSize.large,
            icon: Icons.filter_list,
            onSelected: (s) {},
          ),
          AppChip.choice(
            label: 'Large Choice',
            size: AppChipSize.large,
            selected: true,
            onSelected: (s) {},
          ),
          AppChip.assist(
            label: 'Large Action',
            size: AppChipSize.large,
            icon: Icons.play_arrow,
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _ShapeExamplesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Rounded Chips',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              AppChip(
                  label: 'Rounded',
                  shape: AppChipShape.rounded,
                  onSelected: (s) {}),
              AppChip.filter(
                  label: 'Filter',
                  shape: AppChipShape.rounded,
                  onSelected: (s) {}),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Stadium Chips',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              AppChip(
                  label: 'Stadium',
                  shape: AppChipShape.stadium,
                  onSelected: (s) {}),
              AppChip.filter(
                  label: 'Filter',
                  shape: AppChipShape.stadium,
                  onSelected: (s) {}),
            ],
          ),
        ],
      ),
    );
  }
}

class _StadiumShapeExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          AppChip.input(
            label: 'Stadium Input',
            shape: AppChipShape.stadium,
            onDeleted: () {},
          ),
          AppChip.filter(
            label: 'Stadium Filter',
            shape: AppChipShape.stadium,
            selected: true,
            onSelected: (s) {},
          ),
          AppChip.choice(
            label: 'Stadium Choice',
            shape: AppChipShape.stadium,
            onSelected: (s) {},
          ),
          AppChip.assist(
            label: 'Stadium Assist',
            shape: AppChipShape.stadium,
            icon: Icons.help,
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _CustomBorderRadiusExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          AppChip(
            label: 'Sharp',
            borderRadius: BorderRadius.circular(2),
            onSelected: (s) {},
          ),
          AppChip(
            label: 'Rounded',
            borderRadius: BorderRadius.circular(16),
            onSelected: (s) {},
          ),
          AppChip(
            label: 'Mixed',
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _CustomColorsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          AppChip(
            label: 'Red Theme',
            backgroundColor: Colors.red.shade100,
            color: Colors.red.shade800,
            onSelected: (s) {},
          ),
          AppChip.filter(
            label: 'Green Theme',
            backgroundColor: Colors.green.shade100,
            color: Colors.green.shade800,
            selected: true,
            onSelected: (s) {},
          ),
          AppChip.choice(
            label: 'Blue Theme',
            backgroundColor: Colors.blue.shade100,
            color: Colors.blue.shade800,
            onSelected: (s) {},
          ),
          AppChip.assist(
            label: 'Purple Theme',
            backgroundColor: Colors.purple.shade100,
            color: Colors.purple.shade800,
            icon: Icons.palette,
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _CustomConfigExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customConfig = AppChipConfig(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 4,
      hoverElevation: 8,
      animationDuration: const Duration(milliseconds: 300),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          AppChip(
            label: 'Custom Config',
            config: customConfig,
            onSelected: (s) {},
          ),
          AppChip.filter(
            label: 'Elevated',
            config: customConfig,
            selected: true,
            onSelected: (s) {},
          ),
          AppChip.assist(
            label: 'Rounded',
            config: customConfig,
            icon: Icons.star,
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _CustomTypographyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          AppChip(
            label: 'Bold Text',
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            onSelected: (s) {},
          ),
          AppChip(
            label: 'Italic Text',
            textStyle: const TextStyle(fontStyle: FontStyle.italic),
            onSelected: (s) {},
          ),
          AppChip(
            label: 'Large Text',
            textStyle: const TextStyle(fontSize: 18),
            onSelected: (s) {},
          ),
          AppChip(
            label: 'Small Text',
            textStyle: const TextStyle(fontSize: 12),
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _CustomSpacingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          AppChip(
            label: 'Compact',
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            onSelected: (s) {},
          ),
          AppChip(
            label: 'Normal',
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            onSelected: (s) {},
          ),
          AppChip(
            label: 'Spacious',
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _DeletableChipsExample extends StatefulWidget {
  @override
  _DeletableChipsExampleState createState() => _DeletableChipsExampleState();
}

class _DeletableChipsExampleState extends State<_DeletableChipsExample> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Deletable Items:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: items
                .map((item) => AppChip.input(
                      label: item,
                      onDeleted: () {
                        setState(() {
                          items.remove(item);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Deleted: $item')),
                        );
                      },
                    ))
                .toList(),
          ),
          if (items.isEmpty)
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('All items deleted!'),
            ),
        ],
      ),
    );
  }
}

class _SelectableChipsExample extends StatefulWidget {
  @override
  _SelectableChipsExampleState createState() => _SelectableChipsExampleState();
}

class _SelectableChipsExampleState extends State<_SelectableChipsExample> {
  Set<String> selectedItems = {};
  final items = ['Option A', 'Option B', 'Option C', 'Option D'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Multi-select Options:',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: items
                .map((item) => AppChip.filter(
                      label: item,
                      selected: selectedItems.contains(item),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedItems.add(item);
                          } else {
                            selectedItems.remove(item);
                          }
                        });
                      },
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          Text(
              'Selected: ${selectedItems.isEmpty ? 'None' : selectedItems.join(', ')}'),
        ],
      ),
    );
  }
}

class _ActionChipsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          AppChip.assist(
            label: 'Send Email',
            icon: Icons.email,
            onSelected: (s) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Email action triggered')),
              );
            },
          ),
          AppChip.assist(
            label: 'Call',
            icon: Icons.phone,
            onSelected: (s) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Call action triggered')),
              );
            },
          ),
          AppChip.assist(
            label: 'Navigate',
            icon: Icons.navigation,
            onSelected: (s) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Navigation action triggered')),
              );
            },
          ),
          AppChip.assist(
            label: 'Calendar',
            icon: Icons.calendar_today,
            onSelected: (s) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Calendar action triggered')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ChipGroupsExample extends StatefulWidget {
  @override
  _ChipGroupsExampleState createState() => _ChipGroupsExampleState();
}

class _ChipGroupsExampleState extends State<_ChipGroupsExample> {
  String selectedPriority = 'Medium';
  Set<String> selectedCategories = {'Work'};
  List<String> tags = ['Important', 'Urgent'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Priority (Single Select):',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: ['Low', 'Medium', 'High']
                .map((priority) => AppChip.choice(
                      label: priority,
                      selected: selectedPriority == priority,
                      onSelected: (selected) {
                        setState(() {
                          selectedPriority = priority;
                        });
                      },
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          const Text('Categories (Multi Select):',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: ['Work', 'Personal', 'Study']
                .map((category) => AppChip.filter(
                      label: category,
                      selected: selectedCategories.contains(category),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedCategories.add(category);
                          } else {
                            selectedCategories.remove(category);
                          }
                        });
                      },
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
          const Text('Tags (Deletable):',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: tags
                .map((tag) => AppChip.input(
                      label: tag,
                      onDeleted: () {
                        setState(() {
                          tags.remove(tag);
                        });
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _AccessibilityExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: [
          AppChip.filter(
            label: 'Accessible Filter',
            semanticLabel: 'Filter option for accessibility testing',
            tooltip: 'This is a filter chip with accessibility support',
            onSelected: (s) {},
          ),
          AppChip.input(
            label: 'Screen Reader Friendly',
            semanticLabel: 'Deletable tag for screen reader users',
            tooltip: 'Press delete to remove this tag',
            onDeleted: () {},
          ),
          AppChip.assist(
            label: 'Voice Control',
            icon: Icons.mic,
            semanticLabel: 'Activate voice control feature',
            tooltip: 'Tap to start voice recognition',
            onSelected: (s) {},
          ),
        ],
      ),
    );
  }
}

class _KeyboardNavigationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Keyboard Navigation:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('• Tab: Move between chips'),
          const Text('• Space/Enter: Activate chip'),
          const Text('• Delete: Remove deletable chips'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              AppChip.filter(
                label: 'Keyboard 1',
                onSelected: (s) {},
              ),
              AppChip.filter(
                label: 'Keyboard 2',
                onSelected: (s) {},
              ),
              AppChip.input(
                label: 'Deletable',
                onDeleted: () {},
              ),
              AppChip.assist(
                label: 'Action',
                icon: Icons.keyboard,
                onSelected: (s) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HighContrastExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final highContrastConfig = AppChipConfig(
      colors: AppChipColors(
        backgroundColor: Colors.black,
        borderColor: Colors.white,
        textColor: Colors.white,
        selectedBackgroundColor: Colors.yellow,
        selectedTextColor: Colors.black,
        hoverBackgroundColor: Colors.grey.shade800,
        hoverTextColor: Colors.yellow,
      ),
      borderWidth: 2,
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            AppChip.filter(
              label: 'High Contrast',
              config: highContrastConfig,
              onSelected: (s) {},
            ),
            AppChip.filter(
              label: 'Selected',
              config: highContrastConfig,
              selected: true,
              onSelected: (s) {},
            ),
            AppChip.input(
              label: 'Accessible',
              config: highContrastConfig,
              onDeleted: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _RTLExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            AppChip.filter(
              label: 'مرشح النص',
              onSelected: (s) {},
            ),
            AppChip.input(
              label: 'علامة قابلة للحذف',
              onDeleted: () {},
            ),
            AppChip.choice(
              label: 'خيار واحد',
              selected: true,
              onSelected: (s) {},
            ),
            AppChip.assist(
              label: 'مساعدة',
              icon: Icons.help,
              onSelected: (s) {},
            ),
          ],
        ),
      ),
    );
  }
}

class _RTLWithAvatarsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            AppChip.input(
              label: 'أحمد محمد',
              avatarText: 'أ',
              onDeleted: () {},
            ),
            AppChip.filter(
              label: 'فريق التطوير',
              avatarText: 'ف',
              avatarBackgroundColor: Colors.blue,
              onSelected: (s) {},
            ),
            AppChip.choice(
              label: 'مجموعة التصميم',
              avatarText: 'م',
              avatarBackgroundColor: Colors.purple,
              onSelected: (s) {},
            ),
          ],
        ),
      ),
    );
  }
}

class _RTLWithDeleteExample extends StatefulWidget {
  @override
  _RTLWithDeleteExampleState createState() => _RTLWithDeleteExampleState();
}

class _RTLWithDeleteExampleState extends State<_RTLWithDeleteExample> {
  List<String> items = ['العنصر الأول', 'العنصر الثاني', 'العنصر الثالث'];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('عناصر قابلة للحذف:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: items
                  .map((item) => AppChip.input(
                        label: item,
                        onDeleted: () {
                          setState(() {
                            items.remove(item);
                          });
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlatformAdaptiveExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final adaptiveConfig = AppChipConfig(
      adaptToPlatform: true,
      enableHapticFeedback: true,
      enableSoundEffects: true,
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Platform Adaptive Chips',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
              'These chips adapt their behavior based on the current platform'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              AppChip.filter(
                label: 'Adaptive',
                config: adaptiveConfig,
                onSelected: (s) {},
              ),
              AppChip.input(
                label: 'Platform',
                config: adaptiveConfig,
                onDeleted: () {},
              ),
              AppChip.assist(
                label: 'Responsive',
                config: adaptiveConfig,
                icon: Icons.devices,
                onSelected: (s) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MaterialDesignExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Material Design 3 Chips',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Chips following Material Design 3 specifications'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              AppChip.filter(
                label: 'Material',
                onSelected: (s) {},
              ),
              AppChip.filter(
                label: 'Design',
                selected: true,
                onSelected: (s) {},
              ),
              AppChip.input(
                label: 'Specification',
                onDeleted: () {},
              ),
              AppChip.assist(
                label: 'Guidelines',
                icon: Icons.design_services,
                onSelected: (s) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CrossPlatformExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cross-platform Consistency',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text('Consistent appearance and behavior across all platforms'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              AppChip.filter(
                label: 'iOS',
                icon: Icons.phone_iphone,
                onSelected: (s) {},
              ),
              AppChip.filter(
                label: 'Android',
                icon: Icons.android,
                selected: true,
                onSelected: (s) {},
              ),
              AppChip.filter(
                label: 'Web',
                icon: Icons.web,
                onSelected: (s) {},
              ),
              AppChip.assist(
                label: 'Desktop',
                icon: Icons.desktop_windows,
                onSelected: (s) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
