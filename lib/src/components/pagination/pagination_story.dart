/// Pagination component stories and examples
///
/// This file contains different story examples demonstrating:
/// - Page-based pagination variants
/// - Cursor-based pagination variants
/// - Different sizes and styles
/// - Interactive states
/// - Error handling and loading states
library;

import 'package:flutter/material.dart';
import 'ds_pagination.dart';
import 'pagination_config.dart';

/// Stories collection for DSPagination component
class PaginationStories extends StatefulWidget {
  const PaginationStories({super.key});

  @override
  State<PaginationStories> createState() => _PaginationStoriesState();
}

class _PaginationStoriesState extends State<PaginationStories> {
  int currentPage = 1;
  int currentPageSmall = 1;
  int currentPageLarge = 1;
  int cursorPage = 1;
  String? nextCursor = 'cursor-page-2';
  String? previousCursor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSPagination Stories'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStorySection(
              'Page-based Pagination - Default',
              DSPagination.pageBased(
                page: currentPage,
                pageSize: 10,
                total: 250,
                onPageChanged: (page) {
                  setState(() {
                    currentPage = page;
                  });
                },
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Page-based Pagination - Small Size',
              DSPagination.pageBased(
                page: currentPageSmall,
                pageSize: 20,
                total: 100,
                config: DSPaginationConfig.small,
                onPageChanged: (page) {
                  setState(() {
                    currentPageSmall = page;
                  });
                },
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Page-based Pagination - Large Size',
              DSPagination.pageBased(
                page: currentPageLarge,
                pageSize: 5,
                total: 500,
                config: DSPaginationConfig.large,
                onPageChanged: (page) {
                  setState(() {
                    currentPageLarge = page;
                  });
                },
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Cursor-based Pagination',
              DSPagination.cursor(
                hasNextPage: nextCursor != null,
                hasPreviousPage: previousCursor != null,
                nextCursor: nextCursor,
                previousCursor: previousCursor,
                onCursorChanged: (cursor, isNext) {
                  setState(() {
                    if (isNext) {
                      cursorPage++;
                      previousCursor = 'cursor-page-${cursorPage - 1}';
                      nextCursor = cursorPage < 5
                          ? 'cursor-page-${cursorPage + 1}'
                          : null;
                    } else {
                      cursorPage--;
                      nextCursor = 'cursor-page-${cursorPage + 1}';
                      previousCursor = cursorPage > 1
                          ? 'cursor-page-${cursorPage - 1}'
                          : null;
                    }
                  });
                },
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Loading State',
              DSPagination.pageBased(
                page: 3,
                pageSize: 10,
                total: 100,
                data: const DSPaginationData(
                  currentPage: 3,
                  pageSize: 10,
                  totalItems: 100,
                  totalPages: 10,
                  isLoading: true,
                ),
                onPageChanged: (page) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Loading More State',
              DSPagination.pageBased(
                page: 1,
                pageSize: 10,
                total: 100,
                data: const DSPaginationData(
                  currentPage: 1,
                  pageSize: 10,
                  totalItems: 100,
                  totalPages: 10,
                  isLoadingMore: true,
                ),
                onPageChanged: (page) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Custom Configuration',
              DSPagination.pageBased(
                page: 2,
                pageSize: 15,
                total: 300,
                config: const DSPaginationConfig(
                  size: DSPaginationSize.medium,
                  buttonStyle: DSPageButtonStyle.filled,
                  maxVisiblePages: 7,
                  showJumpToPage: true,
                  backgroundColor: Colors.blue,
                  selectedBackgroundColor: Colors.orange,
                  borderRadius: 12.0,
                ),
                onPageChanged: (page) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Minimal Configuration',
              DSPagination.pageBased(
                page: 1,
                pageSize: 10,
                total: 50,
                config: const DSPaginationConfig(
                  showFirstLast: false,
                  showPageInfo: false,
                  maxVisiblePages: 3,
                ),
                onPageChanged: (page) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Compact Layout',
              DSPagination.pageBased(
                page: 5,
                pageSize: 10,
                total: 200,
                config: const DSPaginationConfig(
                  layout: DSPaginationLayout.compact,
                  size: DSPaginationSize.small,
                ),
                onPageChanged: (page) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Text Button Style',
              DSPagination.pageBased(
                page: 3,
                pageSize: 10,
                total: 120,
                config: const DSPaginationConfig(
                  buttonStyle: DSPageButtonStyle.text,
                ),
                onPageChanged: (page) {},
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
          child: Center(child: widget),
        ),
      ],
    );
  }
}

/// Example usage in an app
class PaginationStoryExample extends StatefulWidget {
  const PaginationStoryExample({super.key});

  @override
  State<PaginationStoryExample> createState() => _PaginationStoryExampleState();
}

class _PaginationStoryExampleState extends State<PaginationStoryExample> {
  int currentPage = 1;
  final int pageSize = 10;
  final int totalItems = 157;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Table with Pagination'),
      ),
      body: Column(
        children: [
          // Simulated data table
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                            child: Text('Name',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text('Email',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text('Role',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: pageSize,
                      itemBuilder: (context, index) {
                        final itemIndex =
                            (currentPage - 1) * pageSize + index + 1;
                        if (itemIndex > totalItems) {
                          return const SizedBox.shrink();
                        }

                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(child: Text('User $itemIndex')),
                              Expanded(
                                  child: Text('user$itemIndex@example.com')),
                              Expanded(
                                  child: Text(
                                      itemIndex % 3 == 0 ? 'Admin' : 'User')),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Pagination
          Container(
            padding: const EdgeInsets.all(16),
            child: DSPagination.pageBased(
              page: currentPage,
              pageSize: pageSize,
              total: totalItems,
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
