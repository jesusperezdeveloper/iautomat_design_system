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

/// Stories collection for AppFilterBar component
class FilterBarStories extends StatefulWidget {
  const FilterBarStories({super.key});

  @override
  State<FilterBarStories> createState() => _FilterBarStoriesState();
}

class _FilterBarStoriesState extends State<FilterBarStories> {
  List<AppFilter> basicFilters = [
    AppFilter(
      id: 'status',
      label: 'Status',
      type: FilterType.single,
      options: [
        const AppFilterOption(value: 'active', label: 'Active'),
        const AppFilterOption(value: 'inactive', label: 'Inactive'),
        const AppFilterOption(value: 'pending', label: 'Pending'),
      ],
    ),
    AppFilter(
      id: 'category',
      label: 'Category',
      type: FilterType.multiple,
      icon: Icons.category,
      options: [
        const AppFilterOption(value: 'electronics', label: 'Electronics'),
        const AppFilterOption(value: 'clothing', label: 'Clothing'),
        const AppFilterOption(value: 'books', label: 'Books'),
        const AppFilterOption(value: 'food', label: 'Food'),
      ],
    ),
    const AppFilter(
      id: 'price',
      label: 'Price Range',
      type: FilterType.range,
      icon: Icons.attach_money,
      minValue: 0,
      maxValue: 1000,
      stepValue: 10,
    ),
    const AppFilter(
      id: 'search',
      label: 'Search',
      type: FilterType.text,
      icon: Icons.search,
      placeholder: 'Enter keywords...',
    ),
  ];

  List<AppFilter> advancedFilters = [
    const AppFilter(
      id: 'date',
      label: 'Date',
      type: FilterType.date,
      icon: Icons.calendar_today,
    ),
    const AppFilter(
      id: 'dateRange',
      label: 'Date Range',
      type: FilterType.dateRange,
      icon: Icons.date_range,
    ),
    const AppFilter(
      id: 'color',
      label: 'Color',
      type: FilterType.color,
      icon: Icons.palette,
    ),
    const AppFilter(
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
        title: const Text('AppFilterBar Stories'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStorySection(
              'Chips Variant - Basic',
              AppFilterBar.chips(
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
              AppFilterBar.popovers(
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
              AppFilterBar.chips(
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
              AppFilterBar.chips(
                filters: basicFilters.take(3).toList(),
                config: AppFilterBarConfig.small,
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Large Size Configuration',
              AppFilterBar.chips(
                filters: basicFilters.take(3).toList(),
                config: AppFilterBarConfig.large,
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Custom Styled Chips',
              AppFilterBar.chips(
                filters: basicFilters,
                config: const AppFilterBarConfig(
                  chipStyle: AppFilterChipStyle.filled,
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
              AppFilterBar.chips(
                filters: const [],
                state: AppFilterBarState.loading,
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Skeleton State',
              AppFilterBar.chips(
                filters: const [],
                state: AppFilterBarState.skeleton,
                config: const AppFilterBarConfig(
                  skeletonFilterCount: 5,
                ),
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Disabled State',
              AppFilterBar.chips(
                filters: basicFilters
                    .map((f) => f.copyWith(isDisabled: true))
                    .toList(),
                state: AppFilterBarState.disabled,
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'With Custom Summary',
              AppFilterBar.chips(
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
              AppFilterBar.chips(
                filters: [
                  ...basicFilters,
                  const AppFilter(id: 'extra1', label: 'Extra Filter 1'),
                  const AppFilter(id: 'extra2', label: 'Extra Filter 2'),
                  const AppFilter(id: 'extra3', label: 'Extra Filter 3'),
                ],
                config: const AppFilterBarConfig(
                  maxVisibleChips: 3,
                ),
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Vertical Layout',
              AppFilterBar.chips(
                filters: basicFilters,
                config: const AppFilterBarConfig(
                  layout: AppFilterBarLayout.vertical,
                ),
                onChanged: (filters) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'With Groups',
              AppFilterBar.chips(
                filters: [
                  AppFilter(
                    id: 'type',
                    label: 'Type',
                    group: 'product',
                    options: const [
                      AppFilterOption(value: 'new', label: 'New'),
                      AppFilterOption(value: 'used', label: 'Used'),
                    ],
                  ),
                  AppFilter(
                    id: 'brand',
                    label: 'Brand',
                    group: 'product',
                    options: const [
                      AppFilterOption(value: 'apple', label: 'Apple'),
                      AppFilterOption(value: 'samsung', label: 'Samsung'),
                    ],
                  ),
                  AppFilter(
                    id: 'shipping',
                    label: 'Shipping',
                    group: 'delivery',
                    options: const [
                      AppFilterOption(value: 'free', label: 'Free Shipping'),
                      AppFilterOption(value: 'express', label: 'Express'),
                    ],
                  ),
                ],
                groups: const [
                  AppFilterGroup(
                    id: 'product',
                    label: 'Product Filters',
                    icon: Icons.shopping_cart,
                  ),
                  AppFilterGroup(
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
  late List<AppFilter> filters;
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
      AppFilter(
        id: 'category',
        label: 'Category',
        type: FilterType.multiple,
        icon: Icons.category,
        options: const [
          AppFilterOption(value: 'electronics', label: 'Electronics'),
          AppFilterOption(value: 'clothing', label: 'Clothing'),
          AppFilterOption(value: 'books', label: 'Books'),
          AppFilterOption(value: 'food', label: 'Food'),
        ],
      ),
      AppFilter(
        id: 'status',
        label: 'Status',
        type: FilterType.single,
        icon: Icons.info,
        options: const [
          AppFilterOption(value: 'active', label: 'Active'),
          AppFilterOption(value: 'inactive', label: 'Inactive'),
          AppFilterOption(value: 'pending', label: 'Pending'),
        ],
      ),
      const AppFilter(
        id: 'price',
        label: 'Price Range',
        type: FilterType.range,
        icon: Icons.attach_money,
        minValue: 0,
        maxValue: 1000,
        stepValue: 50,
      ),
      const AppFilter(
        id: 'featured',
        label: 'Featured',
        type: FilterType.boolean,
        icon: Icons.star,
      ),
    ];
    filteredProducts = allProducts;
  }

  void _applyFilters(List<AppFilter> updatedFilters) {
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
            child: AppFilterBar.chips(
              filters: filters,
              onChanged: _applyFilters,
              config: const AppFilterBarConfig(
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
