import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

enum ChartVariant { line, area, bar, pie, heatmap }

enum ChartState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton
}

class ChartSeries {
  final String id;
  final String name;
  final List<ChartPoint> data;
  final Color? color;
  final double strokeWidth;
  final bool showPoints;
  final double pointRadius;
  final bool showArea;
  final double areaOpacity;
  final bool showInLegend;

  const ChartSeries({
    required this.id,
    required this.name,
    required this.data,
    this.color,
    this.strokeWidth = 2.0,
    this.showPoints = true,
    this.pointRadius = 4.0,
    this.showArea = false,
    this.areaOpacity = 0.2,
    this.showInLegend = true,
  });
}

class ChartPoint {
  final double x;
  final double y;
  final String? label;
  final Color? color;

  const ChartPoint({
    required this.x,
    required this.y,
    this.label,
    this.color,
  });
}

class ChartAxesConfig {
  final ChartAxisConfig? xAxis;
  final ChartAxisConfig? yAxis;
  final bool showGrid;
  final Color gridColor;
  final double gridOpacity;
  final double gridStrokeWidth;

  const ChartAxesConfig({
    this.xAxis,
    this.yAxis,
    this.showGrid = true,
    this.gridColor = Colors.grey,
    this.gridOpacity = 0.2,
    this.gridStrokeWidth = 1.0,
  });
}

class ChartAxisConfig {
  final String? title;
  final bool showLabels;
  final bool showLine;
  final bool showTicks;
  final double? min;
  final double? max;
  final double? interval;
  final TextStyle? labelStyle;
  final TextStyle? titleStyle;

  const ChartAxisConfig({
    this.title,
    this.showLabels = true,
    this.showLine = true,
    this.showTicks = true,
    this.min,
    this.max,
    this.interval,
    this.labelStyle,
    this.titleStyle,
  });
}

class ChartLegendConfig {
  final bool show;
  final LegendPosition position;
  final MainAxisAlignment alignment;
  final double spacing;
  final double runSpacing;
  final TextStyle? textStyle;
  final double iconSize;
  final bool showIcon;

  const ChartLegendConfig({
    this.show = true,
    this.position = LegendPosition.bottom,
    this.alignment = MainAxisAlignment.center,
    this.spacing = 8.0,
    this.runSpacing = 16.0,
    this.textStyle,
    this.iconSize = 12.0,
    this.showIcon = true,
  });
}

enum LegendPosition { top, bottom, left, right }

class ChartTooltipConfig {
  final bool show;
  final double borderRadius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double padding;
  final bool showShadow;

  const ChartTooltipConfig({
    this.show = true,
    this.borderRadius = 8.0,
    this.backgroundColor,
    this.textStyle,
    this.padding = 8.0,
    this.showShadow = true,
  });
}

class ChartInteractionConfig {
  final bool enablePan;
  final bool enableZoom;
  final bool enableSelection;
  final bool enableTooltip;
  final bool enableLegendInteraction;
  final double minZoom;
  final double maxZoom;

  const ChartInteractionConfig({
    this.enablePan = true,
    this.enableZoom = true,
    this.enableSelection = true,
    this.enableTooltip = true,
    this.enableLegendInteraction = true,
    this.minZoom = 1.0,
    this.maxZoom = 5.0,
  });
}

class AppChart extends StatefulWidget {
  final ChartVariant variant;
  final List<ChartSeries> series;
  final ChartAxesConfig? axes;
  final ChartLegendConfig? legend;
  final ChartTooltipConfig? tooltip;
  final ChartInteractionConfig? interaction;
  final ChartState state;
  final bool animate;
  final Duration animationDuration;
  final bool rtlSupport;
  final bool accessibilitySupport;
  final String? accessibilityLabel;
  final VoidCallback? onTap;
  final ValueChanged<ChartPoint>? onPointTap;
  final ValueChanged<ChartPoint>? onPointHover;
  final double? width;
  final double? height;

