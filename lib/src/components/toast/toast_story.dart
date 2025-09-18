import 'package:flutter/material.dart';
import 'app_toast.dart';

class ToastStory extends StatefulWidget {
  const ToastStory({super.key});

  @override
  State<ToastStory> createState() => _ToastStoryState();
}

class _ToastStoryState extends State<ToastStory> {
  ToastType _selectedType = ToastType.info;
  ToastPosition _selectedPosition = ToastPosition.bottom;
  Duration _selectedDuration = const Duration(seconds: 4);
  bool _showAction = true;
  bool _showCloseButton = true;
  bool _enableHapticFeedback = true;
  String _customMessage = 'This is a sample toast message';

  final List<String> _predefinedMessages = [
    'This is a sample toast message',
    'Operation completed successfully!',
    'Warning: Please review your settings',
    'Error: Something went wrong',
    'Your changes have been saved',
    'New update available',
    'Connection restored',
    'File uploaded successfully',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AppToast Story'),
        backgroundColor: theme.colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => AppToastManager.removeAll(),
            icon: const Icon(Icons.clear_all),
            tooltip: 'Clear All Toasts',
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
            _buildQuickActions(theme),
            const SizedBox(height: 24),
            _buildExamples(theme),
            const SizedBox(height: 24),
            _buildStackableDemo(theme),
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
              'Toast Configuration',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Message Input
            TextField(
              onChanged: (value) => setState(() => _customMessage = value),
              decoration: const InputDecoration(
                labelText: 'Toast Message',
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
                  label: Text(message.length > 30
                      ? '${message.substring(0, 30)}...'
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

            // Type Selector
            Text('Toast Type:', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            SegmentedButton<ToastType>(
              segments: const [
                ButtonSegment(
                  value: ToastType.info,
                  label: Text('Info'),
                  icon: Icon(Icons.info),
                ),
                ButtonSegment(
                  value: ToastType.success,
                  label: Text('Success'),
                  icon: Icon(Icons.check_circle),
                ),
                ButtonSegment(
                  value: ToastType.warning,
                  label: Text('Warning'),
                  icon: Icon(Icons.warning),
                ),
                ButtonSegment(
                  value: ToastType.error,
                  label: Text('Error'),
                  icon: Icon(Icons.error),
                ),
              ],
              selected: {_selectedType},
              onSelectionChanged: (Set<ToastType> selection) {
                setState(() => _selectedType = selection.first);
              },
            ),
            const SizedBox(height: 16),

            // Position Selector
            Text('Position:', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            DropdownButton<ToastPosition>(
              value: _selectedPosition,
              isExpanded: true,
              items: ToastPosition.values.map((position) {
                return DropdownMenuItem(
                  value: position,
                  child: Text(_formatPositionName(position)),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedPosition = value);
                }
              },
            ),
            const SizedBox(height: 16),

            // Duration Selector
            Text('Duration:', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            SegmentedButton<Duration>(
              segments: const [
                ButtonSegment(
                  value: Duration(seconds: 2),
                  label: Text('2s'),
                ),
                ButtonSegment(
                  value: Duration(seconds: 4),
                  label: Text('4s'),
                ),
                ButtonSegment(
                  value: Duration(seconds: 6),
                  label: Text('6s'),
                ),
                ButtonSegment(
                  value: Duration.zero,
                  label: Text('Persistent'),
                ),
              ],
              selected: {_selectedDuration},
              onSelectionChanged: (Set<Duration> selection) {
                setState(() => _selectedDuration = selection.first);
              },
            ),
            const SizedBox(height: 16),

            // Options
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                FilterChip(
                  label: const Text('Show Action'),
                  selected: _showAction,
                  onSelected: (selected) =>
                      setState(() => _showAction = selected),
                ),
                FilterChip(
                  label: const Text('Show Close Button'),
                  selected: _showCloseButton,
                  onSelected: (selected) =>
                      setState(() => _showCloseButton = selected),
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

            // Show Toast Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _showConfiguredToast(),
                icon: const Icon(Icons.notification_add),
                label: const Text('Show Toast'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton.icon(
                  onPressed: () => AppToast.info(
                    context,
                    message: 'This is an info message',
                    position: _selectedPosition,
                  ),
                  icon: const Icon(Icons.info),
                  label: const Text('Show Info'),
                ),
                ElevatedButton.icon(
                  onPressed: () => AppToast.success(
                    context,
                    message: 'Operation completed successfully!',
                    position: _selectedPosition,
                    action: ToastAction(
                      label: 'View',
                      onPressed: () => debugPrint('View action tapped'),
                    ),
                  ),
                  icon: const Icon(Icons.check_circle),
                  label: const Text('Show Success'),
                ),
                ElevatedButton.icon(
                  onPressed: () => AppToast.warning(
                    context,
                    message: 'Please review your settings',
                    position: _selectedPosition,
                  ),
                  icon: const Icon(Icons.warning),
                  label: const Text('Show Warning'),
                ),
                ElevatedButton.icon(
                  onPressed: () => AppToast.error(
                    context,
                    message: 'Something went wrong. Please try again.',
                    position: _selectedPosition,
                    action: ToastAction(
                      label: 'Retry',
                      onPressed: () => debugPrint('Retry action tapped'),
                      icon: Icons.refresh,
                    ),
                  ),
                  icon: const Icon(Icons.error),
                  label: const Text('Show Error'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamples(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Toast Examples',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Different positions
            Text('Different Positions:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ToastPosition.values.map((position) {
                return OutlinedButton(
                  onPressed: () => AppToast.info(
                    context,
                    message: 'Toast at ${_formatPositionName(position)}',
                    position: position,
                  ),
                  child: Text(_formatPositionName(position)),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Different durations
            Text('Different Durations:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton(
                  onPressed: () => AppToast.info(
                    context,
                    message: 'Quick toast (1s)',
                    duration: const Duration(seconds: 1),
                    position: _selectedPosition,
                  ),
                  child: const Text('1 Second'),
                ),
                OutlinedButton(
                  onPressed: () => AppToast.info(
                    context,
                    message: 'Normal toast (4s)',
                    duration: const Duration(seconds: 4),
                    position: _selectedPosition,
                  ),
                  child: const Text('4 Seconds'),
                ),
                OutlinedButton(
                  onPressed: () => AppToast.info(
                    context,
                    message: 'Long toast (8s)',
                    duration: const Duration(seconds: 8),
                    position: _selectedPosition,
                  ),
                  child: const Text('8 Seconds'),
                ),
                OutlinedButton(
                  onPressed: () => AppToast.info(
                    context,
                    message: 'Persistent toast (tap to close)',
                    duration: Duration.zero,
                    position: _selectedPosition,
                  ),
                  child: const Text('Persistent'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStackableDemo(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stackable Demo',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Test the stackable behavior by showing multiple toasts',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () => _showMultipleToasts(),
                  child: const Text('Show 3 Toasts'),
                ),
                ElevatedButton(
                  onPressed: () => _showToastSequence(),
                  child: const Text('Show Sequence'),
                ),
                ElevatedButton(
                  onPressed: () => _showMixedPositions(),
                  child: const Text('Mixed Positions'),
                ),
                OutlinedButton(
                  onPressed: () =>
                      AppToastManager.removeAllAtPosition(_selectedPosition),
                  child:
                      Text('Clear ${_formatPositionName(_selectedPosition)}'),
                ),
                OutlinedButton(
                  onPressed: () => AppToastManager.removeAll(),
                  child: const Text('Clear All'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showConfiguredToast() {
    AppToast.show(
      context,
      message: _customMessage,
      type: _selectedType,
      position: _selectedPosition,
      duration: _selectedDuration,
      action: _showAction
          ? ToastAction(
              label: 'Action',
              onPressed: () => debugPrint('Action pressed'),
            )
          : null,
      showCloseButton: _showCloseButton,
    );
  }

  void _showMultipleToasts() {
    for (int i = 1; i <= 3; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        if (mounted) {
          AppToast.info(
            context,
            message: 'Stacked toast #$i',
            position: _selectedPosition,
            duration: const Duration(seconds: 6),
          );
        }
      });
    }
  }

  void _showToastSequence() {
    final messages = [
      'Starting process...',
      'Processing data...',
      'Almost done...',
      'Process completed!',
    ];

    final types = [
      ToastType.info,
      ToastType.warning,
      ToastType.warning,
      ToastType.success,
    ];

    for (int i = 0; i < messages.length; i++) {
      Future.delayed(Duration(milliseconds: i * 1000), () {
        if (mounted) {
          AppToast.show(
            context,
            message: messages[i],
            type: types[i],
            position: _selectedPosition,
            duration: const Duration(seconds: 3),
          );
        }
      });
    }
  }

  void _showMixedPositions() {
    final positions = [
      ToastPosition.top,
      ToastPosition.center,
      ToastPosition.bottom,
    ];

    for (int i = 0; i < positions.length; i++) {
      Future.delayed(Duration(milliseconds: i * 300), () {
        if (mounted) {
          AppToast.info(
            context,
            message: 'Toast at ${_formatPositionName(positions[i])}',
            position: positions[i],
            duration: const Duration(seconds: 5),
          );
        }
      });
    }
  }

  String _formatPositionName(ToastPosition position) {
    switch (position) {
      case ToastPosition.top:
        return 'Top';
      case ToastPosition.topStart:
        return 'Top Start';
      case ToastPosition.topEnd:
        return 'Top End';
      case ToastPosition.center:
        return 'Center';
      case ToastPosition.centerStart:
        return 'Center Start';
      case ToastPosition.centerEnd:
        return 'Center End';
      case ToastPosition.bottom:
        return 'Bottom';
      case ToastPosition.bottomStart:
        return 'Bottom Start';
      case ToastPosition.bottomEnd:
        return 'Bottom End';
    }
  }
}
