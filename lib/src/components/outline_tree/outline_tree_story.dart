/// Outline tree component stories and examples
///
/// This file contains different story examples demonstrating:
/// - Async tree variant with lazy loading
/// - Multi-select tree variant
/// - Different configurations and states
/// - Interactive functionality
library;

import 'package:flutter/material.dart';
import 'app_outline_tree.dart';
import 'outline_tree_config.dart';

/// Stories collection for AppOutlineTree component
class OutlineTreeStories extends StatefulWidget {
  const OutlineTreeStories({super.key});

  @override
  State<OutlineTreeStories> createState() => _OutlineTreeStoriesState();
}

class _OutlineTreeStoriesState extends State<OutlineTreeStories> {
  late List<AppTreeNode> basicNodes;
  late List<AppTreeNode> asyncNodes;
  late List<AppTreeNode> multiSelectNodes;

  @override
  void initState() {
    super.initState();
    _initializeNodes();
  }

  void _initializeNodes() {
    // Basic tree structure
    basicNodes = [
      AppTreeNode(
        id: '1',
        label: 'Documents',
        icon: Icons.folder,
        isExpanded: true,
        children: [
          const AppTreeNode(
            id: '1.1',
            label: 'Project Specs.pdf',
            icon: Icons.picture_as_pdf,
            depth: 1,
          ),
          const AppTreeNode(
            id: '1.2',
            label: 'Requirements.docx',
            icon: Icons.description,
            depth: 1,
          ),
          AppTreeNode(
            id: '1.3',
            label: 'Images',
            icon: Icons.folder,
            depth: 1,
            children: const [
              AppTreeNode(
                id: '1.3.1',
                label: 'logo.png',
                icon: Icons.image,
                depth: 2,
              ),
              AppTreeNode(
                id: '1.3.2',
                label: 'banner.jpg',
                icon: Icons.image,
                depth: 2,
              ),
            ],
          ),
        ],
      ),
      AppTreeNode(
        id: '2',
        label: 'Source Code',
        icon: Icons.code,
        isExpanded: false,
        children: [
          const AppTreeNode(
            id: '2.1',
            label: 'main.dart',
            icon: Icons.code,
            depth: 1,
          ),
          const AppTreeNode(
            id: '2.2',
            label: 'widgets.dart',
            icon: Icons.code,
            depth: 1,
          ),
        ],
      ),
      const AppTreeNode(
        id: '3',
        label: 'README.md',
        icon: Icons.description,
        isLeaf: true,
      ),
    ];

    // Async tree nodes
    asyncNodes = [
      const AppTreeNode(
        id: 'async1',
        label: 'Remote Folder 1',
        icon: Icons.cloud_queue,
        hasChildren: true,
      ),
      const AppTreeNode(
        id: 'async2',
        label: 'Remote Folder 2',
        icon: Icons.cloud_queue,
        hasChildren: true,
      ),
      const AppTreeNode(
        id: 'async3',
        label: 'Empty Folder',
        icon: Icons.folder_open,
        hasChildren: false,
        isLeaf: true,
      ),
    ];

    // Multi-select tree nodes
    multiSelectNodes = [
      AppTreeNode(
        id: 'ms1',
        label: 'Category A',
        icon: Icons.category,
        isExpanded: true,
        children: const [
          AppTreeNode(
            id: 'ms1.1',
            label: 'Item A1',
            icon: Icons.label,
            depth: 1,
          ),
          AppTreeNode(
            id: 'ms1.2',
            label: 'Item A2',
            icon: Icons.label,
            depth: 1,
            isSelected: true,
          ),
        ],
      ),
      AppTreeNode(
        id: 'ms2',
        label: 'Category B',
        icon: Icons.category,
        children: const [
          AppTreeNode(
            id: 'ms2.1',
            label: 'Item B1',
            icon: Icons.label,
            depth: 1,
          ),
          AppTreeNode(
            id: 'ms2.2',
            label: 'Item B2',
            icon: Icons.label,
            depth: 1,
          ),
        ],
      ),
    ];
  }

