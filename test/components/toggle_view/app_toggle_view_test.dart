import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/toggle_view/app_toggle_view.dart';
import 'package:iautomat_design_system/src/components/toggle_view/toggle_view_config.dart';

void main() {
  group('DSToggleView', () {
    group('Widget Tests', () {
      testWidgets('renders correctly with default configuration',
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSToggleView(
                options: [
                  DSToggleViewOption(id: 'option1', label: 'Option 1'),
                  DSToggleViewOption(id: 'option2', label: 'Option 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(DSToggleView), findsOneWidget);
        expect(find.text('Option 1'), findsOneWidget);
        expect(find.text('Option 2'), findsOneWidget);
      });

      testWidgets('renders with list variant', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSToggleView.list(
                options: [
                  DSToggleViewOption(id: 'list1', label: 'List 1'),
                  DSToggleViewOption(id: 'list2', label: 'List 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(DSToggleView), findsOneWidget);
        expect(find.text('List 1'), findsOneWidget);
        expect(find.text('List 2'), findsOneWidget);
      });

      testWidgets('renders with grid variant', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSToggleView.grid(
                options: [
                  DSToggleViewOption(id: 'grid1', label: 'Grid 1'),
                  DSToggleViewOption(id: 'grid2', label: 'Grid 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(DSToggleView), findsOneWidget);
        expect(find.text('Grid 1'), findsOneWidget);
        expect(find.text('Grid 2'), findsOneWidget);
      });

      testWidgets('renders with compact variant', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSToggleView.compact(
                options: [
                  DSToggleViewOption(id: 'compact1', label: 'Compact 1'),
                  DSToggleViewOption(id: 'compact2', label: 'Compact 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(DSToggleView), findsOneWidget);
        expect(find.text('Compact 1'), findsOneWidget);
        expect(find.text('Compact 2'), findsOneWidget);
      });

      testWidgets('displays icons when provided', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSToggleView(
                options: [
                  DSToggleViewOption(
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
              body: DSToggleView(
                value: const ['selected'],
                options: const [
                  DSToggleViewOption(id: 'selected', label: 'Selected'),
                  DSToggleViewOption(id: 'unselected', label: 'Unselected'),
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
              body: DSToggleView(
                value: const ['option1', 'option2'],
                allowMultipleSelection: true,
                options: const [
                  DSToggleViewOption(id: 'option1', label: 'Option 1'),
                  DSToggleViewOption(id: 'option2', label: 'Option 2'),
                  DSToggleViewOption(id: 'option3', label: 'Option 3'),
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
              body: DSToggleView(
                enabled: false,
                options: [
                  DSToggleViewOption(id: 'disabled', label: 'Disabled'),
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
              body: DSToggleView(
                state: DSToggleViewState.loading,
                options: [
                  DSToggleViewOption(id: 'loading', label: 'Loading'),
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
              body: DSToggleView(
                state: DSToggleViewState.skeleton,
                options: [
                  DSToggleViewOption(id: 'skeleton', label: 'Skeleton'),
                ],
              ),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(DSToggleView), findsOneWidget);
      });
    });

    group('Size Tests', () {
      testWidgets('renders small size correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSToggleView(
                size: DSToggleViewSize.small,
                options: [
                  DSToggleViewOption(id: 'small', label: 'Small'),
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
              body: DSToggleView(
                size: DSToggleViewSize.medium,
                options: [
                  DSToggleViewOption(id: 'medium', label: 'Medium'),
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
              body: DSToggleView(
                size: DSToggleViewSize.large,
                options: [
                  DSToggleViewOption(id: 'large', label: 'Large'),
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
              body: DSToggleView(
                value: const [],
                options: const [
                  DSToggleViewOption(id: 'tappable', label: 'Tappable'),
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
              body: DSToggleView(
                value: const [],
                options: const [
                  DSToggleViewOption(id: 'tappable', label: 'Tappable'),
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
              body: DSToggleView(
                value: const [],
                options: const [
                  DSToggleViewOption(id: 'key1', label: 'Key 1'),
                  DSToggleViewOption(id: 'key2', label: 'Key 2'),
                ],
                onChanged: (value) {
                  changedValue = value;
                },
              ),
            ),
          ),
        );

        // Focus the toggle view
        await tester.tap(find.byType(DSToggleView));
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
              body: DSToggleView(
                config: DSToggleViewConfig(
                  backgroundColor: Colors.red,
                  selectedBackgroundColor: Colors.blue,
                  borderRadius: 16,
                ),
                options: [
                  DSToggleViewOption(id: 'custom', label: 'Custom'),
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
              body: DSToggleView(
                size: DSToggleViewSize.large,
                config: DSToggleViewConfig.large,
                options: [
                  DSToggleViewOption(
                      id: 'large_config', label: 'Large Config'),
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
              body: DSToggleView(
                semanticLabel: 'Toggle options',
                options: [
                  DSToggleViewOption(
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
              body: DSToggleView(
                textDirection: TextDirection.rtl,
                options: [
                  DSToggleViewOption(id: 'rtl', label: 'RTL Text'),
                ],
              ),
            ),
          ),
        );

        expect(find.text('RTL Text'), findsOneWidget);
      });
    });

    group('Grid Layout Tests', () {
      testWidgets('renders grid layout with correct cross axis count',
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSToggleView.grid(
                config: DSToggleViewConfig(
                  gridCrossAxisCount: 3,
                ),
                options: [
                  DSToggleViewOption(id: 'grid1', label: 'Grid 1'),
                  DSToggleViewOption(id: 'grid2', label: 'Grid 2'),
                  DSToggleViewOption(id: 'grid3', label: 'Grid 3'),
                  DSToggleViewOption(id: 'grid4', label: 'Grid 4'),
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
              body: DSToggleView.compact(
                config: DSToggleViewConfig(
                  compactWrapItems: true,
                ),
                options: [
                  DSToggleViewOption(id: 'wrap1', label: 'Wrap 1'),
                  DSToggleViewOption(id: 'wrap2', label: 'Wrap 2'),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(Wrap), findsOneWidget);
        expect(find.text('Wrap 1'), findsOneWidget);
        expect(find.text('Wrap 2'), findsOneWidget);
      });

      testWidgets('renders compact layout with horizontal scroll',
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSToggleView.compact(
                config: DSToggleViewConfig(
                  compactWrapItems: false,
                ),
                options: [
                  DSToggleViewOption(id: 'scroll1', label: 'Scroll 1'),
                  DSToggleViewOption(id: 'scroll2', label: 'Scroll 2'),
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
              body: DSToggleView(
                state: DSToggleViewState.defaultState,
                options: [
                  DSToggleViewOption(id: 'animated', label: 'Animated'),
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

  group('DSToggleViewOption', () {
    test('creates option from string correctly', () {
      final option = DSToggleViewOption.fromString('Test Option');

      expect(option.id, equals('test_option'));
      expect(option.label, equals('Test Option'));
      expect(option.enabled, isTrue);
      expect(option.selected, isFalse);
    });

    test('creates option with icon correctly', () {
      final option = DSToggleViewOption.withIcon(
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

  group('DSToggleViewData', () {
    test('correctly identifies selected options', () {
      const data = DSToggleViewData(
        selectedValues: ['option1', 'option3'],
        options: [
          DSToggleViewOption(id: 'option1', label: 'Option 1'),
          DSToggleViewOption(id: 'option2', label: 'Option 2'),
          DSToggleViewOption(id: 'option3', label: 'Option 3'),
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
      const data = DSToggleViewData(
        selectedValues: ['option1', 'option3'],
        options: [
          DSToggleViewOption(id: 'option1', label: 'Option 1', enabled: true),
          DSToggleViewOption(id: 'option2', label: 'Option 2', enabled: false),
          DSToggleViewOption(id: 'option3', label: 'Option 3', enabled: true),
        ],
      );

      expect(data.selectedOptions.length, equals(2));
      expect(data.enabledOptions.length, equals(2));
      expect(data.enabledOptions.every((option) => option.enabled), isTrue);
    });
  });

  group('DSToggleViewUtils', () {
    test('creates data from string list correctly', () {
      final data = DSToggleViewUtils.fromStringList(
        ['Item 1', 'Item 2', 'Item 3'],
        variant: DSToggleViewVariant.grid,
        selectedValues: ['item_1'],
      );

      expect(data.variant, equals(DSToggleViewVariant.grid));
      expect(data.options.length, equals(3));
      expect(data.selectedValues, equals(['item_1']));
      expect(data.options.first.label, equals('Item 1'));
    });

    test('creates data with icons correctly', () {
      final data = DSToggleViewUtils.withIcons(
        {
          'Home': Icons.home,
          'Work': Icons.work,
        },
        variant: DSToggleViewVariant.compact,
        selectedValues: ['home'],
      );

      expect(data.variant, equals(DSToggleViewVariant.compact));
      expect(data.options.length, equals(2));
      expect(data.options.first.icon, equals(Icons.home));
    });

    test('toggles selection correctly', () {
      // Test adding selection
      var result = DSToggleViewUtils.toggleSelection(
        ['option1'],
        'option2',
        allowMultiple: true,
        allowDeselection: true,
      );
      expect(result, equals(['option1', 'option2']));

      // Test removing selection
      result = DSToggleViewUtils.toggleSelection(
        ['option1', 'option2'],
        'option1',
        allowMultiple: true,
        allowDeselection: true,
      );
      expect(result, equals(['option2']));

      // Test single selection mode
      result = DSToggleViewUtils.toggleSelection(
        ['option1'],
        'option2',
        allowMultiple: false,
        allowDeselection: true,
      );
      expect(result, equals(['option2']));

      // Test no deselection allowed
      result = DSToggleViewUtils.toggleSelection(
        ['option1'],
        'option1',
        allowMultiple: true,
        allowDeselection: false,
      );
      expect(result, equals(['option1']));
    });

    test('gets correct item size for toggle view size', () {
      expect(DSToggleViewUtils.getItemSize(DSToggleViewSize.small),
          equals(const Size(80, 32)));
      expect(DSToggleViewUtils.getItemSize(DSToggleViewSize.medium),
          equals(const Size(100, 40)));
      expect(DSToggleViewUtils.getItemSize(DSToggleViewSize.large),
          equals(const Size(120, 48)));
    });

    test('gets correct padding for toggle view size', () {
      expect(DSToggleViewUtils.getPadding(DSToggleViewSize.small),
          equals(const EdgeInsets.symmetric(horizontal: 8, vertical: 4)));
      expect(DSToggleViewUtils.getPadding(DSToggleViewSize.medium),
          equals(const EdgeInsets.symmetric(horizontal: 12, vertical: 6)));
      expect(DSToggleViewUtils.getPadding(DSToggleViewSize.large),
          equals(const EdgeInsets.symmetric(horizontal: 16, vertical: 8)));
    });

    test('gets correct icon size for toggle view size', () {
      expect(
          DSToggleViewUtils.getIconSize(DSToggleViewSize.small), equals(16));
      expect(
          DSToggleViewUtils.getIconSize(DSToggleViewSize.medium), equals(18));
      expect(
          DSToggleViewUtils.getIconSize(DSToggleViewSize.large), equals(20));
    });

    test('checks platform support correctly', () {
      expect(DSToggleViewUtils.isPlatformSupported(TargetPlatform.android),
          isTrue);
      expect(
          DSToggleViewUtils.isPlatformSupported(TargetPlatform.iOS), isTrue);
      expect(
          DSToggleViewUtils.isPlatformSupported(TargetPlatform.linux), isTrue);
    });

    test('calculates optimal cross axis count', () {
      expect(DSToggleViewUtils.calculateOptimalCrossAxisCount(300, 100),
          equals(3));
      expect(DSToggleViewUtils.calculateOptimalCrossAxisCount(200, 100),
          equals(2));
      expect(DSToggleViewUtils.calculateOptimalCrossAxisCount(50, 100),
          equals(1));
      expect(
          DSToggleViewUtils.calculateOptimalCrossAxisCount(0, 100), equals(2));
    });

    test('validates toggle view data correctly', () {
      const validData = DSToggleViewData(
        selectedValues: ['option1', 'option2'],
        options: [
          DSToggleViewOption(id: 'option1', label: 'Option 1'),
          DSToggleViewOption(id: 'option2', label: 'Option 2'),
        ],
      );
      expect(DSToggleViewUtils.validateData(validData), isTrue);

      const invalidData = DSToggleViewData(
        selectedValues: ['option1', 'invalid'],
        options: [
          DSToggleViewOption(id: 'option1', label: 'Option 1'),
          DSToggleViewOption(id: 'option2', label: 'Option 2'),
        ],
      );
      expect(DSToggleViewUtils.validateData(invalidData), isFalse);
    });
  });
}
