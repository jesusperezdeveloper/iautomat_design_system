import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:design_system_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('UI Error Detection Tests', () {

    testWidgets('No Overflow Errors in Home Screen', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Check for any render exceptions
      expect(tester.takeException(), isNull);

      // Verify main elements are present without overflow
      expect(find.text('IAutomat Design System'), findsOneWidget);
      expect(find.text('Sistema de diseño empresarial completo'), findsOneWidget);
    });

    testWidgets('No Overflow Errors in Components Screen', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to components
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();

      // Check for overflow errors that user reported
      expect(tester.takeException(), isNull);

      // Verify components grid renders correctly
      expect(find.text('Demos de Componentes'), findsOneWidget);
      expect(find.text('Botones'), findsOneWidget);
      expect(find.text('Inputs'), findsOneWidget);
      expect(find.text('Cards'), findsOneWidget);
    });

    testWidgets('All Component Demo Screens Render Without Errors', (WidgetTester tester) async {
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
        // Navigate to component demo
        await tester.tap(find.text(component));
        await tester.pumpAndSettle();

        // Check for any render exceptions
        expect(tester.takeException(), isNull,
          reason: 'Component $component should render without errors');

        // Verify the demo screen loaded
        expect(find.text('$component Demo'), findsOneWidget);

        // Go back
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();

        // Check that navigation back didn't cause errors
        expect(tester.takeException(), isNull);
      }
    });

    testWidgets('No Layout Errors with Different Screen Sizes', (WidgetTester tester) async {
      final screenSizes = [
        const Size(320, 568), // iPhone SE
        const Size(375, 667), // iPhone 8
        const Size(414, 896), // iPhone XS Max
        const Size(768, 1024), // iPad
        const Size(1024, 768), // iPad Landscape
        const Size(1200, 800), // Desktop
      ];

      for (final size in screenSizes) {
        await tester.binding.setSurfaceSize(size);
        await tester.pumpWidget(const DesignSystemExampleApp());
        await tester.pumpAndSettle();

        // Check for layout errors
        expect(tester.takeException(), isNull,
          reason: 'Size ${size.width}x${size.height} should not cause layout errors');

        // Test navigation to components
        await tester.tap(find.text('Componentes'));
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull,
          reason: 'Components screen should work at ${size.width}x${size.height}');

        // Go back
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Text Overflow Handling', (WidgetTester tester) async {
      // Test with very narrow screen to trigger potential text overflow
      await tester.binding.setSurfaceSize(const Size(280, 600));
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Check no text overflow errors
      expect(tester.takeException(), isNull);

      // Navigate through screens to test text handling
      final screens = [
        'Sistema de Colores',
        'Tipografía',
        'Componentes',
        'Galería de Temas',
      ];

      for (final screen in screens) {
        await tester.tap(find.text(screen));
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull,
          reason: 'Screen $screen should handle narrow width without text overflow');

        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Image Loading Errors Are Handled', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate through all screens to check for image loading issues
      await tester.tap(find.text('Galería de Temas'));
      await tester.pumpAndSettle();

      // Check for any image loading errors
      expect(tester.takeException(), isNull);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Test other screens that might have images
      await tester.tap(find.text('Sistema de Colores'));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
    });

    testWidgets('Dialog Rendering Errors Are Caught', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to dialogs demo
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Diálogos'));
      await tester.pumpAndSettle();

      // Test different dialog types for rendering errors
      final dialogTriggers = [
        'Mostrar Alert Dialog',
        'Mostrar Simple Dialog',
        'Mostrar Custom Dialog',
      ];

      for (final trigger in dialogTriggers) {
        final triggerFinder = find.text(trigger);
        if (triggerFinder.evaluate().isNotEmpty) {
          await tester.tap(triggerFinder.first);
          await tester.pumpAndSettle();

          // Check dialog rendered without errors
          expect(tester.takeException(), isNull,
            reason: '$trigger should not cause rendering errors');

          // Close dialog
          final dismissButtons = [
            find.text('OK'),
            find.text('Cerrar'),
            find.text('Cancelar'),
            find.byIcon(Icons.close),
          ];

          bool dialogClosed = false;
          for (final dismissButton in dismissButtons) {
            if (dismissButton.evaluate().isNotEmpty && !dialogClosed) {
              await tester.tap(dismissButton.first);
              await tester.pumpAndSettle();
              dialogClosed = true;
            }
          }

          // If no dismiss button found, tap outside dialog
          if (!dialogClosed) {
            await tester.tapAt(const Offset(50, 50));
            await tester.pumpAndSettle();
          }
        }
      }
    });

    testWidgets('Form Validation Errors Display Correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to inputs demo
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Inputs'));
      await tester.pumpAndSettle();

      // Try to trigger validation errors
      final validateButtons = find.text('Validar');
      if (validateButtons.evaluate().isNotEmpty) {
        await tester.tap(validateButtons.first);
        await tester.pumpAndSettle();

        // Check validation errors don't cause UI errors
        expect(tester.takeException(), isNull);

        // Validation messages should be displayed properly
        final errorTexts = find.text('Campo requerido');
        if (errorTexts.evaluate().isNotEmpty) {
          // Error messages should not cause overflow
          expect(tester.takeException(), isNull);
        }
      }
    });

    testWidgets('List and Grid Scrolling Errors', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Test components grid scrolling
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();

      // Find scrollable widget
      final scrollable = find.byType(Scrollable);
      if (scrollable.evaluate().isNotEmpty) {
        // Test scrolling doesn't cause errors
        await tester.drag(scrollable.first, const Offset(0, -200));
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);

        await tester.drag(scrollable.first, const Offset(0, 200));
        await tester.pumpAndSettle();

        expect(tester.takeException(), isNull);
      }
    });

    testWidgets('Animation Errors Are Handled', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Test theme switching animation
      await tester.tap(find.byIcon(Icons.brightness_6));

      // Pump during animation
      for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 50));
        expect(tester.takeException(), isNull);
      }

      await tester.pumpAndSettle();

      // Test navigation animations
      await tester.tap(find.text('Componentes'));

      // Pump during navigation animation
      for (int i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 50));
        expect(tester.takeException(), isNull);
      }

      await tester.pumpAndSettle();
    });

    testWidgets('Memory Pressure Error Handling', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Simulate memory pressure by rapid navigation
      for (int i = 0; i < 20; i++) {
        await tester.tap(find.text('Componentes'));
        await tester.pump();
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pump();
      }

      await tester.pumpAndSettle();

      // App should still be functional
      expect(tester.takeException(), isNull);
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Widget Tree Consistency After Errors', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Perform operations that might cause state inconsistency
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();

      // Rapid back and forth navigation
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.text('Botones'));
        await tester.pump();
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pump();
      }

      await tester.pumpAndSettle();

      // Widget tree should be consistent
      expect(tester.takeException(), isNull);
      expect(find.text('Demos de Componentes'), findsOneWidget);

      // Navigation should still work
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Hot Reload Simulation Error Recovery', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to a complex screen
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Navegación'));
      await tester.pumpAndSettle();

      // Simulate hot reload by rebuilding widget
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // App should recover properly
      expect(tester.takeException(), isNull);
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });
  });
}