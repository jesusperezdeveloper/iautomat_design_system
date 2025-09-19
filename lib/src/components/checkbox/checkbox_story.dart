import 'package:flutter/material.dart';
import 'ds_checkbox.dart';
import 'checkbox_config.dart';

class CheckboxStory extends StatelessWidget {
  const CheckboxStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSCheckbox Stories'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StorySection(
              title: 'Basic States',
              child: _BasicStatesStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'With Labels',
              child: _WithLabelsStory(),
            ),
            SizedBox(height: 32),
            _StorySection(
              title: 'Tri-state (Indeterminate)',
              child: _TristateStory(),
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

class _BasicStatesStory extends StatefulWidget {
  const _BasicStatesStory();

  @override
  State<_BasicStatesStory> createState() => _BasicStatesStoryState();
}

class _BasicStatesStoryState extends State<_BasicStatesStory> {
  DSCheckboxValue? _value1 = DSCheckboxValue.unchecked;
  DSCheckboxValue? _value2 = DSCheckboxValue.checked;
  final DSCheckboxValue _value3 = DSCheckboxValue.unchecked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSCheckbox(
          value: _value1,
          onChanged: (value) => setState(() => _value1 = value),
        ),
        const SizedBox(height: 16),
        DSCheckbox(
          value: _value2,
          onChanged: (value) => setState(() => _value2 = value),
        ),
        const SizedBox(height: 16),
        DSCheckbox(
          value: _value3,
          onChanged: null,
          enabled: false,
        ),
        const SizedBox(height: 16),
        const DSCheckbox(
          value: DSCheckboxValue.checked,
          onChanged: null,
          enabled: false,
        ),
        const SizedBox(height: 16),
        const DSCheckbox(
          value: null,
          onChanged: null,
          overrideState: DSCheckboxState.loading,
        ),
        const SizedBox(height: 16),
        const DSCheckbox(
          value: null,
          onChanged: null,
          overrideState: DSCheckboxState.skeleton,
        ),
      ],
    );
  }
}

class _WithLabelsStory extends StatefulWidget {
  const _WithLabelsStory();

  @override
  State<_WithLabelsStory> createState() => _WithLabelsStoryState();
}

