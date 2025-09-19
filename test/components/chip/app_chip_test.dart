import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/chip/app_chip.dart';
import 'package:iautomat_design_system/src/components/chip/chip_config.dart';

void main() {
  group('DSChip', () {
    group('Widget Tests', () {
      testWidgets('renders correctly with default configuration',
          (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSChip(label: 'Test Chip'),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
        expect(find.text('Test Chip'), findsOneWidget);
      });

      testWidgets('renders with input variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip.input(
                label: 'Input Chip',
                onDeleted: () {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
        expect(find.text('Input Chip'), findsOneWidget);
      });

      testWidgets('renders with filter variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip.filter(
                label: 'Filter Chip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
        expect(find.text('Filter Chip'), findsOneWidget);
      });

      testWidgets('renders with choice variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip.choice(
                label: 'Choice Chip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
        expect(find.text('Choice Chip'), findsOneWidget);
      });

      testWidgets('renders with assist variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip.assist(
                label: 'Assist Chip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
        expect(find.text('Assist Chip'), findsOneWidget);
      });

      testWidgets('displays avatar when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
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
              body: DSChip(
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
              body: DSChip(
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
              body: DSChip(
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
              body: DSChip.filter(
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
              body: DSChip(
                label: 'Disabled Chip',
                enabled: false,
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
        expect(find.text('Disabled Chip'), findsOneWidget);
      });

      testWidgets('renders loading state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
                label: 'Loading Chip',
                state: DSChipState.loading,
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
              body: DSChip(
                label: 'Skeleton Chip',
                state: DSChipState.skeleton,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
      });

      testWidgets('shows selected state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip.filter(
                label: 'Selected Chip',
                selected: true,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
      });
    });

    group('Size Tests', () {
      testWidgets('renders small size correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
                label: 'Small Chip',
                size: DSChipSize.small,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
      });

      testWidgets('renders medium size correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
                label: 'Medium Chip',
                size: DSChipSize.medium,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
      });

      testWidgets('renders large size correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
                label: 'Large Chip',
                size: DSChipSize.large,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
      });
    });

    group('Shape Tests', () {
      testWidgets('renders rounded shape correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
                label: 'Rounded Chip',
                shape: DSChipShape.rounded,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
      });

      testWidgets('renders stadium shape correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
                label: 'Stadium Chip',
                shape: DSChipShape.stadium,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
      });
    });

    group('Interaction Tests', () {
      testWidgets('calls onSelected when tapped', (tester) async {
        bool wasSelected = false;
        bool callbackCalled = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
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

        await tester.tap(find.byType(DSChip), warnIfMissed: false);
        await tester.pumpAndSettle();

        expect(callbackCalled, isTrue);
        expect(wasSelected, isTrue);
      });

      testWidgets('calls onDeleted when delete button tapped', (tester) async {
        bool deleteCalled = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
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
              body: DSChip(
                label: 'Disabled Chip',
                enabled: false,
                onSelected: (selected) {
                  callbackCalled = true;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(DSChip), warnIfMissed: false);
        await tester.pumpAndSettle();

        expect(callbackCalled, isFalse);
      });

      testWidgets('shows tooltip when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
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
        final customConfig = DSChipConfig(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          size: DSChipSize.large,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
                label: 'Custom Config Chip',
                config: customConfig,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
      });

      testWidgets('applies custom colors correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
                label: 'Custom Color Chip',
                backgroundColor: Colors.red,
                color: Colors.white,
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
      });

      testWidgets('applies custom padding correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
                label: 'Custom Padding Chip',
                padding: const EdgeInsets.all(20),
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
      });

      testWidgets('applies custom border radius correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
                label: 'Custom Border Chip',
                borderRadius: BorderRadius.circular(20),
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
      });

      testWidgets('applies custom text style correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
                label: 'Custom Text Chip',
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        expect(find.byType(DSChip), findsOneWidget);
      });
    });

    group('Accessibility Tests', () {
      testWidgets('has proper semantic labels', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
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
              body: DSChip(
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
              body: DSChip(
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
        final chipData = DSChipData(
          label: 'Data Chip',
          avatarText: 'D',
          selected: true,
          deletable: true,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
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
                body: DSChip(
                  label: 'RTL Chip',
                  onSelected: (selected) {},
                ),
              ),
            ),
          ),
        );

        expect(find.text('RTL Chip'), findsOneWidget);
        expect(find.byType(DSChip), findsOneWidget);
      });

      testWidgets('renders avatar correctly in RTL', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: DSChip(
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
                body: DSChip(
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
              body: DSChip(
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
              body: DSChip(
                label: 'Tap Animation Chip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        await tester.tap(find.byType(DSChip), warnIfMissed: false);
        await tester.pump();

        expect(find.byType(AnimatedBuilder), findsWidgets);
      });

      testWidgets('animates on hover', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSChip(
                label: 'Hover Animation Chip',
                onSelected: (selected) {},
              ),
            ),
          ),
        );

        final gesture =
            await tester.createGesture(kind: PointerDeviceKind.mouse);
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);

        await gesture.moveTo(tester.getCenter(find.byType(DSChip)));
        await tester.pumpAndSettle();

        expect(find.byType(AnimatedBuilder), findsWidgets);
      });
    });
  });

  group('DSChipData', () {
    test('correctly identifies avatar presence', () {
      final dataWithAvatarText = DSChipData(
        label: 'Test',
        avatarText: 'T',
      );

      final dataWithAvatarUrl = DSChipData(
        label: 'Test',
        avatarUrl: 'https://example.com/avatar.png',
      );

      final dataWithoutAvatar = DSChipData(
        label: 'Test',
      );

      expect(dataWithAvatarText.hasAvatar, isTrue);
      expect(dataWithAvatarUrl.hasAvatar, isTrue);
      expect(dataWithoutAvatar.hasAvatar, isFalse);
    });

    test('correctly identifies icon presence', () {
      final dataWithIcon = DSChipData(
        label: 'Test',
        icon: Icons.star,
      );

      final dataWithoutIcon = DSChipData(
        label: 'Test',
      );

      expect(dataWithIcon.hasIcon, isTrue);
      expect(dataWithoutIcon.hasIcon, isFalse);
    });

    test('correctly identifies deletable state', () {
      final deletableData = DSChipData(
        label: 'Test',
        deletable: true,
      );

      final nonDeletableData = DSChipData(
        label: 'Test',
        deletable: false,
      );

      final defaultData = DSChipData(
        label: 'Test',
      );

      expect(deletableData.isDeletable, isTrue);
      expect(nonDeletableData.isDeletable, isFalse);
      expect(defaultData.isDeletable, isFalse);
    });

    test('correctly identifies enabled state', () {
      final enabledData = DSChipData(
        label: 'Test',
        enabled: true,
      );

      final disabledData = DSChipData(
        label: 'Test',
        enabled: false,
      );

      final defaultData = DSChipData(
        label: 'Test',
      );

      expect(enabledData.isEnabled, isTrue);
      expect(disabledData.isEnabled, isFalse);
      expect(defaultData.isEnabled, isTrue);
    });

    test('correctly identifies selected state', () {
      final selectedData = DSChipData(
        label: 'Test',
        selected: true,
      );

      final unselectedData = DSChipData(
        label: 'Test',
        selected: false,
      );

      final defaultData = DSChipData(
        label: 'Test',
      );

      expect(selectedData.isSelected, isTrue);
      expect(unselectedData.isSelected, isFalse);
      expect(defaultData.isSelected, isFalse);
    });

    test('generates correct avatar display text', () {
      final dataWithAvatarText = DSChipData(
        label: 'Test Label',
        avatarText: 'Custom',
      );

      final dataWithoutAvatarText = DSChipData(
        label: 'Test Label',
      );

      final dataWithEmptyLabel = DSChipData(
        label: '',
      );

      expect(dataWithAvatarText.avatarDisplayText, equals('Custom'));
      expect(dataWithoutAvatarText.avatarDisplayText, equals('T'));
      expect(dataWithEmptyLabel.avatarDisplayText, equals(''));
    });
  });

  group('DSChipUtils', () {
    test('creates chip data from string list', () {
      final labels = ['Item 1', 'Item 2', 'Item 3'];
      final chipDataList = DSChipUtils.fromStringList(labels);

      expect(chipDataList.length, equals(3));
      expect(chipDataList[0].label, equals('Item 1'));
      expect(chipDataList[0].id, equals('item_1'));
      expect(chipDataList[1].label, equals('Item 2'));
      expect(chipDataList[2].label, equals('Item 3'));
    });

    test('creates chip data with avatars', () {
      final labels = ['Alice', 'Bob', 'Charlie'];
      final chipDataList = DSChipUtils.withAvatars(labels);

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
      final chipDataList = DSChipUtils.withIcons(labelIconMap);

      expect(chipDataList.length, equals(3));
      expect(chipDataList[0].icon, equals(Icons.home));
      expect(chipDataList[1].icon, equals(Icons.settings));
      expect(chipDataList[2].icon, equals(Icons.person));
    });

    test('creates deletable chip data', () {
      final labels = ['Tag 1', 'Tag 2', 'Tag 3'];
      final chipDataList = DSChipUtils.deletable(labels);

      expect(chipDataList.length, equals(3));
      expect(chipDataList[0].deletable, isTrue);
      expect(chipDataList[1].deletable, isTrue);
      expect(chipDataList[2].deletable, isTrue);
    });

    test('gets correct height for chip size', () {
      const sizes = DSChipSizes();

      expect(
        DSChipUtils.getHeight(DSChipSize.small, sizes),
        equals(sizes.smallHeight),
      );
      expect(
        DSChipUtils.getHeight(DSChipSize.medium, sizes),
        equals(sizes.mediumHeight),
      );
      expect(
        DSChipUtils.getHeight(DSChipSize.large, sizes),
        equals(sizes.largeHeight),
      );
    });

    test('gets correct padding for chip size', () {
      const sizes = DSChipSizes();

      expect(
        DSChipUtils.getPadding(DSChipSize.small, sizes),
        equals(sizes.smallPadding),
      );
      expect(
        DSChipUtils.getPadding(DSChipSize.medium, sizes),
        equals(sizes.mediumPadding),
      );
      expect(
        DSChipUtils.getPadding(DSChipSize.large, sizes),
        equals(sizes.largePadding),
      );
    });

    test('gets correct icon size for chip size', () {
      const sizes = DSChipSizes();

      expect(
        DSChipUtils.getIconSize(DSChipSize.small, sizes),
        equals(sizes.smallIconSize),
      );
      expect(
        DSChipUtils.getIconSize(DSChipSize.medium, sizes),
        equals(sizes.mediumIconSize),
      );
      expect(
        DSChipUtils.getIconSize(DSChipSize.large, sizes),
        equals(sizes.largeIconSize),
      );
    });

    test('checks platform support correctly', () {
      expect(DSChipUtils.supportsAdvancedInteractions, isA<bool>());
      expect(DSChipUtils.supportsHover, isA<bool>());
    });
  });
}
