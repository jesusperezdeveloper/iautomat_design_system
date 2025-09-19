import 'package:flutter/material.dart';
import 'ds_radio.dart';
import 'radio_config.dart';

class RadioStory extends StatelessWidget {
  const RadioStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSRadio Stories'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StorySection(
              title: 'Standard Radio - Basic States',
              child: _StandardBasicStatesStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Standard Radio - With Labels',
              child: _StandardWithLabelsStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Segmented Radio - Basic',
              child: _SegmentedBasicStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Segmented Radio - With Icons',
              child: _SegmentedWithIconsStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Interactive States',
              child: _InteractiveStatesStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Platform Adaptive',
              child: _PlatformAdaptiveStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'RTL Support',
              child: _RtlSupportStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Custom Configuration',
              child: _CustomConfigStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Accessibility',
              child: _AccessibilityStory(),
            ),
          ],
        ),
      ),
    );
  }
}

class _StorySection extends StatelessWidget {
  final String title;
  final Widget child;

  const _StorySection({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ],
    );
  }
}

class _StandardBasicStatesStory extends StatefulWidget {
  const _StandardBasicStatesStory();

  @override
  State<_StandardBasicStatesStory> createState() =>
      _StandardBasicStatesStoryState();
}

class _StandardBasicStatesStoryState extends State<_StandardBasicStatesStory> {
  String? _selectedValue = 'option1';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSRadio<String>(
          value: 'option1',
          groupValue: _selectedValue,
          onChanged: (value) => setState(() => _selectedValue = value),
        ),
        const SizedBox(height: 16),
        DSRadio<String>(
          value: 'option2',
          groupValue: _selectedValue,
          onChanged: (value) => setState(() => _selectedValue = value),
        ),
        const SizedBox(height: 16),
        DSRadio<String>(
          value: 'option3',
          groupValue: _selectedValue,
          onChanged: null,
          enabled: false,
        ),
        const SizedBox(height: 16),
        const DSRadio<String>(
          value: 'option4',
          groupValue: 'option4',
          onChanged: null,
          enabled: false,
        ),
        const SizedBox(height: 16),
        const DSRadio<String>(
          value: 'loading',
          groupValue: null,
          onChanged: null,
          overrideState: DSRadioState.loading,
        ),
        const SizedBox(height: 16),
        const DSRadio<String>(
          value: 'skeleton',
          groupValue: null,
          onChanged: null,
          overrideState: DSRadioState.skeleton,
        ),
      ],
    );
  }
}

class _StandardWithLabelsStory extends StatefulWidget {
  const _StandardWithLabelsStory();

  @override
  State<_StandardWithLabelsStory> createState() =>
      _StandardWithLabelsStoryState();
}

