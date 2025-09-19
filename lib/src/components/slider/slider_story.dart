import 'package:flutter/material.dart';
import 'app_slider.dart';
import 'slider_config.dart';

class DSSliderStory extends StatefulWidget {
  const DSSliderStory({super.key});

  @override
  State<DSSliderStory> createState() => _DSSliderStoryState();
}

class _DSSliderStoryState extends State<DSSliderStory> {
  double _continuousValue = 50.0;
  double _discreteValue = 3.0;
  DSSliderRangeValue _rangeValue =
      const DSSliderRangeValue(start: 20.0, end: 80.0);
  double _markedValue = 30.0;
  final double _disabledValue = 25.0;
  double _customConfigValue = 75.0;
  double _validationValue = 120.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSSlider Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStorySection(
              'Continuous Slider',
              'Basic continuous slider with smooth value changes',
              [
                DSSlider(
                  value: _continuousValue,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (value) {
                    setState(() {
                      _continuousValue = value;
                    });
                  },
                  label: 'Volume',
                  helperText: 'Adjust the volume level',
                  variant: DSSliderVariant.continuous,
                ),
              ],
            ),
            _buildStorySection(
              'Discrete Slider',
              'Discrete slider with defined steps and labels',
              [
                DSSlider(
                  value: _discreteValue,
                  min: 1.0,
                  max: 5.0,
                  step: 1.0,
                  onChanged: (value) {
                    setState(() {
                      _discreteValue = value;
                    });
                  },
                  label: 'Rating',
                  helperText: 'Rate from 1 to 5 stars',
                  variant: DSSliderVariant.discrete,
                  labelFormatter: (value) =>
                      '${value.toInt()} star${value > 1 ? 's' : ''}',
                ),
              ],
            ),
            _buildStorySection(
              'Range Slider',
              'Range slider for selecting value ranges',
              [
                DSSlider(
                  rangeValue: _rangeValue,
                  min: 0.0,
                  max: 100.0,
                  onRangeChanged: (value) {
                    setState(() {
                      _rangeValue = value;
                    });
                  },
                  label: 'Price Range',
                  helperText: 'Select minimum and maximum price',
                  variant: DSSliderVariant.range,
                  labelFormatter: (value) => '\$${value.toInt()}',
                ),
              ],
            ),
            _buildStorySection(
              'Slider with Marks',
              'Slider with custom marks and labels',
              [
                DSSlider(
                  value: _markedValue,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (value) {
                    setState(() {
                      _markedValue = value;
                    });
                  },
                  label: 'Temperature',
                  helperText: 'Set the desired temperature',
                  variant: DSSliderVariant.continuous,
                  marks: [
                    const DSSliderMark(value: 0, label: 'Cold'),
                    const DSSliderMark(value: 25, label: 'Cool'),
                    const DSSliderMark(value: 50, label: 'Warm'),
                    const DSSliderMark(value: 75, label: 'Hot'),
                    const DSSliderMark(value: 100, label: 'Very Hot'),
                  ],
                  labelFormatter: (value) => '${value.toInt()}°C',
                ),
              ],
            ),
            _buildStorySection(
              'States',
              'Different slider states for various use cases',
              [
                const Text('Disabled State'),
                DSSlider(
                  value: _disabledValue,
                  min: 0.0,
                  max: 100.0,
                  onChanged: null,
                  label: 'Disabled Slider',
                  helperText: 'This slider is disabled',
                  enabled: false,
                  variant: DSSliderVariant.continuous,
                ),
                const SizedBox(height: 16),
                const Text('Loading State'),
                DSSlider(
                  value: 50.0,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (value) {},
                  label: 'Loading Slider',
                  overrideState: DSSliderState.loading,
                  variant: DSSliderVariant.continuous,
                ),
                const SizedBox(height: 16),
                const Text('Skeleton State'),
                DSSlider(
                  value: 50.0,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (value) {},
                  label: 'Skeleton Slider',
                  overrideState: DSSliderState.skeleton,
                  variant: DSSliderVariant.continuous,
                ),
              ],
            ),
            _buildStorySection(
              'Custom Configuration',
              'Slider with custom styling and configuration',
              [
                DSSlider(
                  value: _customConfigValue,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (value) {
                    setState(() {
                      _customConfigValue = value;
                    });
                  },
                  label: 'Custom Styled Slider',
                  helperText: 'This slider has custom configuration',
                  variant: DSSliderVariant.continuous,
                  config: const DSSliderConfig(
                    thumbRadius: 16.0,
                    trackHeight: 6.0,
                    activeTrackHeight: 8.0,
                    contentPadding: EdgeInsets.all(20.0),
                    decimalPlaces: 1,
                    valuePrefix: '≈ ',
                    valueSuffix: '%',
                  ),
                ),
              ],
            ),
            _buildStorySection(
              'Validation',
              'Slider with validation and error states',
              [
                DSSlider(
                  value: _validationValue,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (value) {
                    setState(() {
                      _validationValue = value;
                    });
                  },
                  label: 'Validated Slider',
                  helperText: 'Value must be between 0 and 100',
                  variant: DSSliderVariant.continuous,
                  validator: (value) {
                    if (value == null) return null;
                    if (value < 0 || value > 100) {
                      return 'Value must be between 0 and 100';
                    }
                    return null;
                  },
                ),
              ],
            ),
            _buildStorySection(
              'Dark Theme Example',
              'Slider appearance in dark theme',
              [
                Theme(
                  data: ThemeData.dark(),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ThemeData.dark().colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DSSlider(
                      value: _continuousValue,
                      min: 0.0,
                      max: 100.0,
                      onChanged: (value) {
                        setState(() {
                          _continuousValue = value;
                        });
                      },
                      label: 'Dark Theme Slider',
                      helperText: 'This slider uses dark theme colors',
                      variant: DSSliderVariant.continuous,
                    ),
                  ),
                ),
              ],
            ),
            _buildStorySection(
              'RTL Support',
              'Slider with right-to-left text direction',
              [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: DSSlider(
                    value: _continuousValue,
                    min: 0.0,
                    max: 100.0,
                    onChanged: (value) {
                      setState(() {
                        _continuousValue = value;
                      });
                    },
                    label: 'شريط التمرير',
                    helperText: 'هذا المنزلق يدعم النص من اليمين إلى اليسار',
                    variant: DSSliderVariant.continuous,
                    labelFormatter: (value) => '${value.toInt()}٪',
                  ),
                ),
              ],
            ),
            _buildStorySection(
              'Multiple Variants',
              'Comparison of all slider variants',
              [
                const Text('Continuous'),
                DSSlider(
                  value: _continuousValue,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (value) {
                    setState(() {
                      _continuousValue = value;
                    });
                  },
                  variant: DSSliderVariant.continuous,
                ),
                const SizedBox(height: 16),
                const Text('Discrete'),
                DSSlider(
                  value: _discreteValue,
                  min: 1.0,
                  max: 5.0,
                  step: 1.0,
                  onChanged: (value) {
                    setState(() {
                      _discreteValue = value;
                    });
                  },
                  variant: DSSliderVariant.discrete,
                ),
                const SizedBox(height: 16),
                const Text('Range'),
                DSSlider(
                  rangeValue: _rangeValue,
                  min: 0.0,
                  max: 100.0,
                  onRangeChanged: (value) {
                    setState(() {
                      _rangeValue = value;
                    });
                  },
                  variant: DSSliderVariant.range,
                ),
              ],
            ),
            _buildStorySection(
              'Edge Cases',
              'Testing edge cases and boundary values',
              [
                const Text('Very Small Range'),
                DSSlider(
                  value: 0.5,
                  min: 0.0,
                  max: 1.0,
                  step: 0.1,
                  onChanged: (value) {},
                  variant: DSSliderVariant.discrete,
                  labelFormatter: (value) => value.toStringAsFixed(1),
                ),
                const SizedBox(height: 16),
                const Text('Very Large Range'),
                DSSlider(
                  value: 500000,
                  min: 0,
                  max: 1000000,
                  step: 10000,
                  onChanged: (value) {},
                  variant: DSSliderVariant.discrete,
                  labelFormatter: (value) => '${(value / 1000).toInt()}K',
                ),
                const SizedBox(height: 16),
                const Text('Negative Range'),
                DSSlider(
                  value: -10,
                  min: -50,
                  max: 50,
                  onChanged: (value) {},
                  variant: DSSliderVariant.continuous,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStorySection(
      String title, String description, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}
