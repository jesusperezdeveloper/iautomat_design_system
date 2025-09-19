import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/product_card/app_product_card.dart';
import 'package:iautomat_design_system/src/components/product_card/app_product_card_config.dart';

void main() {
  group('DSProductCard Golden Tests', () {
    // Configuración común
    final testPrice = DSProductPrice(
      amount: 99.99,
      currency: '\$',
      originalPrice: 129.99,
    );

    final testImage = DSProductImage(
      url: 'https://via.placeholder.com/300',
    );

    final testDiscountChip = DSDiscountChip(
      text: '-23%',
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );

    setUpAll(() {
      // Configurar el tamaño de la ventana de prueba
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    testWidgets('default state golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 250,
                height: 350,
                child: DSProductCard(
                  title: 'iPhone 15 Pro',
                  price: testPrice,
                  image: testImage,
                  variant: DSProductCardVariant.price,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSProductCard),
        matchesGoldenFile('goldens/app_product_card_default.png'),
      );
    });

    testWidgets('discount variant golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 250,
                height: 350,
                child: DSProductCard(
                  title: 'iPhone 15 Pro',
                  price: testPrice,
                  image: testImage,
                  variant: DSProductCardVariant.discount,
                  discountChip: testDiscountChip,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSProductCard),
        matchesGoldenFile('goldens/app_product_card_discount.png'),
      );
    });

    // Tests para todos los estados
    final states = [
      DSProductCardState.hover,
      DSProductCardState.pressed,
      DSProductCardState.focus,
      DSProductCardState.selected,
      DSProductCardState.disabled,
      DSProductCardState.loading,
      DSProductCardState.skeleton,
    ];

    for (final state in states) {
      testWidgets('$state state golden test', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SizedBox(
                  width: 250,
                  height: 350,
                  child: DSProductCard(
                    title: 'iPhone 15 Pro',
                    price: testPrice,
                    image: testImage,
                    initialState: state,
                    variant: DSProductCardVariant.discount,
                    discountChip: testDiscountChip,
                    selected: state == DSProductCardState.selected,
                    enabled: state != DSProductCardState.disabled,
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        await expectLater(
          find.byType(DSProductCard),
          matchesGoldenFile('goldens/app_product_card_${state.name}.png'),
        );
      });
    }

    // Tests para todos los layouts
    final layouts = [
      DSProductCardLayout.vertical,
      DSProductCardLayout.horizontal,
      DSProductCardLayout.overlay,
      DSProductCardLayout.compact,
    ];

    for (final layout in layouts) {
      testWidgets('$layout layout golden test', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SizedBox(
                  width: layout == DSProductCardLayout.horizontal ? 400 : 250,
                  height: layout == DSProductCardLayout.compact ? 100 : 350,
                  child: DSProductCard(
                    title: 'iPhone 15 Pro Max 256GB',
                    price: testPrice,
                    image: testImage,
                    layout: layout,
                    variant: DSProductCardVariant.discount,
                    discountChip: testDiscountChip,
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(DSProductCard),
          matchesGoldenFile('goldens/app_product_card_layout_${layout.name}.png'),
        );
      });
    }

    testWidgets('dark theme golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            backgroundColor: Colors.grey[900],
            body: Center(
              child: SizedBox(
                width: 250,
                height: 350,
                child: DSProductCard(
                  title: 'iPhone 15 Pro',
                  price: testPrice,
                  image: testImage,
                  variant: DSProductCardVariant.discount,
                  discountChip: testDiscountChip,
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSProductCard),
        matchesGoldenFile('goldens/app_product_card_dark.png'),
      );
    });

    testWidgets('with additional info golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 250,
                height: 350,
                child: DSProductCard(
                  title: 'iPhone 15 Pro',
                  price: testPrice,
                  image: testImage,
                  variant: DSProductCardVariant.discount,
                  discountChip: testDiscountChip,
                  additionalInfo: Row(
                    children: [
                      Icon(Icons.local_shipping, size: 16, color: Colors.green),
                      SizedBox(width: 4),
                      Text(
                        'Free shipping',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSProductCard),
        matchesGoldenFile('goldens/app_product_card_additional_info.png'),
      );
    });

    testWidgets('with badge golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 250,
                height: 350,
                child: DSProductCard(
                  title: 'iPhone 15 Pro',
                  price: testPrice,
                  image: testImage,
                  variant: DSProductCardVariant.discount,
                  discountChip: testDiscountChip,
                  badge: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'NEW',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSProductCard),
        matchesGoldenFile('goldens/app_product_card_badge.png'),
      );
    });

    testWidgets('RTL layout golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SizedBox(
                  width: 250,
                  height: 350,
                  child: DSProductCard(
                    title: 'آيفون 15 برو',
                    price: DSProductPrice(
                      amount: 3999,
                      currency: 'ر.س',
                      originalPrice: 4999,
                    ),
                    image: testImage,
                    variant: DSProductCardVariant.discount,
                    discountChip: DSDiscountChip(
                      text: 'خصم ٢٠٪',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSProductCard),
        matchesGoldenFile('goldens/app_product_card_rtl.png'),
      );
    });

    testWidgets('grid layout golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Padding(
              padding: EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.7,
                children: List.generate(4, (index) {
                  return DSProductCard(
                    title: 'Product ${index + 1}',
                    price: DSProductPrice(
                      amount: 99.99 + (index * 50),
                      currency: '\$',
                      originalPrice: index % 2 == 0 ? 149.99 : null,
                    ),
                    image: testImage,
                    variant: index % 2 == 0
                        ? DSProductCardVariant.discount
                        : DSProductCardVariant.price,
                    discountChip: index % 2 == 0
                        ? DSDiscountChip(text: '-${(index + 1) * 10}%')
                        : null,
                  );
                }),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/app_product_card_grid.png'),
      );
    });

    testWidgets('custom colors golden test', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 250,
                height: 350,
                child: DSProductCard(
                  title: 'Custom Styled Product',
                  price: testPrice,
                  image: testImage,
                  variant: DSProductCardVariant.discount,
                  discountChip: DSDiscountChip(
                    text: 'HOT DEAL',
                    backgroundColor: Colors.purple,
                    textColor: Colors.yellow,
                  ),
                  config: DSProductCardConfig(
                    colors: DSProductCardColors(
                      backgroundColor: Colors.purple[50],
                      borderColor: Colors.purple,
                      priceColor: Colors.purple,
                      titleColor: Colors.purple[900],
                      discountBackgroundColor: Colors.orange,
                      discountTextColor: Colors.white,
                    ),
                    spacing: DSProductCardSpacing(
                      borderRadius: 20,
                      borderWidth: 2,
                      padding: EdgeInsets.all(16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSProductCard),
        matchesGoldenFile('goldens/app_product_card_custom_colors.png'),
      );
    });

    testWidgets('different discount positions golden test', (tester) async {
      final positions = [
        DSDiscountChipPosition.topLeft,
        DSDiscountChipPosition.topRight,
        DSDiscountChipPosition.bottomLeft,
        DSDiscountChipPosition.bottomRight,
      ];

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: positions.map((position) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: AspectRatio(
                        aspectRatio: 0.7,
                        child: DSProductCard(
                          title: 'Product',
                          price: testPrice,
                          image: testImage,
                          variant: DSProductCardVariant.discount,
                          discountChip: DSDiscountChip(
                            text: '-20%',
                            position: position,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/app_product_card_discount_positions.png'),
      );
    });
  });
}