class _StandardWithLabelsStoryState extends State<_StandardWithLabelsStory> {
  String? _selectedValue = 'small';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSRadio<String>(
          value: 'small',
          groupValue: _selectedValue,
          onChanged: (value) => setState(() => _selectedValue = value),
          label: 'Small (8oz)',
        ),
        const SizedBox(height: 16),
        DSRadio<String>(
          value: 'medium',
          groupValue: _selectedValue,
          onChanged: (value) => setState(() => _selectedValue = value),
          label: 'Medium (12oz)',
        ),
        const SizedBox(height: 16),
        DSRadio<String>(
          value: 'large',
          groupValue: _selectedValue,
          onChanged: (value) => setState(() => _selectedValue = value),
          label: 'Large (16oz)',
        ),
        const SizedBox(height: 16),
        DSRadio<String>(
          value: 'extra_large',
          groupValue: _selectedValue,
          onChanged: null,
          label: 'Extra Large (20oz) - Temporarily unavailable',
          enabled: false,
        ),
        const SizedBox(height: 16),
        DSRadio<String>(
          value: 'custom',
          groupValue: _selectedValue,
          onChanged: (value) => setState(() => _selectedValue = value),
          labelWidget: Row(
            children: [
              const Text('Custom label with '),
              Text(
                'styled text',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(' and icon'),
              const SizedBox(width: 8),
              Icon(
                Icons.star,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SegmentedBasicStory extends StatefulWidget {
  const _SegmentedBasicStory();

  @override
  State<_SegmentedBasicStory> createState() => _SegmentedBasicStoryState();
}

class _SegmentedBasicStoryState extends State<_SegmentedBasicStory> {
  String? _selectedView = 'list';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'View Mode',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        DSRadio<String>(
          value: _selectedView,
          groupValue: _selectedView,
          onChanged: (value) => setState(() => _selectedView = value),
          variant: DSRadioVariant.segmented,
          options: const [
            DSRadioValue(value: 'list', label: 'List'),
            DSRadioValue(value: 'grid', label: 'Grid'),
            DSRadioValue(value: 'card', label: 'Card'),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'File Format',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        DSRadio<String>(
          value: 'pdf',
          groupValue: 'pdf',
          onChanged: (value) => {},
          variant: DSRadioVariant.segmented,
          options: const [
            DSRadioValue(value: 'pdf', label: 'PDF'),
            DSRadioValue(value: 'docx', label: 'DOCX'),
            DSRadioValue(value: 'txt', label: 'TXT'),
            DSRadioValue(value: 'csv', label: 'CSV', enabled: false),
          ],
        ),
      ],
    );
  }
}

class _SegmentedWithIconsStory extends StatefulWidget {
  const _SegmentedWithIconsStory();

  @override
  State<_SegmentedWithIconsStory> createState() =>
      _SegmentedWithIconsStoryState();
}

class _SegmentedWithIconsStoryState extends State<_SegmentedWithIconsStory> {
  String? _selectedAlignment = 'left';
  String? _selectedTheme = 'light';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Text Alignment',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        DSRadio<String>(
          value: _selectedAlignment,
          groupValue: _selectedAlignment,
          onChanged: (value) => setState(() => _selectedAlignment = value),
          variant: DSRadioVariant.segmented,
          options: const [
            DSRadioValue(
                value: 'left', label: 'Left', icon: Icons.format_align_left),
            DSRadioValue(
                value: 'center',
                label: 'Center',
                icon: Icons.format_align_center),
            DSRadioValue(
                value: 'right', label: 'Right', icon: Icons.format_align_right),
            DSRadioValue(
                value: 'justify',
                label: 'Justify',
                icon: Icons.format_align_justify),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Theme',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        DSRadio<String>(
          value: _selectedTheme,
          groupValue: _selectedTheme,
          onChanged: (value) => setState(() => _selectedTheme = value),
          variant: DSRadioVariant.segmented,
          options: const [
            DSRadioValue(
                value: 'light', label: 'Light', icon: Icons.light_mode),
            DSRadioValue(value: 'dark', label: 'Dark', icon: Icons.dark_mode),
            DSRadioValue(
                value: 'auto', label: 'Auto', icon: Icons.brightness_auto),
          ],
        ),
      ],
    );
  }
}

class _InteractiveStatesStory extends StatefulWidget {
  const _InteractiveStatesStory();

  @override
  State<_InteractiveStatesStory> createState() =>
      _InteractiveStatesStoryState();
}

class _InteractiveStatesStoryState extends State<_InteractiveStatesStory> {
  String? _selectedValue = 'default';
  DSRadioState? _overrideState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _overrideState = null),
              child: const Text('Default'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = DSRadioState.hover),
              child: const Text('Hover'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = DSRadioState.pressed),
              child: const Text('Pressed'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = DSRadioState.focus),
              child: const Text('Focus'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = DSRadioState.loading),
              child: const Text('Loading'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = DSRadioState.skeleton),
              child: const Text('Skeleton'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Standard Radio',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        DSRadio<String>(
          value: 'interactive',
          groupValue: _selectedValue,
          onChanged: (value) => setState(() => _selectedValue = value),
          label: 'Interactive radio button',
          overrideState: _overrideState,
        ),
        const SizedBox(height: 24),
        Text(
          'Segmented Radio',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        DSRadio<String>(
          value: _selectedValue,
          groupValue: _selectedValue,
          onChanged: (value) => setState(() => _selectedValue = value),
          variant: DSRadioVariant.segmented,
          overrideState: _overrideState,
          options: const [
            DSRadioValue(value: 'option1', label: 'Option 1'),
            DSRadioValue(value: 'option2', label: 'Option 2'),
            DSRadioValue(value: 'option3', label: 'Option 3'),
          ],
        ),
      ],
    );
  }
}

class _PlatformAdaptiveStory extends StatefulWidget {
  const _PlatformAdaptiveStory();

  @override
  State<_PlatformAdaptiveStory> createState() => _PlatformAdaptiveStoryState();
}

