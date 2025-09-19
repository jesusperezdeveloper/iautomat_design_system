import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/navigation/app_navigation.dart';
import 'package:iautomat_design_system/src/components/navigation/app_navigation_config.dart';

void main() {
  group('DSNavigation', () {
    group('Basic Rendering', () {
      testWidgets('renders with default configuration', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(),
            ),
          ),
        );

        expect(find.byType(DSNavigation), findsOneWidget);
      });

      testWidgets('renders with destinations', (tester) async {
        const destinations = [
          DSNavigationDestination(
            id: 'home',
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          DSNavigationDestination(
            id: 'search',
            label: 'Search',
            icon: Icon(Icons.search),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(
                destinations: destinations,
              ),
            ),
          ),
        );

        expect(find.text('Home'), findsOneWidget);
        expect(find.text('Search'), findsOneWidget);
        expect(find.byIcon(Icons.home), findsOneWidget);
        expect(find.byIcon(Icons.search), findsOneWidget);
      });

      testWidgets('renders with config destinations', (tester) async {
        const config = DSNavigationComponentConfig(
          destinations: [
            DSNavigationDestination(
              id: 'profile',
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        expect(find.text('Profile'), findsOneWidget);
        expect(find.byIcon(Icons.person), findsOneWidget);
      });
    });

    group('Variants', () {
      testWidgets('renders bottom bar variant', (tester) async {
        const config = DSNavigationComponentConfig(
          variant: DSNavigationVariant.bottomBar,
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(NavigationBar), findsOneWidget);
      });

      testWidgets('renders rail variant', (tester) async {
        const config = DSNavigationComponentConfig(
          variant: DSNavigationVariant.rail,
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(NavigationRail), findsOneWidget);
      });

      testWidgets('renders drawer variant', (tester) async {
        const config = DSNavigationComponentConfig(
          variant: DSNavigationVariant.drawer,
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(Drawer), findsOneWidget);
      });

      testWidgets('renders permanent drawer variant', (tester) async {
        const config = DSNavigationComponentConfig(
          variant: DSNavigationVariant.permanentDrawer,
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(Drawer), findsOneWidget);
      });
    });

    group('States', () {
      testWidgets('shows loading state', (tester) async {
        const config = DSNavigationComponentConfig(
          state: DSNavigationState.loading,
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsAtLeastNWidgets(1));
      });

      testWidgets('shows skeleton state', (tester) async {
        const config = DSNavigationComponentConfig(
          state: DSNavigationState.skeleton,
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(Container), findsAtLeastNWidgets(1));
      });

      testWidgets('disables interaction in disabled state', (tester) async {
        const config = DSNavigationComponentConfig(
          state: DSNavigationState.disabled,
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        // Verify that AnimatedOpacity widgets are present for state animation
        expect(find.byType(AnimatedOpacity), findsAtLeastNWidgets(1));
      });
    });

    group('Badges', () {
      testWidgets('displays count badges', (tester) async {
        const badges = [
          DSNavigationBadge(
            destinationId: 'messages',
            count: 3,
            type: DSNavigationBadgeType.count,
          ),
        ];

        const destinations = [
          DSNavigationDestination(
            id: 'messages',
            label: 'Messages',
            icon: Icon(Icons.message),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(
                destinations: destinations,
                badges: badges,
              ),
            ),
          ),
        );

        expect(find.text('3'), findsOneWidget);
        expect(find.byType(Badge), findsOneWidget);
      });

      testWidgets('displays dot badges', (tester) async {
        const badges = [
          DSNavigationBadge(
            destinationId: 'notifications',
            type: DSNavigationBadgeType.dot,
          ),
        ];

        const destinations = [
          DSNavigationDestination(
            id: 'notifications',
            label: 'Notifications',
            icon: Icon(Icons.notifications),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(
                destinations: destinations,
                badges: badges,
              ),
            ),
          ),
        );

        expect(find.byType(Badge), findsOneWidget);
      });

      testWidgets('displays text badges', (tester) async {
        const badges = [
          DSNavigationBadge(
            destinationId: 'alerts',
            text: 'NEW',
            type: DSNavigationBadgeType.text,
          ),
        ];

        const destinations = [
          DSNavigationDestination(
            id: 'alerts',
            label: 'Alerts',
            icon: Icon(Icons.warning),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(
                destinations: destinations,
                badges: badges,
              ),
            ),
          ),
        );

        expect(find.text('NEW'), findsOneWidget);
        expect(find.byType(Badge), findsOneWidget);
      });
    });

    group('Interaction', () {
      testWidgets('handles destination selection', (tester) async {
        int? selectedIndex;

        const destinations = [
          DSNavigationDestination(
            id: 'home',
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          DSNavigationDestination(
            id: 'search',
            label: 'Search',
            icon: Icon(Icons.search),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSNavigation(
                destinations: destinations,
                onDestinationSelected: (index) => selectedIndex = index,
              ),
            ),
          ),
        );

        await tester.tap(find.text('Search'));
        await tester.pumpAndSettle();

        expect(selectedIndex, equals(1));
      });

      testWidgets('handles config onTap callback', (tester) async {
        int? selectedIndex;

        final config = DSNavigationComponentConfig(
          destinations: const [
            DSNavigationDestination(
              id: 'profile',
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
          ],
          onTap: (index) => selectedIndex = index,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        await tester.tap(find.text('Profile'));
        await tester.pumpAndSettle();

        expect(selectedIndex, equals(0));
      });

      testWidgets('prioritizes widget onDestinationSelected over config onTap',
          (tester) async {
        int? widgetSelectedIndex;
        int? configSelectedIndex;

        final config = DSNavigationComponentConfig(
          destinations: const [
            DSNavigationDestination(
              id: 'settings',
              label: 'Settings',
              icon: Icon(Icons.settings),
            ),
          ],
          onTap: (index) => configSelectedIndex = index,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSNavigation(
                config: config,
                onDestinationSelected: (index) => widgetSelectedIndex = index,
              ),
            ),
          ),
        );

        await tester.tap(find.text('Settings'));
        await tester.pumpAndSettle();

        expect(widgetSelectedIndex, equals(0));
        expect(configSelectedIndex,
            isNull); // Config callback should not be called
      });
    });

    group('Current Index', () {
      testWidgets('highlights current index from widget prop', (tester) async {
        const destinations = [
          DSNavigationDestination(
            id: 'home',
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          DSNavigationDestination(
            id: 'search',
            label: 'Search',
            icon: Icon(Icons.search),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(
                destinations: destinations,
                currentIndex: 1,
              ),
            ),
          ),
        );

        // Verify that the NavigationBar shows the correct selection
        final navigationBar = tester.widget<NavigationBar>(
          find.byType(NavigationBar),
        );
        expect(navigationBar.selectedIndex, equals(1));
      });

      testWidgets('highlights current index from config', (tester) async {
        const config = DSNavigationComponentConfig(
          currentIndex: 1,
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        final navigationBar = tester.widget<NavigationBar>(
          find.byType(NavigationBar),
        );
        expect(navigationBar.selectedIndex, equals(1));
      });

      testWidgets('widget currentIndex overrides config currentIndex',
          (tester) async {
        const config = DSNavigationComponentConfig(
          currentIndex: 1,
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(
                config: config,
                currentIndex: 0, // This should override config
              ),
            ),
          ),
        );

        final navigationBar = tester.widget<NavigationBar>(
          find.byType(NavigationBar),
        );
        expect(navigationBar.selectedIndex, equals(0));
      });
    });

    group('RTL Support', () {
      testWidgets('respects RTL direction', (tester) async {
        const config = DSNavigationComponentConfig(
          isRtl: true,
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        final directionality = tester.widget<Directionality>(
          find.byType(Directionality).first,
        );
        expect(directionality.textDirection, equals(TextDirection.rtl));
      });

      testWidgets('uses LTR direction by default', (tester) async {
        const config = DSNavigationComponentConfig(
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
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
        const config = DSNavigationComponentConfig(
          enableA11y: true,
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
              tooltip: 'Navigate to home screen',
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(Semantics), findsAtLeastNWidgets(1));
      });

      testWidgets('disables accessibility when configured', (tester) async {
        const config = DSNavigationComponentConfig(
          enableA11y: false,
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        // When a11y is disabled, the Semantics wrapper should exclude semantics
        final semantics = tester.widget<Semantics>(
          find.byType(Semantics).first,
        );
        expect(semantics.properties.label, isNull);
      });
    });

    group('Animation', () {
      testWidgets('animates state changes', (tester) async {
        const config = DSNavigationComponentConfig(
          state: DSNavigationState.defaultState,
          destinations: [
            DSNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            DSNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(AnimatedOpacity), findsAtLeastNWidgets(1));
        expect(find.byType(AnimatedScale), findsAtLeastNWidgets(1));
      });

      testWidgets('animates selection changes', (tester) async {
        const destinations = [
          DSNavigationDestination(
            id: 'home',
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          DSNavigationDestination(
            id: 'search',
            label: 'Search',
            icon: Icon(Icons.search),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: DSNavigation(
                destinations: destinations,
                currentIndex: 0,
              ),
            ),
          ),
        );

        // Verify animation widgets are present
        expect(find.byType(AnimatedContainer), findsAtLeastNWidgets(1));
      });
    });
  });

  group('DSNavigationDestination', () {
    test('creates with required parameters', () {
      const destination = DSNavigationDestination(
        id: 'test',
        label: 'Test',
        icon: Icon(Icons.star),
      );

      expect(destination.id, equals('test'));
      expect(destination.label, equals('Test'));
      expect(destination.disabled, isFalse);
      expect(destination.type, equals(DSNavigationDestinationType.standard));
    });

    test('creates with optional parameters', () {
      const destination = DSNavigationDestination(
        id: 'test',
        label: 'Test',
        icon: Icon(Icons.star),
        selectedIcon: Icon(Icons.star, color: Colors.blue),
        tooltip: 'Test tooltip',
        disabled: true,
        type: DSNavigationDestinationType.floating,
        leading: Text('Leading'),
        trailing: Text('Trailing'),
      );

      expect(destination.selectedIcon, isNotNull);
      expect(destination.tooltip, equals('Test tooltip'));
      expect(destination.disabled, isTrue);
      expect(destination.type, equals(DSNavigationDestinationType.floating));
      expect(destination.leading, isNotNull);
      expect(destination.trailing, isNotNull);
    });
  });

  group('DSNavigationBadge', () {
    test('creates count badge', () {
      const badge = DSNavigationBadge(
        destinationId: 'test',
        count: 5,
        type: DSNavigationBadgeType.count,
      );

      expect(badge.destinationId, equals('test'));
      expect(badge.count, equals(5));
      expect(badge.type, equals(DSNavigationBadgeType.count));
      expect(badge.isVisible, isTrue);
      expect(badge.maxCount, equals(99));
    });

    test('creates text badge', () {
      const badge = DSNavigationBadge(
        destinationId: 'test',
        text: 'NEW',
        type: DSNavigationBadgeType.text,
      );

      expect(badge.text, equals('NEW'));
      expect(badge.type, equals(DSNavigationBadgeType.text));
    });

    test('creates dot badge', () {
      const badge = DSNavigationBadge(
        destinationId: 'test',
        type: DSNavigationBadgeType.dot,
      );

      expect(badge.type, equals(DSNavigationBadgeType.dot));
    });
  });

  group('Extensions', () {
    group('DSNavigationVariantExtension', () {
      test('provides correct display names', () {
        expect(
            DSNavigationVariant.bottomBar.displayName, equals('Bottom Bar'));
        expect(
            DSNavigationVariant.rail.displayName, equals('Navigation Rail'));
        expect(DSNavigationVariant.drawer.displayName, equals('Drawer'));
        expect(DSNavigationVariant.permanentDrawer.displayName,
            equals('Permanent Drawer'));
      });

      test('provides correct descriptions', () {
        expect(DSNavigationVariant.bottomBar.description,
            equals('Navegación inferior para pantallas móviles'));
        expect(DSNavigationVariant.rail.description,
            equals('Barra lateral compacta para tablet/desktop'));
        expect(DSNavigationVariant.drawer.description,
            equals('Cajón de navegación modal'));
        expect(DSNavigationVariant.permanentDrawer.description,
            equals('Cajón de navegación permanente'));
      });

      test('identifies horizontal variants correctly', () {
        expect(DSNavigationVariant.bottomBar.isHorizontal, isTrue);
        expect(DSNavigationVariant.rail.isHorizontal, isFalse);
        expect(DSNavigationVariant.drawer.isHorizontal, isFalse);
        expect(DSNavigationVariant.permanentDrawer.isHorizontal, isFalse);
      });

      test('identifies modal variants correctly', () {
        expect(DSNavigationVariant.bottomBar.isModal, isFalse);
        expect(DSNavigationVariant.rail.isModal, isFalse);
        expect(DSNavigationVariant.drawer.isModal, isTrue);
        expect(DSNavigationVariant.permanentDrawer.isModal, isFalse);
      });

      test('all variants support badges', () {
        for (final variant in DSNavigationVariant.values) {
          expect(variant.supportsBadges, isTrue);
        }
      });

      test('provides correct default widths', () {
        expect(DSNavigationVariant.bottomBar.defaultWidth,
            equals(double.infinity));
        expect(DSNavigationVariant.rail.defaultWidth, equals(72.0));
        expect(DSNavigationVariant.drawer.defaultWidth, equals(256.0));
        expect(
            DSNavigationVariant.permanentDrawer.defaultWidth, equals(256.0));
      });
    });

    group('DSNavigationStateExtension', () {
      test('provides correct display names', () {
        expect(DSNavigationState.defaultState.displayName, equals('Default'));
        expect(DSNavigationState.hover.displayName, equals('Hover'));
        expect(DSNavigationState.pressed.displayName, equals('Pressed'));
        expect(DSNavigationState.focus.displayName, equals('Focus'));
        expect(DSNavigationState.selected.displayName, equals('Selected'));
        expect(DSNavigationState.disabled.displayName, equals('Disabled'));
        expect(DSNavigationState.loading.displayName, equals('Loading'));
        expect(DSNavigationState.skeleton.displayName, equals('Skeleton'));
      });

      test('identifies interactive states correctly', () {
        expect(DSNavigationState.defaultState.isInteractive, isTrue);
        expect(DSNavigationState.hover.isInteractive, isTrue);
        expect(DSNavigationState.pressed.isInteractive, isTrue);
        expect(DSNavigationState.focus.isInteractive, isTrue);
        expect(DSNavigationState.selected.isInteractive, isTrue);
        expect(DSNavigationState.disabled.isInteractive, isFalse);
        expect(DSNavigationState.loading.isInteractive, isFalse);
        expect(DSNavigationState.skeleton.isInteractive, isFalse);
      });

      test('provides correct opacity values', () {
        expect(DSNavigationState.defaultState.opacity, equals(1.0));
        expect(DSNavigationState.hover.opacity, equals(1.0));
        expect(DSNavigationState.pressed.opacity, equals(1.0));
        expect(DSNavigationState.focus.opacity, equals(1.0));
        expect(DSNavigationState.selected.opacity, equals(1.0));
        expect(DSNavigationState.disabled.opacity, equals(0.6));
        expect(DSNavigationState.loading.opacity, equals(0.8));
        expect(DSNavigationState.skeleton.opacity, equals(0.3));
      });

      test('identifies loader and skeleton states correctly', () {
        expect(DSNavigationState.loading.showsLoader, isTrue);
        expect(DSNavigationState.skeleton.showsSkeleton, isTrue);

        for (final state in DSNavigationState.values) {
          if (state != DSNavigationState.loading) {
            expect(state.showsLoader, isFalse);
          }
          if (state != DSNavigationState.skeleton) {
            expect(state.showsSkeleton, isFalse);
          }
        }
      });
    });

    group('DSNavigationBadgeTypeExtension', () {
      test('provides correct display names', () {
        expect(DSNavigationBadgeType.dot.displayName, equals('Dot'));
        expect(DSNavigationBadgeType.count.displayName, equals('Count'));
        expect(DSNavigationBadgeType.text.displayName, equals('Text'));
      });

      test('identifies text showing types correctly', () {
        expect(DSNavigationBadgeType.dot.showsText, isFalse);
        expect(DSNavigationBadgeType.count.showsText, isTrue);
        expect(DSNavigationBadgeType.text.showsText, isTrue);
      });

      test('identifies numeric types correctly', () {
        expect(DSNavigationBadgeType.dot.isNumeric, isFalse);
        expect(DSNavigationBadgeType.count.isNumeric, isTrue);
        expect(DSNavigationBadgeType.text.isNumeric, isFalse);
      });
    });
  });
}