  const AppChart({
    super.key,
    required this.variant,
    required this.series,
    this.axes,
    this.legend,
    this.tooltip,
    this.interaction,
    this.state = ChartState.defaultState,
    this.animate = true,
    this.animationDuration = const Duration(milliseconds: 300),
    this.rtlSupport = true,
    this.accessibilitySupport = true,
    this.accessibilityLabel,
    this.onTap,
    this.onPointTap,
    this.onPointHover,
    this.width,
    this.height,
  });

  @override
  State<AppChart> createState() => _AppChartState();
}

class _AppChartState extends State<AppChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int? _hoveredIndex;
  int? _selectedIndex;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (widget.animate) {
      _animationController.forward();
    } else {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(AppChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.series != oldWidget.series && widget.animate) {
      _animationController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isRtl = widget.rtlSupport &&
        Directionality.maybeOf(context) == TextDirection.rtl;

    if (widget.state == ChartState.loading) {
      return _buildLoadingState(theme);
    }

    if (widget.state == ChartState.skeleton) {
      return _buildSkeletonState(theme);
    }

    if (widget.state == ChartState.disabled) {
      return _buildDisabledState(theme);
    }

    final chartContent = Focus(
      onFocusChange: (focused) {
        setState(() {
          _isFocused = focused;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) {},
        onTapUp: (_) {},
        onTapCancel: () {},
        child: MouseRegion(
          onEnter: (_) => setState(() {}),
          onExit: (_) => setState(() {
            _hoveredIndex = null;
          }),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                width: widget.width,
                height: widget.height ?? 300,
                decoration: BoxDecoration(
                  border: _isFocused || widget.state == ChartState.focus
                      ? Border.all(
                          color: colors.primary,
                          width: 2,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Directionality(
                  textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                  child: _buildChart(theme, colors),
                ),
              );
            },
          ),
        ),
      ),
    );

    if (widget.accessibilitySupport) {
      return Semantics(
        label: widget.accessibilityLabel ?? 'Chart: ${widget.variant.name}',
        child: chartContent,
      );
    }

    return chartContent;
  }

  Widget _buildChart(ThemeData theme, ColorScheme colors) {
    switch (widget.variant) {
      case ChartVariant.line:
      case ChartVariant.area:
        return _buildLineChart(theme, colors);
      case ChartVariant.bar:
        return _buildBarChart(theme, colors);
      case ChartVariant.pie:
        return _buildPieChart(theme, colors);
      case ChartVariant.heatmap:
        return _buildHeatmapChart(theme, colors);
    }
  }

  Widget _buildLineChart(ThemeData theme, ColorScheme colors) {
    final axes = widget.axes ?? const ChartAxesConfig();
    final tooltip = widget.tooltip ?? const ChartTooltipConfig();
    final legend = widget.legend ?? const ChartLegendConfig();

    return Column(
      children: [
        if (legend.show && legend.position == LegendPosition.top)
          _buildLegend(theme, colors),
        Expanded(
          child: LineChart(
            LineChartData(
              lineBarsData: widget.series.map((series) {
                final seriesColor =
                    series.color ?? _getSeriesColor(series, colors);
                return LineChartBarData(
                  spots: series.data
                      .map((point) => FlSpot(point.x, point.y))
                      .toList(),
                  isCurved: true,
                  color: seriesColor,
                  barWidth: series.strokeWidth * _animation.value,
                  dotData: FlDotData(
                    show: series.showPoints,
                    getDotPainter: (spot, percent, bar, index) {
                      final isHovered = _hoveredIndex == index;
                      final isSelected = _selectedIndex == index ||
                          widget.state == ChartState.selected;
                      return FlDotCirclePainter(
                        radius: series.pointRadius *
                            _animation.value *
                            (isHovered ? 1.5 : 1.0),
                        color: seriesColor,
                        strokeWidth: isSelected ? 2 : 0,
                        strokeColor: colors.primary,
                      );
                    },
                  ),
                  belowBarData: widget.variant == ChartVariant.area
                      ? BarAreaData(
                          show: true,
                          color: seriesColor.withValues(
                              alpha: series.areaOpacity * _animation.value),
                        )
                      : null,
                );
              }).toList(),
              titlesData: _buildTitlesData(theme, axes),
              gridData: FlGridData(
                show: axes.showGrid,
                drawVerticalLine: true,
                drawHorizontalLine: true,
                verticalInterval: axes.xAxis?.interval,
                horizontalInterval: axes.yAxis?.interval,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: axes.gridColor.withValues(alpha: axes.gridOpacity),
                  strokeWidth: axes.gridStrokeWidth,
                ),
                getDrawingVerticalLine: (value) => FlLine(
                  color: axes.gridColor.withValues(alpha: axes.gridOpacity),
                  strokeWidth: axes.gridStrokeWidth,
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(
                    color: colors.outline.withValues(alpha: 0.3),
                  ),
                  left: BorderSide(
                    color: colors.outline.withValues(alpha: 0.3),
                  ),
                ),
              ),
              lineTouchData: LineTouchData(
                enabled: tooltip.show,
                touchTooltipData: LineTouchTooltipData(
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  getTooltipColor: (touchedSpot) =>
                      tooltip.backgroundColor ?? colors.surfaceContainerHighest,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      final series = widget.series[spot.barIndex];
                      return LineTooltipItem(
                        '${series.name}: ${spot.y.toStringAsFixed(2)}',
                        tooltip.textStyle ??
                            theme.textTheme.bodySmall ??
                            const TextStyle(),
                      );
                    }).toList();
                  },
                ),
                handleBuiltInTouches: true,
                getTouchedSpotIndicator: (barData, spotIndexes) {
                  return spotIndexes.map((spotIndex) {
                    return TouchedSpotIndicatorData(
                      FlLine(
                        color: colors.primary.withValues(alpha: 0.3),
                        strokeWidth: 2,
                        dashArray: [5, 5],
                      ),
                      FlDotData(
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 6,
                            color: colors.primary,
                            strokeWidth: 2,
                            strokeColor: colors.onPrimary,
                          );
                        },
                      ),
                    );
                  }).toList();
                },
              ),
            ),
            duration: widget.animationDuration,
          ),
        ),
        if (legend.show && legend.position == LegendPosition.bottom)
          _buildLegend(theme, colors),
      ],
    );
  }

  Widget _buildBarChart(ThemeData theme, ColorScheme colors) {
    final axes = widget.axes ?? const ChartAxesConfig();
    final tooltip = widget.tooltip ?? const ChartTooltipConfig();
    final legend = widget.legend ?? const ChartLegendConfig();

    return Column(
      children: [
        if (legend.show && legend.position == LegendPosition.top)
          _buildLegend(theme, colors),
        Expanded(
          child: BarChart(
            BarChartData(
              barGroups: _createBarGroups(colors),
              titlesData: _buildTitlesData(theme, axes),
              gridData: FlGridData(
                show: axes.showGrid,
                drawVerticalLine: false,
                drawHorizontalLine: true,
                horizontalInterval: axes.yAxis?.interval,
                getDrawingHorizontalLine: (value) => FlLine(
                  color: axes.gridColor.withValues(alpha: axes.gridOpacity),
                  strokeWidth: axes.gridStrokeWidth,
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(
                    color: colors.outline.withValues(alpha: 0.3),
                  ),
                  left: BorderSide(
                    color: colors.outline.withValues(alpha: 0.3),
                  ),
                ),
              ),
              barTouchData: BarTouchData(
                enabled: tooltip.show,
                touchTooltipData: BarTouchTooltipData(
                  fitInsideHorizontally: true,
                  fitInsideVertically: true,
                  getTooltipColor: (group) =>
                      tooltip.backgroundColor ?? colors.surfaceContainerHighest,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    final series = widget.series[rodIndex];
                    return BarTooltipItem(
                      '${series.name}: ${rod.toY.toStringAsFixed(2)}',
                      tooltip.textStyle ??
                          theme.textTheme.bodySmall ??
                          const TextStyle(),
                    );
                  },
                ),
              ),
            ),
            duration: widget.animationDuration,
          ),
        ),
        if (legend.show && legend.position == LegendPosition.bottom)
          _buildLegend(theme, colors),
      ],
    );
  }

  List<BarChartGroupData> _createBarGroups(ColorScheme colors) {
    if (widget.series.isEmpty) return [];

    final maxPoints = widget.series.map((s) => s.data.length).reduce(math.max);
    final groups = <BarChartGroupData>[];

    for (int i = 0; i < maxPoints; i++) {
      final rods = <BarChartRodData>[];
      for (int j = 0; j < widget.series.length; j++) {
        final series = widget.series[j];
        if (i < series.data.length) {
          final point = series.data[i];
          final seriesColor = series.color ?? _getSeriesColor(series, colors);
          rods.add(
            BarChartRodData(
              toY: point.y * _animation.value,
              color: _hoveredIndex == i
                  ? seriesColor.withValues(alpha: 0.8)
                  : seriesColor,
              width: 16,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(4),
              ),
            ),
          );
        }
      }
      groups.add(
        BarChartGroupData(
          x: i,
          barRods: rods,
          barsSpace: 4,
        ),
      );
    }
    return groups;
  }

  Widget _buildPieChart(ThemeData theme, ColorScheme colors) {
    final legend = widget.legend ?? const ChartLegendConfig();

    if (widget.series.isEmpty || widget.series.first.data.isEmpty) {
      return const Center(child: Text('No data'));
    }

    final series = widget.series.first;
    final total = series.data.fold(0.0, (sum, point) => sum + point.y);

    return Column(
      children: [
        if (legend.show && legend.position == LegendPosition.top)
          _buildLegend(theme, colors),
        Expanded(
          child: PieChart(
            PieChartData(
              sections: series.data.asMap().entries.map((entry) {
                final index = entry.key;
                final point = entry.value;
                final percentage = (point.y / total * 100);
                final isHovered = _hoveredIndex == index;
                final isSelected = _selectedIndex == index ||
                    widget.state == ChartState.selected;

                return PieChartSectionData(
                  value: point.y * _animation.value,
                  title: '${percentage.toStringAsFixed(1)}%',
                  color: point.color ?? _getColorByIndex(index, colors),
                  radius: isHovered
                      ? 110 * _animation.value
                      : 100 * _animation.value,
                  titleStyle: TextStyle(
                    fontSize: isHovered ? 14 : 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  borderSide: isSelected
                      ? BorderSide(
                          color: colors.primary,
                          width: 3,
                        )
                      : BorderSide.none,
                );
              }).toList(),
              sectionsSpace: 2,
              centerSpaceRadius: 40,
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      _hoveredIndex = null;
                      return;
                    }
                    _hoveredIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;

                    if (event is FlTapUpEvent &&
                        widget.onPointTap != null &&
                        _hoveredIndex != null) {
                      widget.onPointTap!(series.data[_hoveredIndex!]);
                    }
                  });
                },
              ),
            ),
            duration: widget.animationDuration,
            curve: Curves.easeInOut,
          ),
        ),
        if (legend.show && legend.position == LegendPosition.bottom)
          _buildLegend(theme, colors),
      ],
    );
  }

  Widget _buildHeatmapChart(ThemeData theme, ColorScheme colors) {
    if (widget.series.isEmpty || widget.series.first.data.isEmpty) {
      return const Center(child: Text('No data'));
    }

    final series = widget.series.first;
    final data = series.data;

    final minValue = data.map((p) => p.y).reduce(math.min);
    final maxValue = data.map((p) => p.y).reduce(math.max);
    final range = maxValue - minValue;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 80,
        childAspectRatio: 1,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final point = data[index];
        final normalizedValue = range > 0 ? (point.y - minValue) / range : 0.5;

        final color = Color.lerp(
          colors.primary.withValues(alpha: 0.2),
          colors.primary,
          normalizedValue * _animation.value,
        )!;

        return MouseRegion(
          onEnter: (_) => setState(() => _hoveredIndex = index),
          onExit: (_) => setState(() => _hoveredIndex = null),
          child: GestureDetector(
            onTap: () => widget.onPointTap?.call(point),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
                border: _hoveredIndex == index
                    ? Border.all(color: colors.primary, width: 2)
                    : null,
              ),
              child: Center(
                child: Text(
                  point.y.toStringAsFixed(1),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color:
                        normalizedValue > 0.5 ? Colors.white : colors.onSurface,
                    fontWeight: _hoveredIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLegend(ThemeData theme, ColorScheme colors) {
    final legend = widget.legend ?? const ChartLegendConfig();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: legend.spacing,
        runSpacing: legend.runSpacing,
        children:
            widget.series.where((series) => series.showInLegend).map((series) {
          final seriesColor = series.color ?? _getSeriesColor(series, colors);
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (legend.showIcon)
                Container(
                  width: legend.iconSize,
                  height: legend.iconSize,
                  decoration: BoxDecoration(
                    color: seriesColor,
                    shape: BoxShape.circle,
                  ),
                ),
              if (legend.showIcon) const SizedBox(width: 4),
              Text(
                series.name,
                style: legend.textStyle ?? theme.textTheme.bodySmall,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  FlTitlesData _buildTitlesData(ThemeData theme, ChartAxesConfig axes) {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: axes.yAxis?.showLabels ?? true,
          reservedSize: 40,
          getTitlesWidget: (value, meta) {
            return Text(
              value.toStringAsFixed(0),
              style: axes.yAxis?.labelStyle ?? theme.textTheme.bodySmall,
            );
          },
        ),
        axisNameWidget: axes.yAxis?.title != null
            ? Text(
                axes.yAxis!.title!,
                style: axes.yAxis?.titleStyle ?? theme.textTheme.labelMedium,
              )
            : null,
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: axes.xAxis?.showLabels ?? true,
          reservedSize: 30,
          getTitlesWidget: (value, meta) {
            return Text(
              value.toStringAsFixed(0),
              style: axes.xAxis?.labelStyle ?? theme.textTheme.bodySmall,
            );
          },
        ),
        axisNameWidget: axes.xAxis?.title != null
            ? Text(
                axes.xAxis!.title!,
                style: axes.xAxis?.titleStyle ?? theme.textTheme.labelMedium,
              )
            : null,
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );
  }

  Widget _buildLoadingState(ThemeData theme) {
    return Container(
      width: widget.width,
      height: widget.height ?? 300,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }

  Widget _buildSkeletonState(ThemeData theme) {
    return Container(
      width: widget.width,
      height: widget.height ?? 300,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomPaint(
        painter: _SkeletonPainter(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
    );
  }

  Widget _buildDisabledState(ThemeData theme) {
    return Opacity(
      opacity: 0.5,
      child: IgnorePointer(
        child: _buildChart(theme, theme.colorScheme),
      ),
    );
  }

  Color _getSeriesColor(ChartSeries series, ColorScheme colors) {
    final index = widget.series.indexOf(series);
    return _getColorByIndex(index, colors);
  }

  Color _getColorByIndex(int index, ColorScheme colors) {
    final colorList = [
      colors.primary,
      colors.secondary,
      colors.tertiary,
      colors.error,
      colors.primary.withValues(alpha: 0.7),
      colors.secondary.withValues(alpha: 0.7),
      colors.tertiary.withValues(alpha: 0.7),
    ];
    return colorList[index % colorList.length];
  }
}

class _SkeletonPainter extends CustomPainter {
  final Color color;

  _SkeletonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawLine(
      Offset(40, size.height - 20),
      Offset(size.width - 20, size.height - 20),
      paint,
    );

    canvas.drawLine(
      const Offset(40, 20),
      Offset(40, size.height - 20),
      paint,
    );

    for (int i = 1; i <= 4; i++) {
      final y = size.height - 20 - (i * (size.height - 40) / 4);
      canvas.drawLine(
        Offset(35, y),
        Offset(size.width - 20, y),
        paint..color = color.withValues(alpha: 0.1),
      );
    }

    final linePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    path.moveTo(40, size.height * 0.7);
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.4,
      size.width * 0.6,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.3,
      size.width - 20,
      size.height * 0.4,
    );

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
