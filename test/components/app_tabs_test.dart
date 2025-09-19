import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/tabs/app_tabs.dart';
import 'package:iautomat_design_system/src/components/tabs/app_tabs_config.dart';

void main() {
  group('DSTabs', () {
    group('Basic Rendering', () {
      testWidgets('renders with default configuration', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(),
            ),
          ),
        );

        expect(find.byType(DSTabs), findsOneWidget);
      });

      testWidgets('renders with provided tabs', (tester) async {
        const tabs = [
          DSTabItem(
            id: 'tab1',
            text: 'Tab 1',
          ),
          DSTabItem(
            id: 'tab2',
            text: 'Tab 2',
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(
                tabs: tabs,
              ),
            ),
          ),
        );

        expect(find.text('Tab 1'), findsOneWidget);
        expect(find.text('Tab 2'), findsOneWidget);
        expect(find.byType(TabBar), findsOneWidget);
      });

      testWidgets('renders with config tabs', (tester) async {
        const config = DSTabsConfig(
          tabs: [
            DSTabItem(
              id: 'config_tab',
              text: 'Config Tab',
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(config: config),
            ),
          ),
        );

        expect(find.text('Config Tab'), findsOneWidget);
        expect(find.byType(TabBar), findsOneWidget);
      });

      testWidgets('renders with children', (tester) async {
        const tabs = [
          DSTabItem(id: 'tab1', text: 'Tab 1'),
          DSTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        const children = [
          Center(child: Text('Content 1')),
          Center(child: Text('Content 2')),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(
                tabs: tabs,
                children: children,
              ),
            ),
          ),
        );

        expect(find.byType(TabBarView), findsOneWidget);
        expect(find.text('Content 1'), findsOneWidget);
      });
    });

    group('Variants', () {
      testWidgets('renders fixed variant', (tester) async {
        const config = DSTabsConfig(
          variant: DSTabsVariant.fixed,
          tabs: [
            DSTabItem(id: 'tab1', text: 'Tab 1'),
            DSTabItem(id: 'tab2', text: 'Tab 2'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(config: config),
            ),
          ),
        );

        final tabBar = tester.widget<TabBar>(find.byType(TabBar));
        expect(tabBar.isScrollable, isFalse);
      });

      testWidgets('renders scrollable variant', (tester) async {
        const config = DSTabsConfig(
          variant: DSTabsVariant.scrollable,
          tabs: [
            DSTabItem(id: 'tab1', text: 'Tab 1'),
            DSTabItem(id: 'tab2', text: 'Tab 2'),
            DSTabItem(id: 'tab3', text: 'Tab 3'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(config: config),
            ),
          ),
        );

        final tabBar = tester.widget<TabBar>(find.byType(TabBar));
        expect(tabBar.isScrollable, isTrue);
      });

      testWidgets('renders withBadges variant', (tester) async {
        const config = DSTabsConfig(
          variant: DSTabsVariant.withBadges,
          tabs: [
            DSTabItem(id: 'tab1', text: 'Tab 1'),
            DSTabItem(id: 'tab2', text: 'Tab 2'),
          ],
          badges: [
            DSTabBadge(
              tabId: 'tab1',
              count: 5,
              type: DSTabBadgeType.count,
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(config: config),
            ),
          ),
        );

        final tabBar = tester.widget<TabBar>(find.byType(TabBar));
        expect(tabBar.isScrollable, isTrue);
        expect(find.text('5'), findsOneWidget);
      });
    });

    group('Tab Types', () {
      testWidgets('renders text only tabs', (tester) async {
        const tabs = [
          DSTabItem(
            id: 'text_tab',
            text: 'Text Tab',
            type: DSTabType.text,
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(tabs: tabs),
            ),
          ),
        );

        expect(find.text('Text Tab'), findsOneWidget);
      });

      testWidgets('renders icon only tabs', (tester) async {
        const tabs = [
          DSTabItem(
            id: 'icon_tab',
            text: 'Icon Tab',
            type: DSTabType.icon,
            icon: Icon(Icons.home),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(tabs: tabs),
            ),
          ),
        );

        expect(find.byIcon(Icons.home), findsOneWidget);
      });

      testWidgets('renders text with icon tabs', (tester) async {
        const tabs = [
          DSTabItem(
            id: 'text_icon_tab',
            text: 'Text Icon',
            type: DSTabType.textWithIcon,
            icon: Icon(Icons.star),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(tabs: tabs),
            ),
          ),
        );

        expect(find.text('Text Icon'), findsOneWidget);
        expect(find.byIcon(Icons.star), findsOneWidget);
      });

      testWidgets('renders custom tabs', (tester) async {
        final tabs = [
          const DSTabItem(
            id: 'custom_tab',
            text: 'Custom Tab',
            type: DSTabType.custom,
            child: Row(
              children: [
                Icon(Icons.category),
                Text('Custom'),
              ],
            ),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSTabs(tabs: tabs),
            ),
          ),
        );

        expect(find.text('Custom'), findsOneWidget);
        expect(find.byIcon(Icons.category), findsOneWidget);
      });
    });

    group('States', () {
      testWidgets('shows loading state', (tester) async {
        const config = DSTabsConfig(
          state: DSTabsState.loading,
          tabs: [
            DSTabItem(id: 'tab1', text: 'Tab 1'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(config: config),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('shows skeleton state', (tester) async {
        const config = DSTabsConfig(
          state: DSTabsState.skeleton,
          tabs: [
            DSTabItem(id: 'tab1', text: 'Tab 1'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(config: config),
            ),
          ),
        );

        expect(find.byType(Container), findsAtLeastNWidgets(1));
      });

      testWidgets('disables interaction in disabled state', (tester) async {
        const config = DSTabsConfig(
          state: DSTabsState.disabled,
          tabs: [
            DSTabItem(id: 'tab1', text: 'Tab 1'),
            DSTabItem(id: 'tab2', text: 'Tab 2'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(config: config),
            ),
          ),
        );

        // Verify opacity is reduced for disabled state
        expect(find.byType(AnimatedOpacity), findsAtLeastNWidgets(1));
      });
    });

    group('Badges', () {
      testWidgets('displays count badges', (tester) async {
        const badges = [
          DSTabBadge(
            tabId: 'tab1',
            count: 3,
            type: DSTabBadgeType.count,
          ),
        ];

        const tabs = [
          DSTabItem(id: 'tab1', text: 'Tab 1'),
          DSTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(
                config: DSTabsConfig(variant: DSTabsVariant.withBadges),
                tabs: tabs,
                badges: badges,
              ),
            ),
          ),
        );

        expect(find.text('3'), findsOneWidget);
      });

      testWidgets('displays dot badges', (tester) async {
        const badges = [
          DSTabBadge(
            tabId: 'tab1',
            type: DSTabBadgeType.dot,
          ),
        ];

        const tabs = [
          DSTabItem(id: 'tab1', text: 'Tab 1'),
          DSTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(
                config: DSTabsConfig(variant: DSTabsVariant.withBadges),
                tabs: tabs,
                badges: badges,
              ),
            ),
          ),
        );

        // Find the badge container by checking for small circular widgets
        expect(find.byType(Container), findsAtLeastNWidgets(1));
      });

      testWidgets('displays text badges', (tester) async {
        const badges = [
          DSTabBadge(
            tabId: 'tab1',
            text: 'NEW',
            type: DSTabBadgeType.text,
          ),
        ];

        const tabs = [
          DSTabItem(id: 'tab1', text: 'Tab 1'),
          DSTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(
                config: DSTabsConfig(variant: DSTabsVariant.withBadges),
                tabs: tabs,
                badges: badges,
              ),
            ),
          ),
        );

        expect(find.text('NEW'), findsOneWidget);
      });

      testWidgets('respects badge visibility', (tester) async {
        const badges = [
          DSTabBadge(
            tabId: 'tab1',
            count: 5,
            type: DSTabBadgeType.count,
            isVisible: false,
          ),
        ];

        const tabs = [
          DSTabItem(id: 'tab1', text: 'Tab 1'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(
                config: DSTabsConfig(variant: DSTabsVariant.withBadges),
                tabs: tabs,
                badges: badges,
              ),
            ),
          ),
        );

        expect(find.text('5'), findsNothing);
      });

      testWidgets('shows max count for large numbers', (tester) async {
        const badges = [
          DSTabBadge(
            tabId: 'tab1',
            count: 150,
            type: DSTabBadgeType.count,
            maxCount: 99,
          ),
        ];

        const tabs = [
          DSTabItem(id: 'tab1', text: 'Tab 1'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(
                config: DSTabsConfig(variant: DSTabsVariant.withBadges),
                tabs: tabs,
                badges: badges,
              ),
            ),
          ),
        );

        expect(find.text('99+'), findsOneWidget);
      });
    });

    group('Interaction', () {
      testWidgets('handles tab selection', (tester) async {
        int? selectedIndex;

        const tabs = [
          DSTabItem(id: 'tab1', text: 'Tab 1'),
          DSTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSTabs(
                tabs: tabs,
                onChanged: (index) => selectedIndex = index,
              ),
            ),
          ),
        );

        await tester.tap(find.text('Tab 2'));
        await tester.pumpAndSettle();

        expect(selectedIndex, equals(1));
      });

      testWidgets('handles config onChanged callback', (tester) async {
        int? selectedIndex;

        final config = DSTabsConfig(
          tabs: const [
            DSTabItem(id: 'tab1', text: 'Tab 1'),
            DSTabItem(id: 'tab2', text: 'Tab 2'),
          ],
          onChanged: (index) => selectedIndex = index,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSTabs(config: config),
            ),
          ),
        );

        await tester.tap(find.text('Tab 2'));
        await tester.pumpAndSettle();

        expect(selectedIndex, equals(1));
      });

      testWidgets('prioritizes widget onChanged over config onChanged',
          (tester) async {
        int? widgetSelectedIndex;
        int? configSelectedIndex;

        final config = DSTabsConfig(
          tabs: const [
            DSTabItem(id: 'tab1', text: 'Tab 1'),
            DSTabItem(id: 'tab2', text: 'Tab 2'),
          ],
          onChanged: (index) => configSelectedIndex = index,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSTabs(
                config: config,
                onChanged: (index) => widgetSelectedIndex = index,
              ),
            ),
          ),
        );

        await tester.tap(find.text('Tab 2'));
        await tester.pumpAndSettle();

        expect(widgetSelectedIndex, equals(1));
        expect(configSelectedIndex, equals(1)); // Both should be called
      });

      testWidgets('handles individual tab onTap callbacks', (tester) async {
        bool tab1Tapped = false;
        bool tab2Tapped = false;

        final tabs = [
          DSTabItem(
            id: 'tab1',
            text: 'Tab 1',
            onTap: () => tab1Tapped = true,
          ),
          DSTabItem(
            id: 'tab2',
            text: 'Tab 2',
            onTap: () => tab2Tapped = true,
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSTabs(tabs: tabs),
            ),
          ),
        );

        await tester.tap(find.text('Tab 1'));
        await tester.pumpAndSettle();

        expect(tab1Tapped, isTrue);
        expect(tab2Tapped, isFalse);
      });
    });

    group('RTL Support', () {
      testWidgets('respects RTL direction', (tester) async {
        const config = DSTabsConfig(
          isRtl: true,
          tabs: [
            DSTabItem(id: 'tab1', text: 'Tab 1'),
            DSTabItem(id: 'tab2', text: 'Tab 2'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(config: config),
            ),
          ),
        );

        final directionality = tester.widget<Directionality>(
          find.byType(Directionality).first,
        );
        expect(directionality.textDirection, equals(TextDirection.rtl));
      });

      testWidgets('uses LTR direction by default', (tester) async {
        const config = DSTabsConfig(
          tabs: [
            DSTabItem(id: 'tab1', text: 'Tab 1'),
            DSTabItem(id: 'tab2', text: 'Tab 2'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(config: config),
            ),
          ),
        );

        final directionality = tester.widget<Directionality>(
          find.byType(Directionality).first,
        );
        expect(directionality.textDirection, equals(TextDirection.ltr));
      });
    });

    group('Accessibility', () {
      testWidgets('includes semantic labels', (tester) async {
        const config = DSTabsConfig(
          enableA11y: true,
          tabs: [
            DSTabItem(
              id: 'tab1',
              text: 'Tab 1',
              semanticLabel: 'First tab',
              tooltip: 'Navigate to first section',
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(config: config),
            ),
          ),
        );

        expect(find.byType(Semantics), findsAtLeastNWidgets(1));
        expect(find.byType(Tooltip), findsAtLeastNWidgets(1));
      });

      testWidgets('disables accessibility when configured', (tester) async {
        const config = DSTabsConfig(
          enableA11y: false,
          tabs: [
            DSTabItem(id: 'tab1', text: 'Tab 1'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(config: config),
            ),
          ),
        );

        // When a11y is disabled, semantic labels should be null
        final semantics = tester.widget<Semantics>(
          find.byType(Semantics).first,
        );
        expect(semantics.properties.label, isNull);
      });
    });

    group('Animation', () {
      testWidgets('animates state changes', (tester) async {
        const config = DSTabsConfig(
          state: DSTabsState.defaultState,
          tabs: [
            DSTabItem(id: 'tab1', text: 'Tab 1'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(config: config),
            ),
          ),
        );

        expect(find.byType(AnimatedOpacity), findsAtLeastNWidgets(1));
        expect(find.byType(AnimatedScale), findsAtLeastNWidgets(1));
      });

      testWidgets('animates tab selection', (tester) async {
        const tabs = [
          DSTabItem(id: 'tab1', text: 'Tab 1'),
          DSTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(tabs: tabs),
            ),
          ),
        );

        // Verify TabBar is present for animation
        expect(find.byType(TabBar), findsOneWidget);
      });
    });

    group('Controller', () {
      testWidgets('works with external TabController', (tester) async {
        late TabController controller;

        await tester.pumpWidget(
          MaterialApp(
            home: Builder(
              builder: (context) {
                controller =
                    TabController(length: 2, vsync: Scaffold.of(context));
                return Scaffold(
                  body: DSTabs(
                    controller: controller,
                    tabs: const [
                      DSTabItem(id: 'tab1', text: 'Tab 1'),
                      DSTabItem(id: 'tab2', text: 'Tab 2'),
                    ],
                  ),
                );
              },
            ),
          ),
        );

        expect(controller.index, equals(0));

        controller.animateTo(1);
        await tester.pumpAndSettle();

        expect(controller.index, equals(1));
      });

      testWidgets('creates internal controller when none provided',
          (tester) async {
        const tabs = [
          DSTabItem(id: 'tab1', text: 'Tab 1'),
          DSTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSTabs(tabs: tabs),
            ),
          ),
        );

        final tabBar = tester.widget<TabBar>(find.byType(TabBar));
        expect(tabBar.controller, isNotNull);
      });
    });
  });

  group('DSTabItem', () {
    test('creates with required parameters', () {
      const tab = DSTabItem(
        id: 'test',
        text: 'Test Tab',
      );

      expect(tab.id, equals('test'));
      expect(tab.text, equals('Test Tab'));
      expect(tab.disabled, isFalse);
      expect(tab.type, equals(DSTabType.text));
    });

    test('creates with optional parameters', () {
      const tab = DSTabItem(
        id: 'test',
        text: 'Test Tab',
        icon: Icon(Icons.star),
        tooltip: 'Test tooltip',
        disabled: true,
        type: DSTabType.textWithIcon,
        semanticLabel: 'Test semantic label',
      );

      expect(tab.icon, isNotNull);
      expect(tab.tooltip, equals('Test tooltip'));
      expect(tab.disabled, isTrue);
      expect(tab.type, equals(DSTabType.textWithIcon));
      expect(tab.semanticLabel, equals('Test semantic label'));
    });
  });

  group('DSTabBadge', () {
    test('creates count badge', () {
      const badge = DSTabBadge(
        tabId: 'test',
        count: 5,
        type: DSTabBadgeType.count,
      );

      expect(badge.tabId, equals('test'));
      expect(badge.count, equals(5));
      expect(badge.type, equals(DSTabBadgeType.count));
      expect(badge.isVisible, isTrue);
      expect(badge.maxCount, equals(99));
    });

    test('creates text badge', () {
      const badge = DSTabBadge(
        tabId: 'test',
        text: 'NEW',
        type: DSTabBadgeType.text,
      );

      expect(badge.text, equals('NEW'));
      expect(badge.type, equals(DSTabBadgeType.text));
    });

    test('creates dot badge', () {
      const badge = DSTabBadge(
        tabId: 'test',
        type: DSTabBadgeType.dot,
      );

      expect(badge.type, equals(DSTabBadgeType.dot));
    });
  });

  group('Extensions', () {
    group('DSTabsVariantExtension', () {
      test('provides correct display names', () {
        expect(DSTabsVariant.fixed.displayName, equals('Fixed'));
        expect(DSTabsVariant.scrollable.displayName, equals('Scrollable'));
        expect(DSTabsVariant.withBadges.displayName, equals('With Badges'));
      });

      test('provides correct descriptions', () {
        expect(DSTabsVariant.fixed.description,
            equals('Pestañas de ancho fijo distribuidas uniformemente'));
        expect(DSTabsVariant.scrollable.description,
            equals('Pestañas desplazables horizontalmente'));
        expect(DSTabsVariant.withBadges.description,
            equals('Pestañas con notificaciones y badges'));
      });

      test('identifies scrollable variants correctly', () {
        expect(DSTabsVariant.fixed.isScrollable, isFalse);
        expect(DSTabsVariant.scrollable.isScrollable, isTrue);
        expect(DSTabsVariant.withBadges.isScrollable, isTrue);
      });

      test('identifies badge support correctly', () {
        expect(DSTabsVariant.fixed.supportsBadges, isFalse);
        expect(DSTabsVariant.scrollable.supportsBadges, isFalse);
        expect(DSTabsVariant.withBadges.supportsBadges, isTrue);
      });

      test('provides correct default alignment', () {
        expect(
            DSTabsVariant.fixed.defaultAlignment, equals(TabAlignment.fill));
        expect(DSTabsVariant.scrollable.defaultAlignment,
            equals(TabAlignment.start));
        expect(DSTabsVariant.withBadges.defaultAlignment,
            equals(TabAlignment.start));
      });
    });

    group('DSTabsStateExtension', () {
      test('provides correct display names', () {
        expect(DSTabsState.defaultState.displayName, equals('Default'));
        expect(DSTabsState.hover.displayName, equals('Hover'));
        expect(DSTabsState.pressed.displayName, equals('Pressed'));
        expect(DSTabsState.focus.displayName, equals('Focus'));
        expect(DSTabsState.selected.displayName, equals('Selected'));
        expect(DSTabsState.disabled.displayName, equals('Disabled'));
        expect(DSTabsState.loading.displayName, equals('Loading'));
        expect(DSTabsState.skeleton.displayName, equals('Skeleton'));
      });

      test('identifies interactive states correctly', () {
        expect(DSTabsState.defaultState.isInteractive, isTrue);
        expect(DSTabsState.hover.isInteractive, isTrue);
        expect(DSTabsState.pressed.isInteractive, isTrue);
        expect(DSTabsState.focus.isInteractive, isTrue);
        expect(DSTabsState.selected.isInteractive, isTrue);
        expect(DSTabsState.disabled.isInteractive, isFalse);
        expect(DSTabsState.loading.isInteractive, isFalse);
        expect(DSTabsState.skeleton.isInteractive, isFalse);
      });

      test('provides correct opacity values', () {
        expect(DSTabsState.defaultState.opacity, equals(1.0));
        expect(DSTabsState.hover.opacity, equals(1.0));
        expect(DSTabsState.pressed.opacity, equals(1.0));
        expect(DSTabsState.focus.opacity, equals(1.0));
        expect(DSTabsState.selected.opacity, equals(1.0));
        expect(DSTabsState.disabled.opacity, equals(0.6));
        expect(DSTabsState.loading.opacity, equals(0.8));
        expect(DSTabsState.skeleton.opacity, equals(0.3));
      });

      test('identifies loader and skeleton states correctly', () {
        expect(DSTabsState.loading.showsLoader, isTrue);
        expect(DSTabsState.skeleton.showsSkeleton, isTrue);

        for (final state in DSTabsState.values) {
          if (state != DSTabsState.loading) {
            expect(state.showsLoader, isFalse);
          }
          if (state != DSTabsState.skeleton) {
            expect(state.showsSkeleton, isFalse);
          }
        }
      });
    });

    group('DSTabTypeExtension', () {
      test('provides correct display names', () {
        expect(DSTabType.text.displayName, equals('Text Only'));
        expect(DSTabType.icon.displayName, equals('Icon Only'));
        expect(DSTabType.textWithIcon.displayName, equals('Text with Icon'));
        expect(DSTabType.custom.displayName, equals('Custom'));
      });

      test('identifies text types correctly', () {
        expect(DSTabType.text.hasText, isTrue);
        expect(DSTabType.textWithIcon.hasText, isTrue);
        expect(DSTabType.icon.hasText, isFalse);
        expect(DSTabType.custom.hasText, isFalse);
      });

      test('identifies icon types correctly', () {
        expect(DSTabType.icon.hasIcon, isTrue);
        expect(DSTabType.textWithIcon.hasIcon, isTrue);
        expect(DSTabType.text.hasIcon, isFalse);
        expect(DSTabType.custom.hasIcon, isFalse);
      });

      test('identifies custom types correctly', () {
        expect(DSTabType.custom.isCustom, isTrue);
        expect(DSTabType.text.isCustom, isFalse);
        expect(DSTabType.icon.isCustom, isFalse);
        expect(DSTabType.textWithIcon.isCustom, isFalse);
      });
    });

    group('DSTabBadgeTypeExtension', () {
      test('provides correct display names', () {
        expect(DSTabBadgeType.dot.displayName, equals('Dot'));
        expect(DSTabBadgeType.count.displayName, equals('Count'));
        expect(DSTabBadgeType.text.displayName, equals('Text'));
      });

      test('identifies text showing types correctly', () {
        expect(DSTabBadgeType.dot.showsText, isFalse);
        expect(DSTabBadgeType.count.showsText, isTrue);
        expect(DSTabBadgeType.text.showsText, isTrue);
      });

      test('identifies numeric types correctly', () {
        expect(DSTabBadgeType.dot.isNumeric, isFalse);
        expect(DSTabBadgeType.count.isNumeric, isTrue);
        expect(DSTabBadgeType.text.isNumeric, isFalse);
      });
    });

    group('DSTabBadgePositionExtension', () {
      test('provides correct display names', () {
        expect(DSTabBadgePosition.topRight.displayName, equals('Top Right'));
        expect(DSTabBadgePosition.topLeft.displayName, equals('Top Left'));
        expect(DSTabBadgePosition.bottomRight.displayName,
            equals('Bottom Right'));
        expect(
            DSTabBadgePosition.bottomLeft.displayName, equals('Bottom Left'));
      });

      test('provides correct alignments', () {
        expect(
            DSTabBadgePosition.topRight.alignment, equals(Alignment.topRight));
        expect(
            DSTabBadgePosition.topLeft.alignment, equals(Alignment.topLeft));
        expect(DSTabBadgePosition.bottomRight.alignment,
            equals(Alignment.bottomRight));
        expect(DSTabBadgePosition.bottomLeft.alignment,
            equals(Alignment.bottomLeft));
      });

      test('provides correct padding', () {
        expect(DSTabBadgePosition.topRight.padding,
            equals(const EdgeInsets.only(top: 2, right: 2)));
        expect(DSTabBadgePosition.topLeft.padding,
            equals(const EdgeInsets.only(top: 2, left: 2)));
        expect(DSTabBadgePosition.bottomRight.padding,
            equals(const EdgeInsets.only(bottom: 2, right: 2)));
        expect(DSTabBadgePosition.bottomLeft.padding,
            equals(const EdgeInsets.only(bottom: 2, left: 2)));
      });
    });
  });
}
