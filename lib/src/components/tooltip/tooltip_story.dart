import 'package:flutter/material.dart';
import 'ds_tooltip.dart';

class TooltipStory extends StatefulWidget {
  const TooltipStory({super.key});

  @override
  State<TooltipStory> createState() => _TooltipStoryState();
}

class _TooltipStoryState extends State<TooltipStory> {
  TooltipVariant _selectedVariant = TooltipVariant.hover;
  TooltipPosition _selectedPosition = TooltipPosition.top;
  DSTooltipState _selectedState = DSTooltipState.defaultState;
  Duration _showDelay = const Duration(milliseconds: 500);
  Duration _hideDelay = const Duration(milliseconds: 150);
  bool _rtlSupport = true;
  bool _accessibilitySupport = true;
  bool _enableHapticFeedback = true;
  String _customMessage = 'This is a sample tooltip message';

  final List<String> _predefinedMessages = [
    'This is a sample tooltip message',
    'Quick action tooltip',
    'Helpful information here',
    'Click to perform action',
    'Save your changes',
    'More options available',
    'Settings and preferences',
    'View detailed information',
    'Export data to file',
    'Share with others',
  ];

  final List<Duration> _delayOptions = [
    const Duration(milliseconds: 0),
    const Duration(milliseconds: 100),
    const Duration(milliseconds: 300),
    const Duration(milliseconds: 500),
    const Duration(milliseconds: 750),
    const Duration(milliseconds: 1000),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DSTooltip Story'),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildControls(theme),
            const SizedBox(height: 24),
            _buildLiveExample(theme),
            const SizedBox(height: 24),
            _buildVariantExamples(theme),
            const SizedBox(height: 24),
            _buildPositionExamples(theme),
            const SizedBox(height: 24),
            _buildStateExamples(theme),
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
              'Tooltip Configuration',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Message Input
            TextField(
              onChanged: (value) => setState(() => _customMessage = value),
              decoration: const InputDecoration(
                labelText: 'Tooltip Message',
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
                  label: Text(message.length > 25
                      ? '${message.substring(0, 25)}...'
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

            // Variant, Position, and State Selectors
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Variant:', style: theme.textTheme.titleSmall),
                      const SizedBox(height: 8),
                      DropdownButton<TooltipVariant>(
                        value: _selectedVariant,
                        isExpanded: true,
                        items: TooltipVariant.values.map((variant) {
                          return DropdownMenuItem(
                            value: variant,
                            child: Row(
                              children: [
                                Icon(_getVariantIcon(variant), size: 16),
                                const SizedBox(width: 8),
                                Text(_formatVariantName(variant)),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedVariant = value);
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
                      Text('Position:', style: theme.textTheme.titleSmall),
                      const SizedBox(height: 8),
                      DropdownButton<TooltipPosition>(
                        value: _selectedPosition,
                        isExpanded: true,
                        items: TooltipPosition.values.map((position) {
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
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // State Selector
            Text('State:', style: theme.textTheme.titleSmall),
            const SizedBox(height: 8),
            DropdownButton<DSTooltipState>(
              value: _selectedState,
              isExpanded: true,
              items: DSTooltipState.values.map((state) {
                return DropdownMenuItem(
                  value: state,
                  child: Text(_formatStateName(state)),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedState = value);
                }
              },
            ),
            const SizedBox(height: 16),

            // Delay Controls
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Show Delay:', style: theme.textTheme.titleSmall),
                      const SizedBox(height: 8),
                      DropdownButton<Duration>(
                        value: _showDelay,
                        isExpanded: true,
                        items: _delayOptions.map((delay) {
                          return DropdownMenuItem(
                            value: delay,
                            child: Text('${delay.inMilliseconds}ms'),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _showDelay = value);
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
                      Text('Hide Delay:', style: theme.textTheme.titleSmall),
                      const SizedBox(height: 8),
                      DropdownButton<Duration>(
                        value: _hideDelay,
                        isExpanded: true,
                        items: _delayOptions.map((delay) {
                          return DropdownMenuItem(
                            value: delay,
                            child: Text('${delay.inMilliseconds}ms'),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _hideDelay = value);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Options
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                FilterChip(
                  label: const Text('RTL Support'),
                  selected: _rtlSupport,
                  onSelected: (selected) =>
                      setState(() => _rtlSupport = selected),
                ),
                FilterChip(
                  label: const Text('Accessibility Support'),
                  selected: _accessibilitySupport,
                  onSelected: (selected) =>
                      setState(() => _accessibilitySupport = selected),
                ),
                FilterChip(
                  label: const Text('Haptic Feedback'),
                  selected: _enableHapticFeedback,
                  onSelected: (selected) =>
                      setState(() => _enableHapticFeedback = selected),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveExample(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Live Configuration Example',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Center(
              child: DSTooltip(
                message: _customMessage,
                variant: _selectedVariant,
                state: _selectedState,
                preferredPosition: _selectedPosition,
                showDelay: _showDelay,
                hideDelay: _hideDelay,
                rtlSupport: _rtlSupport,
                accessibilitySupport: _accessibilitySupport,
                enableHapticFeedback: _enableHapticFeedback,
                onShow: () => debugPrint('Tooltip shown'),
                onHide: () => debugPrint('Tooltip hidden'),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getVariantIcon(_selectedVariant),
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _getInteractionText(_selectedVariant),
                        style: TextStyle(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVariantExamples(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tooltip Variants',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            // Hover Variant
            Text('Hover Variant:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                DSTooltip.hover(
                  message: 'Appears on mouse hover (desktop)',
                  showDelay: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      border: Border.all(color: theme.colorScheme.outline),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.mouse, size: 16),
                        SizedBox(width: 8),
                        Text('Hover me'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Desktop only - hover to see tooltip',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Focus Variant
            Text('Focus Variant:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                DSTooltip.focus(
                  message: 'Appears when element gains focus',
                  showDelay: const Duration(milliseconds: 100),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_tab, size: 16),
                    label: const Text('Focus me'),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Tab to focus - shows tooltip',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Long Press Variant
            Text('Long Press Variant:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                DSTooltip.longPress(
                  message: 'Long press to show tooltip',
                  showDelay: const Duration(milliseconds: 750),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.touch_app,
                          size: 16,
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Long press me',
                          style: TextStyle(
                            color: theme.colorScheme.onSecondaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Mobile optimized - long press to show',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPositionExamples(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Position Examples',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: theme.colorScheme.outline),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    // Center element
                    Positioned(
                      left: 135,
                      top: 85,
                      child: DSTooltip.hover(
                        message: 'Center element',
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    // Top positions
                    Positioned(
                      left: 135,
                      top: 20,
                      child: DSTooltip(
                        message: 'Top tooltip',
                        variant: TooltipVariant.hover,
                        preferredPosition: TooltipPosition.top,
                        child: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Center(
                            child: Text('T', style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ),
                    ),
                    // Bottom positions
                    Positioned(
                      left: 135,
                      bottom: 20,
                      child: DSTooltip(
                        message: 'Bottom tooltip',
                        variant: TooltipVariant.hover,
                        preferredPosition: TooltipPosition.bottom,
                        child: Container(
                          width: 30,
                          height: 20,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Center(
                            child: Text('B', style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ),
                    ),
                    // Left position
                    Positioned(
                      left: 20,
                      top: 85,
                      child: DSTooltip(
                        message: 'Left tooltip',
                        variant: TooltipVariant.hover,
                        preferredPosition: TooltipPosition.left,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Center(
                            child: Text('L', style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ),
                    ),
                    // Right position
                    Positioned(
                      right: 20,
                      top: 85,
                      child: DSTooltip(
                        message: 'Right tooltip',
                        variant: TooltipVariant.hover,
                        preferredPosition: TooltipPosition.right,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.secondary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Center(
                            child: Text('R', style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Hover over the elements to see tooltips in different positions',
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStateExamples(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'State Examples',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: DSTooltipState.values.map((state) {
                return DSTooltip.hover(
                  message: 'Tooltip in ${_formatStateName(state)} state',
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: theme.colorScheme.outline),
                    ),
                    child: DSTooltip(
                      message: 'State: ${_formatStateName(state)}',
                      variant: TooltipVariant.hover,
                      state: state,
                      child: Text(
                        _formatStateName(state),
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                );
              }).toList(),
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

            // Custom Styling
            Text('Custom Styling:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            DSTooltip.hover(
              message: 'Custom styled tooltip with longer text that wraps',
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Custom Styled Element'),
              ),
            ),
            const SizedBox(height: 16),

            // Multiple Lines
            Text('Multi-line Tooltip:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            DSTooltip.hover(
              message:
                  'This is a very long tooltip message that demonstrates how the tooltip handles text wrapping and maintains proper readability across multiple lines of content.',
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.info_outline),
                label: const Text('Multi-line Tooltip'),
              ),
            ),
            const SizedBox(height: 16),

            // RTL Support
            Text('RTL Support:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Directionality(
              textDirection: TextDirection.rtl,
              child: DSTooltip.hover(
                message: 'هذا مثال على نص باللغة العربية',
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'RTL Example',
                    style: TextStyle(
                      color: theme.colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Interactive Tooltips
            Text('Interactive Tooltips:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DSTooltip.hover(
                  message: 'Save your work',
                  onShow: () => debugPrint('Save tooltip shown'),
                  onHide: () => debugPrint('Save tooltip hidden'),
                  child: FloatingActionButton.small(
                    onPressed: () {},
                    child: const Icon(Icons.save),
                  ),
                ),
                DSTooltip.focus(
                  message: 'Edit settings',
                  child: FloatingActionButton.small(
                    onPressed: () {},
                    child: const Icon(Icons.settings),
                  ),
                ),
                DSTooltip.longPress(
                  message: 'Delete item',
                  child: FloatingActionButton.small(
                    onPressed: () {},
                    backgroundColor: theme.colorScheme.error,
                    child: const Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getVariantIcon(TooltipVariant variant) {
    switch (variant) {
      case TooltipVariant.hover:
        return Icons.mouse;
      case TooltipVariant.focus:
        return Icons.keyboard_tab;
      case TooltipVariant.longPress:
        return Icons.touch_app;
    }
  }

  String _formatVariantName(TooltipVariant variant) {
    switch (variant) {
      case TooltipVariant.hover:
        return 'Hover';
      case TooltipVariant.focus:
        return 'Focus';
      case TooltipVariant.longPress:
        return 'Long Press';
    }
  }

  String _formatPositionName(TooltipPosition position) {
    switch (position) {
      case TooltipPosition.top:
        return 'Top';
      case TooltipPosition.bottom:
        return 'Bottom';
      case TooltipPosition.left:
        return 'Left';
      case TooltipPosition.right:
        return 'Right';
      case TooltipPosition.topStart:
        return 'Top Start';
      case TooltipPosition.topEnd:
        return 'Top End';
      case TooltipPosition.bottomStart:
        return 'Bottom Start';
      case TooltipPosition.bottomEnd:
        return 'Bottom End';
    }
  }

  String _formatStateName(DSTooltipState state) {
    switch (state) {
      case DSTooltipState.defaultState:
        return 'Default';
      case DSTooltipState.hover:
        return 'Hover';
      case DSTooltipState.pressed:
        return 'Pressed';
      case DSTooltipState.focus:
        return 'Focus';
      case DSTooltipState.selected:
        return 'Selected';
      case DSTooltipState.disabled:
        return 'Disabled';
      case DSTooltipState.loading:
        return 'Loading';
      case DSTooltipState.skeleton:
        return 'Skeleton';
    }
  }

  String _getInteractionText(TooltipVariant variant) {
    switch (variant) {
      case TooltipVariant.hover:
        return 'Hover to show tooltip';
      case TooltipVariant.focus:
        return 'Tab to focus';
      case TooltipVariant.longPress:
        return 'Long press to show';
    }
  }
}
