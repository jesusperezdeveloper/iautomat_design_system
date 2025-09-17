import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/toggle_view/app_toggle_view.dart';
import 'package:iautomat_design_system/src/components/toggle_view/toggle_view_config.dart';

void main() {
  group('AppToggleView', () {
    group('Widget Tests', () {
      testWidgets('renders correctly with default configuration', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                options: [
                  AppToggleViewOption(id: 'option1', label: 'Option 1'),
                  AppToggleViewOption(id: 'option2', label: 'Option 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppToggleView), findsOneWidget);
        expect(find.text('Option 1'), findsOneWidget);
        expect(find.text('Option 2'), findsOneWidget);
      });

      testWidgets('renders with list variant', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView.list(
                options: [
                  AppToggleViewOption(id: 'list1', label: 'List 1'),
                  AppToggleViewOption(id: 'list2', label: 'List 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppToggleView), findsOneWidget);
        expect(find.text('List 1'), findsOneWidget);
        expect(find.text('List 2'), findsOneWidget);
      });

      testWidgets('renders with grid variant', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView.grid(
                options: [
                  AppToggleViewOption(id: 'grid1', label: 'Grid 1'),
                  AppToggleViewOption(id: 'grid2', label: 'Grid 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppToggleView), findsOneWidget);
        expect(find.text('Grid 1'), findsOneWidget);
        expect(find.text('Grid 2'), findsOneWidget);
      });

      testWidgets('renders with compact variant', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView.compact(
                options: [
                  AppToggleViewOption(id: 'compact1', label: 'Compact 1'),
                  AppToggleViewOption(id: 'compact2', label: 'Compact 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(AppToggleView), findsOneWidget);
        expect(find.text('Compact 1'), findsOneWidget);
        expect(find.text('Compact 2'), findsOneWidget);
      });

      testWidgets('displays icons when provided', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                options: [
                  AppToggleViewOption(
                    id: 'icon1',
                    label: 'With Icon',
                    icon: Icons.star,
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.star), findsOneWidget);
        expect(find.text('With Icon'), findsOneWidget);
      });

      testWidgets('shows selected state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                value: const ['selected'],
                options: const [
                  AppToggleViewOption(id: 'selected', label: 'Selected'),
                  AppToggleViewOption(id: 'unselected', label: 'Unselected'),
                ],
                onChanged: (value) {},
              ),
            ),
          ),
        );

        expect(find.text('Selected'), findsOneWidget);
        expect(find.text('Unselected'), findsOneWidget);
      });

      testWidgets('handles multiple selection', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                value: const ['option1', 'option2'],
                allowMultipleSelection: true,
                options: const [
                  AppToggleViewOption(id: 'option1', label: 'Option 1'),
                  AppToggleViewOption(id: 'option2', label: 'Option 2'),
                  AppToggleViewOption(id: 'option3', label: 'Option 3'),
                ],
                onChanged: (value) {},
              ),
            ),
          ),
        );

        expect(find.text('Option 1'), findsOneWidget);
        expect(find.text('Option 2'), findsOneWidget);
        expect(find.text('Option 3'), findsOneWidget);
      });
    });

    group('State Tests', () {
      testWidgets('renders disabled state correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                enabled: false,
                options: [
                  AppToggleViewOption(id: 'disabled', label: 'Disabled'),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Disabled'), findsOneWidget);
      });

      testWidgets('renders loading state correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                state: AppToggleViewState.loading,
                options: [
                  AppToggleViewOption(id: 'loading', label: 'Loading'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('renders skeleton state correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                state: AppToggleViewState.skeleton,
                options: [
                  AppToggleViewOption(id: 'skeleton', label: 'Skeleton'),
                ],
              ),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(AppToggleView), findsOneWidget);
      });
    });

    group('Size Tests', () {
      testWidgets('renders small size correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                size: AppToggleViewSize.small,
                options: [
                  AppToggleViewOption(id: 'small', label: 'Small'),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Small'), findsOneWidget);
      });

      testWidgets('renders medium size correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                size: AppToggleViewSize.medium,
                options: [
                  AppToggleViewOption(id: 'medium', label: 'Medium'),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Medium'), findsOneWidget);
      });

      testWidgets('renders large size correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                size: AppToggleViewSize.large,
                options: [
                  AppToggleViewOption(id: 'large', label: 'Large'),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Large'), findsOneWidget);
      });
    });

    group('Interaction Tests', () {
      testWidgets('calls onChanged when option tapped', (tester) async {
        List<String>? changedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                value: const [],
                options: const [
                  AppToggleViewOption(id: 'tappable', label: 'Tappable'),
                ],
                onChanged: (value) {
                  changedValue = value;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.text('Tappable'), warnIfMissed: false);
        await tester.pumpAndSettle();

        expect(changedValue, isNotNull);
        expect(changedValue, contains('tappable'));
      });

      testWidgets('calls onOptionTap when option tapped', (tester) async {
        String? tappedOption;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                value: const [],
                options: const [
                  AppToggleViewOption(id: 'tappable', label: 'Tappable'),
                ],
                onOptionTap: (optionId) {
                  tappedOption = optionId;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.text('Tappable'), warnIfMissed: false);
        await tester.pumpAndSettle();

        expect(tappedOption, equals('tappable'));
      });

      testWidgets('handles keyboard navigation', (tester) async {
        List<String>? changedValue;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                value: const [],
                options: const [
                  AppToggleViewOption(id: 'key1', label: 'Key 1'),
                  AppToggleViewOption(id: 'key2', label: 'Key 2'),
                ],
                onChanged: (value) {
                  changedValue = value;
                },
              ),
            ),
          ),
        );

        // Focus the toggle view
        await tester.tap(find.byType(AppToggleView));
        await tester.pumpAndSettle();

        // Navigate with arrow keys
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
        await tester.pumpAndSettle();

        // Select with Enter
        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pumpAndSettle();

        expect(changedValue, isNotNull);
      });
    });

    group('Configuration Tests', () {
      testWidgets('applies custom configuration', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                config: AppToggleViewConfig(
                  backgroundColor: Colors.red,
                  selectedBackgroundColor: Colors.blue,
                  borderRadius: 16,
                ),
                options: [
                  AppToggleViewOption(id: 'custom', label: 'Custom'),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Custom'), findsOneWidget);
      });

      testWidgets('uses size-specific configuration', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                size: AppToggleViewSize.large,
                config: AppToggleViewConfig.large,
                options: [
                  AppToggleViewOption(id: 'large_config', label: 'Large Config'),
                ],
              ),
            ),
          ),
        );

        expect(find.text('Large Config'), findsOneWidget);
      });
    });

    group('Accessibility Tests', () {
      testWidgets('has proper semantics', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                semanticLabel: 'Toggle options',
                options: [
                  AppToggleViewOption(
                    id: 'semantic',
                    label: 'Semantic',
                    semanticLabel: 'Semantic option',
                  ),
                ],
              ),
            ),
          ),
        );

        expect(find.bySemanticsLabel('Toggle options'), findsOneWidget);
      });

      testWidgets('supports RTL text direction', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                textDirection: TextDirection.rtl,
                options: [
                  AppToggleViewOption(id: 'rtl', label: 'RTL Text'),
                ],
              ),
            ),
          ),
        );

        expect(find.text('RTL Text'), findsOneWidget);
      });
    });

    group('Grid Layout Tests', () {
      testWidgets('renders grid layout with correct cross axis count', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView.grid(
                config: AppToggleViewConfig(
                  gridCrossAxisCount: 3,
                ),
                options: [
                  AppToggleViewOption(id: 'grid1', label: 'Grid 1'),
                  AppToggleViewOption(id: 'grid2', label: 'Grid 2'),
                  AppToggleViewOption(id: 'grid3', label: 'Grid 3'),
                  AppToggleViewOption(id: 'grid4', label: 'Grid 4'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(GridView), findsOneWidget);
        expect(find.text('Grid 1'), findsOneWidget);
        expect(find.text('Grid 4'), findsOneWidget);
      });
    });

    group('Compact Layout Tests', () {
      testWidgets('renders compact layout with wrap', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView.compact(
                config: AppToggleViewConfig(
                  compactWrapItems: true,
                ),
                options: [
                  AppToggleViewOption(id: 'wrap1', label: 'Wrap 1'),
                  AppToggleViewOption(id: 'wrap2', label: 'Wrap 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(Wrap), findsOneWidget);
        expect(find.text('Wrap 1'), findsOneWidget);
        expect(find.text('Wrap 2'), findsOneWidget);
      });

      testWidgets('renders compact layout with horizontal scroll', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView.compact(
                config: AppToggleViewConfig(
                  compactWrapItems: false,
                ),
                options: [
                  AppToggleViewOption(id: 'scroll1', label: 'Scroll 1'),
                  AppToggleViewOption(id: 'scroll2', label: 'Scroll 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(SingleChildScrollView), findsWidgets);
        expect(find.text('Scroll 1'), findsOneWidget);
        expect(find.text('Scroll 2'), findsOneWidget);
      });
    });

    group('Animation Tests', () {
      testWidgets('animates on state changes', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppToggleView(
                state: AppToggleViewState.defaultState,
                options: [
                  AppToggleViewOption(id: 'animated', label: 'Animated'),
                ],
              ),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(AnimatedBuilder), findsWidgets);
      });
    });
  });

  group('AppToggleViewOption', () {
    test('creates option from string correctly', () {
      final option = AppToggleViewOption.fromString('Test Option');

      expect(option.id, equals('test_option'));
      expect(option.label, equals('Test Option'));
      expect(option.enabled, isTrue);
      expect(option.selected, isFalse);
    });

    test('creates option with icon correctly', () {
      final option = AppToggleViewOption.withIcon(
        id: 'icon_option',
        label: 'Icon Option',
        icon: Icons.star,
        value: 'test_value',
        enabled: false,
      );

      expect(option.id, equals('icon_option'));
      expect(option.label, equals('Icon Option'));
      expect(option.icon, equals(Icons.star));
      expect(option.value, equals('test_value'));
      expect(option.enabled, isFalse);
    });
  });

  group('AppToggleViewData', () {
    test('correctly identifies selected options', () {
      const data = AppToggleViewData(
        selectedValues: ['option1', 'option3'],
        options: [
          AppToggleViewOption(id: 'option1', label: 'Option 1'),
          AppToggleViewOption(id: 'option2', label: 'Option 2'),
          AppToggleViewOption(id: 'option3', label: 'Option 3'),
        ],
      );

      expect(data.isSelected('option1'), isTrue);
      expect(data.isSelected('option2'), isFalse);
      expect(data.isSelected('option3'), isTrue);
      expect(data.hasMultipleSelections, isTrue);
      expect(data.hasSelection, isTrue);
      expect(data.firstSelectedValue, equals('option1'));
    });

    test('gets selected and enabled options correctly', () {
      const data = AppToggleViewData(
        selectedValues: ['option1', 'option3'],
        options: [
          AppToggleViewOption(id: 'option1', label: 'Option 1', enabled: true),
          AppToggleViewOption(id: 'option2', label: 'Option 2', enabled: false),
          AppToggleViewOption(id: 'option3', label: 'Option 3', enabled: true),
        ],
      );

      expect(data.selectedOptions.length, equals(2));
      expect(data.enabledOptions.length, equals(2));
      expect(data.enabledOptions.every((option) => option.enabled), isTrue);
    });
  });

  group('AppToggleViewUtils', () {
    test('creates data from string list correctly', () {
      final data = AppToggleViewUtils.fromStringList(
        ['Item 1', 'Item 2', 'Item 3'],
        variant: AppToggleViewVariant.grid,
        selectedValues: ['item_1'],
      );

      expect(data.variant, equals(AppToggleViewVariant.grid));
      expect(data.options.length, equals(3));
      expect(data.selectedValues, equals(['item_1']));
      expect(data.options.first.label, equals('Item 1'));
    });

    test('creates data with icons correctly', () {
      final data = AppToggleViewUtils.withIcons(
        {
          'Home': Icons.home,
          'Work': Icons.work,
        },
        variant: AppToggleViewVariant.compact,
        selectedValues: ['home'],
      );

      expect(data.variant, equals(AppToggleViewVariant.compact));
      expect(data.options.length, equals(2));
      expect(data.options.first.icon, equals(Icons.home));
    });

    test('toggles selection correctly', () {
      // Test adding selection
      var result = AppToggleViewUtils.toggleSelection(
        ['option1'],
        'option2',
        allowMultiple: true,
        allowDeselection: true,
      );
      expect(result, equals(['option1', 'option2']));

      // Test removing selection
      result = AppToggleViewUtils.toggleSelection(
        ['option1', 'option2'],
        'option1',
        allowMultiple: true,
        allowDeselection: true,
      );
      expect(result, equals(['option2']));

      // Test single selection mode
      result = AppToggleViewUtils.toggleSelection(
        ['option1'],
        'option2',
        allowMultiple: false,
        allowDeselection: true,
      );
      expect(result, equals(['option2']));

      // Test no deselection allowed
      result = AppToggleViewUtils.toggleSelection(
        ['option1'],
        'option1',
        allowMultiple: true,
        allowDeselection: false,
      );
      expect(result, equals(['option1']));
    });

    test('gets correct item size for toggle view size', () {
      expect(AppToggleViewUtils.getItemSize(AppToggleViewSize.small),
             equals(const Size(80, 32)));
      expect(AppToggleViewUtils.getItemSize(AppToggleViewSize.medium),
             equals(const Size(100, 40)));
      expect(AppToggleViewUtils.getItemSize(AppToggleViewSize.large),
             equals(const Size(120, 48)));
    });

    test('gets correct padding for toggle view size', () {
      expect(AppToggleViewUtils.getPadding(AppToggleViewSize.small),
             equals(const EdgeInsets.symmetric(horizontal: 8, vertical: 4)));
      expect(AppToggleViewUtils.getPadding(AppToggleViewSize.medium),
             equals(const EdgeInsets.symmetric(horizontal: 12, vertical: 6)));
      expect(AppToggleViewUtils.getPadding(AppToggleViewSize.large),
             equals(const EdgeInsets.symmetric(horizontal: 16, vertical: 8)));
    });

    test('gets correct icon size for toggle view size', () {
      expect(AppToggleViewUtils.getIconSize(AppToggleViewSize.small), equals(16));
      expect(AppToggleViewUtils.getIconSize(AppToggleViewSize.medium), equals(18));
      expect(AppToggleViewUtils.getIconSize(AppToggleViewSize.large), equals(20));
    });

    test('checks platform support correctly', () {
      expect(AppToggleViewUtils.isPlatformSupported(TargetPlatform.android), isTrue);
      expect(AppToggleViewUtils.isPlatformSupported(TargetPlatform.iOS), isTrue);
      expect(AppToggleViewUtils.isPlatformSupported(TargetPlatform.linux), isTrue);
    });

    test('calculates optimal cross axis count', () {
      expect(AppToggleViewUtils.calculateOptimalCrossAxisCount(300, 100), equals(3));
      expect(AppToggleViewUtils.calculateOptimalCrossAxisCount(200, 100), equals(2));
      expect(AppToggleViewUtils.calculateOptimalCrossAxisCount(50, 100), equals(1));
      expect(AppToggleViewUtils.calculateOptimalCrossAxisCount(0, 100), equals(2));
    });

    test('validates toggle view data correctly', () {
      const validData = AppToggleViewData(
        selectedValues: ['option1', 'option2'],
        options: [
          AppToggleViewOption(id: 'option1', label: 'Option 1'),
          AppToggleViewOption(id: 'option2', label: 'Option 2'),
        ],
      );
      expect(AppToggleViewUtils.validateData(validData), isTrue);

      const invalidData = AppToggleViewData(
        selectedValues: ['option1', 'invalid'],
        options: [
          AppToggleViewOption(id: 'option1', label: 'Option 1'),
          AppToggleViewOption(id: 'option2', label: 'Option 2'),
        ],
      );
      expect(AppToggleViewUtils.validateData(invalidData), isFalse);
    });
  });
}