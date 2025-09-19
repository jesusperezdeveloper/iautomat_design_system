import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/list_item/app_list_item.dart';
import 'package:iautomat_design_system/src/components/list_item/list_item_config.dart';

/// List Item Stories and Examples
///
/// This file provides comprehensive examples and stories for the DSListItem
/// component, showcasing different configurations, variants, and use cases.

class ListItemStoryExample extends StatefulWidget {
  const ListItemStoryExample({super.key});

  @override
  State<ListItemStoryExample> createState() => _ListItemStoryExampleState();
}

class _ListItemStoryExampleState extends State<ListItemStoryExample> {
  String? selectedItem;
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Item Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOneLineVariantSection(),
            const SizedBox(height: 32),
            _buildTwoLineVariantSection(),
            const SizedBox(height: 32),
            _buildThreeLineVariantSection(),
            const SizedBox(height: 32),
            _buildLeadingVariantsSection(),
            const SizedBox(height: 32),
            _buildTrailingVariantsSection(),
            const SizedBox(height: 32),
            _buildInteractiveSection(),
            const SizedBox(height: 32),
            _buildStateVariationsSection(),
            const SizedBox(height: 32),
            _buildSwipeActionsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildOneLineVariantSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'One Line Variant',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              DSListItem.oneLine(
                title: 'Simple one-line item',
                onTap: () => _showSnackBar('Tapped: Simple one-line item'),
              ),
              DSListItem.oneLine(
                title: 'With leading icon',
                leading: const DSListItemLeading(
                  type: DSListItemLeadingType.icon,
                  icon: Icons.person,
                ),
                onTap: () => _showSnackBar('Tapped: With leading icon'),
              ),
              DSListItem.oneLine(
                title: 'With trailing text',
                trailing: const DSListItemTrailing(
                  type: DSListItemTrailingType.text,
                  text: 'Now',
                ),
                onTap: () => _showSnackBar('Tapped: With trailing text'),
              ),
              DSListItem.oneLine(
                title: 'Complete example',
                leading: const DSListItemLeading(
                  type: DSListItemLeadingType.avatar,
                  avatarText: 'CE',
                  avatarBackgroundColor: Colors.blue,
                ),
                trailing: const DSListItemTrailing(
                  type: DSListItemTrailingType.icon,
                  icon: Icons.arrow_forward_ios,
                  iconSize: 16,
                ),
                onTap: () => _showSnackBar('Tapped: Complete example'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTwoLineVariantSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Two Line Variant',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              DSListItem.twoLine(
                title: 'John Doe',
                subtitle: 'Software Engineer',
                onTap: () => _showSnackBar('Tapped: John Doe'),
              ),
              DSListItem.twoLine(
                title: 'Jane Smith',
                subtitle: 'Product Manager',
                leading: const DSListItemLeading(
                  type: DSListItemLeadingType.avatar,
                  avatarText: 'JS',
                  avatarBackgroundColor: Colors.green,
                ),
                trailing: const DSListItemTrailing(
                  type: DSListItemTrailingType.icon,
                  icon: Icons.favorite_border,
                ),
                onTap: () => _showSnackBar('Tapped: Jane Smith'),
              ),
              DSListItem.twoLine(
                title: 'Bob Johnson',
                subtitle: 'UX Designer • Available',
                leading: const DSListItemLeading(
                  type: DSListItemLeadingType.icon,
                  icon: Icons.design_services,
                  iconColor: Colors.purple,
                ),
                trailing: const DSListItemTrailing(
                  type: DSListItemTrailingType.text,
                  text: '2h ago',
                ),
                onTap: () => _showSnackBar('Tapped: Bob Johnson'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildThreeLineVariantSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Three Line Variant',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              DSListItem.threeLine(
                title: 'Team Meeting',
                subtitle:
                    'Discuss project milestones and upcoming deadlines. Review current progress and plan next steps.',
                leading: const DSListItemLeading(
                  type: DSListItemLeadingType.icon,
                  icon: Icons.calendar_today,
                  iconColor: Colors.orange,
                ),
                trailing: const DSListItemTrailing(
                  type: DSListItemTrailingType.text,
                  text: '10:00 AM',
                ),
                onTap: () => _showSnackBar('Tapped: Team Meeting'),
              ),
              DSListItem.threeLine(
                title: 'Alice Cooper',
                subtitle:
                    'Hey, are you available for the call this afternoon? I wanted to discuss the new feature requirements...',
                leading: const DSListItemLeading(
                  type: DSListItemLeadingType.avatar,
                  avatarText: 'AC',
                  avatarBackgroundColor: Colors.pink,
                ),
                trailing: const DSListItemTrailing(
                  type: DSListItemTrailingType.icon,
                  icon: Icons.more_vert,
                ),
                onTap: () => _showSnackBar('Tapped: Alice Cooper'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLeadingVariantsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Leading Variants',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              DSListItem.oneLine(
                title: 'Icon leading',
                leading: const DSListItemLeading(
                  type: DSListItemLeadingType.icon,
                  icon: Icons.home,
                ),
              ),
              DSListItem.oneLine(
                title: 'Avatar leading',
                leading: const DSListItemLeading(
                  type: DSListItemLeadingType.avatar,
                  avatarText: 'AB',
                  avatarBackgroundColor: Colors.blue,
                ),
              ),
              DSListItem.oneLine(
                title: 'Checkbox leading',
                leading: DSListItemLeading(
                  type: DSListItemLeadingType.checkbox,
                  checkboxValue: selectedItems.contains('checkbox1'),
                  onTap: () {
                    setState(() {
                      if (selectedItems.contains('checkbox1')) {
                        selectedItems.remove('checkbox1');
                      } else {
                        selectedItems.add('checkbox1');
                      }
                    });
                  },
                ),
              ),
              DSListItem.oneLine(
                title: 'Radio leading',
                leading: DSListItemLeading(
                  type: DSListItemLeadingType.radio,
                  radioValue: selectedItem == 'radio1',
                  onTap: () {
                    setState(() {
                      selectedItem = 'radio1';
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrailingVariantsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trailing Variants',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              DSListItem.oneLine(
                title: 'Icon trailing',
                trailing: const DSListItemTrailing(
                  type: DSListItemTrailingType.icon,
                  icon: Icons.arrow_forward,
                ),
              ),
              DSListItem.oneLine(
                title: 'Text trailing',
                trailing: const DSListItemTrailing(
                  type: DSListItemTrailingType.text,
                  text: '125',
                ),
              ),
              DSListItem.oneLine(
                title: 'Switch trailing',
                trailing: DSListItemTrailing(
                  type: DSListItemTrailingType.switchWidget,
                  switchValue: selectedItems.contains('switch1'),
                  onSwitchChanged: (value) {
                    setState(() {
                      if (value) {
                        selectedItems.add('switch1');
                      } else {
                        selectedItems.remove('switch1');
                      }
                    });
                  },
                ),
              ),
              DSListItem.oneLine(
                title: 'Checkbox trailing',
                trailing: DSListItemTrailing(
                  type: DSListItemTrailingType.checkbox,
                  checkboxValue: selectedItems.contains('checkbox2'),
                  onCheckboxChanged: (value) {
                    setState(() {
                      if (value == true) {
                        selectedItems.add('checkbox2');
                      } else {
                        selectedItems.remove('checkbox2');
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Interactive Examples',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              DSListItem.twoLine(
                title: 'Selectable item',
                subtitle: 'Tap to select',
                config: DSListItemConfig(
                  selected: selectedItem == 'selectable1',
                ),
                onTap: () {
                  setState(() {
                    selectedItem =
                        selectedItem == 'selectable1' ? null : 'selectable1';
                  });
                },
              ),
              DSListItem.twoLine(
                title: 'Long press item',
                subtitle: 'Long press for options',
                onTap: () => _showSnackBar('Tapped'),
                onLongPress: () => _showDialog('Long pressed!'),
              ),
              DSListItem.twoLine(
                title: 'Disabled item',
                subtitle: 'This item is disabled',
                config: const DSListItemConfig(
                  enabled: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStateVariationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'State Variations',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              DSListItem.twoLine(
                title: 'Loading state',
                subtitle: 'Processing...',
                config: const DSListItemConfig(
                  loading: true,
                ),
              ),
              DSListItem.twoLine(
                title: 'Skeleton state',
                subtitle: 'Loading content...',
                config: const DSListItemConfig(
                  skeleton: true,
                ),
              ),
              DSListItem.twoLine(
                title: 'Selected state',
                subtitle: 'This item is selected',
                config: const DSListItemConfig(
                  selected: true,
                ),
              ),
              DSListItem.twoLine(
                title: 'With divider',
                subtitle: 'Shows divider below',
                config: const DSListItemConfig(
                  showDivider: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSwipeActionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Swipe Actions',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              DSListItem.twoLine(
                title: 'Swipe me left',
                subtitle: 'Swipe to see trailing actions',
                swipeActions: DSListItemSwipeActions(
                  trailing: [
                    DSListItemSwipeAction(
                      key: 'archive',
                      label: 'Archive',
                      icon: Icons.archive,
                      backgroundColor: Colors.blue,
                      onPressed: () => _showSnackBar('Archived!'),
                    ),
                    DSListItemSwipeAction(
                      key: 'delete',
                      label: 'Delete',
                      icon: Icons.delete,
                      backgroundColor: Colors.red,
                      isDestructive: true,
                      onPressed: () => _showSnackBar('Deleted!'),
                    ),
                  ],
                ),
              ),
              DSListItem.twoLine(
                title: 'Swipe me right',
                subtitle: 'Swipe to see leading actions',
                swipeActions: DSListItemSwipeActions(
                  leading: [
                    DSListItemSwipeAction(
                      key: 'favorite',
                      label: 'Favorite',
                      icon: Icons.favorite,
                      backgroundColor: Colors.pink,
                      onPressed: () => _showSnackBar('Added to favorites!'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Action'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

/// Usage Examples for Documentation
class ListItemUsageExamples {
  /// Basic one-line example
  static Widget oneLineExample() {
    return DSListItem.oneLine(
      title: 'Simple list item',
      onTap: () {
        // Handle tap
      },
    );
  }

  /// Two-line with leading and trailing
  static Widget twoLineExample() {
    return DSListItem.twoLine(
      title: 'John Doe',
      subtitle: 'Software Engineer',
      leading: const DSListItemLeading(
        type: DSListItemLeadingType.avatar,
        avatarText: 'JD',
      ),
      trailing: const DSListItemTrailing(
        type: DSListItemTrailingType.icon,
        icon: Icons.arrow_forward_ios,
      ),
      onTap: () {
        // Handle tap
      },
    );
  }

  /// Three-line example
  static Widget threeLineExample() {
    return DSListItem.threeLine(
      title: 'Meeting Notes',
      subtitle:
          'Weekly team sync - Discussed project progress, upcoming milestones, and resource allocation for next quarter.',
      leading: const DSListItemLeading(
        type: DSListItemLeadingType.icon,
        icon: Icons.notes,
      ),
      trailing: const DSListItemTrailing(
        type: DSListItemTrailingType.text,
        text: '2h ago',
      ),
    );
  }

  /// With checkbox leading
  static Widget checkboxExample() {
    return DSListItem.oneLine(
      title: 'Task item',
      leading: const DSListItemLeading(
        type: DSListItemLeadingType.checkbox,
        checkboxValue: false,
      ),
    );
  }

  /// With switch trailing
  static Widget switchExample() {
    return DSListItem.twoLine(
      title: 'Notifications',
      subtitle: 'Enable push notifications',
      trailing: const DSListItemTrailing(
        type: DSListItemTrailingType.switchWidget,
        switchValue: true,
      ),
    );
  }

  /// Loading state example
  static Widget loadingExample() {
    return DSListItem.oneLine(
      title: 'Loading item',
      config: const DSListItemConfig(
        loading: true,
      ),
    );
  }

  /// Skeleton state example
  static Widget skeletonExample() {
    return DSListItem.twoLine(
      title: 'Placeholder',
      subtitle: 'Loading content...',
      config: const DSListItemConfig(
        skeleton: true,
      ),
    );
  }

  /// With swipe actions
  static Widget swipeActionsExample() {
    return DSListItem.twoLine(
      title: 'Swipeable item',
      subtitle: 'Swipe left for actions',
      swipeActions: DSListItemSwipeActions(
        trailing: [
          DSListItemSwipeAction(
            key: 'delete',
            label: 'Delete',
            icon: Icons.delete,
            backgroundColor: Colors.red,
            onPressed: () {
              // Handle delete
            },
          ),
        ],
      ),
    );
  }

  /// Custom styling example
  static Widget customStyledExample() {
    return DSListItem.twoLine(
      title: 'Custom styled item',
      subtitle: 'With custom configuration',
      config: const DSListItemConfig(
        density: DSListItemDensity.comfortable,
        style: DSListItemStyle(
          contentAlignment: DSListItemContentAlignment.top,
          dense: false,
        ),
        theme: DSListItemTheme(
          backgroundColor: Colors.blue,
          borderRadius: 8.0,
        ),
      ),
    );
  }
}
