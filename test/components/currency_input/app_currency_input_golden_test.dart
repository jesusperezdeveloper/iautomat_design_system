import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppCurrencyInput Golden Tests', () {
    testWidgets('renders basic currency input correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppCurrencyInput(
                amount: 1234.56,
                currency: 'USD',
                label: 'Amount',
                hint: 'Enter amount',
                helperText: 'Helper text example',
                onChanged: (value) {},
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCurrencyInput),
        matchesGoldenFile('currency_input_basic.png'),
      );
    });

    testWidgets('renders disabled state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppCurrencyInput(
                amount: 500.0,
                currency: 'USD',
                label: 'Disabled Amount',
                hint: 'Disabled field',
                enabled: false,
                onChanged: (value) {},
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCurrencyInput),
        matchesGoldenFile('currency_input_disabled.png'),
      );
    });

    testWidgets('renders error state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppCurrencyInput(
                amount: 50.0,
                currency: 'USD',
                label: 'Amount with Error',
                hint: 'Enter valid amount',
                errorText: 'Amount must be at least \$100',
                onChanged: (value) {},
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCurrencyInput),
        matchesGoldenFile('currency_input_error.png'),
      );
    });

    testWidgets('renders with different currencies', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AppCurrencyInput(
                    amount: 1000.0,
                    currency: 'USD',
                    label: 'USD Amount',
                    locale: const Locale('en', 'US'),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  AppCurrencyInput(
                    amount: 850.0,
                    currency: 'EUR',
                    label: 'EUR Amount',
                    locale: const Locale('es', 'ES'),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  AppCurrencyInput(
                    amount: 45000.0,
                    currency: 'COP',
                    label: 'COP Amount',
                    locale: const Locale('es', 'CO'),
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('currency_input_currencies.png'),
      );
    });

    testWidgets('renders loading state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppCurrencyInput(
                amount: 750.0,
                currency: 'USD',
                label: 'Loading Amount',
                hint: 'Processing...',
                initialState: AppCurrencyInputState.loading,
                onChanged: (value) {},
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCurrencyInput),
        matchesGoldenFile('currency_input_loading.png'),
      );
    });

    testWidgets('renders skeleton state correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppCurrencyInput(
                amount: 0.0,
                currency: 'USD',
                label: 'Skeleton Amount',
                hint: 'Loading content...',
                initialState: AppCurrencyInputState.skeleton,
                onChanged: (value) {},
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCurrencyInput),
        matchesGoldenFile('currency_input_skeleton.png'),
      );
    });

    testWidgets('renders with icons correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppCurrencyInput(
                amount: 2500.0,
                currency: 'USD',
                label: 'Amount with Icons',
                hint: 'Enter amount',
                prefixIcon: Icons.attach_money,
                suffixIcon: Icons.clear,
                onChanged: (value) {},
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCurrencyInput),
        matchesGoldenFile('currency_input_with_icons.png'),
      );
    });

    testWidgets('renders custom configuration correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppCurrencyInput(
                amount: 1800.0,
                currency: 'USD',
                label: 'Custom Configuration',
                hint: 'Custom styled input',
                config: AppCurrencyInputConfig(
                  variant: AppCurrencyInputVariant.localized,
                  colors: const AppCurrencyInputColors(
                    backgroundColor: Color(0xFFF3E5F5),
                    borderColor: Color(0xFF9C27B0),
                    focusedBorderColor: Color(0xFF7B1FA2),
                    textColor: Color(0xFF4A148C),
                  ),
                  spacing: const AppCurrencyInputSpacing(
                    borderRadius: 12,
                    borderWidth: 2,
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCurrencyInput),
        matchesGoldenFile('currency_input_custom.png'),
      );
    });

    testWidgets('renders dark theme correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppCurrencyInput(
                amount: 3200.0,
                currency: 'USD',
                label: 'Dark Theme Amount',
                hint: 'Enter amount',
                helperText: 'Dark theme example',
                onChanged: (value) {},
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      await expectLater(
        find.byType(AppCurrencyInput),
        matchesGoldenFile('currency_input_dark_theme.png'),
      );
    });
  });
}