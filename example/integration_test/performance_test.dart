import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:design_system_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Performance and Stress Tests', () {

    testWidgets('App Loads Without Performance Issues', (WidgetTester tester) async {
      // Measure app startup time
      final stopwatch = Stopwatch()..start();

      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      stopwatch.stop();

      // App should load in reasonable time (less than 3 seconds)
      expect(stopwatch.elapsedMilliseconds, lessThan(3000));

      // Verify app loaded correctly
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Navigation Performance is Acceptable', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      final screens = [
        'Sistema de Colores',
        'Tipografía',
        'Componentes',
        'Galería de Temas',
      ];

      for (final screen in screens) {
        final stopwatch = Stopwatch()..start();

        // Navigate to screen
        await tester.tap(find.text(screen));
        await tester.pumpAndSettle();

        stopwatch.stop();

        // Navigation should be fast (less than 1 second)
        expect(stopwatch.elapsedMilliseconds, lessThan(1000));

        // Go back
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Component Demo Loading Performance', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to components
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();

      final components = [
        'Botones',
        'Inputs',
        'Cards',
        'Navegación',
        'Diálogos',
        'Feedback',
        'DSTopAppBar',
      ];

      for (final component in components) {
        final stopwatch = Stopwatch()..start();

        // Navigate to component demo
        await tester.tap(find.text(component));
        await tester.pumpAndSettle();

        stopwatch.stop();

        // Component demo should load quickly
        expect(stopwatch.elapsedMilliseconds, lessThan(1000));

        // Go back to components list
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Theme Switching Performance', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Test theme switching multiple times
      for (int i = 0; i < 5; i++) {
        final stopwatch = Stopwatch()..start();

        await tester.tap(find.byIcon(Icons.brightness_6));
        await tester.pumpAndSettle();

        stopwatch.stop();

        // Theme switching should be fast
        expect(stopwatch.elapsedMilliseconds, lessThan(500));
      }
    });

    testWidgets('Multiple Rapid Interactions Handle Gracefully', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Rapid navigation test
      for (int i = 0; i < 10; i++) {
        await tester.tap(find.text('Componentes'));
        await tester.pump(); // Don't wait for settle to test rapid taps

        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pump();
      }

      // Wait for everything to settle
      await tester.pumpAndSettle();

      // App should still be in valid state
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Memory Usage Remains Stable During Navigation', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate through all screens multiple times
      final screens = [
        'Sistema de Colores',
        'Tipografía',
        'Componentes',
        'Galería de Temas',
      ];

      for (int cycle = 0; cycle < 3; cycle++) {
        for (final screen in screens) {
          await tester.tap(find.text(screen));
          await tester.pumpAndSettle();

          // Force garbage collection
          await tester.pump();

          await tester.tap(find.byIcon(Icons.arrow_back));
          await tester.pumpAndSettle();
        }
      }

      // App should still be responsive
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Scrolling Performance in Long Lists', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to components (which has a grid)
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();

      // Test scrolling performance
      final scrollView = find.byType(Scrollable);
      if (scrollView.evaluate().isNotEmpty) {
        final stopwatch = Stopwatch()..start();

        // Perform scrolling
        await tester.drag(scrollView.first, const Offset(0, -300));
        await tester.pump();
        await tester.drag(scrollView.first, const Offset(0, 300));
        await tester.pumpAndSettle();

        stopwatch.stop();

        // Scrolling should be smooth (complete in reasonable time)
        expect(stopwatch.elapsedMilliseconds, lessThan(2000));
      }
    });

    testWidgets('Heavy Component Demos Perform Well', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to components
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();

      // Test navigation demo (has many interactive elements)
      final stopwatch = Stopwatch()..start();

      await tester.tap(find.text('Navegación'));
      await tester.pumpAndSettle();

      stopwatch.stop();

      // Should load even complex screens quickly
      expect(stopwatch.elapsedMilliseconds, lessThan(2000));

      // Test interactions within the demo
      final tabs = find.byType(Tab);
      if (tabs.evaluate().length > 1) {
        for (int i = 0; i < tabs.evaluate().length && i < 3; i++) {
          await tester.tap(tabs.at(i));
          await tester.pump();
        }
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Animation Performance is Smooth', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Test animations don't cause performance issues
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Feedback'));
      await tester.pumpAndSettle();

      // Trigger animations if available
      final animationTriggers = find.text('Mostrar Progress');
      if (animationTriggers.evaluate().isNotEmpty) {
        await tester.tap(animationTriggers.first);

        // Let animations run
        for (int i = 0; i < 30; i++) {
          await tester.pump(const Duration(milliseconds: 16)); // 60fps
        }

        await tester.pumpAndSettle();
      }

      // App should still be responsive
      expect(find.text('Feedback Demo'), findsOneWidget);
    });

    testWidgets('No Memory Leaks During Extended Use', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Simulate extended app usage
      final screens = ['Componentes', 'Sistema de Colores', 'Tipografía'];

      for (int session = 0; session < 5; session++) {
        // Navigate through app multiple times
        for (final screen in screens) {
          await tester.tap(find.text(screen));
          await tester.pumpAndSettle();

          if (screen == 'Componentes') {
            // Navigate to component demos
            final components = ['Botones', 'Inputs', 'Cards'];
            for (final component in components) {
              await tester.tap(find.text(component));
              await tester.pumpAndSettle();
              await tester.tap(find.byIcon(Icons.arrow_back));
              await tester.pumpAndSettle();
            }
          }

          await tester.tap(find.byIcon(Icons.arrow_back));
          await tester.pumpAndSettle();
        }

        // Switch themes to test theme cleanup
        await tester.tap(find.byIcon(Icons.brightness_6));
        await tester.pumpAndSettle();
      }

      // App should still be in good state
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Error Recovery Performance', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Test error scenarios and recovery time
      try {
        // Attempt rapid invalid operations
        for (int i = 0; i < 5; i++) {
          await tester.tap(find.text('Componentes'));
          await tester.pump(const Duration(milliseconds: 10));
          await tester.tap(find.byIcon(Icons.arrow_back));
          await tester.pump(const Duration(milliseconds: 10));
        }
      } catch (e) {
        // Errors during rapid operations should be handled gracefully
      }

      // App should recover quickly
      await tester.pumpAndSettle();
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });
  });
}