class _PlatformAdaptiveStoryState extends State<_PlatformAdaptiveStory> {
  String? _selectedValue = 'ios';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'This radio adapts to the current platform:',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        DSRadio<String>(
          value: 'ios',
          groupValue: _selectedValue,
          onChanged: (value) => setState(() => _selectedValue = value),
          label: 'iOS optimized',
        ),
        const SizedBox(height: 8),
        DSRadio<String>(
          value: 'android',
          groupValue: _selectedValue,
          onChanged: (value) => setState(() => _selectedValue = value),
          label: 'Android optimized',
        ),
        const SizedBox(height: 8),
        DSRadio<String>(
          value: 'web',
          groupValue: _selectedValue,
          onChanged: (value) => setState(() => _selectedValue = value),
          label: 'Web optimized',
        ),
        const SizedBox(height: 16),
        Text(
          'Loading indicator also adapts to platform',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        const DSRadio<String>(
          value: 'loading',
          groupValue: null,
          onChanged: null,
          label: 'Loading state',
          overrideState: DSRadioState.loading,
        ),
      ],
    );
  }
}

class _RtlSupportStory extends StatefulWidget {
  const _RtlSupportStory();

  @override
  State<_RtlSupportStory> createState() => _RtlSupportStoryState();
}

class _RtlSupportStoryState extends State<_RtlSupportStory> {
  String? _selectedValue1 = 'ltr';
  String? _selectedValue2 = 'rtl';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Left-to-Right (LTR)',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        DSRadio<String>(
          value: 'ltr',
          groupValue: _selectedValue1,
          onChanged: (value) => setState(() => _selectedValue1 = value),
          label: 'English text radio',
          textDirection: TextDirection.ltr,
        ),
        const SizedBox(height: 16),
        Text(
          'Right-to-Left (RTL)',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        DSRadio<String>(
          value: 'rtl',
          groupValue: _selectedValue2,
          onChanged: (value) => setState(() => _selectedValue2 = value),
          label: 'نص عربي',
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 16),
        Text(
          'Segmented RTL',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        DSRadio<String>(
          value: _selectedValue2,
          groupValue: _selectedValue2,
          onChanged: (value) => setState(() => _selectedValue2 = value),
          variant: DSRadioVariant.segmented,
          textDirection: TextDirection.rtl,
          options: const [
            DSRadioValue(value: 'option1', label: 'خيار 1'),
            DSRadioValue(value: 'option2', label: 'خيار 2'),
            DSRadioValue(value: 'rtl', label: 'خيار 3'),
          ],
        ),
      ],
    );
  }
}

class _CustomConfigStory extends StatefulWidget {
  const _CustomConfigStory();

  @override
  State<_CustomConfigStory> createState() => _CustomConfigStoryState();
}

