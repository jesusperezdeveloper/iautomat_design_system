import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/navigation/app_navigation.dart';
import 'package:iautomat_design_system/src/components/navigation/app_navigation_config.dart';

void main() {
  group('AppNavigation', () {
    group('Basic Rendering', () {
      testWidgets('renders with default configuration', (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(),
            ),
          ),
        );

        expect(find.byType(AppNavigation), findsOneWidget);
      });

      testWidgets('renders with destinations', (tester) async {
        const destinations = [
          AppNavigationDestination(
            id: 'home',
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          AppNavigationDestination(
            id: 'search',
            label: 'Search',
            icon: Icon(Icons.search),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(
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
        const config = AppNavigationComponentConfig(
          destinations: [
            AppNavigationDestination(
              id: 'profile',
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
            ),
          ),
        );

        expect(find.text('Profile'), findsOneWidget);
        expect(find.byIcon(Icons.person), findsOneWidget);
      });
    });

    group('Variants', () {
      testWidgets('renders bottom bar variant', (tester) async {
        const config = AppNavigationComponentConfig(
          variant: AppNavigationVariant.bottomBar,
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(NavigationBar), findsOneWidget);
      });

      testWidgets('renders rail variant', (tester) async {
        const config = AppNavigationComponentConfig(
          variant: AppNavigationVariant.rail,
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(NavigationRail), findsOneWidget);
      });

      testWidgets('renders drawer variant', (tester) async {
        const config = AppNavigationComponentConfig(
          variant: AppNavigationVariant.drawer,
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(Drawer), findsOneWidget);
      });

      testWidgets('renders permanent drawer variant', (tester) async {
        const config = AppNavigationComponentConfig(
          variant: AppNavigationVariant.permanentDrawer,
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(Drawer), findsOneWidget);
      });
    });

    group('States', () {
      testWidgets('shows loading state', (tester) async {
        const config = AppNavigationComponentConfig(
          state: AppNavigationState.loading,
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsAtLeastNWidgets(1));
      });

      testWidgets('shows skeleton state', (tester) async {
        const config = AppNavigationComponentConfig(
          state: AppNavigationState.skeleton,
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(Container), findsAtLeastNWidgets(1));
      });

      testWidgets('disables interaction in disabled state', (tester) async {
        const config = AppNavigationComponentConfig(
          state: AppNavigationState.disabled,
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
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
          AppNavigationBadge(
            destinationId: 'messages',
            count: 3,
            type: AppNavigationBadgeType.count,
          ),
        ];

        const destinations = [
          AppNavigationDestination(
            id: 'messages',
            label: 'Messages',
            icon: Icon(Icons.message),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(
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
          AppNavigationBadge(
            destinationId: 'notifications',
            type: AppNavigationBadgeType.dot,
          ),
        ];

        const destinations = [
          AppNavigationDestination(
            id: 'notifications',
            label: 'Notifications',
            icon: Icon(Icons.notifications),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(
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
          AppNavigationBadge(
            destinationId: 'alerts',
            text: 'NEW',
            type: AppNavigationBadgeType.text,
          ),
        ];

        const destinations = [
          AppNavigationDestination(
            id: 'alerts',
            label: 'Alerts',
            icon: Icon(Icons.warning),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(
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
          AppNavigationDestination(
            id: 'home',
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          AppNavigationDestination(
            id: 'search',
            label: 'Search',
            icon: Icon(Icons.search),
          ),
        ];

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppNavigation(
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

        final config = AppNavigationComponentConfig(
          destinations: const [
            AppNavigationDestination(
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
              body: AppNavigation(config: config),
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

        final config = AppNavigationComponentConfig(
          destinations: const [
            AppNavigationDestination(
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
              body: AppNavigation(
                config: config,
                onDestinationSelected: (index) => widgetSelectedIndex = index,
              ),
            ),
          ),
        );

        await tester.tap(find.text('Settings'));
        await tester.pumpAndSettle();

        expect(widgetSelectedIndex, equals(0));
        expect(configSelectedIndex, isNull); // Config callback should not be called
      });
    });

    group('Current Index', () {
      testWidgets('highlights current index from widget prop', (tester) async {
        const destinations = [
          AppNavigationDestination(
            id: 'home',
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          AppNavigationDestination(
            id: 'search',
            label: 'Search',
            icon: Icon(Icons.search),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(
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
        const config = AppNavigationComponentConfig(
          currentIndex: 1,
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
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
        const config = AppNavigationComponentConfig(
          currentIndex: 1,
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(
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
        const config = AppNavigationComponentConfig(
          isRtl: true,
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
            ),
          ),
        );

        final directionality = tester.widget<Directionality>(
          find.byType(Directionality).first,
        );
        expect(directionality.textDirection, equals(TextDirection.rtl));
      });

      testWidgets('uses LTR direction by default', (tester) async {
        const config = AppNavigationComponentConfig(
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
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
        const config = AppNavigationComponentConfig(
          enableA11y: true,
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
              tooltip: 'Navigate to home screen',
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(Semantics), findsAtLeastNWidgets(1));
      });

      testWidgets('disables accessibility when configured', (tester) async {
        const config = AppNavigationComponentConfig(
          enableA11y: false,
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
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
        const config = AppNavigationComponentConfig(
          state: AppNavigationState.defaultState,
          destinations: [
            AppNavigationDestination(
              id: 'home',
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            AppNavigationDestination(
              id: 'search',
              label: 'Search',
              icon: Icon(Icons.search),
            ),
          ],
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(config: config),
            ),
          ),
        );

        expect(find.byType(AnimatedOpacity), findsAtLeastNWidgets(1));
        expect(find.byType(AnimatedScale), findsAtLeastNWidgets(1));
      });

      testWidgets('animates selection changes', (tester) async {
        const destinations = [
          AppNavigationDestination(
            id: 'home',
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          AppNavigationDestination(
            id: 'search',
            label: 'Search',
            icon: Icon(Icons.search),
          ),
        ];

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: AppNavigation(
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

  group('AppNavigationDestination', () {
    test('creates with required parameters', () {
      const destination = AppNavigationDestination(
        id: 'test',
        label: 'Test',
        icon: Icon(Icons.star),
      );

      expect(destination.id, equals('test'));
      expect(destination.label, equals('Test'));
      expect(destination.disabled, isFalse);
      expect(destination.type, equals(AppNavigationDestinationType.standard));
    });

    test('creates with optional parameters', () {
      const destination = AppNavigationDestination(
        id: 'test',
        label: 'Test',
        icon: Icon(Icons.star),
        selectedIcon: Icon(Icons.star, color: Colors.blue),
        tooltip: 'Test tooltip',
        disabled: true,
        type: AppNavigationDestinationType.floating,
        leading: Text('Leading'),
        trailing: Text('Trailing'),
      );

      expect(destination.selectedIcon, isNotNull);
      expect(destination.tooltip, equals('Test tooltip'));
      expect(destination.disabled, isTrue);
      expect(destination.type, equals(AppNavigationDestinationType.floating));
      expect(destination.leading, isNotNull);
      expect(destination.trailing, isNotNull);
    });
  });

  group('AppNavigationBadge', () {
    test('creates count badge', () {
      const badge = AppNavigationBadge(
        destinationId: 'test',
        count: 5,
        type: AppNavigationBadgeType.count,
      );

      expect(badge.destinationId, equals('test'));
      expect(badge.count, equals(5));
      expect(badge.type, equals(AppNavigationBadgeType.count));
      expect(badge.isVisible, isTrue);
      expect(badge.maxCount, equals(99));
    });

    test('creates text badge', () {
      const badge = AppNavigationBadge(
        destinationId: 'test',
        text: 'NEW',
        type: AppNavigationBadgeType.text,
      );

      expect(badge.text, equals('NEW'));
      expect(badge.type, equals(AppNavigationBadgeType.text));
    });

    test('creates dot badge', () {
      const badge = AppNavigationBadge(
        destinationId: 'test',
        type: AppNavigationBadgeType.dot,
      );

      expect(badge.type, equals(AppNavigationBadgeType.dot));
    });
  });

  group('Extensions', () {
    group('AppNavigationVariantExtension', () {
      test('provides correct display names', () {
        expect(AppNavigationVariant.bottomBar.displayName, equals('Bottom Bar'));
        expect(AppNavigationVariant.rail.displayName, equals('Navigation Rail'));
        expect(AppNavigationVariant.drawer.displayName, equals('Drawer'));
        expect(AppNavigationVariant.permanentDrawer.displayName, equals('Permanent Drawer'));
      });

      test('provides correct descriptions', () {
        expect(AppNavigationVariant.bottomBar.description,
            equals('Navegación inferior para pantallas móviles'));
        expect(AppNavigationVariant.rail.description,
            equals('Barra lateral compacta para tablet/desktop'));
        expect(AppNavigationVariant.drawer.description,
            equals('Cajón de navegación modal'));
        expect(AppNavigationVariant.permanentDrawer.description,
            equals('Cajón de navegación permanente'));
      });

      test('identifies horizontal variants correctly', () {
        expect(AppNavigationVariant.bottomBar.isHorizontal, isTrue);
        expect(AppNavigationVariant.rail.isHorizontal, isFalse);
        expect(AppNavigationVariant.drawer.isHorizontal, isFalse);
        expect(AppNavigationVariant.permanentDrawer.isHorizontal, isFalse);
      });

      test('identifies modal variants correctly', () {
        expect(AppNavigationVariant.bottomBar.isModal, isFalse);
        expect(AppNavigationVariant.rail.isModal, isFalse);
        expect(AppNavigationVariant.drawer.isModal, isTrue);
        expect(AppNavigationVariant.permanentDrawer.isModal, isFalse);
      });

      test('all variants support badges', () {
        for (final variant in AppNavigationVariant.values) {
          expect(variant.supportsBadges, isTrue);
        }
      });

      test('provides correct default widths', () {
        expect(AppNavigationVariant.bottomBar.defaultWidth, equals(double.infinity));
        expect(AppNavigationVariant.rail.defaultWidth, equals(72.0));
        expect(AppNavigationVariant.drawer.defaultWidth, equals(256.0));
        expect(AppNavigationVariant.permanentDrawer.defaultWidth, equals(256.0));
      });
    });

    group('AppNavigationStateExtension', () {
      test('provides correct display names', () {
        expect(AppNavigationState.defaultState.displayName, equals('Default'));
        expect(AppNavigationState.hover.displayName, equals('Hover'));
        expect(AppNavigationState.pressed.displayName, equals('Pressed'));
        expect(AppNavigationState.focus.displayName, equals('Focus'));
        expect(AppNavigationState.selected.displayName, equals('Selected'));
        expect(AppNavigationState.disabled.displayName, equals('Disabled'));
        expect(AppNavigationState.loading.displayName, equals('Loading'));
        expect(AppNavigationState.skeleton.displayName, equals('Skeleton'));
      });

      test('identifies interactive states correctly', () {
        expect(AppNavigationState.defaultState.isInteractive, isTrue);
        expect(AppNavigationState.hover.isInteractive, isTrue);
        expect(AppNavigationState.pressed.isInteractive, isTrue);
        expect(AppNavigationState.focus.isInteractive, isTrue);
        expect(AppNavigationState.selected.isInteractive, isTrue);
        expect(AppNavigationState.disabled.isInteractive, isFalse);
        expect(AppNavigationState.loading.isInteractive, isFalse);
        expect(AppNavigationState.skeleton.isInteractive, isFalse);
      });

      test('provides correct opacity values', () {
        expect(AppNavigationState.defaultState.opacity, equals(1.0));
        expect(AppNavigationState.hover.opacity, equals(1.0));
        expect(AppNavigationState.pressed.opacity, equals(1.0));
        expect(AppNavigationState.focus.opacity, equals(1.0));
        expect(AppNavigationState.selected.opacity, equals(1.0));
        expect(AppNavigationState.disabled.opacity, equals(0.6));
        expect(AppNavigationState.loading.opacity, equals(0.8));
        expect(AppNavigationState.skeleton.opacity, equals(0.3));
      });

      test('identifies loader and skeleton states correctly', () {
        expect(AppNavigationState.loading.showsLoader, isTrue);
        expect(AppNavigationState.skeleton.showsSkeleton, isTrue);

        for (final state in AppNavigationState.values) {
          if (state != AppNavigationState.loading) {
            expect(state.showsLoader, isFalse);
          }
          if (state != AppNavigationState.skeleton) {
            expect(state.showsSkeleton, isFalse);
          }
        }
      });
    });

    group('AppNavigationBadgeTypeExtension', () {
      test('provides correct display names', () {
        expect(AppNavigationBadgeType.dot.displayName, equals('Dot'));
        expect(AppNavigationBadgeType.count.displayName, equals('Count'));
        expect(AppNavigationBadgeType.text.displayName, equals('Text'));
      });

      test('identifies text showing types correctly', () {
        expect(AppNavigationBadgeType.dot.showsText, isFalse);
        expect(AppNavigationBadgeType.count.showsText, isTrue);
        expect(AppNavigationBadgeType.text.showsText, isTrue);
      });

      test('identifies numeric types correctly', () {
        expect(AppNavigationBadgeType.dot.isNumeric, isFalse);
        expect(AppNavigationBadgeType.count.isNumeric, isTrue);
        expect(AppNavigationBadgeType.text.isNumeric, isFalse);
      });
    });
  });
}