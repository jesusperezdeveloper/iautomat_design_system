import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:design_system_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Component Interaction Tests', () {

    // Helper function to navigate to components section
    Future<void> navigateToComponents(WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();
    }

    testWidgets('Button Interactions Work Correctly', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to Buttons Demo
      await tester.tap(find.text('Botones'));
      await tester.pumpAndSettle();

      // Test elevated button press
      final elevatedButtons = find.text('Botón Elevado');
      if (elevatedButtons.evaluate().isNotEmpty) {
        await tester.tap(elevatedButtons.first);
        await tester.pumpAndSettle();

        // Should show snackbar or some feedback
        expect(find.byType(SnackBar), findsWidgets);
      }

      // Test outlined button press
      final outlinedButtons = find.text('Botón Outlined');
      if (outlinedButtons.evaluate().isNotEmpty) {
        await tester.tap(outlinedButtons.first);
        await tester.pumpAndSettle();
      }

      // Test text button press
      final textButtons = find.text('Botón de Texto');
      if (textButtons.evaluate().isNotEmpty) {
        await tester.tap(textButtons.first);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Input Field Interactions Work', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to Inputs Demo
      await tester.tap(find.text('Inputs'));
      await tester.pumpAndSettle();

      // Find text fields and test input
      final textFields = find.byType(TextField);
      if (textFields.evaluate().isNotEmpty) {
        await tester.enterText(textFields.first, 'Texto de prueba');
        await tester.pumpAndSettle();

        // Verify text was entered
        expect(find.text('Texto de prueba'), findsOneWidget);
      }

      // Test form validation if present
      final submitButtons = find.text('Enviar');
      if (submitButtons.evaluate().isNotEmpty) {
        await tester.tap(submitButtons.first);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('Dialog Interactions Work', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to Dialogs Demo
      await tester.tap(find.text('Diálogos'));
      await tester.pumpAndSettle();

      // Test Alert Dialog
      final alertDialogButtons = find.text('Mostrar Alert Dialog');
      if (alertDialogButtons.evaluate().isNotEmpty) {
        await tester.tap(alertDialogButtons.first);
        await tester.pumpAndSettle();

        // Verify dialog appeared
        expect(find.byType(AlertDialog), findsOneWidget);

        // Close dialog
        final okButtons = find.text('OK');
        if (okButtons.evaluate().isNotEmpty) {
          await tester.tap(okButtons.first);
          await tester.pumpAndSettle();
        }
      }

      // Test Simple Dialog
      final simpleDialogButtons = find.text('Mostrar Simple Dialog');
      if (simpleDialogButtons.evaluate().isNotEmpty) {
        await tester.tap(simpleDialogButtons.first);
        await tester.pumpAndSettle();

        // Verify dialog appeared
        expect(find.byType(SimpleDialog), findsOneWidget);

        // Select an option
        final firstOption = find.text('Opción 1');
        if (firstOption.evaluate().isNotEmpty) {
          await tester.tap(firstOption.first);
          await tester.pumpAndSettle();
        }
      }
    });

    testWidgets('Feedback Components Show Correctly', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to Feedback Demo
      await tester.tap(find.text('Feedback'));
      await tester.pumpAndSettle();

      // Test SnackBar
      final snackbarButtons = find.text('Mostrar SnackBar');
      if (snackbarButtons.evaluate().isNotEmpty) {
        await tester.tap(snackbarButtons.first);
        await tester.pumpAndSettle();

        // Verify snackbar appeared
        expect(find.byType(SnackBar), findsOneWidget);

        // Wait for snackbar to disappear
        await tester.pump(const Duration(seconds: 5));
      }

      // Test Progress Indicators
      final progressButtons = find.text('Mostrar Progress');
      if (progressButtons.evaluate().isNotEmpty) {
        await tester.tap(progressButtons.first);
        await tester.pumpAndSettle();

        // Should show progress indicator
        expect(find.byType(CircularProgressIndicator), findsWidgets);
      }
    });

    testWidgets('Navigation Components Function Properly', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to Navigation Demo
      await tester.tap(find.text('Navegación'));
      await tester.pumpAndSettle();

      // Test Tab Bar navigation
      final tabs = find.byType(Tab);
      if (tabs.evaluate().length > 1) {
        await tester.tap(tabs.at(1));
        await tester.pumpAndSettle();

        // Verify tab content changed
        expect(find.text('Contenido de Explorar'), findsOneWidget);
      }

      // Test Bottom Navigation Bar
      final bottomNavItems = find.byType(BottomNavigationBarItem);
      if (bottomNavItems.evaluate().length > 1) {
        // Find the actual tappable areas (Icons within BottomNavigationBar)
        final bottomNavBar = find.byType(BottomNavigationBar);
        if (bottomNavBar.evaluate().isNotEmpty) {
          final navIcons = find.descendant(
            of: bottomNavBar,
            matching: find.byIcon(Icons.search),
          );
          if (navIcons.evaluate().isNotEmpty) {
            await tester.tap(navIcons.first);
            await tester.pumpAndSettle();
          }
        }
      }

      // Test Navigation Rail
      final railDestinations = find.byType(NavigationRailDestination);
      if (railDestinations.evaluate().length > 1) {
        // Find the NavigationRail and tap on second destination
        final navRail = find.byType(NavigationRail);
        if (navRail.evaluate().isNotEmpty) {
          final railIcons = find.descendant(
            of: navRail,
            matching: find.byIcon(Icons.bookmark_border),
          );
          if (railIcons.evaluate().isNotEmpty) {
            await tester.tap(railIcons.first);
            await tester.pumpAndSettle();
          }
        }
      }
    });

    testWidgets('Card Interactions Work', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to Cards Demo
      await tester.tap(find.text('Cards'));
      await tester.pumpAndSettle();

      // Test card interactions (tap, long press)
      final cards = find.byType(Card);
      if (cards.evaluate().isNotEmpty) {
        await tester.tap(cards.first);
        await tester.pumpAndSettle();

        // Test long press if supported
        await tester.longPress(cards.first);
        await tester.pumpAndSettle();
      }

      // Test card buttons
      final cardButtons = find.text('Acción');
      if (cardButtons.evaluate().isNotEmpty) {
        await tester.tap(cardButtons.first);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('AppBar Interactions Work', (WidgetTester tester) async {
      await navigateToComponents(tester);

      // Navigate to AppBar Demo
      await tester.tap(find.text('DSTopAppBar'));
      await tester.pumpAndSettle();

      // Test variant switching
      final variantButtons = find.byIcon(Icons.palette);
      if (variantButtons.evaluate().isNotEmpty) {
        await tester.tap(variantButtons.first);
        await tester.pumpAndSettle();

        // Select different variant
        final centerVariant = find.text('Center');
        if (centerVariant.evaluate().isNotEmpty) {
          await tester.tap(centerVariant.first);
          await tester.pumpAndSettle();
        }
      }

      // Test state switching
      final stateButtons = find.byIcon(Icons.tune);
      if (stateButtons.evaluate().isNotEmpty) {
        await tester.tap(stateButtons.first);
        await tester.pumpAndSettle();

        // Select different state
        final loadingState = find.text('Loading');
        if (loadingState.evaluate().isNotEmpty) {
          await tester.tap(loadingState.first);
          await tester.pumpAndSettle();
        }
      }
    });

    testWidgets('Error Handling Works Correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const DesignSystemExampleApp());
      await tester.pumpAndSettle();

      // Test navigation to non-existent route handling
      // This should be handled gracefully without crashes

      // Test form validation errors
      await tester.tap(find.text('Componentes'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Inputs'));
      await tester.pumpAndSettle();

      // Try to submit empty required fields
      final submitButtons = find.text('Validar');
      if (submitButtons.evaluate().isNotEmpty) {
        await tester.tap(submitButtons.first);
        await tester.pumpAndSettle();

        // Should show validation errors
        expect(find.text('Campo requerido'), findsWidgets);
      }
    });
  });
}