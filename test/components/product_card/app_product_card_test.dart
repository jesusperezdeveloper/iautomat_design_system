import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/product_card/app_product_card.dart';
import 'package:iautomat_design_system/src/components/product_card/app_product_card_config.dart';

void main() {
  group('AppProductCard', () {
    late AppProductPrice testPrice;
    late AppProductImage testImage;
    late AppDiscountChip testDiscountChip;

    setUp(() {
      testPrice = const AppProductPrice(
        amount: 99.99,
        currency: '\$',
        originalPrice: 129.99,
      );

      testImage = const AppProductImage(
        url: 'assets/test_product.png',
      );

      testDiscountChip = const AppDiscountChip(
        text: '-23%',
      );
    });

    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppProductCard(
              title: 'Test Product',
              price: testPrice,
            ),
          ),
        ),
      );

      expect(find.byType(AppProductCard), findsOneWidget);
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('\$99.99'), findsOneWidget);
    });

    group('Variants', () {
      testWidgets('shows only current price for price variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                variant: AppProductCardVariant.price,
              ),
            ),
          ),
        );

        expect(find.text('\$99.99'), findsOneWidget);
        expect(find.text('\$129.99'), findsNothing);
      });

      testWidgets('shows both prices for discount variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                variant: AppProductCardVariant.discount,
              ),
            ),
          ),
        );

        expect(find.text('\$99.99'), findsOneWidget);
        expect(find.text('\$129.99'), findsOneWidget);
      });

      testWidgets('shows discount chip when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                variant: AppProductCardVariant.discount,
                discountChip: testDiscountChip,
              ),
            ),
          ),
        );

        expect(find.text('-23%'), findsOneWidget);
      });
    });

    group('States', () {
      testWidgets('handles tap interaction', (tester) async {
        bool tapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                onTap: () => tapped = true,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppProductCard));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });

      testWidgets('handles long press interaction', (tester) async {
        bool longPressed = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                onLongPress: () => longPressed = true,
              ),
            ),
          ),
        );

        await tester.longPress(find.byType(AppProductCard));
        await tester.pumpAndSettle();

        expect(longPressed, isTrue);
      });

      testWidgets('handles selection state', (tester) async {
        bool selected = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: StatefulBuilder(
                builder: (context, setState) {
                  return AppProductCard(
                    title: 'Test Product',
                    price: testPrice,
                    selected: selected,
                    onSelectionChanged: (value) {
                      setState(() {
                        selected = value;
                      });
                    },
                  );
                },
              ),
            ),
          ),
        );

        expect(selected, isFalse);

        await tester.tap(find.byType(AppProductCard));
        await tester.pumpAndSettle();

        expect(selected, isTrue);
      });

      testWidgets('disabled state prevents interaction', (tester) async {
        bool tapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                enabled: false,
                onTap: () => tapped = true,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(AppProductCard));
        await tester.pumpAndSettle();

        expect(tapped, isFalse);
      });

      testWidgets('shows skeleton state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                initialState: AppProductCardState.skeleton,
              ),
            ),
          ),
        );

        // En skeleton state, el contenido real no se muestra
        expect(find.text('Test Product'), findsNothing);
      });

      testWidgets('shows loading state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                initialState: AppProductCardState.loading,
              ),
            ),
          ),
        );

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    });

    group('Layouts', () {
      testWidgets('vertical layout renders correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                image: testImage,
                layout: AppProductCardLayout.vertical,
              ),
            ),
          ),
        );

        expect(find.byType(AppProductCard), findsOneWidget);
        // Verificar que los elementos están en columna
        expect(find.byType(Column), findsWidgets);
      });

      testWidgets('horizontal layout renders correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                image: testImage,
                layout: AppProductCardLayout.horizontal,
              ),
            ),
          ),
        );

        expect(find.byType(AppProductCard), findsOneWidget);
        // Verificar que los elementos están en fila
        expect(find.byType(Row), findsWidgets);
      });

      testWidgets('overlay layout renders correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SizedBox(
                height: 300,
                child: AppProductCard(
                  title: 'Test Product',
                  price: testPrice,
                  image: testImage,
                  layout: AppProductCardLayout.overlay,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(AppProductCard), findsOneWidget);
        // Verificar que usa Stack para overlay
        expect(find.byType(Stack), findsWidgets);
      });

      testWidgets('compact layout renders correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                image: testImage,
                layout: AppProductCardLayout.compact,
              ),
            ),
          ),
        );

        expect(find.byType(AppProductCard), findsOneWidget);
        expect(find.byType(Row), findsWidgets);
      });
    });

    group('Additional features', () {
      testWidgets('shows additional info when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                additionalInfo: const Text('Free shipping'),
              ),
            ),
          ),
        );

        expect(find.text('Free shipping'), findsOneWidget);
      });

      testWidgets('shows badge when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                image: testImage,
                badge: Container(
                  padding: const EdgeInsets.all(4),
                  color: Colors.red,
                  child: const Text('NEW'),
                ),
              ),
            ),
          ),
        );

        expect(find.text('NEW'), findsOneWidget);
      });

      testWidgets('respects custom width and height', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                width: 200,
                height: 300,
              ),
            ),
          ),
        );

        final card = tester.widget<Container>(
          find.descendant(
            of: find.byType(AppProductCard),
            matching: find.byType(Container),
          ).first,
        );

        expect(card.constraints?.minWidth, isNotNull);
        expect(card.constraints?.minHeight, isNotNull);
      });
    });

    group('Price extensions', () {
      test('calculates discount percentage correctly', () {
        final price = AppProductPrice(
          amount: 75,
          originalPrice: 100,
        );

        expect(price.discountPercentage, equals(25.0));
      });

      test('formats price correctly', () {
        final price = AppProductPrice(
          amount: 1234.56,
          currency: '\$',
          format: AppPriceFormat.withThousands,
        );

        expect(price.formatPrice(), equals('\$1,234.56'));
      });

      test('formats compact price correctly', () {
        final price = AppProductPrice(
          amount: 99.99,
          currency: '\$',
          format: AppPriceFormat.compact,
        );

        expect(price.formatPrice(), equals('\$100'));
      });

      test('returns null discount for invalid prices', () {
        final price = AppProductPrice(
          amount: 100,
          originalPrice: 100,
        );

        expect(price.discountPercentage, isNull);
      });
    });

    group('Configuration', () {
      testWidgets('applies custom configuration', (tester) async {
        final config = AppProductCardConfig(
          variant: AppProductCardVariant.discount,
          colors: AppProductCardColors(
            backgroundColor: Colors.blue,
            priceColor: Colors.red,
          ),
          spacing: const AppProductCardSpacing(
            padding: EdgeInsets.all(20),
            borderRadius: 16,
          ),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                config: config,
                title: 'Test Product',
                price: testPrice,
              ),
            ),
          ),
        );

        expect(find.byType(AppProductCard), findsOneWidget);
      });

      test('variant extensions work correctly', () {
        expect(AppProductCardVariant.price.displayName, equals('Precio'));
        expect(AppProductCardVariant.discount.displayName, equals('Descuento'));
        expect(AppProductCardVariant.price.showOriginalPrice, isFalse);
        expect(AppProductCardVariant.discount.showOriginalPrice, isTrue);
        expect(AppProductCardVariant.price.showDiscountChip, isFalse);
        expect(AppProductCardVariant.discount.showDiscountChip, isTrue);
      });

      test('state extensions work correctly', () {
        expect(AppProductCardState.defaultState.displayName, equals('Normal'));
        expect(AppProductCardState.hover.displayName, equals('Hover'));
        expect(AppProductCardState.disabled.isInteractive, isFalse);
        expect(AppProductCardState.defaultState.isInteractive, isTrue);
        expect(AppProductCardState.disabled.opacity, equals(0.5));
        expect(AppProductCardState.hover.elevation, equals(8.0));
      });

      test('layout extensions work correctly', () {
        expect(AppProductCardLayout.vertical.isVertical, isTrue);
        expect(AppProductCardLayout.horizontal.isHorizontal, isTrue);
        expect(AppProductCardLayout.overlay.hasOverlay, isTrue);
        expect(AppProductCardLayout.compact.isCompact, isTrue);
        expect(AppProductCardLayout.vertical.recommendedImageRatio, equals(1.0));
      });

      test('discount chip position extensions work correctly', () {
        expect(AppDiscountChipPosition.topLeft.alignment, equals(Alignment.topLeft));
        expect(AppDiscountChipPosition.topRight.alignment, equals(Alignment.topRight));
        expect(AppDiscountChipPosition.bottomLeft.alignment, equals(Alignment.bottomLeft));
        expect(AppDiscountChipPosition.bottomRight.alignment, equals(Alignment.bottomRight));
      });
    });

    group('Accessibility', () {
      testWidgets('has semantic labels', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
              ),
            ),
          ),
        );

        final semantics = tester.getSemantics(find.byType(AppProductCard));
        expect(semantics.label, contains('Test Product'));
        expect(semantics.label, contains('99.99'));
      });

      testWidgets('announces state changes', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                initialState: AppProductCardState.focus,
              ),
            ),
          ),
        );

        expect(find.byType(AppProductCard), findsOneWidget);
      });

      testWidgets('supports keyboard navigation', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
                onTap: () {},
              ),
            ),
          ),
        );

        expect(find.byType(KeyboardListener), findsWidgets);
      });
    });

    group('Platform differences', () {
      testWidgets('renders for Android platform', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppProductCard(
                title: 'Test Product',
                price: testPrice,
              ),
            ),
          ),
        );

        expect(find.byType(Card), findsWidgets);
      });

      testWidgets('handles RTL layout', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: AppProductCard(
                  title: 'منتج تجريبي',
                  price: testPrice,
                ),
              ),
            ),
          ),
        );

        expect(find.text('منتج تجريبي'), findsOneWidget);
      });
    });
  });
}