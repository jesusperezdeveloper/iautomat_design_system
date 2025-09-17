import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/list_item/app_list_item.dart';
import 'package:iautomat_design_system/src/components/list_item/list_item_config.dart';

void main() {
  group('AppListItem', () {
    testWidgets('renders one-line variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'Test Title',
            ),
          ),
        ),
      );

      expect(find.byType(AppListItem), findsOneWidget);
      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('renders two-line variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.twoLine(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      expect(find.byType(AppListItem), findsOneWidget);
      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
    });

    testWidgets('renders three-line variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.threeLine(
              title: 'Test Title',
              subtitle: 'Test Subtitle with more content that spans multiple lines',
            ),
          ),
        ),
      );

      expect(find.byType(AppListItem), findsOneWidget);
      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle with more content that spans multiple lines'), findsOneWidget);
    });

    testWidgets('handles tap correctly', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'Tappable Item',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppListItem));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('handles long press correctly', (tester) async {
      bool longPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'Long Press Item',
              onLongPress: () {
                longPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.longPress(find.byType(AppListItem));
      await tester.pump();

      expect(longPressed, isTrue);
    });

    testWidgets('displays leading icon correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'With Leading',
              leading: const AppListItemLeading(
                type: AppListItemLeadingType.icon,
                icon: Icons.star,
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('displays leading avatar correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'With Avatar',
              leading: const AppListItemLeading(
                type: AppListItemLeadingType.avatar,
                avatarText: 'AB',
              ),
            ),
          ),
        ),
      );

      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.text('AB'), findsOneWidget);
    });

    testWidgets('displays leading checkbox correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'With Checkbox',
              leading: const AppListItemLeading(
                type: AppListItemLeadingType.checkbox,
                checkboxValue: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Checkbox), findsOneWidget);
    });

    testWidgets('displays trailing icon correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'With Trailing',
              trailing: const AppListItemTrailing(
                type: AppListItemTrailingType.icon,
                icon: Icons.arrow_forward,
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('displays trailing text correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'With Trailing Text',
              trailing: const AppListItemTrailing(
                type: AppListItemTrailingType.text,
                text: 'Now',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Now'), findsOneWidget);
    });

    testWidgets('displays trailing switch correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'With Switch',
              trailing: const AppListItemTrailing(
                type: AppListItemTrailingType.switchWidget,
                switchValue: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('handles disabled state correctly', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'Disabled Item',
              config: const AppListItemConfig(
                enabled: false,
              ),
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(AppListItem));
      await tester.pump();

      expect(tapped, isFalse);
    });

    testWidgets('displays loading state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'Loading Item',
              config: const AppListItemConfig(
                loading: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays skeleton state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'Skeleton Item',
              config: const AppListItemConfig(
                skeleton: true,
              ),
            ),
          ),
        ),
      );

      // Skeleton should show containers instead of text
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('shows selected state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'Selected Item',
              config: const AppListItemConfig(
                selected: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppListItem), findsOneWidget);
    });

    testWidgets('handles swipe actions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'Swipeable Item',
              swipeActions: AppListItemSwipeActions(
                trailing: [
                  AppListItemSwipeAction(
                    key: 'delete',
                    label: 'Delete',
                    icon: Icons.delete,
                    onPressed: () {
                      // Handle action
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Dismissible), findsOneWidget);
    });

    testWidgets('respects RTL layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: AppListItem.oneLine(
                title: 'RTL Item',
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
      );

      expect(find.byType(AppListItem), findsOneWidget);
    });

    testWidgets('handles focus correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'Focusable Item',
              onFocusChange: (focus) {
                // Handle focus change
              },
            ),
          ),
        ),
      );

      // Focus the item
      await tester.tap(find.byType(AppListItem));
      await tester.pump();

      // The focus would be handled by the InkWell
      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('shows divider when configured', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppListItem.oneLine(
              title: 'Item with Divider',
              config: const AppListItemConfig(
                showDivider: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('handles different densities', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AppListItem.oneLine(
                  title: 'Compact',
                  config: const AppListItemConfig(
                    density: AppListItemDensity.compact,
                  ),
                ),
                AppListItem.oneLine(
                  title: 'Standard',
                  config: const AppListItemConfig(
                    density: AppListItemDensity.standard,
                  ),
                ),
                AppListItem.oneLine(
                  title: 'Comfortable',
                  config: const AppListItemConfig(
                    density: AppListItemDensity.comfortable,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Compact'), findsOneWidget);
      expect(find.text('Standard'), findsOneWidget);
      expect(find.text('Comfortable'), findsOneWidget);
    });

    group('AppListItemConfig', () {
      test('creates config with default values', () {
        const config = AppListItemConfig();

        expect(config.variant, AppListItemVariant.oneLine);
        expect(config.state, AppListItemState.defaultState);
        expect(config.enabled, true);
        expect(config.selected, false);
        expect(config.loading, false);
        expect(config.skeleton, false);
        expect(config.showDivider, false);
        expect(config.autofocus, false);
        expect(config.density, AppListItemDensity.standard);
        expect(config.keyboardNavigation, true);
        expect(config.platformAdaptive, true);
      });

      test('creates config with custom values', () {
        const config = AppListItemConfig(
          variant: AppListItemVariant.twoLine,
          state: AppListItemState.selected,
          enabled: false,
          selected: true,
          loading: true,
          skeleton: false,
          showDivider: true,
          autofocus: true,
          density: AppListItemDensity.compact,
        );

        expect(config.variant, AppListItemVariant.twoLine);
        expect(config.state, AppListItemState.selected);
        expect(config.enabled, false);
        expect(config.selected, true);
        expect(config.loading, true);
        expect(config.skeleton, false);
        expect(config.showDivider, true);
        expect(config.autofocus, true);
        expect(config.density, AppListItemDensity.compact);
      });

      test('computes interactive state correctly', () {
        const enabledConfig = AppListItemConfig(enabled: true);
        const disabledConfig = AppListItemConfig(enabled: false);
        const loadingConfig = AppListItemConfig(loading: true);
        const skeletonConfig = AppListItemConfig(skeleton: true);

        expect(enabledConfig.isInteractive, true);
        expect(disabledConfig.isInteractive, false);
        expect(loadingConfig.isInteractive, false);
        expect(skeletonConfig.isInteractive, false);
      });

      test('computes effective state correctly', () {
        const defaultConfig = AppListItemConfig();
        const selectedConfig = AppListItemConfig(selected: true);
        const loadingConfig = AppListItemConfig(loading: true);
        const skeletonConfig = AppListItemConfig(skeleton: true);
        const disabledConfig = AppListItemConfig(enabled: false);

        expect(defaultConfig.effectiveState, AppListItemState.defaultState);
        expect(selectedConfig.effectiveState, AppListItemState.selected);
        expect(loadingConfig.effectiveState, AppListItemState.loading);
        expect(skeletonConfig.effectiveState, AppListItemState.skeleton);
        expect(disabledConfig.effectiveState, AppListItemState.disabled);
      });
    });

    group('AppListItemLeading', () {
      test('creates leading with default values', () {
        const leading = AppListItemLeading();

        expect(leading.type, AppListItemLeadingType.none);
        expect(leading.iconSize, 24.0);
        expect(leading.avatarRadius, 20.0);
        expect(leading.imageWidth, 40.0);
        expect(leading.imageHeight, 40.0);
        expect(leading.imageBorderRadius, 4.0);
        expect(leading.enabled, true);
        expect(leading.padding, EdgeInsets.zero);
      });

      test('detects interactive leading correctly', () {
        const nonInteractive = AppListItemLeading();
        const checkbox = AppListItemLeading(type: AppListItemLeadingType.checkbox);
        const radio = AppListItemLeading(type: AppListItemLeadingType.radio);

        expect(nonInteractive.isInteractive, false);
        expect(checkbox.isInteractive, true);
        expect(radio.isInteractive, true);
      });

      test('handles RTL margin correctly', () {
        const leading = AppListItemLeading(
          margin: EdgeInsets.only(right: 16),
        );

        final ltrMargin = leading.getEffectiveMargin(TextDirection.ltr);
        final rtlMargin = leading.getEffectiveMargin(TextDirection.rtl);

        expect(ltrMargin.right, 16.0);
        expect(rtlMargin.left, 16.0);
      });
    });

    group('AppListItemTrailing', () {
      test('creates trailing with default values', () {
        const trailing = AppListItemTrailing();

        expect(trailing.type, AppListItemTrailingType.none);
        expect(trailing.iconSize, 24.0);
        expect(trailing.enabled, true);
        expect(trailing.padding, EdgeInsets.zero);
      });

      test('detects interactive trailing correctly', () {
        const nonInteractive = AppListItemTrailing();
        const withSwitch = AppListItemTrailing(type: AppListItemTrailingType.switchWidget);
        const withCheckbox = AppListItemTrailing(type: AppListItemTrailingType.checkbox);
        const withRadio = AppListItemTrailing(type: AppListItemTrailingType.radio);

        expect(nonInteractive.isInteractive, false);
        expect(withSwitch.isInteractive, true);
        expect(withCheckbox.isInteractive, true);
        expect(withRadio.isInteractive, true);
      });
    });

    group('AppListItemSwipeActions', () {
      test('creates swipe actions with defaults', () {
        const swipeActions = AppListItemSwipeActions();

        expect(swipeActions.leading, isEmpty);
        expect(swipeActions.trailing, isEmpty);
        expect(swipeActions.direction, AppListItemSwipeDirection.both);
        expect(swipeActions.enabled, true);
        expect(swipeActions.threshold, 0.5);
        expect(swipeActions.dismissible, false);
      });

      test('detects actions correctly', () {
        const noActions = AppListItemSwipeActions();
        const withLeading = AppListItemSwipeActions(
          leading: [
            AppListItemSwipeAction(
              key: 'test',
              label: 'Test',
            ),
          ],
        );
        const withTrailing = AppListItemSwipeActions(
          trailing: [
            AppListItemSwipeAction(
              key: 'test',
              label: 'Test',
            ),
          ],
        );

        expect(noActions.hasActions, false);
        expect(noActions.hasLeadingActions, false);
        expect(noActions.hasTrailingActions, false);

        expect(withLeading.hasActions, true);
        expect(withLeading.hasLeadingActions, true);
        expect(withLeading.hasTrailingActions, false);

        expect(withTrailing.hasActions, true);
        expect(withTrailing.hasLeadingActions, false);
        expect(withTrailing.hasTrailingActions, true);
      });
    });

    group('Extensions', () {
      test('AppListItemVariant extension works correctly', () {
        expect(AppListItemVariant.oneLine.maxLines, 1);
        expect(AppListItemVariant.twoLine.maxLines, 2);
        expect(AppListItemVariant.threeLine.maxLines, 3);

        expect(AppListItemVariant.oneLine.supportsSubtitle, false);
        expect(AppListItemVariant.twoLine.supportsSubtitle, true);
        expect(AppListItemVariant.threeLine.supportsSubtitle, true);

        expect(AppListItemVariant.oneLine.defaultHeight, 48.0);
        expect(AppListItemVariant.twoLine.defaultHeight, 64.0);
        expect(AppListItemVariant.threeLine.defaultHeight, 88.0);
      });

      test('AppListItemState extension works correctly', () {
        expect(AppListItemState.defaultState.isInteractive, true);
        expect(AppListItemState.disabled.isInteractive, false);
        expect(AppListItemState.loading.isInteractive, false);
        expect(AppListItemState.skeleton.isInteractive, false);

        expect(AppListItemState.hover.hasVisualFeedback, true);
        expect(AppListItemState.pressed.hasVisualFeedback, true);
        expect(AppListItemState.focus.hasVisualFeedback, true);
        expect(AppListItemState.selected.hasVisualFeedback, true);
        expect(AppListItemState.defaultState.hasVisualFeedback, false);

        expect(AppListItemState.hover.isTemporary, true);
        expect(AppListItemState.pressed.isTemporary, true);
        expect(AppListItemState.focus.isTemporary, true);
        expect(AppListItemState.selected.isTemporary, false);
      });
    });
  });
}