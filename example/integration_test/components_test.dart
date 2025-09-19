import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:design_system_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Components Navigation Tests', () {

    // Helper function to navigate to components section
    Future<void> navigateToComponents(WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();
    }

    testWidgets('Buttons Demo Navigation and Back', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to Buttons Demo
      await tester.tap(find.text('Botones'));
      await tester.pumpAndSettle();

      // Verify buttons demo screen loads
      expect(find.text('Botones Demo'), findsOneWidget);
      expect(find.text('Botones Elevados'), findsOneWidget);
      expect(find.text('Botones Outlined'), findsOneWidget);

      // Test back navigation returns to components (not home)
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('Demos de Componentes'), findsOneWidget);
      expect(find.text('Botones'), findsOneWidget); // Should be back in components list
    });

    testWidgets('Inputs Demo Navigation and Back', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to Inputs Demo
      await tester.tap(find.text('Inputs'));
      await tester.pumpAndSettle();

      // Verify inputs demo screen loads
      expect(find.text('Inputs Demo'), findsOneWidget);
      expect(find.text('Text Fields'), findsOneWidget);

      // Test back navigation
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('Demos de Componentes'), findsOneWidget);
    });

    testWidgets('Cards Demo Navigation and Back', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to Cards Demo
      await tester.tap(find.text('Cards'));
      await tester.pumpAndSettle();

      // Verify cards demo screen loads
      expect(find.text('Cards Demo'), findsOneWidget);
      expect(find.text('Basic Cards'), findsOneWidget);

      // Test back navigation
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('Demos de Componentes'), findsOneWidget);
    });

    testWidgets('Navigation Demo Navigation and Back', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to Navigation Demo
      await tester.tap(find.text('Navegación'));
      await tester.pumpAndSettle();

      // Verify navigation demo screen loads
      expect(find.text('Navegación Demo'), findsOneWidget);
      expect(find.text('Tab Bar'), findsOneWidget);

      // Test back navigation
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('Demos de Componentes'), findsOneWidget);
    });

    testWidgets('Dialogs Demo Navigation and Back', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to Dialogs Demo
      await tester.tap(find.text('Diálogos'));
      await tester.pumpAndSettle();

      // Verify dialogs demo screen loads
      expect(find.text('Diálogos Demo'), findsOneWidget);
      expect(find.text('Alert Dialogs'), findsOneWidget);

      // Test back navigation
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('Demos de Componentes'), findsOneWidget);
    });

    testWidgets('Feedback Demo Navigation and Back', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to Feedback Demo
      await tester.tap(find.text('Feedback'));
      await tester.pumpAndSettle();

      // Verify feedback demo screen loads
      expect(find.text('Feedback Demo'), findsOneWidget);
      expect(find.text('SnackBars'), findsOneWidget);

      // Test back navigation
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('Demos de Componentes'), findsOneWidget);
    });

    testWidgets('AppBar Demo Navigation and Back', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to AppBar Demo
      await tester.tap(find.text('DSTopAppBar'));
      await tester.pumpAndSettle();

      // Verify appbar demo screen loads
      expect(find.text('AppBar Demo'), findsOneWidget);
      expect(find.text('Características Principales'), findsOneWidget);

      // Test back navigation
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
      expect(find.text('Demos de Componentes'), findsOneWidget);
    });
  });
}