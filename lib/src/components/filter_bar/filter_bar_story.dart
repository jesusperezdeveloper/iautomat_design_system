/// Filter bar component stories and examples
///
/// This file contains different story examples demonstrating:
/// - Chip-based filter variants
/// - Popover-based filter variants
/// - Different filter types
/// - Interactive states
/// - Custom configurations
library;

import 'package:flutter/material.dart';
import 'app_filter_bar.dart';
import 'filter_bar_config.dart';

/// Stories collection for DSFilterBar component
class FilterBarStories extends StatefulWidget {
  const FilterBarStories({super.key});

  @override
  State<FilterBarStories> createState() => _FilterBarStoriesState();
}

class _FilterBarStoriesState extends State<FilterBarStories> {
  List<DSFilter> basicFilters = [
    DSFilter(
      id: 'status',
      label: 'Status',
      type: FilterType.single,
      options: [
        const DSFilterOption(value: 'active', label: 'Active'),
        const DSFilterOption(value: 'inactive', label: 'Inactive'),
        const DSFilterOption(value: 'pending', label: 'Pending'),
      ],
    ),
    DSFilter(
      id: 'category',
      label: 'Category',
      type: FilterType.multiple,
      icon: Icons.category,
      options: [
        const DSFilterOption(value: 'electronics', label: 'Electronics'),
        const DSFilterOption(value: 'clothing', label: 'Clothing'),
        const DSFilterOption(value: 'books', label: 'Books'),
        const DSFilterOption(value: 'food', label: 'Food'),
      ],
    ),
    const DSFilter(
      id: 'price',
      label: 'Price Range',
      type: FilterType.range,
      icon: Icons.attach_money,
      minValue: 0,
      maxValue: 1000,
      stepValue: 10,
    ),
    const DSFilter(
      id: 'search',
      label: 'Search',
      type: FilterType.text,
      icon: Icons.search,
      placeholder: 'Enter keywords...',
    ),
  ];

