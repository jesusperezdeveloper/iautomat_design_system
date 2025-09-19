import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/list_item/ds_list_item.dart';
import 'package:iautomat_design_system/src/components/list_item/list_item_config.dart';

void main() {
  group('DSListItem', () {
    testWidgets('renders one-line variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSListItem.oneLine(
              title: 'Test Title',
            ),
          ),
        ),
      );

      expect(find.byType(DSListItem), findsOneWidget);
      expect(find.text('Test Title'), findsOneWidget);
    });

    testWidgets('renders two-line variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSListItem.twoLine(
              title: 'Test Title',
              subtitle: 'Test Subtitle',
            ),
          ),
        ),
      );

      expect(find.byType(DSListItem), findsOneWidget);
      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
    });

    testWidgets('renders three-line variant correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSListItem.threeLine(
              title: 'Test Title',
              subtitle:
                  'Test Subtitle with more content that spans multiple lines',
            ),
          ),
        ),
      );

      expect(find.byType(DSListItem), findsOneWidget);
      expect(find.text('Test Title'), findsOneWidget);
      expect(
          find.text(
              'Test Subtitle with more content that spans multiple lines'),
          findsOneWidget);
    });

    testWidgets('handles tap correctly', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSListItem.oneLine(
              title: 'Tappable Item',
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSListItem));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('handles long press correctly', (tester) async {
      bool longPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSListItem.oneLine(
              title: 'Long Press Item',
              onLongPress: () {
                longPressed = true;
              },
            ),
          ),
        ),
      );

      await tester.longPress(find.byType(DSListItem));
      await tester.pump();

      expect(longPressed, isTrue);
    });

    testWidgets('displays leading icon correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSListItem.oneLine(
              title: 'With Leading',
              leading: const DSListItemLeading(
                type: DSListItemLeadingType.icon,
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
            body: DSListItem.oneLine(
              title: 'With Avatar',
              leading: const DSListItemLeading(
                type: DSListItemLeadingType.avatar,
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
            body: DSListItem.oneLine(
              title: 'With Checkbox',
              leading: const DSListItemLeading(
                type: DSListItemLeadingType.checkbox,
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
            body: DSListItem.oneLine(
              title: 'With Trailing',
              trailing: const DSListItemTrailing(
                type: DSListItemTrailingType.icon,
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
            body: DSListItem.oneLine(
              title: 'With Trailing Text',
              trailing: const DSListItemTrailing(
                type: DSListItemTrailingType.text,
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
            body: DSListItem.oneLine(
              title: 'With Switch',
              trailing: const DSListItemTrailing(
                type: DSListItemTrailingType.switchWidget,
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
            body: DSListItem.oneLine(
              title: 'Disabled Item',
              config: const DSListItemConfig(
                enabled: false,
              ),
              onTap: () {
                tapped = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(DSListItem));
      await tester.pump();

      expect(tapped, isFalse);
    });

    testWidgets('displays loading state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSListItem.oneLine(
              title: 'Loading Item',
              config: const DSListItemConfig(
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
            body: DSListItem.oneLine(
              title: 'Skeleton Item',
              config: const DSListItemConfig(
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
            body: DSListItem.oneLine(
              title: 'Selected Item',
              config: const DSListItemConfig(
                selected: true,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSListItem), findsOneWidget);
    });

    testWidgets('handles swipe actions', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSListItem.oneLine(
              title: 'Swipeable Item',
              swipeActions: DSListItemSwipeActions(
                trailing: [
                  DSListItemSwipeAction(
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
              body: DSListItem.oneLine(
                title: 'RTL Item',
                leading: const DSListItemLeading(
                  type: DSListItemLeadingType.icon,
                  icon: Icons.star,
                ),
                trailing: const DSListItemTrailing(
                  type: DSListItemTrailingType.icon,
                  icon: Icons.arrow_forward,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(DSListItem), findsOneWidget);
    });

    testWidgets('handles focus correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSListItem.oneLine(
              title: 'Focusable Item',
              onFocusChange: (focus) {
                // Handle focus change
              },
            ),
          ),
        ),
      );

      // Focus the item
      await tester.tap(find.byType(DSListItem));
      await tester.pump();

      // The focus would be handled by the InkWell
      expect(find.byType(InkWell), findsOneWidget);
    });

    testWidgets('shows divider when configured', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSListItem.oneLine(
              title: 'Item with Divider',
              config: const DSListItemConfig(
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
                DSListItem.oneLine(
                  title: 'Compact',
                  config: const DSListItemConfig(
                    density: DSListItemDensity.compact,
                  ),
                ),
                DSListItem.oneLine(
                  title: 'Standard',
                  config: const DSListItemConfig(
                    density: DSListItemDensity.standard,
                  ),
                ),
                DSListItem.oneLine(
                  title: 'Comfortable',
                  config: const DSListItemConfig(
                    density: DSListItemDensity.comfortable,
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

    group('DSListItemConfig', () {
      test('creates config with default values', () {
        const config = DSListItemConfig();

        expect(config.variant, DSListItemVariant.oneLine);
        expect(config.state, DSListItemState.defaultState);
        expect(config.enabled, true);
        expect(config.selected, false);
        expect(config.loading, false);
        expect(config.skeleton, false);
        expect(config.showDivider, false);
        expect(config.autofocus, false);
        expect(config.density, DSListItemDensity.standard);
        expect(config.keyboardNavigation, true);
        expect(config.platformAdaptive, true);
      });

      test('creates config with custom values', () {
        const config = DSListItemConfig(
          variant: DSListItemVariant.twoLine,
          state: DSListItemState.selected,
          enabled: false,
          selected: true,
          loading: true,
          skeleton: false,
          showDivider: true,
          autofocus: true,
          density: DSListItemDensity.compact,
        );

        expect(config.variant, DSListItemVariant.twoLine);
        expect(config.state, DSListItemState.selected);
        expect(config.enabled, false);
        expect(config.selected, true);
        expect(config.loading, true);
        expect(config.skeleton, false);
        expect(config.showDivider, true);
        expect(config.autofocus, true);
        expect(config.density, DSListItemDensity.compact);
      });

      test('computes interactive state correctly', () {
        const enabledConfig = DSListItemConfig(enabled: true);
        const disabledConfig = DSListItemConfig(enabled: false);
        const loadingConfig = DSListItemConfig(loading: true);
        const skeletonConfig = DSListItemConfig(skeleton: true);

        expect(enabledConfig.isInteractive, true);
        expect(disabledConfig.isInteractive, false);
        expect(loadingConfig.isInteractive, false);
        expect(skeletonConfig.isInteractive, false);
      });

      test('computes effective state correctly', () {
        const defaultConfig = DSListItemConfig();
        const selectedConfig = DSListItemConfig(selected: true);
        const loadingConfig = DSListItemConfig(loading: true);
        const skeletonConfig = DSListItemConfig(skeleton: true);
        const disabledConfig = DSListItemConfig(enabled: false);

        expect(defaultConfig.effectiveState, DSListItemState.defaultState);
        expect(selectedConfig.effectiveState, DSListItemState.selected);
        expect(loadingConfig.effectiveState, DSListItemState.loading);
        expect(skeletonConfig.effectiveState, DSListItemState.skeleton);
        expect(disabledConfig.effectiveState, DSListItemState.disabled);
      });
    });

    group('DSListItemLeading', () {
      test('creates leading with default values', () {
        const leading = DSListItemLeading();

        expect(leading.type, DSListItemLeadingType.none);
        expect(leading.iconSize, 24.0);
        expect(leading.avatarRadius, 20.0);
        expect(leading.imageWidth, 40.0);
        expect(leading.imageHeight, 40.0);
        expect(leading.imageBorderRadius, 4.0);
        expect(leading.enabled, true);
        expect(leading.padding, EdgeInsets.zero);
      });

      test('detects interactive leading correctly', () {
        const nonInteractive = DSListItemLeading();
        const checkbox =
            DSListItemLeading(type: DSListItemLeadingType.checkbox);
        const radio = DSListItemLeading(type: DSListItemLeadingType.radio);

        expect(nonInteractive.isInteractive, false);
        expect(checkbox.isInteractive, true);
        expect(radio.isInteractive, true);
      });

      test('handles RTL margin correctly', () {
        const leading = DSListItemLeading(
          margin: EdgeInsets.only(right: 16),
        );

        final ltrMargin = leading.getEffectiveMargin(TextDirection.ltr);
        final rtlMargin = leading.getEffectiveMargin(TextDirection.rtl);

        expect(ltrMargin.right, 16.0);
        expect(rtlMargin.left, 16.0);
      });
    });

    group('DSListItemTrailing', () {
      test('creates trailing with default values', () {
        const trailing = DSListItemTrailing();

        expect(trailing.type, DSListItemTrailingType.none);
        expect(trailing.iconSize, 24.0);
        expect(trailing.enabled, true);
        expect(trailing.padding, EdgeInsets.zero);
      });

      test('detects interactive trailing correctly', () {
        const nonInteractive = DSListItemTrailing();
        const withSwitch =
            DSListItemTrailing(type: DSListItemTrailingType.switchWidget);
        const withCheckbox =
            DSListItemTrailing(type: DSListItemTrailingType.checkbox);
        const withRadio =
            DSListItemTrailing(type: DSListItemTrailingType.radio);

        expect(nonInteractive.isInteractive, false);
        expect(withSwitch.isInteractive, true);
        expect(withCheckbox.isInteractive, true);
        expect(withRadio.isInteractive, true);
      });
    });

    group('DSListItemSwipeActions', () {
      test('creates swipe actions with defaults', () {
        const swipeActions = DSListItemSwipeActions();

        expect(swipeActions.leading, isEmpty);
        expect(swipeActions.trailing, isEmpty);
        expect(swipeActions.direction, DSListItemSwipeDirection.both);
        expect(swipeActions.enabled, true);
        expect(swipeActions.threshold, 0.5);
        expect(swipeActions.dismissible, false);
      });

      test('detects actions correctly', () {
        const noActions = DSListItemSwipeActions();
        const withLeading = DSListItemSwipeActions(
          leading: [
            DSListItemSwipeAction(
              key: 'test',
              label: 'Test',
            ),
          ],
        );
        const withTrailing = DSListItemSwipeActions(
          trailing: [
            DSListItemSwipeAction(
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
      test('DSListItemVariant extension works correctly', () {
        expect(DSListItemVariant.oneLine.maxLines, 1);
        expect(DSListItemVariant.twoLine.maxLines, 2);
        expect(DSListItemVariant.threeLine.maxLines, 3);

        expect(DSListItemVariant.oneLine.supportsSubtitle, false);
        expect(DSListItemVariant.twoLine.supportsSubtitle, true);
        expect(DSListItemVariant.threeLine.supportsSubtitle, true);

        expect(DSListItemVariant.oneLine.defaultHeight, 48.0);
        expect(DSListItemVariant.twoLine.defaultHeight, 64.0);
        expect(DSListItemVariant.threeLine.defaultHeight, 88.0);
      });

      test('DSListItemState extension works correctly', () {
        expect(DSListItemState.defaultState.isInteractive, true);
        expect(DSListItemState.disabled.isInteractive, false);
        expect(DSListItemState.loading.isInteractive, false);
        expect(DSListItemState.skeleton.isInteractive, false);

        expect(DSListItemState.hover.hasVisualFeedback, true);
        expect(DSListItemState.pressed.hasVisualFeedback, true);
        expect(DSListItemState.focus.hasVisualFeedback, true);
        expect(DSListItemState.selected.hasVisualFeedback, true);
        expect(DSListItemState.defaultState.hasVisualFeedback, false);

        expect(DSListItemState.hover.isTemporary, true);
        expect(DSListItemState.pressed.isTemporary, true);
        expect(DSListItemState.focus.isTemporary, true);
        expect(DSListItemState.selected.isTemporary, false);
      });
    });
  });
}
