import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/chip/app_chip.dart';
import 'package:iautomat_design_system/src/components/chip/chip_config.dart';

void main() {
  group('AppChip', () {
    group('Widget Tests', () {
      testWidgets('renders correctly with default configuration', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppChip(label: 'Test Chip'),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
        expect(find.text('Test Chip'), findsOneWidget);
      });

      testWidgets('renders with input variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip.input(
                label: 'Input Chip',
                onDeleted: () {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
        expect(find.text('Input Chip'), findsOneWidget);
      });

      testWidgets('renders with filter variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip.filter(
                label: 'Filter Chip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
        expect(find.text('Filter Chip'), findsOneWidget);
      });

      testWidgets('renders with choice variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip.choice(
                label: 'Choice Chip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
        expect(find.text('Choice Chip'), findsOneWidget);
      });

      testWidgets('renders with assist variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip.assist(
                label: 'Assist Chip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
        expect(find.text('Assist Chip'), findsOneWidget);
      });

      testWidgets('displays avatar when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Avatar Chip',
                avatar: const CircleAvatar(child: Text('A')),
              ),
            ),
          ),
        );

        expect(find.byType(CircleAvatar), findsOneWidget);
        expect(find.text('A'), findsOneWidget);
      });

      testWidgets('displays icon when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Icon Chip',
                icon: Icons.star,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.star), findsOneWidget);
      });

      testWidgets('displays avatarText when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Avatar Text Chip',
                avatarText: 'AT',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.text('A'), findsOneWidget); // First character
      });

      testWidgets('shows delete button when deletable', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Deletable Chip',
                deletable: true,
                onDeleted: () {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.close), findsOneWidget);
      });

      testWidgets('shows checkmark when selected filter chip', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip.filter(
                label: 'Selected Filter',
                selected: true,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.check), findsOneWidget);
      });
    });

    group('State Tests', () {
      testWidgets('renders disabled state correctly', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Disabled Chip',
                enabled: false,
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
        expect(find.text('Disabled Chip'), findsOneWidget);
      });

      testWidgets('renders loading state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Loading Chip',
                state: AppChipState.loading,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('renders skeleton state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Skeleton Chip',
                state: AppChipState.skeleton,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
      });

      testWidgets('shows selected state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip.filter(
                label: 'Selected Chip',
                selected: true,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
      });
    });

    group('Size Tests', () {
      testWidgets('renders small size correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Small Chip',
                size: AppChipSize.small,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
      });

      testWidgets('renders medium size correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Medium Chip',
                size: AppChipSize.medium,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
      });

      testWidgets('renders large size correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Large Chip',
                size: AppChipSize.large,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
      });
    });

    group('Shape Tests', () {
      testWidgets('renders rounded shape correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Rounded Chip',
                shape: AppChipShape.rounded,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
      });

      testWidgets('renders stadium shape correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Stadium Chip',
                shape: AppChipShape.stadium,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
      });
    });

    group('Interaction Tests', () {
      testWidgets('calls onSelected when tapped', (tester) async {
        bool wasSelected = false;
        bool callbackCalled = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Selectable Chip',
                selected: wasSelected,
                onSelected: (selected) {
                  callbackCalled = true;
                  wasSelected = selected;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppChip), warnIfMissed: false);
        await tester.pumpAndSettle();

        expect(callbackCalled, isTrue);
        expect(wasSelected, isTrue);
      });

      testWidgets('calls onDeleted when delete button tapped', (tester) async {
        bool deleteCalled = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Deletable Chip',
                deletable: true,
                onDeleted: () {
                  deleteCalled = true;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byIcon(Icons.close));
        await tester.pumpAndSettle();

        expect(deleteCalled, isTrue);
      });

      testWidgets('does not respond to tap when disabled', (tester) async {
        bool callbackCalled = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Disabled Chip',
                enabled: false,
                onSelected: (selected) {
                  callbackCalled = true;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppChip), warnIfMissed: false);
        await tester.pumpAndSettle();

        expect(callbackCalled, isFalse);
      });

      testWidgets('shows tooltip when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Tooltip Chip',
                tooltip: 'This is a tooltip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(Tooltip), findsOneWidget);
      });
    });

    group('Configuration Tests', () {
      testWidgets('applies custom configuration correctly', (tester) async {
        final customConfig = AppChipConfig(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          size: AppChipSize.large,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Custom Config Chip',
                config: customConfig,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
      });

      testWidgets('applies custom colors correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Custom Color Chip',
                backgroundColor: Colors.red,
                color: Colors.white,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
      });

      testWidgets('applies custom padding correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Custom Padding Chip',
                padding: const EdgeInsets.all(20),
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
      });

      testWidgets('applies custom border radius correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Custom Border Chip',
                borderRadius: BorderRadius.circular(20),
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
      });

      testWidgets('applies custom text style correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Custom Text Chip',
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AppChip), findsOneWidget);
      });
    });

    group('Accessibility Tests', () {
      testWidgets('has proper semantic labels', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Accessible Chip',
                semanticLabel: 'Custom semantic label',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(
          find.bySemanticsLabel('Custom semantic label'),
          findsOneWidget,
        );
      });

      testWidgets('is marked as button for accessibility', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Button Chip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(Semantics), findsWidgets);
      });

      testWidgets('supports focus and keyboard navigation', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Focusable Chip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        await tester.sendKeyEvent(LogicalKeyboardKey.tab);
        await tester.pumpAndSettle();

        expect(find.byType(Focus), findsWidgets);
      });
    });

    group('Data Model Tests', () {
      testWidgets('uses data model properties when provided', (tester) async {
        final chipData = AppChipData(
          label: 'Data Chip',
          avatarText: 'D',
          selected: true,
          deletable: true,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Will be overridden',
                data: chipData,
                onSelected: (selected) {},
                onDeleted: () {},
              ),
            ),
          ),
        );

        expect(find.text('Data Chip'), findsOneWidget);
        expect(find.text('D'), findsOneWidget);
      });
    });

    group('RTL Tests', () {
      testWidgets('renders correctly in RTL direction', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: AppChip(
                  label: 'RTL Chip',
                  onSelected: (selected) {},
                ),
              ),
            ),
          ),
        );

        expect(find.text('RTL Chip'), findsOneWidget);
        expect(find.byType(AppChip), findsOneWidget);
      });

      testWidgets('renders avatar correctly in RTL', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: AppChip(
                  label: 'RTL Avatar Chip',
                  avatarText: 'R',
                  onSelected: (selected) {},
                ),
              ),
            ),
          ),
        );

        expect(find.text('RTL Avatar Chip'), findsOneWidget);
        expect(find.text('R'), findsOneWidget);
      });

      testWidgets('renders delete button correctly in RTL', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: AppChip(
                  label: 'RTL Delete Chip',
                  deletable: true,
                  onDeleted: () {},
                ),
              ),
            ),
          ),
        );

        expect(find.byIcon(Icons.close), findsOneWidget);
      });
    });

    group('Animation Tests', () {
      testWidgets('has animation controllers', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Animated Chip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(AnimatedBuilder), findsWidgets);
      });

      testWidgets('animates on tap', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Tap Animation Chip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppChip), warnIfMissed: false);
        await tester.pump();

        expect(find.byType(AnimatedBuilder), findsWidgets);
      });

      testWidgets('animates on hover', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppChip(
                label: 'Hover Animation Chip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);

        await gesture.moveTo(tester.getCenter(find.byType(AppChip)));
        await tester.pumpAndSettle();

        expect(find.byType(AnimatedBuilder), findsWidgets);
      });
    });
  });

  group('AppChipData', () {
    test('correctly identifies avatar presence', () {
      final dataWithAvatarText = AppChipData(
        label: 'Test',
        avatarText: 'T',
      );

      final dataWithAvatarUrl = AppChipData(
        label: 'Test',
        avatarUrl: 'https://example.com/avatar.png',
      );

      final dataWithoutAvatar = AppChipData(
        label: 'Test',
      );

      expect(dataWithAvatarText.hasAvatar, isTrue);
      expect(dataWithAvatarUrl.hasAvatar, isTrue);
      expect(dataWithoutAvatar.hasAvatar, isFalse);
    });

    test('correctly identifies icon presence', () {
      final dataWithIcon = AppChipData(
        label: 'Test',
        icon: Icons.star,
      );

      final dataWithoutIcon = AppChipData(
        label: 'Test',
      );

      expect(dataWithIcon.hasIcon, isTrue);
      expect(dataWithoutIcon.hasIcon, isFalse);
    });

    test('correctly identifies deletable state', () {
      final deletableData = AppChipData(
        label: 'Test',
        deletable: true,
      );

      final nonDeletableData = AppChipData(
        label: 'Test',
        deletable: false,
      );

      final defaultData = AppChipData(
        label: 'Test',
      );

      expect(deletableData.isDeletable, isTrue);
      expect(nonDeletableData.isDeletable, isFalse);
      expect(defaultData.isDeletable, isFalse);
    });

    test('correctly identifies enabled state', () {
      final enabledData = AppChipData(
        label: 'Test',
        enabled: true,
      );

      final disabledData = AppChipData(
        label: 'Test',
        enabled: false,
      );

      final defaultData = AppChipData(
        label: 'Test',
      );

      expect(enabledData.isEnabled, isTrue);
      expect(disabledData.isEnabled, isFalse);
      expect(defaultData.isEnabled, isTrue);
    });

    test('correctly identifies selected state', () {
      final selectedData = AppChipData(
        label: 'Test',
        selected: true,
      );

      final unselectedData = AppChipData(
        label: 'Test',
        selected: false,
      );

      final defaultData = AppChipData(
        label: 'Test',
      );

      expect(selectedData.isSelected, isTrue);
      expect(unselectedData.isSelected, isFalse);
      expect(defaultData.isSelected, isFalse);
    });

    test('generates correct avatar display text', () {
      final dataWithAvatarText = AppChipData(
        label: 'Test Label',
        avatarText: 'Custom',
      );

      final dataWithoutAvatarText = AppChipData(
        label: 'Test Label',
      );

      final dataWithEmptyLabel = AppChipData(
        label: '',
      );

      expect(dataWithAvatarText.avatarDisplayText, equals('Custom'));
      expect(dataWithoutAvatarText.avatarDisplayText, equals('T'));
      expect(dataWithEmptyLabel.avatarDisplayText, equals(''));
    });
  });

  group('AppChipUtils', () {
    test('creates chip data from string list', () {
      final labels = ['Item 1', 'Item 2', 'Item 3'];
      final chipDataList = AppChipUtils.fromStringList(labels);

      expect(chipDataList.length, equals(3));
      expect(chipDataList[0].label, equals('Item 1'));
      expect(chipDataList[0].id, equals('item_1'));
      expect(chipDataList[1].label, equals('Item 2'));
      expect(chipDataList[2].label, equals('Item 3'));
    });

    test('creates chip data with avatars', () {
      final labels = ['Alice', 'Bob', 'Charlie'];
      final chipDataList = AppChipUtils.withAvatars(labels);

      expect(chipDataList.length, equals(3));
      expect(chipDataList[0].avatarText, equals('A'));
      expect(chipDataList[1].avatarText, equals('B'));
      expect(chipDataList[2].avatarText, equals('C'));
    });

    test('creates chip data with icons', () {
      final labelIconMap = {
        'Home': Icons.home,
        'Settings': Icons.settings,
        'Profile': Icons.person,
      };
      final chipDataList = AppChipUtils.withIcons(labelIconMap);

      expect(chipDataList.length, equals(3));
      expect(chipDataList[0].icon, equals(Icons.home));
      expect(chipDataList[1].icon, equals(Icons.settings));
      expect(chipDataList[2].icon, equals(Icons.person));
    });

    test('creates deletable chip data', () {
      final labels = ['Tag 1', 'Tag 2', 'Tag 3'];
      final chipDataList = AppChipUtils.deletable(labels);

      expect(chipDataList.length, equals(3));
      expect(chipDataList[0].deletable, isTrue);
      expect(chipDataList[1].deletable, isTrue);
      expect(chipDataList[2].deletable, isTrue);
    });

    test('gets correct height for chip size', () {
      const sizes = AppChipSizes();

      expect(
        AppChipUtils.getHeight(AppChipSize.small, sizes),
        equals(sizes.smallHeight),
      );
      expect(
        AppChipUtils.getHeight(AppChipSize.medium, sizes),
        equals(sizes.mediumHeight),
      );
      expect(
        AppChipUtils.getHeight(AppChipSize.large, sizes),
        equals(sizes.largeHeight),
      );
    });

    test('gets correct padding for chip size', () {
      const sizes = AppChipSizes();

      expect(
        AppChipUtils.getPadding(AppChipSize.small, sizes),
        equals(sizes.smallPadding),
      );
      expect(
        AppChipUtils.getPadding(AppChipSize.medium, sizes),
        equals(sizes.mediumPadding),
      );
      expect(
        AppChipUtils.getPadding(AppChipSize.large, sizes),
        equals(sizes.largePadding),
      );
    });

    test('gets correct icon size for chip size', () {
      const sizes = AppChipSizes();

      expect(
        AppChipUtils.getIconSize(AppChipSize.small, sizes),
        equals(sizes.smallIconSize),
      );
      expect(
        AppChipUtils.getIconSize(AppChipSize.medium, sizes),
        equals(sizes.mediumIconSize),
      );
      expect(
        AppChipUtils.getIconSize(AppChipSize.large, sizes),
        equals(sizes.largeIconSize),
      );
    });

    test('checks platform support correctly', () {
      expect(AppChipUtils.supportsAdvancedInteractions, isA<bool>());
      expect(AppChipUtils.supportsHover, isA<bool>());
    });
  });
}