  List<DSFilter> advancedFilters = [
    const DSFilter(
      id: 'date',
      label: 'Date',
      type: FilterType.date,
      icon: Icons.calendar_today,
    ),
    const DSFilter(
      id: 'dateRange',
      label: 'Date Range',
      type: FilterType.dateRange,
      icon: Icons.date_range,
    ),
    const DSFilter(
      id: 'color',
      label: 'Color',
      type: FilterType.color,
      icon: Icons.palette,
    ),
    const DSFilter(
      id: 'featured',
      label: 'Featured Only',
      type: FilterType.boolean,
      icon: Icons.star,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSFilterBar Stories'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStorySection(
              'Chips Variant - Basic',
              DSFilterBar.chips(
                filters: basicFilters,
                onChanged: (filters) {
                  debugPrint(
                      'Filters changed: ${filters.map((f) => f.displayValue)}');
                },
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Popovers Variant - Basic',
              DSFilterBar.popovers(
                filters: basicFilters,
                onChanged: (filters) {
                  debugPrint(
                      'Filters changed: ${filters.map((f) => f.displayValue)}');
                },
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Advanced Filter Types',
              DSFilterBar.chips(
                filters: advancedFilters,
                onChanged: (filters) {
                  debugPrint(
                      'Filters changed: ${filters.map((f) => f.displayValue)}');
                },
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Small Size Configuration',
              DSFilterBar.chips(
                filters: basicFilters.take(3).toList(),
                config: DSFilterBarConfig.small,
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Large Size Configuration',
              DSFilterBar.chips(
                filters: basicFilters.take(3).toList(),
                config: DSFilterBarConfig.large,
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Custom Styled Chips',
              DSFilterBar.chips(
                filters: basicFilters,
                config: const DSFilterBarConfig(
                  chipStyle: DSFilterChipStyle.filled,
                  backgroundColor: Colors.blue,
                  selectedBackgroundColor: Colors.orange,
                  borderRadius: 16.0,
                  chipHeight: 36.0,
                ),
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Loading State',
              DSFilterBar.chips(
                filters: const [],
                state: DSFilterBarState.loading,
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Skeleton State',
              DSFilterBar.chips(
                filters: const [],
                state: DSFilterBarState.skeleton,
                config: const DSFilterBarConfig(
                  skeletonFilterCount: 5,
                ),
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Disabled State',
              DSFilterBar.chips(
                filters: basicFilters
                    .map((f) => f.copyWith(isDisabled: true))
                    .toList(),
                state: DSFilterBarState.disabled,
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'With Custom Summary',
              DSFilterBar.chips(
                filters: basicFilters,
                summaryBuilder: (context, activeFilters, total) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${activeFilters.length} of $total filters active',
                      style: TextStyle(
                        color: Colors.amber.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Max Visible Chips',
              DSFilterBar.chips(
                filters: [
                  ...basicFilters,
                  const DSFilter(id: 'extra1', label: 'Extra Filter 1'),
                  const DSFilter(id: 'extra2', label: 'Extra Filter 2'),
                  const DSFilter(id: 'extra3', label: 'Extra Filter 3'),
                ],
                config: const DSFilterBarConfig(
                  maxVisibleChips: 3,
                ),
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Vertical Layout',
              DSFilterBar.chips(
                filters: basicFilters,
                config: const DSFilterBarConfig(
                  layout: DSFilterBarLayout.vertical,
                ),
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'With Groups',
              DSFilterBar.chips(
                filters: [
                  DSFilter(
                    id: 'type',
                    label: 'Type',
                    group: 'product',
                    options: const [
                      DSFilterOption(value: 'new', label: 'New'),
                      DSFilterOption(value: 'used', label: 'Used'),
                    ],
                  ),
                  DSFilter(
                    id: 'brand',
                    label: 'Brand',
                    group: 'product',
                    options: const [
                      DSFilterOption(value: 'apple', label: 'Apple'),
                      DSFilterOption(value: 'samsung', label: 'Samsung'),
                    ],
                  ),
                  DSFilter(
                    id: 'shipping',
                    label: 'Shipping',
                    group: 'delivery',
                    options: const [
                      DSFilterOption(value: 'free', label: 'Free Shipping'),
                      DSFilterOption(value: 'express', label: 'Express'),
                    ],
                  ),
                ],
                groups: const [
                  DSFilterGroup(
                    id: 'product',
                    label: 'Product Filters',
                    icon: Icons.shopping_cart,
                  ),
                  DSFilterGroup(
                    id: 'delivery',
                    label: 'Delivery Options',
                    icon: Icons.local_shipping,
                  ),
                ],
                onChanged: (filters) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStorySection(String title, Widget widget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: widget,
        ),
      ],
    );
  }
}

/// Example usage in an app
class FilterBarStoryExample extends StatefulWidget {
  const FilterBarStoryExample({super.key});

  @override
  State<FilterBarStoryExample> createState() => _FilterBarStoryExampleState();
}

class _FilterBarStoryExampleState extends State<FilterBarStoryExample> {
  late List<DSFilter> filters;
  List<Map<String, dynamic>> allProducts = List.generate(
      100,
      (index) => {
            'id': index,
            'name': 'Product ${index + 1}',
            'category': ['electronics', 'clothing', 'books', 'food'][index % 4],
            'price': (index * 10) % 1000,
            'status': ['active', 'inactive', 'pending'][index % 3],
            'featured': index % 3 == 0,
          });

  List<Map<String, dynamic>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filters = [
      DSFilter(
        id: 'category',
        label: 'Category',
        type: FilterType.multiple,
        icon: Icons.category,
        options: const [
          DSFilterOption(value: 'electronics', label: 'Electronics'),
          DSFilterOption(value: 'clothing', label: 'Clothing'),
          DSFilterOption(value: 'books', label: 'Books'),
          DSFilterOption(value: 'food', label: 'Food'),
        ],
      ),
      DSFilter(
        id: 'status',
        label: 'Status',
        type: FilterType.single,
        icon: Icons.info,
        options: const [
          DSFilterOption(value: 'active', label: 'Active'),
          DSFilterOption(value: 'inactive', label: 'Inactive'),
          DSFilterOption(value: 'pending', label: 'Pending'),
        ],
      ),
      const DSFilter(
        id: 'price',
        label: 'Price Range',
        type: FilterType.range,
        icon: Icons.attach_money,
        minValue: 0,
        maxValue: 1000,
        stepValue: 50,
      ),
      const DSFilter(
        id: 'featured',
        label: 'Featured',
        type: FilterType.boolean,
        icon: Icons.star,
      ),
    ];
    filteredProducts = allProducts;
  }

  void _applyFilters(List<DSFilter> updatedFilters) {
    setState(() {
      filters = updatedFilters;
      filteredProducts = allProducts.where((product) {
        for (final filter in updatedFilters) {
          if (!filter.hasValue) continue;

          switch (filter.id) {
            case 'category':
              final selectedCategories = filter.value as List;
              if (selectedCategories.isNotEmpty &&
                  !selectedCategories.contains(product['category'])) {
                return false;
              }
              break;
            case 'status':
              if (filter.value != product['status']) {
                return false;
              }
              break;
            case 'price':
              final range = filter.value as List;
              if (product['price'] < range[0] || product['price'] > range[1]) {
                return false;
              }
              break;
            case 'featured':
              if (filter.value == true && product['featured'] != true) {
                return false;
              }
              break;
          }
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog with Filters'),
      ),
      body: Column(
        children: [
          // Filter bar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: DSFilterBar.chips(
              filters: filters,
              onChanged: _applyFilters,
              config: const DSFilterBarConfig(
                showSummary: true,
                enableClearAll: true,
              ),
            ),
          ),
          // Results count
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'Showing ${filteredProducts.length} of ${allProducts.length} products',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          // Product grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (product['featured'] == true)
                              const Icon(Icons.star,
                                  size: 16, color: Colors.amber),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                product['name'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Category: ${product['category']}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          'Price: \$${product['price']}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: product['status'] == 'active'
                                ? Colors.green.shade100
                                : product['status'] == 'inactive'
                                    ? Colors.red.shade100
                                    : Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            product['status'].toString().toUpperCase(),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: product['status'] == 'active'
                                  ? Colors.green.shade900
                                  : product['status'] == 'inactive'
                                      ? Colors.red.shade900
                                      : Colors.orange.shade900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
