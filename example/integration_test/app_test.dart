import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:design_system_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Design System Example App Integration Tests', () {

    testWidgets('App loads correctly and shows home screen', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Verify home screen loads
      expect(find.text('IAutomat Design System'), findsOneWidget);
      expect(find.text('Sistema de diseño empresarial completo'), findsOneWidget);

      // Verify main navigation cards are present
      expect(find.text('Galería de Temas'), findsOneWidget);
      expect(find.text('Sistema de Colores'), findsOneWidget);
      expect(find.text('Tipografía'), findsOneWidget);
      expect(find.text('Componentes'), findsOneWidget);
    });

    testWidgets('Navigation to Themes Gallery works', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Tap on Themes card
      await tester.tap(find.text('Galería de Temas'));
      await tester.pumpAndSettle();

      // Verify themes screen loads
      expect(find.text('100 Temas Profesionales para 2025'), findsOneWidget);
      expect(find.text('Corporativo'), findsOneWidget);
      expect(find.text('Moderno'), findsOneWidget);

      // Test back navigation
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Navigation to Colors System works', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Tap on Colors card
      await tester.tap(find.text('Sistema de Colores'));
      await tester.pumpAndSettle();

      // Verify colors screen loads
      expect(find.text('Sistema de Colores'), findsOneWidget);
      expect(find.text('Primarios'), findsOneWidget);
      expect(find.text('Secundarios'), findsOneWidget);
      expect(find.text('Semánticos'), findsOneWidget);

      // Test back navigation
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Navigation to Typography System works', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Tap on Typography card
      await tester.tap(find.text('Tipografía'));
      await tester.pumpAndSettle();

      // Verify typography screen loads
      expect(find.text('Sistema Tipográfico'), findsOneWidget);
      expect(find.text('Headers'), findsOneWidget);
      expect(find.text('Body Text'), findsOneWidget);

      // Test back navigation
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Navigation to Components works', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Tap on Components card
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();

      // Verify components screen loads
      expect(find.text('Demos de Componentes'), findsOneWidget);
      expect(find.text('Explora todos los componentes del Design System con ejemplos interactivos.'), findsOneWidget);

      // Verify all component categories are present
      expect(find.text('Botones'), findsOneWidget);
      expect(find.text('Inputs'), findsOneWidget);
      expect(find.text('Cards'), findsOneWidget);
      expect(find.text('Navegación'), findsOneWidget);
      expect(find.text('Diálogos'), findsOneWidget);
      expect(find.text('Feedback'), findsOneWidget);
      expect(find.text('DSTopAppBar'), findsOneWidget);

      // Test back navigation to home
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Theme switching functionality works', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Find and tap theme switcher button
      final themeSwitcher = find.byIcon(Icons.brightness_6);
      expect(themeSwitcher, findsOneWidget);

      await tester.tap(themeSwitcher);
      await tester.pumpAndSettle();

      // Verify the app still works after theme change
      expect(find.text('IAutomat Design System'), findsOneWidget);
    });

    testWidgets('Theme picker functionality works', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Find and tap theme picker button
      final themePicker = find.byIcon(Icons.palette);
      expect(themePicker, findsOneWidget);

      await tester.tap(themePicker);
      await tester.pumpAndSettle();

      // Verify theme picker opened
      expect(find.text('Seleccionar Tema'), findsOneWidget);

      // Close theme picker
      await tester.tap(find.text('Cancelar'));
      await tester.pumpAndSettle();
    });
  });
}