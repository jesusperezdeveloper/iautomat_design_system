import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppTopAppBar Tests', () {
    late Widget testApp;

    setUp(() {
      testApp = MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: Scaffold(
          appBar: AppTopAppBar(
            title: const Text('Test Title'),
          ),
          body: const Text('Test Content'),
        ),
      );
    });

    testWidgets('should render basic app bar correctly', (tester) async {
      await tester.pumpWidget(testApp);

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Content'), findsOneWidget);
    });

    testWidgets('should handle primary variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            appBar: const AppTopAppBar(
              config: AppTopAppBarConfig(
                variant: AppTopAppBarVariant.primary,
              ),
              title: Text('Primary AppBar'),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Primary AppBar'), findsOneWidget);
    });

    testWidgets('should handle center variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            appBar: const AppTopAppBar(
              config: AppTopAppBarConfig(
                variant: AppTopAppBarVariant.center,
              ),
              title: Text('Center AppBar'),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Center AppBar'), findsOneWidget);
    });

    testWidgets('should handle collapsed variant', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            appBar: const AppTopAppBar(
              config: AppTopAppBarConfig(
                variant: AppTopAppBarVariant.collapsed,
              ),
              title: Text('Collapsed AppBar'),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Collapsed AppBar'), findsOneWidget);
    });

    testWidgets('should handle loading state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            appBar: const AppTopAppBar(
              config: AppTopAppBarConfig(
                state: AppTopAppBarState.loading,
              ),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsAtLeastNWidgets(1));
      expect(find.text('Cargando...'), findsOneWidget);
    });

    testWidgets('should handle skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            appBar: const AppTopAppBar(
              config: AppTopAppBarConfig(
                state: AppTopAppBarState.skeleton,
              ),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('should handle disabled state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            appBar: const AppTopAppBar(
              config: AppTopAppBarConfig(
                state: AppTopAppBarState.disabled,
              ),
              title: Text('Disabled AppBar'),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Disabled AppBar'), findsOneWidget);
    });

    testWidgets('should handle RTL direction', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            appBar: const AppTopAppBar(
              config: AppTopAppBarConfig(
                isRtl: true,
              ),
              title: Text('RTL AppBar'),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      expect(find.byType(Directionality), findsAtLeastNWidgets(1));
      expect(find.text('RTL AppBar'), findsOneWidget);
    });

    testWidgets('should render with custom title from config', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            appBar: const AppTopAppBar(
              config: AppTopAppBarConfig(
                title: AppTopAppBarTitle(
                  text: 'Config Title',
                  alignment: TextAlign.center,
                ),
              ),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      expect(find.text('Config Title'), findsOneWidget);
    });

    testWidgets('should render with custom actions from config', (tester) async {
      bool actionPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            appBar: AppTopAppBar(
              config: AppTopAppBarConfig(
                actions: AppTopAppBarActions(
                  primary: [
                    AppTopAppBarAction(
                      id: 'search',
                      icon: const Icon(Icons.search),
                      tooltip: 'Search',
                      onPressed: () {
                        actionPressed = true;
                      },
                    ),
                  ],
                ),
              ),
              title: const Text('Actions Test'),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);

      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();

      expect(actionPressed, true);
    });

    testWidgets('should render with navigation icon', (tester) async {
      bool navigationPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            appBar: AppTopAppBar(
              config: AppTopAppBarConfig(
                navigationIcon: AppTopAppBarNavigationIcon(
                  type: AppTopAppBarNavigationType.menu,
                  tooltip: 'Menu',
                  onPressed: () {
                    navigationPressed = true;
                  },
                ),
              ),
              title: const Text('Navigation Test'),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      expect(find.byIcon(Icons.menu), findsOneWidget);

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pump();

      expect(navigationPressed, true);
    });

    testWidgets('should handle actions overflow', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            appBar: const AppTopAppBar(
              config: AppTopAppBarConfig(
                actions: AppTopAppBarActions(
                  maxPrimary: 2,
                  primary: [
                    AppTopAppBarAction(
                      id: 'action1',
                      icon: Icon(Icons.star),
                    ),
                    AppTopAppBarAction(
                      id: 'action2',
                      icon: Icon(Icons.favorite),
                    ),
                    AppTopAppBarAction(
                      id: 'action3',
                      icon: Icon(Icons.share),
                    ),
                    AppTopAppBarAction(
                      id: 'action4',
                      icon: Icon(Icons.download),
                    ),
                  ],
                ),
              ),
              title: Text('Overflow Test'),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.more_vert), findsOneWidget);
    });

    testWidgets('should support keyboard navigation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            appBar: const AppTopAppBar(
              config: AppTopAppBarConfig(
                enableKeyboardSupport: true,
                actions: AppTopAppBarActions(
                  primary: [
                    AppTopAppBarAction(
                      id: 'search',
                      icon: Icon(Icons.search),
                      tooltip: 'Search',
                    ),
                  ],
                ),
              ),
              title: Text('Keyboard Test'),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('should support accessibility features', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: Scaffold(
            appBar: const AppTopAppBar(
              config: AppTopAppBarConfig(
                enableA11y: true,
              ),
              title: Text('A11y Test'),
            ),
            body: const Text('Content'),
          ),
        ),
      );

      expect(find.byType(Semantics), findsWidgets);
      expect(find.text('A11y Test'), findsOneWidget);
    });

    group('Platform Adaptive Behavior', () {
      testWidgets('should adapt to mobile layout', (tester) async {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            ),
            home: Scaffold(
              appBar: const AppTopAppBar(
                config: AppTopAppBarConfig(
                  isAdaptive: true,
                ),
                title: Text('Mobile AppBar'),
              ),
              body: const Text('Mobile Content'),
            ),
          ),
        );

        expect(find.text('Mobile AppBar'), findsOneWidget);
        expect(find.byType(AppBar), findsOneWidget);
      });

      testWidgets('should adapt to tablet layout', (tester) async {
        tester.view.physicalSize = const Size(768, 1024);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            ),
            home: Scaffold(
              appBar: const AppTopAppBar(
                config: AppTopAppBarConfig(
                  isAdaptive: true,
                ),
                title: Text('Tablet AppBar'),
              ),
              body: const Text('Tablet Content'),
            ),
          ),
        );

        expect(find.text('Tablet AppBar'), findsOneWidget);
        expect(find.byType(AppBar), findsOneWidget);
      });

      testWidgets('should adapt to desktop layout', (tester) async {
        tester.view.physicalSize = const Size(1920, 1080);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            ),
            home: Scaffold(
              appBar: const AppTopAppBar(
                config: AppTopAppBarConfig(
                  isAdaptive: true,
                ),
                title: Text('Desktop AppBar'),
              ),
              body: const Text('Desktop Content'),
            ),
          ),
        );

        expect(find.text('Desktop AppBar'), findsOneWidget);
        expect(find.byType(AppBar), findsOneWidget);
      });
    });

    group('State Management', () {
      testWidgets('should transition between states', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            ),
            home: Scaffold(
              appBar: const AppTopAppBar(
                config: AppTopAppBarConfig(
                  state: AppTopAppBarState.defaultState,
                ),
                title: Text('State Test'),
              ),
              body: const Text('Content'),
            ),
          ),
        );

        expect(find.text('State Test'), findsOneWidget);

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            ),
            home: Scaffold(
              appBar: const AppTopAppBar(
                config: AppTopAppBarConfig(
                  state: AppTopAppBarState.loading,
                ),
                title: Text('State Test'),
              ),
              body: const Text('Content'),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsAtLeastNWidgets(1));
      });

      testWidgets('should handle focus state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            ),
            home: Scaffold(
              appBar: const AppTopAppBar(
                config: AppTopAppBarConfig(
                  state: AppTopAppBarState.focus,
                ),
                title: Text('Focused AppBar'),
              ),
              body: const Text('Content'),
            ),
          ),
        );

        expect(find.text('Focused AppBar'), findsOneWidget);
      });

      testWidgets('should handle selected state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            ),
            home: Scaffold(
              appBar: const AppTopAppBar(
                config: AppTopAppBarConfig(
                  state: AppTopAppBarState.selected,
                ),
                title: Text('Selected AppBar'),
              ),
              body: const Text('Content'),
            ),
          ),
        );

        expect(find.text('Selected AppBar'), findsOneWidget);
      });
    });
  });

  group('AppTopAppBarConfig Tests', () {
    test('should create default config', () {
      const config = AppTopAppBarConfig();

      expect(config.variant, AppTopAppBarVariant.primary);
      expect(config.state, AppTopAppBarState.defaultState);
      expect(config.isAdaptive, true);
      expect(config.isRtl, false);
      expect(config.enableA11y, true);
      expect(config.enableKeyboardSupport, true);
    });

    test('should create config with custom values', () {
      const config = AppTopAppBarConfig(
        variant: AppTopAppBarVariant.center,
        state: AppTopAppBarState.loading,
        isAdaptive: false,
        isRtl: true,
        enableA11y: false,
        enableKeyboardSupport: false,
      );

      expect(config.variant, AppTopAppBarVariant.center);
      expect(config.state, AppTopAppBarState.loading);
      expect(config.isAdaptive, false);
      expect(config.isRtl, true);
      expect(config.enableA11y, false);
      expect(config.enableKeyboardSupport, false);
    });

    test('should support copyWith', () {
      const originalConfig = AppTopAppBarConfig();
      final modifiedConfig = originalConfig.copyWith(
        variant: AppTopAppBarVariant.large,
        state: AppTopAppBarState.loading,
      );

      expect(modifiedConfig.variant, AppTopAppBarVariant.large);
      expect(modifiedConfig.state, AppTopAppBarState.loading);
      expect(modifiedConfig.isAdaptive, true); // unchanged
      expect(modifiedConfig.isRtl, false); // unchanged
    });
  });

  group('Variant Extension Tests', () {
    test('should provide correct display names', () {
      expect(AppTopAppBarVariant.primary.displayName, 'Primary');
      expect(AppTopAppBarVariant.center.displayName, 'Center');
      expect(AppTopAppBarVariant.large.displayName, 'Large');
      expect(AppTopAppBarVariant.collapsed.displayName, 'Collapsed');
    });

    test('should provide correct heights', () {
      expect(AppTopAppBarVariant.primary.preferredHeight, 56.0);
      expect(AppTopAppBarVariant.center.preferredHeight, 56.0);
      expect(AppTopAppBarVariant.large.preferredHeight, 112.0);
      expect(AppTopAppBarVariant.collapsed.preferredHeight, 48.0);
    });

    test('should provide correct center title behavior', () {
      expect(AppTopAppBarVariant.primary.centerTitle, false);
      expect(AppTopAppBarVariant.center.centerTitle, true);
      expect(AppTopAppBarVariant.large.centerTitle, false);
      expect(AppTopAppBarVariant.collapsed.centerTitle, false);
    });
  });

  group('State Extension Tests', () {
    test('should provide correct interactive states', () {
      expect(AppTopAppBarState.defaultState.isInteractive, true);
      expect(AppTopAppBarState.hover.isInteractive, true);
      expect(AppTopAppBarState.pressed.isInteractive, true);
      expect(AppTopAppBarState.focus.isInteractive, true);
      expect(AppTopAppBarState.selected.isInteractive, true);
      expect(AppTopAppBarState.disabled.isInteractive, false);
      expect(AppTopAppBarState.loading.isInteractive, false);
      expect(AppTopAppBarState.skeleton.isInteractive, false);
    });

    test('should provide correct opacity values', () {
      expect(AppTopAppBarState.defaultState.opacity, 1.0);
      expect(AppTopAppBarState.disabled.opacity, 0.6);
      expect(AppTopAppBarState.loading.opacity, 0.8);
      expect(AppTopAppBarState.skeleton.opacity, 0.3);
    });
  });

  group('Action Config Tests', () {
    test('should create action config', () {
      const action = AppTopAppBarAction(
        id: 'test',
        text: 'Test Action',
        tooltip: 'Test Tooltip',
        type: AppTopAppBarActionType.text,
        priority: AppTopAppBarActionPriority.primary,
      );

      expect(action.id, 'test');
      expect(action.text, 'Test Action');
      expect(action.tooltip, 'Test Tooltip');
      expect(action.type, AppTopAppBarActionType.text);
      expect(action.priority, AppTopAppBarActionPriority.primary);
      expect(action.disabled, false);
    });
  });

  group('Navigation Icon Config Tests', () {
    test('should create navigation icon config', () {
      const navigationIcon = AppTopAppBarNavigationIcon(
        type: AppTopAppBarNavigationType.back,
        tooltip: 'Back',
        disabled: false,
      );

      expect(navigationIcon.type, AppTopAppBarNavigationType.back);
      expect(navigationIcon.tooltip, 'Back');
      expect(navigationIcon.disabled, false);
    });
  });
}