class _WithLabelsStoryState extends State<_WithLabelsStory> {
  DSCheckboxValue? _value1 = DSCheckboxValue.unchecked;
  DSCheckboxValue? _value2 = DSCheckboxValue.checked;
  final DSCheckboxValue _value3 = DSCheckboxValue.unchecked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSCheckbox(
          value: _value1,
          onChanged: (value) => setState(() => _value1 = value),
          label: 'Accept terms and conditions',
        ),
        const SizedBox(height: 16),
        DSCheckbox(
          value: _value2,
          onChanged: (value) => setState(() => _value2 = value),
          label: 'Subscribe to newsletter',
        ),
        const SizedBox(height: 16),
        DSCheckbox(
          value: _value3,
          onChanged: null,
          label: 'Disabled with label',
          enabled: false,
        ),
        const SizedBox(height: 16),
        DSCheckbox(
          value: _value1,
          onChanged: (value) => setState(() => _value1 = value),
          labelWidget: Row(
            children: [
              const Text('Custom label widget with '),
              Text(
                'styled text',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TristateStory extends StatefulWidget {
  const _TristateStory();

  @override
  State<_TristateStory> createState() => _TristateStoryState();
}

class _TristateStoryState extends State<_TristateStory> {
  DSCheckboxValue? _parentValue = DSCheckboxValue.indeterminate;
  List<DSCheckboxValue?> _childValues = [
    DSCheckboxValue.checked,
    DSCheckboxValue.unchecked,
    DSCheckboxValue.checked,
  ];

  void _updateParentValue() {
    final checkedCount =
        _childValues.where((v) => v == DSCheckboxValue.checked).length;

    setState(() {
      if (checkedCount == 0) {
        _parentValue = DSCheckboxValue.unchecked;
      } else if (checkedCount == _childValues.length) {
        _parentValue = DSCheckboxValue.checked;
      } else {
        _parentValue = DSCheckboxValue.indeterminate;
      }
    });
  }

  void _onParentChanged(DSCheckboxValue? value) {
    setState(() {
      _parentValue = value;
      if (value == DSCheckboxValue.checked) {
        _childValues = List.filled(3, DSCheckboxValue.checked);
      } else if (value == DSCheckboxValue.unchecked) {
        _childValues = List.filled(3, DSCheckboxValue.unchecked);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSCheckbox(
          value: _parentValue,
          onChanged: _onParentChanged,
          label: 'Select all items',
          tristate: true,
        ),
        const Divider(),
        ...List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 32, top: 8),
            child: DSCheckbox(
              value: _childValues[index],
              onChanged: (value) {
                setState(() {
                  _childValues[index] = value;
                  _updateParentValue();
                });
              },
              label: 'Item ${index + 1}',
            ),
          );
        }),
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
  DSCheckboxValue? _value = DSCheckboxValue.unchecked;
  DSCheckboxState? _overrideState;

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
                  setState(() => _overrideState = DSCheckboxState.hover),
              child: const Text('Hover'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = DSCheckboxState.pressed),
              child: const Text('Pressed'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = DSCheckboxState.focus),
              child: const Text('Focus'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = DSCheckboxState.loading),
              child: const Text('Loading'),
            ),
            ElevatedButton(
              onPressed: () =>
                  setState(() => _overrideState = DSCheckboxState.skeleton),
              child: const Text('Skeleton'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        DSCheckbox(
          value: _value,
          onChanged: (value) => setState(() => _value = value),
          label: 'Interactive checkbox',
          overrideState: _overrideState,
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
  DSCheckboxValue? _value = DSCheckboxValue.unchecked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'This checkbox adapts to the current platform:',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        DSCheckbox(
          value: _value,
          onChanged: (value) => setState(() => _value = value),
          label: 'Platform adaptive checkbox',
        ),
        const SizedBox(height: 8),
        Text(
          'Loading indicator also adapts to platform',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        const DSCheckbox(
          value: null,
          onChanged: null,
          label: 'Loading state',
          overrideState: DSCheckboxState.loading,
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
  DSCheckboxValue? _value1 = DSCheckboxValue.unchecked;
  DSCheckboxValue? _value2 = DSCheckboxValue.checked;

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
        DSCheckbox(
          value: _value1,
          onChanged: (value) => setState(() => _value1 = value),
          label: 'English text checkbox',
          textDirection: TextDirection.ltr,
        ),
        const SizedBox(height: 16),
        Text(
          'Right-to-Left (RTL)',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        DSCheckbox(
          value: _value2,
          onChanged: (value) => setState(() => _value2 = value),
          label: 'نص عربي',
          textDirection: TextDirection.rtl,
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
  DSCheckboxValue? _value1 = DSCheckboxValue.unchecked;
  DSCheckboxValue? _value2 = DSCheckboxValue.checked;
  DSCheckboxValue? _value3 = DSCheckboxValue.unchecked;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DSCheckbox(
          value: _value1,
          onChanged: (value) => setState(() => _value1 = value),
          label: 'Large checkbox (28px)',
          config: const DSCheckboxConfig(
            size: 28,
            borderWidth: 3,
          ),
        ),
        const SizedBox(height: 16),
        DSCheckbox(
          value: _value2,
          onChanged: (value) => setState(() => _value2 = value),
          label: 'Small checkbox (16px)',
          config: const DSCheckboxConfig(
            size: 16,
            borderWidth: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        DSCheckbox(
          value: _value3,
          onChanged: (value) => setState(() => _value3 = value),
          label: 'Custom colors',
          colors: DSCheckboxColors(
            borderColor: Colors.purple,
            fillColor: Colors.purple,
            checkColor: Colors.white,
            disabledBorderColor: Colors.purple.withValues(alpha: 0.3),
            disabledFillColor: Colors.purple.withValues(alpha: 0.3),
            disabledCheckColor: Colors.white,
            hoverOverlay: Colors.purple.withValues(alpha: 0.08),
            focusOverlay: Colors.purple.withValues(alpha: 0.12),
            pressedOverlay: Colors.purple.withValues(alpha: 0.12),
            labelColor: theme.colorScheme.onSurface,
            disabledLabelColor:
                theme.colorScheme.onSurface.withValues(alpha: 0.38),
          ),
        ),
        const SizedBox(height: 16),
        DSCheckbox(
          value: _value1,
          onChanged: (value) => setState(() => _value1 = value),
          label: 'Circular checkbox',
          config: const DSCheckboxConfig(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
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
  DSCheckboxValue? _value1 = DSCheckboxValue.unchecked;
  DSCheckboxValue? _value2 = DSCheckboxValue.checked;
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
          'Use Tab to navigate, Space to toggle',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 16),
        DSCheckbox(
          value: _value1,
          onChanged: (value) => setState(() => _value1 = value),
          label: 'First checkbox (autofocus)',
          autoFocus: true,
        ),
        const SizedBox(height: 8),
        DSCheckbox(
          value: _value2,
          onChanged: (value) => setState(() => _value2 = value),
          label: 'Second checkbox',
          focusNode: _focusNode,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => _focusNode.requestFocus(),
          child: const Text('Focus second checkbox'),
        ),
        const SizedBox(height: 24),
        Text(
          'Semantic Labels',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        DSCheckbox(
          value: _value1,
          onChanged: (value) => setState(() => _value1 = value),
          label: 'Visible label',
          semanticLabel: 'Custom semantic label for screen readers',
        ),
        const SizedBox(height: 16),
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
          child: DSCheckbox(
            value: _value2,
            onChanged: (value) => setState(() => _value2 = value),
            config: const DSCheckboxConfig(
              minimumTouchTargetSize: 48,
            ),
          ),
        ),
      ],
    );
  }
}
