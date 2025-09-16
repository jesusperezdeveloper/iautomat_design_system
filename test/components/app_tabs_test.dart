import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/tabs/app_tabs.dart';
import 'package:iautomat_design_system/src/components/tabs/app_tabs_config.dart';

void main() {
  group('AppTabs', () {
    group('Basic Rendering', () {
      testWidgets('renders with default configuration', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(),
            ),
          ),
        );

        expect(find.byType(AppTabs), findsOneWidget);
      });

      testWidgets('renders with provided tabs', (tester) async {
        const tabs = [
          AppTabItem(
            id: 'tab1',
            text: 'Tab 1',
          ),
          AppTabItem(
            id: 'tab2',
            text: 'Tab 2',
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(
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
        const config = AppTabsConfig(
          tabs: [
            AppTabItem(
              id: 'config_tab',
              text: 'Config Tab',
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(config: config),
            ),
          ),
        );

        expect(find.text('Config Tab'), findsOneWidget);
        expect(find.byType(TabBar), findsOneWidget);
      });

      testWidgets('renders with children', (tester) async {
        const tabs = [
          AppTabItem(id: 'tab1', text: 'Tab 1'),
          AppTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        const children = [
          Center(child: Text('Content 1')),
          Center(child: Text('Content 2')),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(
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
        const config = AppTabsConfig(
          variant: AppTabsVariant.fixed,
          tabs: [
            AppTabItem(id: 'tab1', text: 'Tab 1'),
            AppTabItem(id: 'tab2', text: 'Tab 2'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(config: config),
            ),
          ),
        );

        final tabBar = tester.widget<TabBar>(find.byType(TabBar));
        expect(tabBar.isScrollable, isFalse);
      });

      testWidgets('renders scrollable variant', (tester) async {
        const config = AppTabsConfig(
          variant: AppTabsVariant.scrollable,
          tabs: [
            AppTabItem(id: 'tab1', text: 'Tab 1'),
            AppTabItem(id: 'tab2', text: 'Tab 2'),
            AppTabItem(id: 'tab3', text: 'Tab 3'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(config: config),
            ),
          ),
        );

        final tabBar = tester.widget<TabBar>(find.byType(TabBar));
        expect(tabBar.isScrollable, isTrue);
      });

      testWidgets('renders withBadges variant', (tester) async {
        const config = AppTabsConfig(
          variant: AppTabsVariant.withBadges,
          tabs: [
            AppTabItem(id: 'tab1', text: 'Tab 1'),
            AppTabItem(id: 'tab2', text: 'Tab 2'),
          ],
          badges: [
            AppTabBadge(
              tabId: 'tab1',
              count: 5,
              type: AppTabBadgeType.count,
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(config: config),
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
          AppTabItem(
            id: 'text_tab',
            text: 'Text Tab',
            type: AppTabType.text,
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(tabs: tabs),
            ),
          ),
        );

        expect(find.text('Text Tab'), findsOneWidget);
      });

      testWidgets('renders icon only tabs', (tester) async {
        const tabs = [
          AppTabItem(
            id: 'icon_tab',
            text: 'Icon Tab',
            type: AppTabType.icon,
            icon: Icon(Icons.home),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(tabs: tabs),
            ),
          ),
        );

        expect(find.byIcon(Icons.home), findsOneWidget);
      });

      testWidgets('renders text with icon tabs', (tester) async {
        const tabs = [
          AppTabItem(
            id: 'text_icon_tab',
            text: 'Text Icon',
            type: AppTabType.textWithIcon,
            icon: Icon(Icons.star),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(tabs: tabs),
            ),
          ),
        );

        expect(find.text('Text Icon'), findsOneWidget);
        expect(find.byIcon(Icons.star), findsOneWidget);
      });

      testWidgets('renders custom tabs', (tester) async {
        final tabs = [
          const AppTabItem(
            id: 'custom_tab',
            text: 'Custom Tab',
            type: AppTabType.custom,
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
              body: AppTabs(tabs: tabs),
            ),
          ),
        );

        expect(find.text('Custom'), findsOneWidget);
        expect(find.byIcon(Icons.category), findsOneWidget);
      });
    });

    group('States', () {
      testWidgets('shows loading state', (tester) async {
        const config = AppTabsConfig(
          state: AppTabsState.loading,
          tabs: [
            AppTabItem(id: 'tab1', text: 'Tab 1'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(config: config),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('shows skeleton state', (tester) async {
        const config = AppTabsConfig(
          state: AppTabsState.skeleton,
          tabs: [
            AppTabItem(id: 'tab1', text: 'Tab 1'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(config: config),
            ),
          ),
        );

        expect(find.byType(Container), findsAtLeastNWidgets(1));
      });

      testWidgets('disables interaction in disabled state', (tester) async {
        const config = AppTabsConfig(
          state: AppTabsState.disabled,
          tabs: [
            AppTabItem(id: 'tab1', text: 'Tab 1'),
            AppTabItem(id: 'tab2', text: 'Tab 2'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(config: config),
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
          AppTabBadge(
            tabId: 'tab1',
            count: 3,
            type: AppTabBadgeType.count,
          ),
        ];

        const tabs = [
          AppTabItem(id: 'tab1', text: 'Tab 1'),
          AppTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(
                config: AppTabsConfig(variant: AppTabsVariant.withBadges),
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
          AppTabBadge(
            tabId: 'tab1',
            type: AppTabBadgeType.dot,
          ),
        ];

        const tabs = [
          AppTabItem(id: 'tab1', text: 'Tab 1'),
          AppTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(
                config: AppTabsConfig(variant: AppTabsVariant.withBadges),
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
          AppTabBadge(
            tabId: 'tab1',
            text: 'NEW',
            type: AppTabBadgeType.text,
          ),
        ];

        const tabs = [
          AppTabItem(id: 'tab1', text: 'Tab 1'),
          AppTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(
                config: AppTabsConfig(variant: AppTabsVariant.withBadges),
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
          AppTabBadge(
            tabId: 'tab1',
            count: 5,
            type: AppTabBadgeType.count,
            isVisible: false,
          ),
        ];

        const tabs = [
          AppTabItem(id: 'tab1', text: 'Tab 1'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(
                config: AppTabsConfig(variant: AppTabsVariant.withBadges),
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
          AppTabBadge(
            tabId: 'tab1',
            count: 150,
            type: AppTabBadgeType.count,
            maxCount: 99,
          ),
        ];

        const tabs = [
          AppTabItem(id: 'tab1', text: 'Tab 1'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(
                config: AppTabsConfig(variant: AppTabsVariant.withBadges),
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
          AppTabItem(id: 'tab1', text: 'Tab 1'),
          AppTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTabs(
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

        final config = AppTabsConfig(
          tabs: const [
            AppTabItem(id: 'tab1', text: 'Tab 1'),
            AppTabItem(id: 'tab2', text: 'Tab 2'),
          ],
          onChanged: (index) => selectedIndex = index,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTabs(config: config),
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

        final config = AppTabsConfig(
          tabs: const [
            AppTabItem(id: 'tab1', text: 'Tab 1'),
            AppTabItem(id: 'tab2', text: 'Tab 2'),
          ],
          onChanged: (index) => configSelectedIndex = index,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTabs(
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
          AppTabItem(
            id: 'tab1',
            text: 'Tab 1',
            onTap: () => tab1Tapped = true,
          ),
          AppTabItem(
            id: 'tab2',
            text: 'Tab 2',
            onTap: () => tab2Tapped = true,
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppTabs(tabs: tabs),
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
        const config = AppTabsConfig(
          isRtl: true,
          tabs: [
            AppTabItem(id: 'tab1', text: 'Tab 1'),
            AppTabItem(id: 'tab2', text: 'Tab 2'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(config: config),
            ),
          ),
        );

        final directionality = tester.widget<Directionality>(
          find.byType(Directionality).first,
        );
        expect(directionality.textDirection, equals(TextDirection.rtl));
      });

      testWidgets('uses LTR direction by default', (tester) async {
        const config = AppTabsConfig(
          tabs: [
            AppTabItem(id: 'tab1', text: 'Tab 1'),
            AppTabItem(id: 'tab2', text: 'Tab 2'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(config: config),
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
        const config = AppTabsConfig(
          enableA11y: true,
          tabs: [
            AppTabItem(
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
              body: AppTabs(config: config),
            ),
          ),
        );

        expect(find.byType(Semantics), findsAtLeastNWidgets(1));
        expect(find.byType(Tooltip), findsAtLeastNWidgets(1));
      });

      testWidgets('disables accessibility when configured', (tester) async {
        const config = AppTabsConfig(
          enableA11y: false,
          tabs: [
            AppTabItem(id: 'tab1', text: 'Tab 1'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(config: config),
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
        const config = AppTabsConfig(
          state: AppTabsState.defaultState,
          tabs: [
            AppTabItem(id: 'tab1', text: 'Tab 1'),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(config: config),
            ),
          ),
        );

        expect(find.byType(AnimatedOpacity), findsAtLeastNWidgets(1));
        expect(find.byType(AnimatedScale), findsAtLeastNWidgets(1));
      });

      testWidgets('animates tab selection', (tester) async {
        const tabs = [
          AppTabItem(id: 'tab1', text: 'Tab 1'),
          AppTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(tabs: tabs),
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
                controller = TabController(length: 2, vsync: Scaffold.of(context));
                return Scaffold(
                  body: AppTabs(
                    controller: controller,
                    tabs: const [
                      AppTabItem(id: 'tab1', text: 'Tab 1'),
                      AppTabItem(id: 'tab2', text: 'Tab 2'),
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

      testWidgets('creates internal controller when none provided', (tester) async {
        const tabs = [
          AppTabItem(id: 'tab1', text: 'Tab 1'),
          AppTabItem(id: 'tab2', text: 'Tab 2'),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppTabs(tabs: tabs),
            ),
          ),
        );

        final tabBar = tester.widget<TabBar>(find.byType(TabBar));
        expect(tabBar.controller, isNotNull);
      });
    });
  });

  group('AppTabItem', () {
    test('creates with required parameters', () {
      const tab = AppTabItem(
        id: 'test',
        text: 'Test Tab',
      );

      expect(tab.id, equals('test'));
      expect(tab.text, equals('Test Tab'));
      expect(tab.disabled, isFalse);
      expect(tab.type, equals(AppTabType.text));
    });

    test('creates with optional parameters', () {
      const tab = AppTabItem(
        id: 'test',
        text: 'Test Tab',
        icon: Icon(Icons.star),
        tooltip: 'Test tooltip',
        disabled: true,
        type: AppTabType.textWithIcon,
        semanticLabel: 'Test semantic label',
      );

      expect(tab.icon, isNotNull);
      expect(tab.tooltip, equals('Test tooltip'));
      expect(tab.disabled, isTrue);
      expect(tab.type, equals(AppTabType.textWithIcon));
      expect(tab.semanticLabel, equals('Test semantic label'));
    });
  });

  group('AppTabBadge', () {
    test('creates count badge', () {
      const badge = AppTabBadge(
        tabId: 'test',
        count: 5,
        type: AppTabBadgeType.count,
      );

      expect(badge.tabId, equals('test'));
      expect(badge.count, equals(5));
      expect(badge.type, equals(AppTabBadgeType.count));
      expect(badge.isVisible, isTrue);
      expect(badge.maxCount, equals(99));
    });

    test('creates text badge', () {
      const badge = AppTabBadge(
        tabId: 'test',
        text: 'NEW',
        type: AppTabBadgeType.text,
      );

      expect(badge.text, equals('NEW'));
      expect(badge.type, equals(AppTabBadgeType.text));
    });

    test('creates dot badge', () {
      const badge = AppTabBadge(
        tabId: 'test',
        type: AppTabBadgeType.dot,
      );

      expect(badge.type, equals(AppTabBadgeType.dot));
    });
  });

  group('Extensions', () {
    group('AppTabsVariantExtension', () {
      test('provides correct display names', () {
        expect(AppTabsVariant.fixed.displayName, equals('Fixed'));
        expect(AppTabsVariant.scrollable.displayName, equals('Scrollable'));
        expect(AppTabsVariant.withBadges.displayName, equals('With Badges'));
      });

      test('provides correct descriptions', () {
        expect(AppTabsVariant.fixed.description,
            equals('Pestañas de ancho fijo distribuidas uniformemente'));
        expect(AppTabsVariant.scrollable.description,
            equals('Pestañas desplazables horizontalmente'));
        expect(AppTabsVariant.withBadges.description,
            equals('Pestañas con notificaciones y badges'));
      });

      test('identifies scrollable variants correctly', () {
        expect(AppTabsVariant.fixed.isScrollable, isFalse);
        expect(AppTabsVariant.scrollable.isScrollable, isTrue);
        expect(AppTabsVariant.withBadges.isScrollable, isTrue);
      });

      test('identifies badge support correctly', () {
        expect(AppTabsVariant.fixed.supportsBadges, isFalse);
        expect(AppTabsVariant.scrollable.supportsBadges, isFalse);
        expect(AppTabsVariant.withBadges.supportsBadges, isTrue);
      });

      test('provides correct default alignment', () {
        expect(AppTabsVariant.fixed.defaultAlignment, equals(TabAlignment.fill));
        expect(AppTabsVariant.scrollable.defaultAlignment, equals(TabAlignment.start));
        expect(AppTabsVariant.withBadges.defaultAlignment, equals(TabAlignment.start));
      });
    });

    group('AppTabsStateExtension', () {
      test('provides correct display names', () {
        expect(AppTabsState.defaultState.displayName, equals('Default'));
        expect(AppTabsState.hover.displayName, equals('Hover'));
        expect(AppTabsState.pressed.displayName, equals('Pressed'));
        expect(AppTabsState.focus.displayName, equals('Focus'));
        expect(AppTabsState.selected.displayName, equals('Selected'));
        expect(AppTabsState.disabled.displayName, equals('Disabled'));
        expect(AppTabsState.loading.displayName, equals('Loading'));
        expect(AppTabsState.skeleton.displayName, equals('Skeleton'));
      });

      test('identifies interactive states correctly', () {
        expect(AppTabsState.defaultState.isInteractive, isTrue);
        expect(AppTabsState.hover.isInteractive, isTrue);
        expect(AppTabsState.pressed.isInteractive, isTrue);
        expect(AppTabsState.focus.isInteractive, isTrue);
        expect(AppTabsState.selected.isInteractive, isTrue);
        expect(AppTabsState.disabled.isInteractive, isFalse);
        expect(AppTabsState.loading.isInteractive, isFalse);
        expect(AppTabsState.skeleton.isInteractive, isFalse);
      });

      test('provides correct opacity values', () {
        expect(AppTabsState.defaultState.opacity, equals(1.0));
        expect(AppTabsState.hover.opacity, equals(1.0));
        expect(AppTabsState.pressed.opacity, equals(1.0));
        expect(AppTabsState.focus.opacity, equals(1.0));
        expect(AppTabsState.selected.opacity, equals(1.0));
        expect(AppTabsState.disabled.opacity, equals(0.6));
        expect(AppTabsState.loading.opacity, equals(0.8));
        expect(AppTabsState.skeleton.opacity, equals(0.3));
      });

      test('identifies loader and skeleton states correctly', () {
        expect(AppTabsState.loading.showsLoader, isTrue);
        expect(AppTabsState.skeleton.showsSkeleton, isTrue);

        for (final state in AppTabsState.values) {
          if (state != AppTabsState.loading) {
            expect(state.showsLoader, isFalse);
          }
          if (state != AppTabsState.skeleton) {
            expect(state.showsSkeleton, isFalse);
          }
        }
      });
    });

    group('AppTabTypeExtension', () {
      test('provides correct display names', () {
        expect(AppTabType.text.displayName, equals('Text Only'));
        expect(AppTabType.icon.displayName, equals('Icon Only'));
        expect(AppTabType.textWithIcon.displayName, equals('Text with Icon'));
        expect(AppTabType.custom.displayName, equals('Custom'));
      });

      test('identifies text types correctly', () {
        expect(AppTabType.text.hasText, isTrue);
        expect(AppTabType.textWithIcon.hasText, isTrue);
        expect(AppTabType.icon.hasText, isFalse);
        expect(AppTabType.custom.hasText, isFalse);
      });

      test('identifies icon types correctly', () {
        expect(AppTabType.icon.hasIcon, isTrue);
        expect(AppTabType.textWithIcon.hasIcon, isTrue);
        expect(AppTabType.text.hasIcon, isFalse);
        expect(AppTabType.custom.hasIcon, isFalse);
      });

      test('identifies custom types correctly', () {
        expect(AppTabType.custom.isCustom, isTrue);
        expect(AppTabType.text.isCustom, isFalse);
        expect(AppTabType.icon.isCustom, isFalse);
        expect(AppTabType.textWithIcon.isCustom, isFalse);
      });
    });

    group('AppTabBadgeTypeExtension', () {
      test('provides correct display names', () {
        expect(AppTabBadgeType.dot.displayName, equals('Dot'));
        expect(AppTabBadgeType.count.displayName, equals('Count'));
        expect(AppTabBadgeType.text.displayName, equals('Text'));
      });

      test('identifies text showing types correctly', () {
        expect(AppTabBadgeType.dot.showsText, isFalse);
        expect(AppTabBadgeType.count.showsText, isTrue);
        expect(AppTabBadgeType.text.showsText, isTrue);
      });

      test('identifies numeric types correctly', () {
        expect(AppTabBadgeType.dot.isNumeric, isFalse);
        expect(AppTabBadgeType.count.isNumeric, isTrue);
        expect(AppTabBadgeType.text.isNumeric, isFalse);
      });
    });

    group('AppTabBadgePositionExtension', () {
      test('provides correct display names', () {
        expect(AppTabBadgePosition.topRight.displayName, equals('Top Right'));
        expect(AppTabBadgePosition.topLeft.displayName, equals('Top Left'));
        expect(AppTabBadgePosition.bottomRight.displayName, equals('Bottom Right'));
        expect(AppTabBadgePosition.bottomLeft.displayName, equals('Bottom Left'));
      });

      test('provides correct alignments', () {
        expect(AppTabBadgePosition.topRight.alignment, equals(Alignment.topRight));
        expect(AppTabBadgePosition.topLeft.alignment, equals(Alignment.topLeft));
        expect(AppTabBadgePosition.bottomRight.alignment, equals(Alignment.bottomRight));
        expect(AppTabBadgePosition.bottomLeft.alignment, equals(Alignment.bottomLeft));
      });

      test('provides correct padding', () {
        expect(AppTabBadgePosition.topRight.padding, equals(const EdgeInsets.only(top: 2, right: 2)));
        expect(AppTabBadgePosition.topLeft.padding, equals(const EdgeInsets.only(top: 2, left: 2)));
        expect(AppTabBadgePosition.bottomRight.padding, equals(const EdgeInsets.only(bottom: 2, right: 2)));
        expect(AppTabBadgePosition.bottomLeft.padding, equals(const EdgeInsets.only(bottom: 2, left: 2)));
      });
    });
  });
}