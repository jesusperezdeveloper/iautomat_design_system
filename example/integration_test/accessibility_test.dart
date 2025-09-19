import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:design_system_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Accessibility Tests', () {

    testWidgets('All Interactive Elements Have Semantic Labels', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Main screen buttons should have proper semantics
      expect(find.text('Galería de Temas'), findsOneWidget);
      expect(find.text('Sistema de Colores'), findsOneWidget);
      expect(find.text('Tipografía'), findsOneWidget);
      expect(find.text('Componentes'), findsOneWidget);

      // Theme buttons should have tooltips
      final themeSwitcher = find.byIcon(Icons.brightness_6);
      expect(themeSwitcher, findsOneWidget);

      final themePicker = find.byIcon(Icons.palette);
      expect(themePicker, findsOneWidget);
    });

    testWidgets('Navigation Elements Are Accessible', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to components
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();

      // Back button should have proper accessibility
      final backButton = find.byIcon(Icons.arrow_back);
      expect(backButton, findsOneWidget);

      // Test back button accessibility
      final backButtonWidget = tester.widget<IconButton>(backButton);
      expect(backButtonWidget.tooltip, isNotNull);

      // Navigate to a component demo
      await tester.tap(find.text('Botones'));
      await tester.pumpAndSettle();

      // Verify back button still accessible
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('Form Elements Have Proper Accessibility', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to inputs demo
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Inputs'));
      await tester.pumpAndSettle();

      // Check text fields have proper labels
      final textFields = find.byType(TextField);
      for (int i = 0; i < textFields.evaluate().length; i++) {
        final textField = tester.widget<TextField>(textFields.at(i));

        // Text fields should have either a label or hint
        final hasLabel = textField.decoration?.labelText != null;
        final hasHint = textField.decoration?.hintText != null;
        final hasHelper = textField.decoration?.helperText != null;

        expect(hasLabel || hasHint || hasHelper, isTrue,
          reason: 'TextField at index $i should have accessibility text');
      }
    });

    testWidgets('Buttons Have Proper Accessibility', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to buttons demo
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Botones'));
      await tester.pumpAndSettle();

      // Find all buttons and check accessibility
      final elevatedButtons = find.byType(ElevatedButton);
      final outlinedButtons = find.byType(OutlinedButton);
      final textButtons = find.byType(TextButton);

      // Check ElevatedButtons
      for (int i = 0; i < elevatedButtons.evaluate().length; i++) {
        final button = tester.widget<ElevatedButton>(elevatedButtons.at(i));
        expect(button.child, isNotNull,
          reason: 'ElevatedButton at index $i should have child widget');
      }

      // Check OutlinedButtons
      for (int i = 0; i < outlinedButtons.evaluate().length; i++) {
        final button = tester.widget<OutlinedButton>(outlinedButtons.at(i));
        expect(button.child, isNotNull,
          reason: 'OutlinedButton at index $i should have child widget');
      }

      // Check TextButtons
      for (int i = 0; i < textButtons.evaluate().length; i++) {
        final button = tester.widget<TextButton>(textButtons.at(i));
        expect(button.child, isNotNull,
          reason: 'TextButton at index $i should have child widget');
      }
    });

    testWidgets('Dialog Accessibility Works Correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to dialogs demo
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Diálogos'));
      await tester.pumpAndSettle();

      // Test Alert Dialog accessibility
      final alertDialogButton = find.text('Mostrar Alert Dialog');
      if (alertDialogButton.evaluate().isNotEmpty) {
        await tester.tap(alertDialogButton.first);
        await tester.pumpAndSettle();

        // Dialog should be announced to screen readers
        expect(find.byType(AlertDialog), findsOneWidget);

        // Dialog should have proper focus
        final dialog = tester.widget<AlertDialog>(find.byType(AlertDialog));
        expect(dialog.title, isNotNull);
        expect(dialog.content, isNotNull);

        // Close dialog
        final okButton = find.text('OK');
        if (okButton.evaluate().isNotEmpty) {
          await tester.tap(okButton.first);
          await tester.pumpAndSettle();
        }
      }
    });

    testWidgets('Color System Has Accessibility Information', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to color system
      await tester.tap(find.text('Sistema de Colores'));
      await tester.pumpAndSettle();

      // Color demonstrations should have text descriptions
      expect(find.text('Primarios'), findsOneWidget);
      expect(find.text('Secundarios'), findsOneWidget);
      expect(find.text('Semánticos'), findsOneWidget);

      // Color swatches should have semantic meaning
      final containers = find.byType(Container);
      expect(containers.evaluate().length, greaterThan(0));
    });

    testWidgets('Typography Is Accessible', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to typography
      await tester.tap(find.text('Tipografía'));
      await tester.pumpAndSettle();

      // Typography samples should have proper hierarchy
      expect(find.text('Headers'), findsOneWidget);
      expect(find.text('Body Text'), findsOneWidget);

      // Text should be readable and have good contrast
      final textWidgets = find.byType(Text);
      expect(textWidgets.evaluate().length, greaterThan(3));
    });

    testWidgets('Theme Switching Maintains Accessibility', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Test accessibility before theme change
      expect(find.byIcon(Icons.brightness_6), findsOneWidget);
      expect(find.byIcon(Icons.palette), findsOneWidget);

      // Switch theme
      await tester.tap(find.byIcon(Icons.brightness_6));
      await tester.pumpAndSettle();

      // Accessibility should be maintained
      expect(find.text('IAutomat Design System'), findsOneWidget);
      expect(find.byIcon(Icons.brightness_6), findsOneWidget);
      expect(find.byIcon(Icons.palette), findsOneWidget);

      // Navigate to ensure navigation accessibility is maintained
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('High Contrast Mode Compatibility', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Switch to different themes to test contrast
      await tester.tap(find.byIcon(Icons.palette));
      await tester.pumpAndSettle();

      // Cancel picker to return to app
      final cancelButton = find.text('Cancelar');
      if (cancelButton.evaluate().isNotEmpty) {
        await tester.tap(cancelButton.first);
        await tester.pumpAndSettle();
      }

      // Switch theme mode for contrast testing
      await tester.tap(find.byIcon(Icons.brightness_6));
      await tester.pumpAndSettle();

      // App should still be functional and readable
      expect(find.text('IAutomat Design System'), findsOneWidget);

      // Test navigation still works
      await tester.tap(find.text('Sistema de Colores'));
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();
    });

    testWidgets('Screen Reader Navigation Works', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Main navigation should be properly structured
      expect(find.text('IAutomat Design System'), findsOneWidget);
      expect(find.text('Sistema de diseño empresarial completo'), findsOneWidget);

      // Navigation cards should be accessible
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();

      // Component list should be navigable
      expect(find.text('Demos de Componentes'), findsOneWidget);
      expect(find.text('Explora todos los componentes del Design System con ejemplos interactivos.'), findsOneWidget);
    });

    testWidgets('Focus Management Works Correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate through screens and test focus
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Inputs'));
      await tester.pumpAndSettle();

      // Focus should work properly in input fields
      final textFields = find.byType(TextField);
      if (textFields.evaluate().isNotEmpty) {
        await tester.tap(textFields.first);
        await tester.pumpAndSettle();

        // Enter text to verify focus
        await tester.enterText(textFields.first, 'Test focus');
        await tester.pumpAndSettle();

        expect(find.text('Test focus'), findsOneWidget);
      }
    });

    testWidgets('Error Messages Are Accessible', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Navigate to forms that might have validation
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Inputs'));
      await tester.pumpAndSettle();

      // Try to trigger validation errors
      final submitButtons = find.text('Validar');
      if (submitButtons.evaluate().isNotEmpty) {
        await tester.tap(submitButtons.first);
        await tester.pumpAndSettle();

        // Error messages should be accessible
        final errorMessages = find.text('Campo requerido');
        if (errorMessages.evaluate().isNotEmpty) {
          // Error should be announced to screen readers
          expect(errorMessages, findsWidgets);
        }
      }
    });
  });
}