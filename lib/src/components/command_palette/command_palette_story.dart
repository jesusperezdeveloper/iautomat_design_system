import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_command_palette.dart';
import 'command_palette_config.dart';

/// Story examples for DSCommandPalette component
class CommandPaletteStoryExample extends StatefulWidget {
  const CommandPaletteStoryExample({super.key});

  @override
  State<CommandPaletteStoryExample> createState() =>
      _CommandPaletteStoryExampleState();
}

class _CommandPaletteStoryExampleState
    extends State<CommandPaletteStoryExample> {
  bool _showGlobalSearch = false;
  bool _showActions = false;
  bool _showCustom = false;
  bool _showLoading = false;
  bool _showSkeleton = false;
  String _currentQuery = '';
  String _lastInvokedCommand = '';

  final List<DSCommandResult> _recentCommands = [
    DSCommandResult.action(
      id: 'recent1',
      title: 'Open Recent File',
      description: 'document.pdf',
      icon: Icons.description,
    ),
    DSCommandResult.navigation(
      id: 'recent2',
      title: 'Go to Dashboard',
      description: 'Navigate to main dashboard',
      icon: Icons.dashboard,
    ),
  ];

  final List<DSCommandResult> _searchResults = [
    DSCommandResult(
      id: 'search1',
      title: 'Create New Project',
      description: 'Start a new project from template',
      icon: Icons.create_new_folder,
      type: DSCommandResultType.search,
      shortcut: [LogicalKeyboardKey.meta, LogicalKeyboardKey.keyN],
    ),
    DSCommandResult(
      id: 'search2',
      title: 'Open File',
      description: 'Open an existing file',
      icon: Icons.folder_open,
      type: DSCommandResultType.search,
      shortcut: [LogicalKeyboardKey.meta, LogicalKeyboardKey.keyO],
    ),
    DSCommandResult(
      id: 'search3',
      title: 'Save Document',
      description: 'Save current document',
      icon: Icons.save,
      type: DSCommandResultType.search,
      shortcut: [LogicalKeyboardKey.meta, LogicalKeyboardKey.keyS],
    ),
    DSCommandResult(
      id: 'search4',
      title: 'Find in Files',
      description: 'Search across all project files',
      icon: Icons.search,
      type: DSCommandResultType.search,
      shortcut: [
        LogicalKeyboardKey.meta,
        LogicalKeyboardKey.shift,
        LogicalKeyboardKey.keyF
      ],
    ),
    DSCommandResult(
      id: 'search5',
      title: 'Settings',
      description: 'Open application settings',
      icon: Icons.settings,
      type: DSCommandResultType.search,
      shortcut: [LogicalKeyboardKey.meta, LogicalKeyboardKey.comma],
    ),
  ];

  final List<DSCommandResult> _actionResults = [
    DSCommandResult.action(
      id: 'action1',
      title: 'Quick Actions',
      description: 'Show available quick actions',
      icon: Icons.flash_on,
    ),
    DSCommandResult.action(
      id: 'action2',
      title: 'Toggle Theme',
      description: 'Switch between light and dark theme',
      icon: Icons.brightness_6,
      shortcut: [LogicalKeyboardKey.meta, LogicalKeyboardKey.keyT],
    ),
    DSCommandResult.action(
      id: 'action3',
      title: 'Run Command',
      description: 'Execute custom command',
      icon: Icons.play_arrow,
      shortcut: [LogicalKeyboardKey.meta, LogicalKeyboardKey.keyR],
    ),
    DSCommandResult.action(
      id: 'action4',
      title: 'Show Shortcuts',
      description: 'Display keyboard shortcuts',
      icon: Icons.keyboard,
      shortcut: [LogicalKeyboardKey.meta, LogicalKeyboardKey.slash],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSCommandPalette Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStorySection(
                  'Basic Usage',
                  'Simple command palette with search functionality',
                  _buildBasicUsage(),
                ),
                _buildStorySection(
                  'Variants',
                  'Different variants: global search and actions',
                  _buildVariants(),
                ),
                _buildStorySection(
                  'States',
                  'Different states: default, loading, skeleton, disabled',
                  _buildStates(),
                ),
                _buildStorySection(
                  'Keyboard Shortcuts',
                  'Keyboard navigation and shortcuts integration',
                  _buildKeyboardShortcuts(),
                ),
                _buildStorySection(
                  'Custom Styling',
                  'Custom colors, sizes, and positioning',
                  _buildCustomStyling(),
                ),
                _buildStorySection(
                  'Platform Adaptive',
                  'Platform-adaptive behavior and responsiveness',
                  _buildPlatformAdaptive(),
                ),
                _buildStorySection(
                  'Advanced Features',
                  'Fuzzy search, recent commands, and filtering',
                  _buildAdvancedFeatures(),
                ),
                _buildStatusSection(),
              ],
            ),
          ),

          // Overlays for command palettes
          if (_showGlobalSearch) _buildGlobalSearchOverlay(),
          if (_showActions) _buildActionsOverlay(),
          if (_showCustom) _buildCustomOverlay(),
          if (_showLoading) _buildLoadingOverlay(),
          if (_showSkeleton) _buildSkeletonOverlay(),
        ],
      ),
    );
  }

  Widget _buildStorySection(String title, String description, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          child: content,
        ),
      ],
    );
  }

  Widget _buildBasicUsage() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => setState(() => _showGlobalSearch = true),
          child: const Text('Show Global Search'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => setState(() => _showActions = true),
          child: const Text('Show Actions Palette'),
        ),
        const SizedBox(height: 8),
        const Text('Press Cmd+K or Ctrl+K to open global search'),
        const Text('Press Cmd+Shift+P or Ctrl+Shift+P for actions'),
      ],
    );
  }

  Widget _buildVariants() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => setState(() => _showGlobalSearch = true),
                icon: const Icon(Icons.search),
                label: const Text('Global Search'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => setState(() => _showActions = true),
                icon: const Icon(Icons.flash_on),
                label: const Text('Actions'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Global Search: General purpose search and navigation'),
        const Text('Actions: Quick commands and shortcuts'),
      ],
    );
  }

  Widget _buildStates() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => setState(() => _showLoading = true),
                child: const Text('Loading State'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () => setState(() => _showSkeleton = true),
                child: const Text('Skeleton State'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Loading: Shows progress indicator'),
        const Text('Skeleton: Shows placeholder items'),
      ],
    );
  }

  Widget _buildKeyboardShortcuts() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => setState(() => _showGlobalSearch = true),
          child: const Text('Show Palette with Shortcuts'),
        ),
        const SizedBox(height: 16),
        const Text('Available shortcuts:'),
        _buildShortcutItem('⌘ + N', 'Create New Project'),
        _buildShortcutItem('⌘ + O', 'Open File'),
        _buildShortcutItem('⌘ + S', 'Save Document'),
        _buildShortcutItem('⌘ + Shift + F', 'Find in Files'),
        _buildShortcutItem('⌘ + ,', 'Settings'),
        const SizedBox(height: 8),
        const Text('Navigation:'),
        _buildShortcutItem('↑ / ↓', 'Navigate results'),
        _buildShortcutItem('Enter', 'Execute command'),
        _buildShortcutItem('Esc', 'Close palette'),
      ],
    );
  }

  Widget _buildShortcutItem(String shortcut, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              shortcut,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontFamily: 'monospace',
                  ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(description)),
        ],
      ),
    );
  }

  Widget _buildCustomStyling() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => setState(() => _showCustom = true),
          child: const Text('Show Custom Styled Palette'),
        ),
        const SizedBox(height: 16),
        const Text('Features:'),
        const Text('• Custom colors and theme'),
        const Text('• Different sizes (small, medium, large)'),
        const Text('• Position options (top, center, bottom)'),
        const Text('• Custom icons and animations'),
      ],
    );
  }

  Widget _buildPlatformAdaptive() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => setState(() => _showGlobalSearch = true),
          child: const Text('Show Adaptive Palette'),
        ),
        const SizedBox(height: 16),
        const Text('Adaptive features:'),
        const Text('• Platform-specific shortcuts (Cmd on Mac, Ctrl on PC)'),
        const Text('• Responsive sizing based on screen size'),
        const Text('• Native scroll behavior'),
        const Text('• RTL text direction support'),
      ],
    );
  }

  Widget _buildAdvancedFeatures() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => setState(() => _showGlobalSearch = true),
          child: const Text('Show Advanced Features'),
        ),
        const SizedBox(height: 16),
        const Text('Advanced features:'),
        const Text('• Fuzzy search with scoring'),
        const Text('• Recent commands history'),
        const Text('• Result highlighting'),
        const Text('• Debounced search input'),
        const Text('• Custom result builders'),
      ],
    );
  }

  Widget _buildStatusSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          'Status',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Current Query: "${_currentQuery.isEmpty ? "None" : _currentQuery}"'),
              const SizedBox(height: 8),
              Text(
                  'Last Invoked: "${_lastInvokedCommand.isEmpty ? "None" : _lastInvokedCommand}"'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGlobalSearchOverlay() {
    return Material(
      color: Colors.black.withValues(alpha: 0.5),
      child: GestureDetector(
        onTap: () => setState(() => _showGlobalSearch = false),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {}, // Prevent tap propagation
            child: DSCommandPalette.globalSearch(
              results: _searchResults,
              recentCommands: _recentCommands,
              onQuery: (query) => setState(() => _currentQuery = query),
              onInvoke: (result) {
                setState(() {
                  _lastInvokedCommand = result.title;
                  _showGlobalSearch = false;
                });
              },
              onClose: () => setState(() => _showGlobalSearch = false),
              shortcuts: {
                [LogicalKeyboardKey.meta, LogicalKeyboardKey.keyN]:
                    _searchResults[0],
                [LogicalKeyboardKey.meta, LogicalKeyboardKey.keyO]:
                    _searchResults[1],
                [LogicalKeyboardKey.meta, LogicalKeyboardKey.keyS]:
                    _searchResults[2],
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionsOverlay() {
    return Material(
      color: Colors.black.withValues(alpha: 0.5),
      child: GestureDetector(
        onTap: () => setState(() => _showActions = false),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {}, // Prevent tap propagation
            child: DSCommandPalette.actions(
              results: _actionResults,
              onQuery: (query) => setState(() => _currentQuery = query),
              onInvoke: (result) {
                setState(() {
                  _lastInvokedCommand = result.title;
                  _showActions = false;
                });
              },
              onClose: () => setState(() => _showActions = false),
              config: const DSCommandPaletteConfig(
                placeholder: 'Type an action...',
                maxResults: 10,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomOverlay() {
    return Material(
      color: Colors.purple.withValues(alpha: 0.3),
      child: GestureDetector(
        onTap: () => setState(() => _showCustom = false),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: GestureDetector(
              onTap: () {}, // Prevent tap propagation
              child: DSCommandPalette(
                results: _searchResults,
                onQuery: (query) => setState(() => _currentQuery = query),
                onInvoke: (result) {
                  setState(() {
                    _lastInvokedCommand = result.title;
                    _showCustom = false;
                  });
                },
                onClose: () => setState(() => _showCustom = false),
                config: const DSCommandPaletteConfig(
                  position: DSCommandPalettePosition.top,
                  size: DSCommandPaletteSize.large,
                  backgroundColor: Colors.deepPurple,
                  inputTextColor: Colors.white,
                  resultTextColor: Colors.white,
                  placeholderColor: Colors.white70,
                  resultIconColor: Colors.white70,
                  inputBorderColor: Colors.purple,
                  inputFocusBorderColor: Colors.purpleAccent,
                  resultSelectedBackgroundColor: Colors.purpleAccent,
                  borderRadius: 16,
                  elevation: 16,
                  highlightColor: Colors.yellow,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingOverlay() {
    return Material(
      color: Colors.black.withValues(alpha: 0.5),
      child: GestureDetector(
        onTap: () => setState(() => _showLoading = false),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {}, // Prevent tap propagation
            child: DSCommandPalette(
              results: const [],
              state: DSCommandPaletteState.loading,
              onClose: () => setState(() => _showLoading = false),
              config: const DSCommandPaletteConfig(
                placeholder: 'Searching...',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkeletonOverlay() {
    return Material(
      color: Colors.black.withValues(alpha: 0.5),
      child: GestureDetector(
        onTap: () => setState(() => _showSkeleton = false),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {}, // Prevent tap propagation
            child: DSCommandPalette(
              results: const [],
              state: DSCommandPaletteState.skeleton,
              onClose: () => setState(() => _showSkeleton = false),
              config: const DSCommandPaletteConfig(
                placeholder: 'Loading commands...',
                skeletonItemCount: 5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