  Future<List<AppTreeNode>> _simulateAsyncLoad(AppTreeNode node) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    switch (node.id) {
      case 'async1':
        return [
          const AppTreeNode(
            id: 'async1.1',
            label: 'Loaded File 1.txt',
            icon: Icons.description,
            depth: 1,
          ),
          const AppTreeNode(
            id: 'async1.2',
            label: 'Loaded File 2.pdf',
            icon: Icons.picture_as_pdf,
            depth: 1,
          ),
          const AppTreeNode(
            id: 'async1.3',
            label: 'Subfolder',
            icon: Icons.folder,
            hasChildren: true,
            depth: 1,
          ),
        ];
      case 'async2':
        return [
          const AppTreeNode(
            id: 'async2.1',
            label: 'Config.json',
            icon: Icons.settings,
            depth: 1,
          ),
        ];
      case 'async1.3':
        return [
          const AppTreeNode(
            id: 'async1.3.1',
            label: 'Deep File.dat',
            icon: Icons.storage,
            depth: 2,
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppOutlineTree Stories'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStorySection(
              'Basic Tree - Default',
              AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: basicNodes,
                onToggle: (node) {
                  debugPrint('Toggled: ${node.label}');
                },
                onSelect: (node, selected) {
                  debugPrint(
                      '${node.label} ${selected ? 'selected' : 'deselected'}');
                },
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Async Tree with Lazy Loading',
              AppOutlineTree.async(
                nodes: asyncNodes,
                onAsyncLoad: _simulateAsyncLoad,
                onToggle: (node) {
                  debugPrint('Async toggled: ${node.label}');
                },
                config: const AppOutlineTreeConfig(
                  showLoadingIndicator: true,
                ),
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Multi-Select Tree',
              AppOutlineTree.multiSelect(
                nodes: multiSelectNodes,
                config: const AppOutlineTreeConfig(
                  selectionMode: AppTreeSelectionMode.hierarchical,
                  showSelectionCheckboxes: true,
                ),
                onSelect: (node, selected) {
                  debugPrint('Multi-select: ${node.label} = $selected');
                },
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Compact Configuration',
              AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: basicNodes,
                config: AppOutlineTreeConfig.compact,
                onToggle: (node) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Spacious Configuration',
              AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: basicNodes,
                config: AppOutlineTreeConfig.spacious,
                onToggle: (node) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Custom Colors',
              AppOutlineTree(
                variant: AppOutlineTreeVariant.multiSelect,
                nodes: multiSelectNodes,
                config: const AppOutlineTreeConfig(
                  selectionMode: AppTreeSelectionMode.multiple,
                  showSelectionCheckboxes: true,
                  selectedBackgroundColor: Colors.green,
                  selectedTextColor: Colors.white,
                  hoverBackgroundColor: Colors.lightGreen,
                  selectionColor: Colors.orange,
                ),
                onSelect: (node, selected) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Loading State',
              AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: const [],
                state: AppOutlineTreeState.loading,
                config: const AppOutlineTreeConfig(
                  loadingLabel: 'Loading tree data...',
                ),
                onToggle: (node) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Skeleton State',
              AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: const [],
                state: AppOutlineTreeState.skeleton,
                config: const AppOutlineTreeConfig(
                  skeletonNodeCount: 8,
                  skeletonMaxDepth: 3,
                ),
                onToggle: (node) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Disabled State',
              AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: basicNodes
                    .map((n) => n.copyWith(isDisabled: true))
                    .toList(),
                state: AppOutlineTreeState.disabled,
                onToggle: (node) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'Custom Animation',
              AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: basicNodes,
                config: const AppOutlineTreeConfig(
                  expansionAnimation: AppTreeExpansionAnimation.scale,
                  animationDuration: Duration(milliseconds: 500),
                  animationCurve: Curves.elasticOut,
                ),
                onToggle: (node) {},
              ),
            ),
            const SizedBox(height: 32),
            _buildStorySection(
              'No Icons, No Connectors',
              AppOutlineTree(
                variant: AppOutlineTreeVariant.async,
                nodes: basicNodes,
                config: const AppOutlineTreeConfig(
                  showIcons: false,
                  showConnectors: false,
                  showSelectionCheckboxes: false,
                ),
                onToggle: (node) {},
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
          height: 300,
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

/// Example usage in a file browser app
class FileExplorerExample extends StatefulWidget {
  const FileExplorerExample({super.key});

  @override
  State<FileExplorerExample> createState() => _FileExplorerExampleState();
}

class _FileExplorerExampleState extends State<FileExplorerExample> {
  late List<AppTreeNode> fileSystemNodes;
  final Set<String> selectedFiles = {};

  @override
  void initState() {
    super.initState();
    _initializeFileSystem();
  }

  void _initializeFileSystem() {
    fileSystemNodes = [
      AppTreeNode(
        id: 'home',
        label: 'Home',
        icon: Icons.home,
        isExpanded: true,
        children: [
          AppTreeNode(
            id: 'documents',
            label: 'Documents',
            icon: Icons.folder,
            badge: '15',
            children: [
              const AppTreeNode(
                id: 'resume.pdf',
                label: 'Resume.pdf',
                icon: Icons.picture_as_pdf,
                depth: 2,
              ),
              const AppTreeNode(
                id: 'cover_letter.docx',
                label: 'Cover Letter.docx',
                icon: Icons.description,
                depth: 2,
              ),
            ],
          ),
          AppTreeNode(
            id: 'downloads',
            label: 'Downloads',
            icon: Icons.download,
            badge: '247',
            hasChildren: true, // Will load async
          ),
          AppTreeNode(
            id: 'pictures',
            label: 'Pictures',
            icon: Icons.photo_library,
            children: [
              const AppTreeNode(
                id: 'vacation.jpg',
                label: 'Vacation.jpg',
                icon: Icons.image,
                tooltip: 'Taken in Hawaii, 2024',
                depth: 2,
              ),
              const AppTreeNode(
                id: 'family.png',
                label: 'Family.png',
                icon: Icons.image,
                depth: 2,
              ),
            ],
          ),
          const AppTreeNode(
            id: 'music',
            label: 'Music',
            icon: Icons.library_music,
            hasChildren: true,
          ),
        ],
      ),
      const AppTreeNode(
        id: 'external',
        label: 'External Drive',
        icon: Icons.usb,
        hasChildren: true,
        state: AppTreeNodeState.loading,
      ),
    ];
  }

  Future<List<AppTreeNode>> _loadFileSystemChildren(AppTreeNode node) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    switch (node.id) {
      case 'downloads':
        return [
          const AppTreeNode(
            id: 'installer.exe',
            label: 'installer.exe',
            icon: Icons.launch,
            depth: 2,
          ),
          const AppTreeNode(
            id: 'backup.zip',
            label: 'backup.zip',
            icon: Icons.archive,
            depth: 2,
          ),
          const AppTreeNode(
            id: 'temp_folder',
            label: 'Temp Files',
            icon: Icons.folder_special,
            hasChildren: true,
            depth: 2,
          ),
        ];
      case 'music':
        return [
          const AppTreeNode(
            id: 'playlist1.m3u',
            label: 'My Playlist.m3u',
            icon: Icons.playlist_play,
            depth: 2,
          ),
          const AppTreeNode(
            id: 'song1.mp3',
            label: 'Favorite Song.mp3',
            icon: Icons.music_note,
            depth: 2,
          ),
        ];
      case 'external':
        return [
          const AppTreeNode(
            id: 'backup_2024',
            label: 'Backup 2024',
            icon: Icons.backup,
            depth: 1,
          ),
          const AppTreeNode(
            id: 'projects',
            label: 'Projects',
            icon: Icons.work,
            hasChildren: true,
            depth: 1,
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Explorer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _initializeFileSystem();
                selectedFiles.clear();
              });
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // Tree view
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: AppOutlineTree.async(
                nodes: fileSystemNodes,
                onAsyncLoad: _loadFileSystemChildren,
                config: const AppOutlineTreeConfig(
                  selectionMode: AppTreeSelectionMode.multiple,
                  showSelectionCheckboxes: true,
                  itemHeight: 36.0,
                  enableRipple: true,
                  maxExpandDepth: 10,
                ),
                onSelect: (node, selected) {
                  setState(() {
                    if (selected) {
                      selectedFiles.add(node.id);
                    } else {
                      selectedFiles.remove(node.id);
                    }
                  });
                },
                onToggle: (node) {
                  debugPrint('File explorer: ${node.label} toggled');
                },
              ),
            ),
          ),
          // Details panel
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Files (${selectedFiles.length})',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  if (selectedFiles.isEmpty)
                    const Expanded(
                      child: Center(
                        child: Text(
                          'No files selected',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: selectedFiles.length,
                        itemBuilder: (context, index) {
                          final fileId = selectedFiles.elementAt(index);
                          return ListTile(
                            leading: const Icon(Icons.insert_drive_file),
                            title: Text(fileId),
                            subtitle: Text('Selected file #${index + 1}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  selectedFiles.remove(fileId);
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: selectedFiles.isNotEmpty
                            ? () {
                                // Simulate download
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Downloading ${selectedFiles.length} files...'),
                                  ),
                                );
                              }
                            : null,
                        icon: const Icon(Icons.download),
                        label: const Text('Download'),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton.icon(
                        onPressed: selectedFiles.isNotEmpty
                            ? () {
                                setState(() {
                                  selectedFiles.clear();
                                });
                              }
                            : null,
                        icon: const Icon(Icons.clear_all),
                        label: const Text('Clear All'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
