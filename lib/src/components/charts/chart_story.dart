import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'ds_chart.dart';

class ChartStory extends StatefulWidget {
  const ChartStory({super.key});

  @override
  State<ChartStory> createState() => _ChartStoryState();
}

class _ChartStoryState extends State<ChartStory> {
  ChartVariant _selectedVariant = ChartVariant.line;
  ChartState _selectedState = ChartState.defaultState;
  bool _showLegend = true;
  bool _showGrid = true;
  bool _animate = true;
  bool _showTooltip = true;
  bool _enableInteractions = true;
  LegendPosition _legendPosition = LegendPosition.bottom;

  final _random = math.Random();

  List<ChartSeries> _generateLineData() {
    return [
      ChartSeries(
        id: 'sales',
        name: 'Sales',
        data: List.generate(
          12,
          (index) => ChartPoint(
            x: index.toDouble(),
            y: 50 + _random.nextDouble() * 50,
            label: 'Month ${index + 1}',
          ),
        ),
        color: Colors.blue,
        showArea: _selectedVariant == ChartVariant.area,
      ),
      ChartSeries(
        id: 'revenue',
        name: 'Revenue',
        data: List.generate(
          12,
          (index) => ChartPoint(
            x: index.toDouble(),
            y: 70 + _random.nextDouble() * 30,
            label: 'Month ${index + 1}',
          ),
        ),
        color: Colors.green,
        showArea: _selectedVariant == ChartVariant.area,
      ),
      ChartSeries(
        id: 'costs',
        name: 'Costs',
        data: List.generate(
          12,
          (index) => ChartPoint(
            x: index.toDouble(),
            y: 30 + _random.nextDouble() * 20,
            label: 'Month ${index + 1}',
          ),
        ),
        color: Colors.orange,
        showArea: _selectedVariant == ChartVariant.area,
      ),
    ];
  }

  List<ChartSeries> _generateBarData() {
    return [
      ChartSeries(
        id: 'q1',
        name: 'Q1',
        data: [
          ChartPoint(x: 0, y: 85, label: 'Product A'),
          ChartPoint(x: 1, y: 92, label: 'Product B'),
          ChartPoint(x: 2, y: 78, label: 'Product C'),
          ChartPoint(x: 3, y: 88, label: 'Product D'),
        ],
        color: Colors.blue,
      ),
      ChartSeries(
        id: 'q2',
        name: 'Q2',
        data: [
          ChartPoint(x: 0, y: 90, label: 'Product A'),
          ChartPoint(x: 1, y: 88, label: 'Product B'),
          ChartPoint(x: 2, y: 82, label: 'Product C'),
          ChartPoint(x: 3, y: 95, label: 'Product D'),
        ],
        color: Colors.green,
      ),
      ChartSeries(
        id: 'q3',
        name: 'Q3',
        data: [
          ChartPoint(x: 0, y: 88, label: 'Product A'),
          ChartPoint(x: 1, y: 95, label: 'Product B'),
          ChartPoint(x: 2, y: 80, label: 'Product C'),
          ChartPoint(x: 3, y: 92, label: 'Product D'),
        ],
        color: Colors.orange,
      ),
    ];
  }

  List<ChartSeries> _generatePieData() {
    return [
      ChartSeries(
        id: 'categories',
        name: 'Market Share',
        data: [
          ChartPoint(x: 0, y: 35, label: 'Technology', color: Colors.blue),
          ChartPoint(x: 1, y: 25, label: 'Finance', color: Colors.green),
          ChartPoint(x: 2, y: 20, label: 'Healthcare', color: Colors.orange),
          ChartPoint(x: 3, y: 12, label: 'Retail', color: Colors.purple),
          ChartPoint(x: 4, y: 8, label: 'Other', color: Colors.grey),
        ],
      ),
    ];
  }

  List<ChartSeries> _generateHeatmapData() {
    return [
      ChartSeries(
        id: 'heatmap',
        name: 'Activity Heatmap',
        data: List.generate(
          35,
          (index) => ChartPoint(
            x: (index % 7).toDouble(),
            y: _random.nextDouble() * 100,
            label: 'Day ${index + 1}',
          ),
        ),
      ),
    ];
  }

