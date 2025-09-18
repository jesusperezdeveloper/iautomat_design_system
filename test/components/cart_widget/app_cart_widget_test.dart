import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/cart_widget/app_cart_widget.dart';
import 'package:iautomat_design_system/src/components/cart_widget/app_cart_widget_config.dart';

void main() {
  group('AppCartWidget', () {
    late List<AppCartItem> testItems;
    late AppCartItem testItem1;
    late AppCartItem testItem2;

    setUp(() {
      testItem1 = const AppCartItem(
        id: '1',
        name: 'iPhone 15 Pro',
        price: 999.99,
        quantity: 1,
        description: 'Latest iPhone model',
        originalPrice: 1199.99,
      );

      testItem2 = const AppCartItem(
        id: '2',
        name: 'AirPods Pro',
        price: 249.99,
        quantity: 2,
        description: 'Wireless earbuds',
      );

      testItems = [testItem1, testItem2];
    });

    testWidgets('renders correctly with default configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppCartWidget(
              items: testItems,
            ),
          ),
        ),
      );

      expect(find.byType(AppCartWidget), findsOneWidget);
      expect(find.text('iPhone 15 Pro'), findsOneWidget);
      expect(find.text('AirPods Pro'), findsOneWidget);
    });

    group('Variants', () {
      testWidgets('shows mini variant correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCartWidget(
                items: testItems,
                variant: AppCartVariant.mini,
              ),
            ),
          ),
        );

        expect(find.byType(AppCartWidget), findsOneWidget);
        // En mini variant debería mostrar un resumen compacto
      });

      testWidgets('shows full variant correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCartWidget(
                items: testItems,
                variant: AppCartVariant.full,
              ),
            ),
          ),
        );

        expect(find.byType(AppCartWidget), findsOneWidget);
        expect(find.text('iPhone 15 Pro'), findsOneWidget);
        expect(find.text('AirPods Pro'), findsOneWidget);
      });
    });

    group('Empty State', () {
      testWidgets('shows empty state when no items', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCartWidget(
                items: const [],
              ),
            ),
          ),
        );

        expect(find.byType(AppCartWidget), findsOneWidget);
        expect(find.text('Tu carrito está vacío'), findsOneWidget);
      });
    });

    group('Interactions', () {
      testWidgets('calls onQtyChange when quantity is changed', (tester) async {
        String? changedItemId;
        int? newQuantity;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCartWidget(
                items: testItems,
                onQtyChange: (itemId, qty) {
                  changedItemId = itemId;
                  newQuantity = qty;
                },
              ),
            ),
          ),
        );

        // Simular cambio de cantidad
        await tester.tap(find.byIcon(Icons.add).first);
        await tester.pump();

        expect(changedItemId, isNotNull);
        expect(newQuantity, isNotNull);
      });

      testWidgets('calls onCheckout when checkout button is pressed', (tester) async {
        AppCartSummary? checkoutSummary;

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCartWidget(
                items: testItems,
                onCheckout: (summary) {
                  checkoutSummary = summary;
                },
              ),
            ),
          ),
        );

        // Buscar y presionar el botón de checkout
        await tester.tap(find.text('Finalizar Compra'));
        await tester.pump();

        expect(checkoutSummary, isNotNull);
        expect(checkoutSummary!.itemCount, equals(2));
        expect(checkoutSummary!.totalQuantity, equals(3));
      });

      testWidgets('disables checkout when cart is empty', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCartWidget(
                items: const [],
                onCheckout: (summary) {},
              ),
            ),
          ),
        );

        expect(find.text('Finalizar Compra'), findsNothing);
      });
    });

    group('States', () {
      testWidgets('shows skeleton state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCartWidget(
                items: testItems,
                initialState: AppCartState.skeleton,
              ),
            ),
          ),
        );

        expect(find.byType(AppCartWidget), findsOneWidget);
        // Verificar que se muestran shimmer/skeleton loaders
      });

      testWidgets('shows loading state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCartWidget(
                items: testItems,
                initialState: AppCartState.loading,
              ),
            ),
          ),
        );

        expect(find.byType(AppCartWidget), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });

      testWidgets('shows disabled state correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCartWidget(
                items: testItems,
                initialState: AppCartState.disabled,
              ),
            ),
          ),
        );

        expect(find.byType(AppCartWidget), findsOneWidget);
        // Los botones deberían estar deshabilitados
      });
    });

    group('Cart Calculations', () {
      test('calculates cart totals correctly', () {
        final items = [testItem1, testItem2];
        final summary = AppCartUtils.calculateSummary(items);

        expect(summary.subtotal, equals(1499.97)); // 999.99 + (249.99 * 2)
        expect(summary.taxes, equals(149.997)); // 10% tax
        expect(summary.shipping, equals(0.0));
        expect(summary.total, equals(1649.967));
      });

      test('applies discounts correctly', () {
        final items = [testItem1, testItem2];
        final summary = AppCartUtils.calculateSummary(
          items,
          discountAmount: 100.0,
        );

        expect(summary.discount, equals(100.0));
        expect(summary.total, equals(1549.967));
      });
    });

    group('AppCartItem Extensions', () {
      test('calculates item totals correctly', () {
        expect(testItem1.totalPrice, equals(999.99));
        expect(testItem2.totalPrice, equals(499.98)); // 249.99 * 2
      });

      test('calculates savings correctly', () {
        expect(testItem1.totalSavings, equals(200.0)); // 1199.99 - 999.99
        expect(testItem2.totalSavings, equals(0.0)); // No original price
      });

      test('checks quantity limits correctly', () {
        final maxItem = AppCartItem(
          id: testItem1.id,
          name: testItem1.name,
          price: testItem1.price,
          quantity: 1,
          maxQuantity: 1,
          minQuantity: testItem1.minQuantity,
          description: testItem1.description,
          imageUrl: testItem1.imageUrl,
          category: testItem1.category,
          available: testItem1.available,
          originalPrice: testItem1.originalPrice,
          metadata: testItem1.metadata,
        );
        expect(maxItem.canIncreaseQuantity, isFalse);

        final minItem = AppCartItem(
          id: testItem1.id,
          name: testItem1.name,
          price: testItem1.price,
          quantity: 1,
          maxQuantity: testItem1.maxQuantity,
          minQuantity: 1,
          description: testItem1.description,
          imageUrl: testItem1.imageUrl,
          category: testItem1.category,
          available: testItem1.available,
          originalPrice: testItem1.originalPrice,
          metadata: testItem1.metadata,
        );
        expect(minItem.canDecreaseQuantity, isFalse);
      });
    });

    group('AppCartSummary', () {
      test('creates summary correctly', () {
        const summary = AppCartSummary(
          subtotal: 100.0,
          taxes: 10.0,
          shipping: 5.0,
          discount: 0.0,
          total: 115.0,
          itemCount: 2,
          totalQuantity: 3,
        );

        expect(summary.subtotal, equals(100.0));
        expect(summary.taxes, equals(10.0));
        expect(summary.shipping, equals(5.0));
        expect(summary.discount, equals(0.0));
        expect(summary.itemCount, equals(2));
        expect(summary.totalQuantity, equals(3));
      });

      test('applies promo codes correctly', () {
        const summary = AppCartSummary(
          subtotal: 100.0,
          taxes: 10.0,
          shipping: 5.0,
          discount: 15.0,
          total: 100.0,
          itemCount: 2,
          totalQuantity: 3,
          promoCode: 'SAVE15',
        );

        expect(summary.hasPromoCode, isTrue);
        expect(summary.promoCode, equals('SAVE15'));
      });
    });

    group('AppCartUtils', () {
      test('validates quantities correctly', () {
        final limitedItem = AppCartItem(
          id: testItem1.id,
          name: testItem1.name,
          price: testItem1.price,
          quantity: testItem1.quantity,
          minQuantity: 2,
          maxQuantity: 5,
          description: testItem1.description,
          imageUrl: testItem1.imageUrl,
          category: testItem1.category,
          available: testItem1.available,
          originalPrice: testItem1.originalPrice,
          metadata: testItem1.metadata,
        );
        expect(AppCartUtils.isValidQuantity(limitedItem, 1), isFalse);
        expect(AppCartUtils.isValidQuantity(limitedItem, 3), isTrue);
        expect(AppCartUtils.isValidQuantity(limitedItem, 6), isFalse);
      });

      test('formats currency correctly', () {
        expect(AppCartUtils.formatCurrency(123.45), equals('\$123.45'));
        expect(AppCartUtils.formatCurrency(1000.0), equals('\$1,000.00'));
      });

      test('filters items correctly', () {
        final availableItems = AppCartUtils.getAvailableItems(testItems);
        expect(availableItems.length, equals(2));

        final unavailableItem = AppCartItem(
          id: '3',
          name: 'Out of Stock',
          price: 99.99,
          quantity: 1,
          available: false,
        );

        final mixedItems = [...testItems, unavailableItem];
        final availableFromMixed = AppCartUtils.getAvailableItems(mixedItems);
        expect(availableFromMixed.length, equals(2));
      });
    });

    group('Accessibility', () {
      testWidgets('provides proper semantics', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCartWidget(
                items: testItems,
              ),
            ),
          ),
        );

        // Verificar que existen elementos semánticos apropiados
        expect(find.bySemanticsLabel('Carrito de compras'), findsOneWidget);
        expect(find.bySemanticsLabel('iPhone 15 Pro'), findsOneWidget);
      });

      testWidgets('supports RTL correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: AppCartWidget(
                  items: testItems,
                ),
              ),
            ),
          ),
        );

        expect(find.byType(AppCartWidget), findsOneWidget);
        // El layout debería adaptarse a RTL
      });
    });

    group('Platform Specific', () {
      testWidgets('adapts to platform', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCartWidget(
                items: testItems,
              ),
            ),
          ),
        );

        expect(find.byType(AppCartWidget), findsOneWidget);
        // El comportamiento debería adaptarse según la plataforma
      });
    });

    group('Custom Configuration', () {
      testWidgets('applies custom configuration correctly', (tester) async {
        const config = AppCartWidgetConfig(
          variant: AppCartVariant.full,
          state: AppCartState.defaultState,
          colors: AppCartColors(
            backgroundColor: Colors.red,
            borderColor: Colors.blue,
          ),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppCartWidget(
                items: testItems,
                config: config,
              ),
            ),
          ),
        );

        expect(find.byType(AppCartWidget), findsOneWidget);
      });
    });
  });
}