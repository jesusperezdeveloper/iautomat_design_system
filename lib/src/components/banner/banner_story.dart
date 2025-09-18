import 'package:flutter/material.dart';
import 'app_banner.dart';

class BannerStory extends StatefulWidget {
  const BannerStory({super.key});

  @override
  State<BannerStory> createState() => _BannerStoryState();
}

class _BannerStoryState extends State<BannerStory> {
  BannerType _selectedType = BannerType.info;
  BannerVariant _selectedVariant = BannerVariant.inline;
  BannerPriority _selectedPriority = BannerPriority.medium;
  bool _showIcon = true;
  bool _showDismissButton = true;
  bool _showActions = true;
  bool _enableHapticFeedback = true;
  String _customMessage = 'This is a sample banner message';

  final List<String> _predefinedMessages = [
    'This is a sample banner message',
    'Your changes have been saved successfully!',
    'Warning: Please review your settings before continuing',
    'Error: Unable to connect to server. Please try again.',
    'New version available - update to get the latest features',
    'Your account will expire in 3 days',
    'Maintenance scheduled for tonight at 11 PM',
    'Welcome! Complete your profile to get started',
    'File upload completed successfully',
    'You have 5 unread notifications',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBanner Story'),
        backgroundColor: theme.colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => AppBannerManager.removeAll(),
            icon: const Icon(Icons.clear_all),
            tooltip: 'Dismiss All Global Banners',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildControls(theme),
            const SizedBox(height: 24),
            _buildInlineExamples(theme),
            const SizedBox(height: 24),
            _buildGlobalActions(theme),
            const SizedBox(height: 24),
            _buildTypeExamples(theme),
            const SizedBox(height: 24),
            _buildPriorityDemo(theme),
            const SizedBox(height: 24),
            _buildAdvancedExamples(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildControls(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Banner Configuration',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Message Input
            TextField(
              onChanged: (value) => setState(() => _customMessage = value),
              decoration: const InputDecoration(
                labelText: 'Banner Message',
                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: _customMessage),
            ),
            const SizedBox(height: 16),

            // Quick Message Selector
            Text('Quick Messages:', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _predefinedMessages.map((message) {
                return FilterChip(
                  label: Text(message.length > 40
                      ? '${message.substring(0, 40)}...'
                      : message),
                  selected: _customMessage == message,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _customMessage = message);
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Type and Variant Selectors
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Banner Type:', style: theme.textTheme.titleSmall),
                      const SizedBox(height: 8),
                      DropdownButton<BannerType>(
                        value: _selectedType,
                        isExpanded: true,
                        items: BannerType.values.map((type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Row(
                              children: [
                                Icon(_getTypeIcon(type), size: 16),
                                const SizedBox(width: 8),
                                Text(_formatTypeName(type)),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedType = value);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Variant:', style: theme.textTheme.titleSmall),
                      const SizedBox(height: 8),
                      SegmentedButton<BannerVariant>(
                        segments: const [
                          ButtonSegment(
                            value: BannerVariant.inline,
                            label: Text('Inline'),
                            icon: Icon(Icons.view_stream, size: 16),
                          ),
                          ButtonSegment(
                            value: BannerVariant.global,
                            label: Text('Global'),
                            icon: Icon(Icons.notifications, size: 16),
                          ),
                        ],
                        selected: {_selectedVariant},
                        onSelectionChanged: (Set<BannerVariant> selection) {
                          setState(() => _selectedVariant = selection.first);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Priority Selector (only for global banners)
            if (_selectedVariant == BannerVariant.global) ...[
              Text('Priority:', style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              SegmentedButton<BannerPriority>(
                segments: const [
                  ButtonSegment(
                    value: BannerPriority.low,
                    label: Text('Low'),
                  ),
                  ButtonSegment(
                    value: BannerPriority.medium,
                    label: Text('Medium'),
                  ),
                  ButtonSegment(
                    value: BannerPriority.high,
                    label: Text('High'),
                  ),
                  ButtonSegment(
                    value: BannerPriority.critical,
                    label: Text('Critical'),
                  ),
                ],
                selected: {_selectedPriority},
                onSelectionChanged: (Set<BannerPriority> selection) {
                  setState(() => _selectedPriority = selection.first);
                },
              ),
              const SizedBox(height: 16),
            ],

            // Options
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                FilterChip(
                  label: const Text('Show Icon'),
                  selected: _showIcon,
                  onSelected: (selected) =>
                      setState(() => _showIcon = selected),
                ),
                FilterChip(
                  label: const Text('Show Dismiss Button'),
                  selected: _showDismissButton,
                  onSelected: (selected) =>
                      setState(() => _showDismissButton = selected),
                ),
                FilterChip(
                  label: const Text('Show Actions'),
                  selected: _showActions,
                  onSelected: (selected) =>
                      setState(() => _showActions = selected),
                ),
                FilterChip(
                  label: const Text('Haptic Feedback'),
                  selected: _enableHapticFeedback,
                  onSelected: (selected) =>
                      setState(() => _enableHapticFeedback = selected),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Show Banner Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _showConfiguredBanner(),
                icon: Icon(_selectedVariant == BannerVariant.inline
                    ? Icons.add_box
                    : Icons.notification_add),
                label: Text(_selectedVariant == BannerVariant.inline
                    ? 'Show Inline Banner'
                    : 'Show Global Banner'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInlineExamples(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Inline Banner Examples',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Info Banner
            AppBanner(
              variant: BannerVariant.inline,
              type: BannerType.info,
              message: 'This is an informational message',
              leading: const Icon(Icons.info),
              showDismissButton: true,
              onDismiss: () => debugPrint('Info banner dismissed'),
            ),
            const SizedBox(height: 12),

            // Success Banner with Action
            AppBanner(
              variant: BannerVariant.inline,
              type: BannerType.success,
              message: 'Operation completed successfully!',
              leading: const Icon(Icons.check_circle),
              showDismissButton: true,
              actions: [
                BannerAction(
                  label: 'View Details',
                  onPressed: () => debugPrint('View details pressed'),
                ),
              ],
              onDismiss: () => debugPrint('Success banner dismissed'),
            ),
            const SizedBox(height: 12),

            // Warning Banner
            AppBanner(
              variant: BannerVariant.inline,
              type: BannerType.warning,
              message: 'Please review your settings before continuing',
              leading: const Icon(Icons.warning),
              showDismissButton: true,
              onDismiss: () => debugPrint('Warning banner dismissed'),
            ),
            const SizedBox(height: 12),

            // Error Banner with Multiple Actions
            AppBanner(
              variant: BannerVariant.inline,
              type: BannerType.error,
              message: 'Unable to save changes. Please try again.',
              leading: const Icon(Icons.error),
              showDismissButton: true,
              actions: [
                BannerAction(
                  label: 'Retry',
                  onPressed: () => debugPrint('Retry pressed'),
                  isPrimary: true,
                ),
                BannerAction(
                  label: 'Cancel',
                  onPressed: () => debugPrint('Cancel pressed'),
                ),
              ],
              onDismiss: () => debugPrint('Error banner dismissed'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlobalActions(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Global Banner Actions',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Global banners appear as overlays at the top of the screen',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton.icon(
                  onPressed: () => AppBanner.showGlobal(
                    context,
                    type: BannerType.info,
                    message: 'Global info banner',
                    priority: BannerPriority.medium,
                  ),
                  icon: const Icon(Icons.info, size: 16),
                  label: const Text('Show Global Info'),
                ),
                ElevatedButton.icon(
                  onPressed: () => AppBanner.showGlobal(
                    context,
                    type: BannerType.success,
                    message: 'Task completed successfully!',
                    priority: BannerPriority.medium,
                    actions: [
                      BannerAction(
                        label: 'View',
                        onPressed: () => debugPrint('View pressed'),
                      ),
                    ],
                  ),
                  icon: const Icon(Icons.check_circle, size: 16),
                  label: const Text('Show Global Success'),
                ),
                ElevatedButton.icon(
                  onPressed: () => AppBanner.showGlobal(
                    context,
                    type: BannerType.warning,
                    message: 'System maintenance in 10 minutes',
                    priority: BannerPriority.high,
                    persistent: true,
                  ),
                  icon: const Icon(Icons.warning, size: 16),
                  label: const Text('Show Global Warning'),
                ),
                ElevatedButton.icon(
                  onPressed: () => AppBanner.showGlobal(
                    context,
                    type: BannerType.error,
                    message: 'Critical system error detected',
                    priority: BannerPriority.critical,
                    persistent: true,
                    actions: [
                      BannerAction(
                        label: 'Report',
                        onPressed: () => debugPrint('Report pressed'),
                        isPrimary: true,
                      ),
                    ],
                  ),
                  icon: const Icon(Icons.error, size: 16),
                  label: const Text('Show Critical Error'),
                ),
                OutlinedButton(
                  onPressed: () => AppBannerManager.removeAll(),
                  child: const Text('Dismiss All Global'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeExamples(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Banner Types Showcase',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text('All Types with Icons:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            ...BannerType.values.map((type) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: AppBanner(
                    variant: BannerVariant.inline,
                    type: type,
                    message: _getTypeExampleMessage(type),
                    leading: Icon(_getTypeIcon(type)),
                    showDismissButton: false,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityDemo(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Priority System Demo',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Show multiple global banners with different priorities to see the ordering',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () => _showPrioritySequence(),
                  child: const Text('Show Priority Sequence'),
                ),
                ElevatedButton(
                  onPressed: () => _showMixedPriorities(),
                  child: const Text('Show Mixed Priorities'),
                ),
                OutlinedButton(
                  onPressed: () => AppBannerManager.removeAll(),
                  child: const Text('Clear All'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvancedExamples(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Advanced Features',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Custom Styling Example
            Text('Custom Styling:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            AppBanner(
              variant: BannerVariant.inline,
              type: BannerType.neutral,
              message: 'Custom styled banner with neutral type',
              showDismissButton: true,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              textColor: theme.colorScheme.onSurface,
              onDismiss: () => debugPrint('Custom banner dismissed'),
            ),
            const SizedBox(height: 16),

            // Long Message Example
            Text('Long Message Handling:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            AppBanner(
              variant: BannerVariant.inline,
              type: BannerType.info,
              message:
                  'This is a very long message that demonstrates how the banner handles text wrapping and maintains proper spacing and alignment across multiple lines of content.',
              leading: const Icon(Icons.info),
              showDismissButton: true,
              actions: [
                BannerAction(
                  label: 'Learn More',
                  onPressed: () => debugPrint('Learn more pressed'),
                ),
              ],
              onDismiss: () => debugPrint('Long message banner dismissed'),
            ),
            const SizedBox(height: 16),

            // Action Buttons
            Text('Interactive Features:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                OutlinedButton(
                  onPressed: () => AppBanner.showGlobal(
                    context,
                    type: BannerType.info,
                    message: 'Auto-dismiss banner (5 seconds)',
                    autoDismissDuration: const Duration(seconds: 5),
                  ),
                  child: const Text('Auto-dismiss Banner'),
                ),
                OutlinedButton(
                  onPressed: () => AppBanner.showGlobal(
                    context,
                    type: BannerType.warning,
                    message: 'Persistent banner (no auto-dismiss)',
                    persistent: true,
                  ),
                  child: const Text('Persistent Banner'),
                ),
                OutlinedButton(
                  onPressed: () => _showAnimationDemo(),
                  child: const Text('Animation Demo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showConfiguredBanner() {
    if (_selectedVariant == BannerVariant.inline) {
      // For inline banners, we would need to manage them in the parent widget
      // This is just a demonstration
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Inline banner would be shown here'),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ),
      );
    } else {
      AppBanner.showGlobal(context,
          type: _selectedType,
          message: _customMessage,
          priority: _selectedPriority,
          showDismissButton: _showDismissButton,
          leading: _showIcon ? Icon(_getTypeIcon(_selectedType)) : null,
          actions: _showActions
              ? [
                  BannerAction(
                    label: 'Action',
                    onPressed: () => debugPrint('Action pressed'),
                  ),
                ]
              : []);
    }
  }

  void _showPrioritySequence() {
    final priorities = [
      BannerPriority.low,
      BannerPriority.medium,
      BannerPriority.high,
      BannerPriority.critical,
    ];

    for (int i = 0; i < priorities.length; i++) {
      Future.delayed(Duration(milliseconds: i * 500), () {
        if (mounted) {
          AppBanner.showGlobal(
            context,
            type: BannerType.info,
            message: 'Priority: ${_formatPriorityName(priorities[i])}',
            priority: priorities[i],
            autoDismissDuration: const Duration(seconds: 6),
          );
        }
      });
    }
  }

  void _showMixedPriorities() {
    // Show in reverse priority order to demonstrate reordering
    final banners = [
      (BannerPriority.low, 'Low priority banner'),
      (BannerPriority.critical, 'Critical priority banner'),
      (BannerPriority.medium, 'Medium priority banner'),
      (BannerPriority.high, 'High priority banner'),
    ];

    for (int i = 0; i < banners.length; i++) {
      Future.delayed(Duration(milliseconds: i * 300), () {
        if (mounted) {
          AppBanner.showGlobal(
            context,
            type: BannerType.info,
            message: banners[i].$2,
            priority: banners[i].$1,
            autoDismissDuration: const Duration(seconds: 8),
          );
        }
      });
    }
  }

  void _showAnimationDemo() {
    final types = [BannerType.info, BannerType.warning, BannerType.error];
    final messages = [
      'Animation demo step 1',
      'Animation demo step 2',
      'Animation demo step 3',
    ];

    for (int i = 0; i < types.length; i++) {
      Future.delayed(Duration(milliseconds: i * 1000), () {
        if (mounted) {
          AppBanner.showGlobal(
            context,
            type: types[i],
            message: messages[i],
            priority: BannerPriority.medium,
            autoDismissDuration: const Duration(seconds: 2),
          );
        }
      });
    }
  }

  IconData _getTypeIcon(BannerType type) {
    switch (type) {
      case BannerType.info:
        return Icons.info;
      case BannerType.success:
        return Icons.check_circle;
      case BannerType.warning:
        return Icons.warning;
      case BannerType.error:
        return Icons.error;
      case BannerType.neutral:
        return Icons.info_outline;
    }
  }

  String _formatTypeName(BannerType type) {
    switch (type) {
      case BannerType.info:
        return 'Info';
      case BannerType.success:
        return 'Success';
      case BannerType.warning:
        return 'Warning';
      case BannerType.error:
        return 'Error';
      case BannerType.neutral:
        return 'Neutral';
    }
  }

  String _formatPriorityName(BannerPriority priority) {
    switch (priority) {
      case BannerPriority.low:
        return 'Low';
      case BannerPriority.medium:
        return 'Medium';
      case BannerPriority.high:
        return 'High';
      case BannerPriority.critical:
        return 'Critical';
    }
  }

  String _getTypeExampleMessage(BannerType type) {
    switch (type) {
      case BannerType.info:
        return 'This is an informational message';
      case BannerType.success:
        return 'Operation completed successfully!';
      case BannerType.warning:
        return 'Please review your settings';
      case BannerType.error:
        return 'An error occurred';
      case BannerType.neutral:
        return 'Neutral banner message';
    }
  }
}