  List<ChartSeries> _getCurrentData() {
    switch (_selectedVariant) {
      case ChartVariant.line:
      case ChartVariant.area:
        return _generateLineData();
      case ChartVariant.bar:
        return _generateBarData();
      case ChartVariant.pie:
        return _generatePieData();
      case ChartVariant.heatmap:
        return _generateHeatmapData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DSChart Story'),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          _buildControls(theme),
          const Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: DSChart(
                  key: ValueKey('${_selectedVariant}_$_selectedState'),
                  variant: _selectedVariant,
                  series: _getCurrentData(),
                  state: _selectedState,
                  animate: _animate,
                  legend: _showLegend
                      ? ChartLegendConfig(
                          show: true,
                          position: _legendPosition,
                        )
                      : const ChartLegendConfig(show: false),
                  axes: ChartAxesConfig(
                    showGrid: _showGrid,
                    xAxis: const ChartAxisConfig(
                      title: 'X Axis',
                      showLabels: true,
                    ),
                    yAxis: const ChartAxisConfig(
                      title: 'Y Axis',
                      showLabels: true,
                    ),
                  ),
                  tooltip: ChartTooltipConfig(
                    show: _showTooltip,
                  ),
                  interaction: ChartInteractionConfig(
                    enablePan: _enableInteractions,
                    enableZoom: _enableInteractions,
                    enableSelection: _enableInteractions,
                    enableTooltip: _showTooltip,
                    enableLegendInteraction: _enableInteractions,
                  ),
                  onPointTap: (point) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Tapped: ${point.label ?? 'Point'} (${point.x}, ${point.y.toStringAsFixed(2)})',
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  onTap: () {
                    debugPrint('Chart tapped');
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildControls(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chart Configuration',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildVariantSelector(),
              _buildStateSelector(),
              _buildLegendPositionSelector(),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              FilterChip(
                label: const Text('Show Legend'),
                selected: _showLegend,
                onSelected: (value) => setState(() => _showLegend = value),
              ),
              FilterChip(
                label: const Text('Show Grid'),
                selected: _showGrid,
                onSelected: (value) => setState(() => _showGrid = value),
              ),
              FilterChip(
                label: const Text('Animate'),
                selected: _animate,
                onSelected: (value) => setState(() => _animate = value),
              ),
              FilterChip(
                label: const Text('Show Tooltip'),
                selected: _showTooltip,
                onSelected: (value) => setState(() => _showTooltip = value),
              ),
              FilterChip(
                label: const Text('Enable Interactions'),
                selected: _enableInteractions,
                onSelected: (value) =>
                    setState(() => _enableInteractions = value),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVariantSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Variant:'),
        const SizedBox(height: 8),
        SegmentedButton<ChartVariant>(
          segments: const [
            ButtonSegment(
              value: ChartVariant.line,
              label: Text('Line'),
              icon: Icon(Icons.show_chart),
            ),
            ButtonSegment(
              value: ChartVariant.area,
              label: Text('Area'),
              icon: Icon(Icons.area_chart),
            ),
            ButtonSegment(
              value: ChartVariant.bar,
              label: Text('Bar'),
              icon: Icon(Icons.bar_chart),
            ),
            ButtonSegment(
              value: ChartVariant.pie,
              label: Text('Pie'),
              icon: Icon(Icons.pie_chart),
            ),
            ButtonSegment(
              value: ChartVariant.heatmap,
              label: Text('Heatmap'),
              icon: Icon(Icons.grid_on),
            ),
          ],
          selected: {_selectedVariant},
          onSelectionChanged: (Set<ChartVariant> selection) {
            setState(() {
              _selectedVariant = selection.first;
            });
          },
        ),
      ],
    );
  }

  Widget _buildStateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('State:'),
        const SizedBox(height: 8),
        DropdownButton<ChartState>(
          value: _selectedState,
          items: ChartState.values.map((state) {
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
      ],
    );
  }

  Widget _buildLegendPositionSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Legend Position:'),
        const SizedBox(height: 8),
        DropdownButton<LegendPosition>(
          value: _legendPosition,
          items: LegendPosition.values.map((position) {
            return DropdownMenuItem(
              value: position,
              child: Text(position.name),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() => _legendPosition = value);
            }
          },
        ),
      ],
    );
  }

  String _formatStateName(ChartState state) {
    switch (state) {
      case ChartState.defaultState:
        return 'Default';
      case ChartState.hover:
        return 'Hover';
      case ChartState.pressed:
        return 'Pressed';
      case ChartState.focus:
        return 'Focus';
      case ChartState.selected:
        return 'Selected';
      case ChartState.disabled:
        return 'Disabled';
      case ChartState.loading:
        return 'Loading';
      case ChartState.skeleton:
        return 'Skeleton';
    }
  }
}
