import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_in_page_search.dart';
import 'in_page_search_config.dart';

/// Story examples for AppInPageSearch component
class InPageSearchStory extends StatefulWidget {
  const InPageSearchStory({super.key});

  @override
  State<InPageSearchStory> createState() => _InPageSearchStoryState();
}

class _InPageSearchStoryState extends State<InPageSearchStory> {
  final _searchController = AppInPageSearchController();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppInPageSearch Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildBasicUsageSection(),
          const SizedBox(height: 32.0),
          _buildStatesSection(),
          const SizedBox(height: 32.0),
          _buildSizesSection(),
          const SizedBox(height: 32.0),
          _buildCustomStylingSection(),
          const SizedBox(height: 32.0),
          _buildInteractiveSection(),
          const SizedBox(height: 32.0),
          _buildPlatformAdaptiveSection(),
          const SizedBox(height: 32.0),
          _buildAdvancedFeaturesSection(),
        ],
      ),
    );
  }

  Widget _buildBasicUsageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Basic Usage',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Default Inline Search',
          description: 'Basic inline search with default configuration',
          child: AppInPageSearch.inline(
            onFind: (query, highlights) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Searching for: $query')),
              );
            },
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'With Custom Controller',
          description: 'Search with custom controller and callbacks',
          child: AppInPageSearch.inline(
            searchController: _searchController,
            onFind: (query, highlights) {
              debugPrint('Found $query with ${highlights.length} highlights');
            },
            onNext: () => debugPrint('Next result'),
            onPrevious: () => debugPrint('Previous result'),
            onClear: () => debugPrint('Cleared search'),
            onClose: () => debugPrint('Closed search'),
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'With Initial Query',
          description: 'Search pre-populated with initial query',
          child: AppInPageSearch.inline(
            initialQuery: 'flutter',
            autoFocus: true,
            highlights: const [
              AppSearchHighlight(
                start: 0,
                end: 7,
                text: 'flutter',
                isActive: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'States',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Default State',
          description: 'Normal interactive state',
          child: AppInPageSearch.inline(
            state: AppInPageSearchState.defaultState,
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Focus State',
          description: 'Focused search input',
          child: AppInPageSearch.inline(
            state: AppInPageSearchState.focus,
            autoFocus: true,
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Disabled State',
          description: 'Non-interactive disabled state',
          child: AppInPageSearch.inline(
            state: AppInPageSearchState.disabled,
            initialQuery: 'disabled search',
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Loading State',
          description: 'Search in progress',
          child: AppInPageSearch.inline(
            state: AppInPageSearchState.loading,
            initialQuery: 'searching...',
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Skeleton State',
          description: 'Loading skeleton animation',
          child: AppInPageSearch.inline(
            state: AppInPageSearchState.skeleton,
          ),
        ),
      ],
    );
  }

  Widget _buildSizesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sizes',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Small Size',
          description: 'Compact search bar for tight spaces',
          child: AppInPageSearch.inline(
            config: AppInPageSearchConfig.small,
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Medium Size (Default)',
          description: 'Standard size for most use cases',
          child: AppInPageSearch.inline(
            config: AppInPageSearchConfig.medium,
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Large Size',
          description: 'Larger search bar for emphasis',
          child: AppInPageSearch.inline(
            config: AppInPageSearchConfig.large,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomStylingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Custom Styling',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Custom Colors',
          description: 'Search with custom color scheme',
          child: AppInPageSearch.inline(
            config: const AppInPageSearchConfig(
              backgroundColor: Color(0xFFF3E5F5),
              borderColor: Color(0xFF9C27B0),
              focusBorderColor: Color(0xFF673AB7),
              textColor: Color(0xFF4A148C),
              iconColor: Color(0xFF7B1FA2),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Rounded Style',
          description: 'Highly rounded borders',
          child: AppInPageSearch.inline(
            config: const AppInPageSearchConfig(
              borderRadius: 25.0,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'No Border, High Elevation',
          description: 'Elevated floating appearance',
          child: AppInPageSearch.inline(
            config: const AppInPageSearchConfig(
              showBorder: false,
              elevation: 8.0,
              borderRadius: 12.0,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Custom Icons',
          description: 'Different icon set',
          child: AppInPageSearch.inline(
            config: const AppInPageSearchConfig(
              searchIcon: Icons.manage_search,
              clearIcon: Icons.cancel,
              nextIcon: Icons.arrow_forward_ios,
              previousIcon: Icons.arrow_back_ios,
              closeIcon: Icons.close_fullscreen,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveSection() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interactive Examples',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            _buildStoryCard(
              title: 'Search with Results',
              description: 'Interactive search with mock results',
              child: Column(
                children: [
                  AppInPageSearch.inline(
                    onFind: (query, highlights) {
                      setState(() {
                        // Mock search results would be updated here
                        debugPrint('Searching for: $query');
                      });
                    },
                    data: const AppInPageSearchData(
                      query: 'test',
                      highlights: [
                        AppSearchHighlight(
                          start: 0,
                          end: 4,
                          text: 'test',
                          isActive: true,
                        ),
                        AppSearchHighlight(
                          start: 10,
                          end: 14,
                          text: 'test',
                        ),
                        AppSearchHighlight(
                          start: 20,
                          end: 24,
                          text: 'test',
                        ),
                      ],
                      totalResults: 3,
                      currentResultIndex: 1,
                      activeHighlightIndex: 0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'This is a test document with test content for testing the search functionality.',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            _buildStoryCard(
              title: 'Full Feature Example',
              description: 'Complete search with all features enabled',
              child: AppInPageSearch.inline(
                config: const AppInPageSearchConfig(
                  showResultCount: true,
                  showNavigationButtons: true,
                  showClearButton: true,
                  showCloseButton: true,
                  placeholder: 'Search through content...',
                ),
                data: const AppInPageSearchData(
                  query: 'flutter',
                  totalResults: 5,
                  currentResultIndex: 2,
                  highlights: [
                    AppSearchHighlight(start: 0, end: 7, text: 'flutter'),
                    AppSearchHighlight(
                        start: 15, end: 22, text: 'flutter', isActive: true),
                    AppSearchHighlight(start: 30, end: 37, text: 'flutter'),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPlatformAdaptiveSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Platform Adaptive',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'iOS Style',
          description: 'iOS-styled search bar',
          child: AppInPageSearch.inline(
            config: const AppInPageSearchConfig(
              borderRadius: 10.0,
              backgroundColor: Color(0xFFF2F2F7),
              borderColor: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Material Design',
          description: 'Material 3 styled search',
          child: AppInPageSearch.inline(
            config: const AppInPageSearchConfig(
              borderRadius: 28.0,
              showBorder: true,
              elevation: 0.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Web Style',
          description: 'Web-optimized search interface',
          child: AppInPageSearch.inline(
            config: const AppInPageSearchConfig(
              width: 400.0,
              borderRadius: 4.0,
              elevation: 1.0,
              showBorder: true,
              placeholder: 'Search pages...',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAdvancedFeaturesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Advanced Features',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'RTL Support',
          description: 'Right-to-left text direction',
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: AppInPageSearch.inline(
              config: const AppInPageSearchConfig(
                placeholder: 'بحث في المحتوى...',
                textDirection: TextDirection.rtl,
              ),
              initialQuery: 'نص تجريبي',
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Custom Keyboard Shortcuts',
          description: 'Search with keyboard shortcuts',
          child: Focus(
            autofocus: true,
            onKeyEvent: (node, event) {
              if (event is KeyDownEvent) {
                if (event.logicalKey == LogicalKeyboardKey.keyF &&
                    HardwareKeyboard.instance.isControlPressed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ctrl+F pressed')),
                  );
                  return KeyEventResult.handled;
                }
              }
              return KeyEventResult.ignored;
            },
            child: AppInPageSearch.inline(
              config: const AppInPageSearchConfig(
                placeholder: 'Press Ctrl+F to focus',
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Search Options',
          description: 'Case sensitive and regex search',
          child: AppInPageSearch.inline(
            data: const AppInPageSearchData(
              caseSensitive: true,
              wholeWordsOnly: false,
              useRegex: false,
            ),
            config: const AppInPageSearchConfig(
              placeholder: 'Case-sensitive search',
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        _buildStoryCard(
          title: 'Custom Result Builder',
          description: 'Custom rendering of search results',
          child: AppInPageSearch.inline(
            resultBuilder: (context, data) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  'Custom: ${data.resultPositionText}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            data: const AppInPageSearchData(
              totalResults: 10,
              currentResultIndex: 3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStoryCard({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 4.0),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 16.0),
            child,
          ],
        ),
      ),
    );
  }
}
