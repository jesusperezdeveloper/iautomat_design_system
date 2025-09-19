import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:design_system_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Basic App Tests', () {

    testWidgets('App loads correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Verify home screen loads
      expect(find.text('IAutomat Design System'), findsOneWidget);
      expect(find.text('Sistema de diseño empresarial completo'), findsOneWidget);
    });

    testWidgets('Basic navigation works', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Test navigation to components
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();

      expect(find.text('Demos de Componentes'), findsOneWidget);

      // Test back navigation
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(find.text('IAutomat Design System'), findsOneWidget);
    });
  });
}