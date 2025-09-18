import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:design_system_example/main.dart';

void main() {
  testWidgets('Design system example app loads', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const DesignSystemExampleApp());

    // Verify that the app title is displayed.
    expect(find.text('IAutomat Design System'), findsOneWidget);

    // Verify that the tabs are present
    expect(find.text('Temas'), findsOneWidget);
    expect(find.text('Colores'), findsOneWidget);
    expect(find.text('Tipografía'), findsOneWidget);
    expect(find.text('Componentes'), findsOneWidget);
  });

  testWidgets('Theme selection works', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const DesignSystemExampleApp());

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Verify default theme is displayed (appears multiple times in UI)
    expect(find.text('Corporate Blue'), findsWidgets);

    // Verify the theme selector buttons are present
    expect(find.byIcon(Icons.color_lens), findsWidgets);
  });
}