class _CustomConfigStoryState extends State<_CustomConfigStory> {
  String? _selectedValue1 = 'large';
  String? _selectedValue2 = 'small';
  String? _selectedValue3 = 'purple';
  String? _selectedValue4 = 'rounded';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSRadio<String>(
          value: 'large',
          groupValue: _selectedValue1,
          onChanged: (value) => setState(() => _selectedValue1 = value),
          label: 'Large radio (28px)',
          config: const DSRadioConfig(
            size: 28,
            borderWidth: 3,
          ),
        ),
        const SizedBox(height: 16),
        DSRadio<String>(
          value: 'small',
          groupValue: _selectedValue2,
          onChanged: (value) => setState(() => _selectedValue2 = value),
          label: 'Small radio (16px)',
          config: const DSRadioConfig(
            size: 16,
            borderWidth: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        DSRadio<String>(
          value: 'purple',
          groupValue: _selectedValue3,
          onChanged: (value) => setState(() => _selectedValue3 = value),
          label: 'Custom colors',
          colors: DSRadioColors(
            borderColor: Colors.purple,
            fillColor: Colors.purple,
            dotColor: Colors.white,
            disabledBorderColor: Colors.purple.withValues(alpha: 0.3),
            disabledFillColor: Colors.purple.withValues(alpha: 0.3),
            disabledDotColor: Colors.white,
            hoverOverlay: Colors.purple.withValues(alpha: 0.08),
            focusOverlay: Colors.purple.withValues(alpha: 0.12),
            pressedOverlay: Colors.purple.withValues(alpha: 0.12),
            labelColor: theme.colorScheme.onSurface,
            disabledLabelColor:
                theme.colorScheme.onSurface.withValues(alpha: 0.38),
            segmentBackgroundColor: Colors.purple.withValues(alpha: 0.1),
            segmentSelectedBackgroundColor: Colors.purple,
            segmentBorderColor: Colors.purple,
            segmentSelectedBorderColor: Colors.purple,
            segmentTextColor: Colors.purple,
            segmentSelectedTextColor: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Custom Segmented Style',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        DSRadio<String>(
          value: _selectedValue4,
          groupValue: _selectedValue4,
          onChanged: (value) => setState(() => _selectedValue4 = value),
          variant: DSRadioVariant.segmented,
          config: const DSRadioConfig(
            segmentBorderRadius: 16,
            segmentBorderWidth: 2,
          ),
          colors: DSRadioColors(
            borderColor: Colors.orange,
            fillColor: Colors.orange,
            dotColor: Colors.white,
            disabledBorderColor: Colors.orange.withValues(alpha: 0.3),
            disabledFillColor: Colors.orange.withValues(alpha: 0.3),
            disabledDotColor: Colors.white,
            hoverOverlay: Colors.orange.withValues(alpha: 0.08),
            focusOverlay: Colors.orange.withValues(alpha: 0.12),
            pressedOverlay: Colors.orange.withValues(alpha: 0.12),
            labelColor: theme.colorScheme.onSurface,
            disabledLabelColor:
                theme.colorScheme.onSurface.withValues(alpha: 0.38),
            segmentBackgroundColor: Colors.orange.withValues(alpha: 0.1),
            segmentSelectedBackgroundColor: Colors.orange,
            segmentBorderColor: Colors.orange,
            segmentSelectedBorderColor: Colors.orange,
            segmentTextColor: Colors.orange,
            segmentSelectedTextColor: Colors.white,
          ),
          options: const [
            DSRadioValue(value: 'rounded', label: 'Rounded'),
            DSRadioValue(value: 'style', label: 'Style'),
            DSRadioValue(value: 'custom', label: 'Custom'),
          ],
        ),
      ],
    );
  }
}

class _AccessibilityStory extends StatefulWidget {
  const _AccessibilityStory();

  @override
  State<_AccessibilityStory> createState() => _AccessibilityStoryState();
}

class _AccessibilityStoryState extends State<_AccessibilityStory> {
  String? _selectedValue1 = 'first';
  String? _selectedValue2 = 'option1';
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Keyboard Navigation',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Use Tab to navigate, Space or Enter to select',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        DSRadio<String>(
          value: 'first',
          groupValue: _selectedValue1,
          onChanged: (value) => setState(() => _selectedValue1 = value),
          label: 'First radio (autofocus)',
          autoFocus: true,
        ),
        const SizedBox(height: 8),
        DSRadio<String>(
          value: 'second',
          groupValue: _selectedValue1,
          onChanged: (value) => setState(() => _selectedValue1 = value),
          label: 'Second radio',
          focusNode: _focusNode,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => _focusNode.requestFocus(),
          child: const Text('Focus second radio'),
        ),
        const SizedBox(height: 24),
        Text(
          'Semantic Labels',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        DSRadio<String>(
          value: 'semantic',
          groupValue: _selectedValue1,
          onChanged: (value) => setState(() => _selectedValue1 = value),
          label: 'Visible label',
          semanticLabel: 'Custom semantic label for screen readers',
        ),
        const SizedBox(height: 24),
        Text(
          'Touch Target Size',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'Minimum 48x48 touch target for accessibility',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
          ),
          child: DSRadio<String>(
            value: 'touch_target',
            groupValue: _selectedValue1,
            onChanged: (value) => setState(() => _selectedValue1 = value),
            config: const DSRadioConfig(
              minimumTouchTargetSize: 48,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Segmented Accessibility',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        DSRadio<String>(
          value: _selectedValue2,
          groupValue: _selectedValue2,
          onChanged: (value) => setState(() => _selectedValue2 = value),
          variant: DSRadioVariant.segmented,
          options: const [
            DSRadioValue(value: 'option1', label: 'Accessible'),
            DSRadioValue(value: 'option2', label: 'Options'),
            DSRadioValue(value: 'option3', label: 'Here'),
          ],
        ),
      ],
    );
  }
}
