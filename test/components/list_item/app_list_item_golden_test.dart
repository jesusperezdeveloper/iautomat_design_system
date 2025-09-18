import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/list_item/app_list_item.dart';
import 'package:iautomat_design_system/src/components/list_item/list_item_config.dart';

void main() {
  group('AppListItem Golden Tests', () {
    testWidgets('One-line variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: AppListItem.oneLine(
                title: 'Simple one-line item',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_one_line.png'),
      );
    });

    testWidgets('Two-line variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 120,
              padding: const EdgeInsets.all(16),
              child: AppListItem.twoLine(
                title: 'John Doe',
                subtitle: 'Software Engineer',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_two_line.png'),
      );
    });

    testWidgets('Three-line variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 150,
              padding: const EdgeInsets.all(16),
              child: AppListItem.threeLine(
                title: 'Team Meeting',
                subtitle:
                    'Discuss project milestones and upcoming deadlines. Review current progress and plan next steps.',
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_three_line.png'),
      );
    });

    testWidgets('With leading icon golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: AppListItem.oneLine(
                title: 'With leading icon',
                leading: const AppListItemLeading(
                  type: AppListItemLeadingType.icon,
                  icon: Icons.person,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_leading_icon.png'),
      );
    });

    testWidgets('With leading avatar golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: AppListItem.oneLine(
                title: 'With leading avatar',
                leading: const AppListItemLeading(
                  type: AppListItemLeadingType.avatar,
                  avatarText: 'JD',
                  avatarBackgroundColor: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_leading_avatar.png'),
      );
    });

    testWidgets('With leading checkbox golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: AppListItem.oneLine(
                title: 'With checkbox',
                leading: const AppListItemLeading(
                  type: AppListItemLeadingType.checkbox,
                  checkboxValue: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_leading_checkbox.png'),
      );
    });

    testWidgets('With leading radio golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: AppListItem.oneLine(
                title: 'With radio button',
                leading: const AppListItemLeading(
                  type: AppListItemLeadingType.radio,
                  radioValue: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_leading_radio.png'),
      );
    });

    testWidgets('With trailing icon golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: AppListItem.oneLine(
                title: 'With trailing icon',
                trailing: const AppListItemTrailing(
                  type: AppListItemTrailingType.icon,
                  icon: Icons.arrow_forward_ios,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_trailing_icon.png'),
      );
    });

    testWidgets('With trailing text golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: AppListItem.oneLine(
                title: 'With trailing text',
                trailing: const AppListItemTrailing(
                  type: AppListItemTrailingType.text,
                  text: 'Now',
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_trailing_text.png'),
      );
    });

    testWidgets('With trailing switch golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: AppListItem.oneLine(
                title: 'With switch',
                trailing: const AppListItemTrailing(
                  type: AppListItemTrailingType.switchWidget,
                  switchValue: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_trailing_switch.png'),
      );
    });

    testWidgets('With trailing checkbox golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: AppListItem.oneLine(
                title: 'With checkbox',
                trailing: const AppListItemTrailing(
                  type: AppListItemTrailingType.checkbox,
                  checkboxValue: false,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_trailing_checkbox.png'),
      );
    });

    testWidgets('Complete example golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 120,
              padding: const EdgeInsets.all(16),
              child: AppListItem.twoLine(
                title: 'Alice Cooper',
                subtitle: 'Product Designer',
                leading: const AppListItemLeading(
                  type: AppListItemLeadingType.avatar,
                  avatarText: 'AC',
                  avatarBackgroundColor: Colors.pink,
                ),
                trailing: const AppListItemTrailing(
                  type: AppListItemTrailingType.icon,
                  icon: Icons.more_vert,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_complete_example.png'),
      );
    });

    testWidgets('Selected state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: AppListItem.oneLine(
                title: 'Selected item',
                config: const AppListItemConfig(
                  selected: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_selected.png'),
      );
    });

    testWidgets('Disabled state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: AppListItem.oneLine(
                title: 'Disabled item',
                config: const AppListItemConfig(
                  enabled: false,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_disabled.png'),
      );
    });

    testWidgets('Loading state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: AppListItem.oneLine(
                title: 'Loading item',
                config: const AppListItemConfig(
                  loading: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_loading.png'),
      );
    });

    testWidgets('Skeleton state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 120,
              padding: const EdgeInsets.all(16),
              child: AppListItem.twoLine(
                title: 'Skeleton item',
                subtitle: 'Loading content...',
                leading: const AppListItemLeading(
                  type: AppListItemLeadingType.avatar,
                  avatarText: 'SK',
                ),
                trailing: const AppListItemTrailing(
                  type: AppListItemTrailingType.icon,
                  icon: Icons.arrow_forward,
                ),
                config: const AppListItemConfig(
                  skeleton: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_skeleton.png'),
      );
    });

    testWidgets('With divider golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 120,
              padding: const EdgeInsets.all(16),
              child: AppListItem.oneLine(
                title: 'Item with divider',
                config: const AppListItemConfig(
                  showDivider: true,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_with_divider.png'),
      );
    });

    testWidgets('Compact density golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: AppListItem.twoLine(
                title: 'Compact density',
                subtitle: 'Reduced spacing',
                config: const AppListItemConfig(
                  density: AppListItemDensity.compact,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_compact_density.png'),
      );
    });

    testWidgets('Comfortable density golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 140,
              padding: const EdgeInsets.all(16),
              child: AppListItem.twoLine(
                title: 'Comfortable density',
                subtitle: 'Increased spacing',
                config: const AppListItemConfig(
                  density: AppListItemDensity.comfortable,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_comfortable_density.png'),
      );
    });

    testWidgets('RTL layout golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Container(
                width: 400,
                height: 120,
                padding: const EdgeInsets.all(16),
                child: AppListItem.twoLine(
                  title: 'RTL layout item',
                  subtitle: 'Right-to-left text direction',
                  leading: const AppListItemLeading(
                    type: AppListItemLeadingType.icon,
                    icon: Icons.star,
                  ),
                  trailing: const AppListItemTrailing(
                    type: AppListItemTrailingType.icon,
                    icon: Icons.arrow_forward,
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_rtl.png'),
      );
    });

    testWidgets('Dark theme golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 120,
              padding: const EdgeInsets.all(16),
              child: AppListItem.twoLine(
                title: 'Dark theme item',
                subtitle: 'Styled for dark mode',
                leading: const AppListItemLeading(
                  type: AppListItemLeadingType.avatar,
                  avatarText: 'DT',
                  avatarBackgroundColor: Colors.purple,
                ),
                trailing: const AppListItemTrailing(
                  type: AppListItemTrailingType.icon,
                  icon: Icons.favorite,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_dark_theme.png'),
      );
    });

    testWidgets('Custom styling golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 120,
              padding: const EdgeInsets.all(16),
              child: AppListItem.twoLine(
                title: 'Custom styled item',
                subtitle: 'With custom configuration',
                config: const AppListItemConfig(
                  theme: AppListItemTheme(
                    backgroundColor: Colors.blue,
                    borderRadius: 12.0,
                    elevation: 4.0,
                  ),
                  style: AppListItemStyle(
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppListItem),
        matchesGoldenFile('goldens/list_item_custom_styling.png'),
      );
    });

    testWidgets('List of items golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Container(
              width: 400,
              height: 400,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AppListItem.oneLine(
                    title: 'First item',
                    leading: const AppListItemLeading(
                      type: AppListItemLeadingType.icon,
                      icon: Icons.home,
                    ),
                    config: const AppListItemConfig(
                      showDivider: true,
                    ),
                  ),
                  AppListItem.twoLine(
                    title: 'Second item',
                    subtitle: 'With subtitle',
                    leading: const AppListItemLeading(
                      type: AppListItemLeadingType.avatar,
                      avatarText: 'SI',
                    ),
                    trailing: const AppListItemTrailing(
                      type: AppListItemTrailingType.switchWidget,
                      switchValue: true,
                    ),
                    config: const AppListItemConfig(
                      showDivider: true,
                    ),
                  ),
                  AppListItem.threeLine(
                    title: 'Third item',
                    subtitle:
                        'With longer subtitle that spans multiple lines for better content display',
                    trailing: const AppListItemTrailing(
                      type: AppListItemTrailingType.text,
                      text: '12:30',
                    ),
                    config: const AppListItemConfig(
                      showDivider: true,
                    ),
                  ),
                  AppListItem.oneLine(
                    title: 'Fourth item (disabled)',
                    config: const AppListItemConfig(
                      enabled: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Column),
        matchesGoldenFile('goldens/list_item_list_example.png'),
      );
    });
  });
}
