import 'package:flutter/material.dart';
import 'app_slider.dart';
import 'slider_config.dart';

class AppSliderStory extends StatefulWidget {
  const AppSliderStory({super.key});

  @override
  State<AppSliderStory> createState() => _AppSliderStoryState();
}

class _AppSliderStoryState extends State<AppSliderStory> {
  double _continuousValue = 50.0;
  double _discreteValue = 3.0;
  AppSliderRangeValue _rangeValue = const AppSliderRangeValue(start: 20.0, end: 80.0);
  double _markedValue = 30.0;
  final double _disabledValue = 25.0;
  double _customConfigValue = 75.0;
  double _validationValue = 120.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppSlider Stories'),
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
                AppSlider(
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
                  variant: AppSliderVariant.continuous,
                ),
              ],
            ),
            _buildStorySection(
              'Discrete Slider',
              'Discrete slider with defined steps and labels',
              [
                AppSlider(
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
                  variant: AppSliderVariant.discrete,
                  labelFormatter: (value) => '${value.toInt()} star${value > 1 ? 's' : ''}',
                ),
              ],
            ),
            _buildStorySection(
              'Range Slider',
              'Range slider for selecting value ranges',
              [
                AppSlider(
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
                  variant: AppSliderVariant.range,
                  labelFormatter: (value) => '\$${value.toInt()}',
                ),
              ],
            ),
            _buildStorySection(
              'Slider with Marks',
              'Slider with custom marks and labels',
              [
                AppSlider(
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
                  variant: AppSliderVariant.continuous,
                  marks: [
                    const AppSliderMark(value: 0, label: 'Cold'),
                    const AppSliderMark(value: 25, label: 'Cool'),
                    const AppSliderMark(value: 50, label: 'Warm'),
                    const AppSliderMark(value: 75, label: 'Hot'),
                    const AppSliderMark(value: 100, label: 'Very Hot'),
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
                AppSlider(
                  value: _disabledValue,
                  min: 0.0,
                  max: 100.0,
                  onChanged: null,
                  label: 'Disabled Slider',
                  helperText: 'This slider is disabled',
                  enabled: false,
                  variant: AppSliderVariant.continuous,
                ),
                const SizedBox(height: 16),
                const Text('Loading State'),
                AppSlider(
                  value: 50.0,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (value) {},
                  label: 'Loading Slider',
                  overrideState: AppSliderState.loading,
                  variant: AppSliderVariant.continuous,
                ),
                const SizedBox(height: 16),
                const Text('Skeleton State'),
                AppSlider(
                  value: 50.0,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (value) {},
                  label: 'Skeleton Slider',
                  overrideState: AppSliderState.skeleton,
                  variant: AppSliderVariant.continuous,
                ),
              ],
            ),
            _buildStorySection(
              'Custom Configuration',
              'Slider with custom styling and configuration',
              [
                AppSlider(
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
                  variant: AppSliderVariant.continuous,
                  config: const AppSliderConfig(
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
                AppSlider(
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
                  variant: AppSliderVariant.continuous,
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
                    child: AppSlider(
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
                      variant: AppSliderVariant.continuous,
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
                  child: AppSlider(
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
                    variant: AppSliderVariant.continuous,
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
                AppSlider(
                  value: _continuousValue,
                  min: 0.0,
                  max: 100.0,
                  onChanged: (value) {
                    setState(() {
                      _continuousValue = value;
                    });
                  },
                  variant: AppSliderVariant.continuous,
                ),
                const SizedBox(height: 16),
                const Text('Discrete'),
                AppSlider(
                  value: _discreteValue,
                  min: 1.0,
                  max: 5.0,
                  step: 1.0,
                  onChanged: (value) {
                    setState(() {
                      _discreteValue = value;
                    });
                  },
                  variant: AppSliderVariant.discrete,
                ),
                const SizedBox(height: 16),
                const Text('Range'),
                AppSlider(
                  rangeValue: _rangeValue,
                  min: 0.0,
                  max: 100.0,
                  onRangeChanged: (value) {
                    setState(() {
                      _rangeValue = value;
                    });
                  },
                  variant: AppSliderVariant.range,
                ),
              ],
            ),
            _buildStorySection(
              'Edge Cases',
              'Testing edge cases and boundary values',
              [
                const Text('Very Small Range'),
                AppSlider(
                  value: 0.5,
                  min: 0.0,
                  max: 1.0,
                  step: 0.1,
                  onChanged: (value) {},
                  variant: AppSliderVariant.discrete,
                  labelFormatter: (value) => value.toStringAsFixed(1),
                ),
                const SizedBox(height: 16),
                const Text('Very Large Range'),
                AppSlider(
                  value: 500000,
                  min: 0,
                  max: 1000000,
                  step: 10000,
                  onChanged: (value) {},
                  variant: AppSliderVariant.discrete,
                  labelFormatter: (value) => '${(value / 1000).toInt()}K',
                ),
                const SizedBox(height: 16),
                const Text('Negative Range'),
                AppSlider(
                  value: -10,
                  min: -50,
                  max: 50,
                  onChanged: (value) {},
                  variant: AppSliderVariant.continuous,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStorySection(String title, String description, List<Widget> children) {
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