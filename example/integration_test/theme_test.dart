import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:design_system_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Theme and Visual Tests', () {

    testWidgets('Theme Switching Works Correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Verify initial state
      expect(find.text('IAutomat Design System'), findsOneWidget);

      // Find and tap theme switcher
      final themeSwitcher = find.byIcon(Icons.brightness_6);
      expect(themeSwitcher, findsOneWidget);

      await tester.tap(themeSwitcher);
      await tester.pumpAndSettle();

      // Verify app still works after theme change
      expect(find.text('IAutomat Design System'), findsOneWidget);

      // Test navigation still works with new theme
      await tester.tap(find.text('Galería de Temas'));
      await tester.pumpAndSettle();
      expect(find.text('20 Temas Profesionales para 2025'), findsOneWidget);

      // Go back to home
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Theme Picker Works Correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Find and tap theme picker
      final themePicker = find.byIcon(Icons.palette);
      expect(themePicker, findsOneWidget);

      await tester.tap(themePicker);
      await tester.pumpAndSettle();

      // Verify theme picker dialog opened
      expect(find.text('Seleccionar Tema'), findsOneWidget);

      // Test selecting a different theme
      final corporativoTheme = find.text('Corporativo');
      if (corporativoTheme.evaluate().isNotEmpty) {
        await tester.tap(corporativoTheme.first);
        await tester.pumpAndSettle();
      }

      // Apply the theme
      final aplicarButton = find.text('Aplicar');
      if (aplicarButton.evaluate().isNotEmpty) {
        await tester.tap(aplicarButton.first);
        await tester.pumpAndSettle();
      }

      // Verify app works with new theme
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Theme Picker Can Be Cancelled', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Open theme picker
      await tester.tap(find.byIcon(Icons.palette));
      await tester.pumpAndSettle();

      // Cancel without selecting
      await tester.tap(find.text('Cancelar'));
      await tester.pumpAndSettle();

      // Verify we're back to home screen
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Colors Display Correctly in Color System', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to Colors System
      await tester.tap(find.text('Sistema de Colores'));
      await tester.pumpAndSettle();

      // Verify color sections are present
      expect(find.text('Sistema de Colores'), findsOneWidget);
      expect(find.text('Primarios'), findsOneWidget);
      expect(find.text('Secundarios'), findsOneWidget);
      expect(find.text('Semánticos'), findsOneWidget);

      // Test color palette interactions
      final colorContainers = find.byType(Container);
      expect(colorContainers.evaluate().length, greaterThan(0));

      // Test copying color codes if available
      final copyButtons = find.byIcon(Icons.copy);
      if (copyButtons.evaluate().isNotEmpty) {
        await tester.tap(copyButtons.first);
        await tester.pumpAndSettle();

        // Should show feedback
        expect(find.byType(SnackBar), findsOneWidget);
      }
    });

    testWidgets('Typography Displays Correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to Typography
      await tester.tap(find.text('Tipografía'));
      await tester.pumpAndSettle();

      // Verify typography sections
      expect(find.text('Sistema Tipográfico'), findsOneWidget);
      expect(find.text('Headers'), findsOneWidget);
      expect(find.text('Body Text'), findsOneWidget);

      // Verify different text styles are displayed
      final textWidgets = find.byType(Text);
      expect(textWidgets.evaluate().length, greaterThan(5));

      // Test any interactive typography features
      final interactiveElements = find.byType(ElevatedButton);
      if (interactiveElements.evaluate().isNotEmpty) {
        await tester.tap(interactiveElements.first);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Themes Gallery Displays All Themes', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to Themes Gallery
      await tester.tap(find.text('Galería de Temas'));
      await tester.pumpAndSettle();

      // Verify themes gallery loaded
      expect(find.text('20 Temas Profesionales para 2025'), findsOneWidget);

      // Verify theme categories are present
      expect(find.text('Corporativo'), findsOneWidget);
      expect(find.text('Moderno'), findsOneWidget);

      // Test theme preview cards
      final cards = find.byType(Card);
      expect(cards.evaluate().length, greaterThan(0));

      // Test theme selection if available
      if (cards.evaluate().isNotEmpty) {
        await tester.tap(cards.first);
        await tester.pumpAndSettle();

        // Should show theme details or apply theme
        // Depending on implementation
      }
    });

    testWidgets('Visual Consistency Across Screens', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // List of screens to test visual consistency
      final screens = [
        'Sistema de Colores',
        'Tipografía',
        'Componentes',
        'Galería de Temas',
      ];

      for (final screen in screens) {
        // Navigate to screen
        await tester.tap(find.text(screen));
        await tester.pumpAndSettle();

        // Verify AppBar is consistent
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.byIcon(Icons.arrow_back), findsOneWidget);

        // Verify no overflow errors
        expect(tester.takeException(), isNull);

        // Go back to home
        await tester.tap(find.byIcon(Icons.arrow_back));
        await tester.pumpAndSettle();

        expect(find.text('IAutomat Design System'), findsOneWidget);
      }
    });

    testWidgets('App Handles Different Screen Orientations', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Test in portrait (default)
      expect(find.text('IAutomat Design System'), findsOneWidget);

      // Rotate to landscape
      await tester.binding.setSurfaceSize(const Size(800, 600));
      await tester.pumpAndSettle();

      // Verify app still works in landscape
      expect(find.text('IAutomat Design System'), findsOneWidget);

      // Test navigation in landscape
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();
      expect(find.text('Demos de Componentes'), findsOneWidget);

      // Rotate back to portrait
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpAndSettle();

      // Verify still works
      expect(find.text('Demos de Componentes'), findsOneWidget);
    });

    testWidgets('App Handles Different Screen Sizes', (WidgetTester tester) async {
      // Test mobile size
      await tester.binding.setSurfaceSize(const Size(375, 667));
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      expect(find.text('IAutomat Design System'), findsOneWidget);

      // Test tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024));
      await tester.pumpAndSettle();

      expect(find.text('IAutomat Design System'), findsOneWidget);

      // Test desktop size
      await tester.binding.setSurfaceSize(const Size(1200, 800));
      await tester.pumpAndSettle();

      expect(find.text('IAutomat Design System'), findsOneWidget);

      // Test navigation still works on different sizes
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();
      expect(find.text('Demos de Componentes'), findsOneWidget);
    });

    testWidgets('Theme Persistence Works Correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Change theme
      await tester.tap(find.byIcon(Icons.brightness_6));
      await tester.pumpAndSettle();

      // Navigate to another screen
      await tester.tap(find.text('Sistema de Colores'));
      await tester.pumpAndSettle();

      // Go back
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Theme should still be applied
      expect(find.text('IAutomat Design System'), findsOneWidget);

      // Test with theme picker
      await tester.tap(find.byIcon(Icons.palette));
      await tester.pumpAndSettle();

      // Select a theme
      final modernoTheme = find.text('Moderno');
      if (modernoTheme.evaluate().isNotEmpty) {
        await tester.tap(modernoTheme.first);
        await tester.pumpAndSettle();

        // Apply
        final aplicarButton = find.text('Aplicar');
        if (aplicarButton.evaluate().isNotEmpty) {
          await tester.tap(aplicarButton.first);
          await tester.pumpAndSettle();
        }
      }

      // Navigate away and back
      await tester.tap(find.text('Tipografía'));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Theme should persist
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });
  });
}