import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppScaffold Tests', () {
    late Widget testApp;

    setUp(() {
      testApp = MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: const AppScaffold(
          body: Text('Test Content'),
        ),
      );
    });

    testWidgets('should render basic scaffold correctly', (tester) async {
      await tester.pumpWidget(testApp);

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should handle loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const AppScaffold(
            config: AppScaffoldConfig(
              state: AppScaffoldState.loading,
            ),
            body: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Cargando...'), findsOneWidget);
    });

    testWidgets('should handle skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const AppScaffold(
            config: AppScaffoldConfig(
              state: AppScaffoldState.skeleton,
            ),
            body: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('should handle disabled state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const AppScaffold(
            config: AppScaffoldConfig(
              state: AppScaffoldState.disabled,
            ),
            body: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should render with app shell variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const AppScaffold(
            config: AppScaffoldConfig(
              variant: AppScaffoldVariant.appShell,
            ),
            body: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should render with gutters variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const AppScaffold(
            config: AppScaffoldConfig(
              variant: AppScaffoldVariant.gutters,
              hasGutters: true,
            ),
            body: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Padding), findsWidgets);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should render with responsive variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const AppScaffold(
            config: AppScaffoldConfig(
              variant: AppScaffoldVariant.responsive,
              isResponsive: true,
            ),
            body: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should handle RTL direction', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const AppScaffold(
            config: AppScaffoldConfig(
              isRtl: true,
            ),
            body: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(Directionality), findsAtLeastNWidgets(1));
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should render with custom app bar', (tester) async {
      const appBarConfig = AppBarConfig(
        height: 64.0,
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const AppScaffold(
            config: AppScaffoldConfig(
              appBar: appBarConfig,
            ),
            body: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should render with bottom navigation', (tester) async {
      const bottomBarConfig = BottomBarConfig(
        items: [
          BottomBarItem(
            label: 'Home',
            icon: Icons.home,
          ),
          BottomBarItem(
            label: 'Settings',
            icon: Icons.settings,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const AppScaffold(
            config: AppScaffoldConfig(
              bottomBar: bottomBarConfig,
            ),
            body: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
    });

    testWidgets('should render with floating action button', (tester) async {
      const fabConfig = FloatingActionConfig(
        mini: false,
        tooltip: 'Add',
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const AppScaffold(
            config: AppScaffoldConfig(
              floatingAction: fabConfig,
            ),
            body: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should handle navigation drawer', (tester) async {
      const navigationConfig = AppNavigationConfig(
        type: NavigationType.drawer,
        width: 280.0,
        items: [
          NavigationItem(
            label: 'Dashboard',
            icon: Icons.dashboard,
          ),
          NavigationItem(
            label: 'Profile',
            icon: Icons.person,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const AppScaffold(
            config: AppScaffoldConfig(
              navigation: navigationConfig,
            ),
            body: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(Drawer), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should support keyboard padding', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const AppScaffold(
            config: AppScaffoldConfig(
              enableKeyboardPadding: true,
            ),
            body: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(SafeArea), findsWidgets);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should support accessibility features', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: const AppScaffold(
            config: AppScaffoldConfig(
              enableA11y: true,
            ),
            body: Text('Test Content'),
          ),
        ),
      );

      expect(find.byType(Semantics), findsWidgets);
      expect(find.text('Test Content'), findsOneWidget);
    });

    group('Platform Adaptive Behavior', () {
      testWidgets('should adapt to mobile layout', (tester) async {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: const AppScaffold(
              config: AppScaffoldConfig(
                variant: AppScaffoldVariant.responsive,
              ),
              body: Text('Mobile Content'),
            ),
          ),
        );

        expect(find.text('Mobile Content'), findsOneWidget);
        expect(find.byType(Scaffold), findsOneWidget);
      });

      testWidgets('should adapt to tablet layout', (tester) async {
        tester.view.physicalSize = const Size(768, 1024);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: const AppScaffold(
              config: AppScaffoldConfig(
                variant: AppScaffoldVariant.responsive,
              ),
              body: Text('Tablet Content'),
            ),
          ),
        );

        expect(find.text('Tablet Content'), findsOneWidget);
        expect(find.byType(Scaffold), findsOneWidget);
      });

      testWidgets('should adapt to desktop layout', (tester) async {
        tester.view.physicalSize = const Size(1920, 1080);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: const AppScaffold(
              config: AppScaffoldConfig(
                variant: AppScaffoldVariant.responsive,
                navigation: AppNavigationConfig(
                  type: NavigationType.rail,
                  items: [
                    NavigationItem(
                      label: 'Home',
                      icon: Icons.home,
                    ),
                  ],
                ),
              ),
              body: Text('Desktop Content'),
            ),
          ),
        );

        expect(find.text('Desktop Content'), findsOneWidget);
        expect(find.byType(Scaffold), findsOneWidget);
      });
    });

    group('State Management', () {
      testWidgets('should transition between states', (tester) async {
        const Widget testWidget = AppScaffold(
          config: AppScaffoldConfig(
            state: AppScaffoldState.defaultState,
          ),
          body: Text('Test Content'),
        );

        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: testWidget,
          ),
        );

        expect(find.text('Test Content'), findsOneWidget);

        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: const AppScaffold(
              config: AppScaffoldConfig(
                state: AppScaffoldState.loading,
              ),
              body: Text('Test Content'),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('should handle focus state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: const AppScaffold(
              config: AppScaffoldConfig(
                state: AppScaffoldState.focus,
              ),
              body: Text('Focused Content'),
            ),
          ),
        );

        expect(find.text('Focused Content'), findsOneWidget);
      });

      testWidgets('should handle selected state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.lightTheme,
            home: const AppScaffold(
              config: AppScaffoldConfig(
                state: AppScaffoldState.selected,
              ),
              body: Text('Selected Content'),
            ),
          ),
        );

        expect(find.text('Selected Content'), findsOneWidget);
      });
    });
  });

  group('AppScaffoldConfig Tests', () {
    test('should create default config', () {
      const config = AppScaffoldConfig();

      expect(config.variant, AppScaffoldVariant.appShell);
      expect(config.state, AppScaffoldState.defaultState);
      expect(config.isResponsive, true);
      expect(config.hasGutters, false);
      expect(config.isRtl, false);
      expect(config.enableKeyboardPadding, true);
      expect(config.enableA11y, true);
    });

    test('should create config with custom values', () {
      const config = AppScaffoldConfig(
        variant: AppScaffoldVariant.gutters,
        state: AppScaffoldState.loading,
        isResponsive: false,
        hasGutters: true,
        isRtl: true,
        enableKeyboardPadding: false,
        enableA11y: false,
      );

      expect(config.variant, AppScaffoldVariant.gutters);
      expect(config.state, AppScaffoldState.loading);
      expect(config.isResponsive, false);
      expect(config.hasGutters, true);
      expect(config.isRtl, true);
      expect(config.enableKeyboardPadding, false);
      expect(config.enableA11y, false);
    });

    test('should support copyWith', () {
      const originalConfig = AppScaffoldConfig();
      final modifiedConfig = originalConfig.copyWith(
        variant: AppScaffoldVariant.responsive,
        state: AppScaffoldState.loading,
      );

      expect(modifiedConfig.variant, AppScaffoldVariant.responsive);
      expect(modifiedConfig.state, AppScaffoldState.loading);
      expect(modifiedConfig.isResponsive, true); // unchanged
      expect(modifiedConfig.hasGutters, false); // unchanged
    });
  });

  group('Navigation Config Tests', () {
    test('should create navigation config', () {
      const config = AppNavigationConfig(
        type: NavigationType.drawer,
        width: 320.0,
        items: [
          NavigationItem(
            label: 'Home',
            icon: Icons.home,
          ),
        ],
      );

      expect(config.type, NavigationType.drawer);
      expect(config.width, 320.0);
      expect(config.items.length, 1);
      expect(config.items.first.label, 'Home');
    });
  });

  group('Bottom Bar Config Tests', () {
    test('should create bottom bar config', () {
      const config = BottomBarConfig(
        type: BottomBarType.navigation,
        items: [
          BottomBarItem(
            label: 'Home',
            icon: Icons.home,
          ),
          BottomBarItem(
            label: 'Profile',
            icon: Icons.person,
          ),
        ],
      );

      expect(config.type, BottomBarType.navigation);
      expect(config.items.length, 2);
      expect(config.items.first.label, 'Home');
      expect(config.items.last.label, 'Profile');
    });
  });
}
