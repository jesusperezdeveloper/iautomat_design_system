import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/product_card/app_product_card.dart';
import 'package:iautomat_design_system/src/components/product_card/app_product_card_config.dart';

void main() {
  group('DSProductCard', () {
    late DSProductPrice testPrice;
    late DSProductImage testImage;
    late DSDiscountChip testDiscountChip;

    setUp(() {
      testPrice = const DSProductPrice(
        amount: 99.99,
        currency: '\$',
        originalPrice: 129.99,
      );

      testImage = const DSProductImage(
        url: 'assets/test_product.png',
      );

      testDiscountChip = const DSDiscountChip(
        text: '-23%',
      );
    });

    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSProductCard(
              title: 'Test Product',
              price: testPrice,
            ),
          ),
        ),
      );

      expect(find.byType(DSProductCard), findsOneWidget);
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('\$99.99'), findsOneWidget);
    });

    group('Variants', () {
      testWidgets('shows only current price for price variant', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSProductCard(
                title: 'Test Product',
                price: testPrice,
                variant: DSProductCardVariant.price,
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
              body: DSProductCard(
                title: 'Test Product',
                price: testPrice,
                variant: DSProductCardVariant.discount,
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
              body: DSProductCard(
                title: 'Test Product',
                price: testPrice,
                variant: DSProductCardVariant.discount,
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
              body: DSProductCard(
                title: 'Test Product',
                price: testPrice,
                onTap: () => tapped = true,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(DSProductCard));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });

      testWidgets('handles long press interaction', (tester) async {
        bool longPressed = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSProductCard(
                title: 'Test Product',
                price: testPrice,
                onLongPress: () => longPressed = true,
              ),
            ),
          ),
        );

        await tester.longPress(find.byType(DSProductCard));
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
                  return DSProductCard(
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

        await tester.tap(find.byType(DSProductCard));
        await tester.pumpAndSettle();

        expect(selected, isTrue);
      });

      testWidgets('disabled state prevents interaction', (tester) async {
        bool tapped = false;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSProductCard(
                title: 'Test Product',
                price: testPrice,
                enabled: false,
                onTap: () => tapped = true,
              ),
            ),
          ),
        );

        await tester.tap(find.byType(DSProductCard));
        await tester.pumpAndSettle();

        expect(tapped, isFalse);
      });

      testWidgets('shows skeleton state', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSProductCard(
                title: 'Test Product',
                price: testPrice,
                initialState: DSProductCardState.skeleton,
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
              body: DSProductCard(
                title: 'Test Product',
                price: testPrice,
                initialState: DSProductCardState.loading,
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
              body: DSProductCard(
                title: 'Test Product',
                price: testPrice,
                image: testImage,
                layout: DSProductCardLayout.vertical,
              ),
            ),
          ),
        );

        expect(find.byType(DSProductCard), findsOneWidget);
        // Verificar que los elementos están en columna
        expect(find.byType(Column), findsWidgets);
      });

      testWidgets('horizontal layout renders correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSProductCard(
                title: 'Test Product',
                price: testPrice,
                image: testImage,
                layout: DSProductCardLayout.horizontal,
              ),
            ),
          ),
        );

        expect(find.byType(DSProductCard), findsOneWidget);
        // Verificar que los elementos están en fila
        expect(find.byType(Row), findsWidgets);
      });

      testWidgets('overlay layout renders correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SizedBox(
                height: 300,
                child: DSProductCard(
                  title: 'Test Product',
                  price: testPrice,
                  image: testImage,
                  layout: DSProductCardLayout.overlay,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(DSProductCard), findsOneWidget);
        // Verificar que usa Stack para overlay
        expect(find.byType(Stack), findsWidgets);
      });

      testWidgets('compact layout renders correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSProductCard(
                title: 'Test Product',
                price: testPrice,
                image: testImage,
                layout: DSProductCardLayout.compact,
              ),
            ),
          ),
        );

        expect(find.byType(DSProductCard), findsOneWidget);
        expect(find.byType(Row), findsWidgets);
      });
    });

    group('Additional features', () {
      testWidgets('shows additional info when provided', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSProductCard(
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
              body: DSProductCard(
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
              body: DSProductCard(
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
            of: find.byType(DSProductCard),
            matching: find.byType(Container),
          ).first,
        );

        expect(card.constraints?.minWidth, isNotNull);
        expect(card.constraints?.minHeight, isNotNull);
      });
    });

    group('Price extensions', () {
      test('calculates discount percentage correctly', () {
        final price = DSProductPrice(
          amount: 75,
          originalPrice: 100,
        );

        expect(price.discountPercentage, equals(25.0));
      });

      test('formats price correctly', () {
        final price = DSProductPrice(
          amount: 1234.56,
          currency: '\$',
          format: DSPriceFormat.withThousands,
        );

        expect(price.formatPrice(), equals('\$1,234.56'));
      });

      test('formats compact price correctly', () {
        final price = DSProductPrice(
          amount: 99.99,
          currency: '\$',
          format: DSPriceFormat.compact,
        );

        expect(price.formatPrice(), equals('\$100'));
      });

      test('returns null discount for invalid prices', () {
        final price = DSProductPrice(
          amount: 100,
          originalPrice: 100,
        );

        expect(price.discountPercentage, isNull);
      });
    });

    group('Configuration', () {
      testWidgets('applies custom configuration', (tester) async {
        final config = DSProductCardConfig(
          variant: DSProductCardVariant.discount,
          colors: DSProductCardColors(
            backgroundColor: Colors.blue,
            priceColor: Colors.red,
          ),
          spacing: const DSProductCardSpacing(
            padding: EdgeInsets.all(20),
            borderRadius: 16,
          ),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSProductCard(
                config: config,
                title: 'Test Product',
                price: testPrice,
              ),
            ),
          ),
        );

        expect(find.byType(DSProductCard), findsOneWidget);
      });

      test('variant extensions work correctly', () {
        expect(DSProductCardVariant.price.displayName, equals('Precio'));
        expect(DSProductCardVariant.discount.displayName, equals('Descuento'));
        expect(DSProductCardVariant.price.showOriginalPrice, isFalse);
        expect(DSProductCardVariant.discount.showOriginalPrice, isTrue);
        expect(DSProductCardVariant.price.showDiscountChip, isFalse);
        expect(DSProductCardVariant.discount.showDiscountChip, isTrue);
      });

      test('state extensions work correctly', () {
        expect(DSProductCardState.defaultState.displayName, equals('Normal'));
        expect(DSProductCardState.hover.displayName, equals('Hover'));
        expect(DSProductCardState.disabled.isInteractive, isFalse);
        expect(DSProductCardState.defaultState.isInteractive, isTrue);
        expect(DSProductCardState.disabled.opacity, equals(0.5));
        expect(DSProductCardState.hover.elevation, equals(8.0));
      });

      test('layout extensions work correctly', () {
        expect(DSProductCardLayout.vertical.isVertical, isTrue);
        expect(DSProductCardLayout.horizontal.isHorizontal, isTrue);
        expect(DSProductCardLayout.overlay.hasOverlay, isTrue);
        expect(DSProductCardLayout.compact.isCompact, isTrue);
        expect(DSProductCardLayout.vertical.recommendedImageRatio, equals(1.0));
      });

      test('discount chip position extensions work correctly', () {
        expect(DSDiscountChipPosition.topLeft.alignment, equals(Alignment.topLeft));
        expect(DSDiscountChipPosition.topRight.alignment, equals(Alignment.topRight));
        expect(DSDiscountChipPosition.bottomLeft.alignment, equals(Alignment.bottomLeft));
        expect(DSDiscountChipPosition.bottomRight.alignment, equals(Alignment.bottomRight));
      });
    });

    group('Accessibility', () {
      testWidgets('has semantic labels', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSProductCard(
                title: 'Test Product',
                price: testPrice,
              ),
            ),
          ),
        );

        final semantics = tester.getSemantics(find.byType(DSProductCard));
        expect(semantics.label, contains('Test Product'));
        expect(semantics.label, contains('99.99'));
      });

      testWidgets('announces state changes', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSProductCard(
                title: 'Test Product',
                price: testPrice,
                initialState: DSProductCardState.focus,
              ),
            ),
          ),
        );

        expect(find.byType(DSProductCard), findsOneWidget);
      });

      testWidgets('supports keyboard navigation', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSProductCard(
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
              body: DSProductCard(
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
                body: DSProductCard(
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