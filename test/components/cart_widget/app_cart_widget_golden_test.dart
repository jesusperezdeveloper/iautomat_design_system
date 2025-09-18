import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppCartWidget Golden Tests', () {
    final testItems = [
      const AppCartItem(
        id: '1',
        name: 'Product 1',
        price: 29.99,
        quantity: 2,
        imageUrl: 'https://example.com/product1.jpg',
        description: 'High-quality product with great features',
      ),
      const AppCartItem(
        id: '2',
        name: 'Product 2',
        price: 19.99,
        quantity: 1,
        imageUrl: 'https://example.com/product2.jpg',
        description: 'Another amazing product',
      ),
    ];

    Widget createCartWidget({
      AppCartWidgetConfig? config,
      List<AppCartItem>? items,
      AppCartVariant? variant,
      AppCartState? state,
    }) {
      return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 400,
              height: 600,
              child: AppCartWidget(
                config: config,
                items: items ?? testItems,
                variant: variant,
                initialState: state,
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('full variant default state', (tester) async {
      await tester.pumpWidget(createCartWidget(
        variant: AppCartVariant.full,
        state: AppCartState.defaultState,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_full_default.png'),
      );
    });

    testWidgets('mini variant default state', (tester) async {
      await tester.pumpWidget(createCartWidget(
        variant: AppCartVariant.mini,
        state: AppCartState.defaultState,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_mini_default.png'),
      );
    });

    testWidgets('full variant hover state', (tester) async {
      await tester.pumpWidget(createCartWidget(
        variant: AppCartVariant.full,
        state: AppCartState.hover,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_full_hover.png'),
      );
    });

    testWidgets('full variant loading state', (tester) async {
      await tester.pumpWidget(createCartWidget(
        variant: AppCartVariant.full,
        state: AppCartState.loading,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_full_loading.png'),
      );
    });

    testWidgets('full variant skeleton state', (tester) async {
      await tester.pumpWidget(createCartWidget(
        variant: AppCartVariant.full,
        state: AppCartState.skeleton,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_full_skeleton.png'),
      );
    });

    testWidgets('mini variant disabled state', (tester) async {
      await tester.pumpWidget(createCartWidget(
        variant: AppCartVariant.mini,
        state: AppCartState.disabled,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_mini_disabled.png'),
      );
    });

    testWidgets('empty cart state', (tester) async {
      await tester.pumpWidget(createCartWidget(
        items: [],
        variant: AppCartVariant.full,
        state: AppCartState.defaultState,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_empty.png'),
      );
    });

    testWidgets('custom colors configuration', (tester) async {
      final customConfig = AppCartWidgetConfig(
        variant: AppCartVariant.full,
        state: AppCartState.defaultState,
        colors: const AppCartColors(
          backgroundColor: Colors.grey,
          borderColor: Colors.grey,
          headerColor: Colors.purple,
          headerTextColor: Colors.white,
          titleColor: Colors.black,
          descriptionColor: Colors.grey,
          priceColor: Colors.black,
          totalColor: Colors.purple,
          buttonPrimaryColor: Colors.purple,
          buttonSecondaryColor: Colors.amber,
          buttonTextColor: Colors.white,
        ),
      );

      await tester.pumpWidget(createCartWidget(
        config: customConfig,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_custom_colors.png'),
      );
    });

    testWidgets('RTL layout', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(useMaterial3: true),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  width: 400,
                  height: 600,
                  child: AppCartWidget(
                    items: testItems,
                    variant: AppCartVariant.full,
                    initialState: AppCartState.defaultState,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_rtl.png'),
      );
    });

    testWidgets('dark theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(useMaterial3: true),
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 400,
                height: 600,
                child: AppCartWidget(
                  items: testItems,
                  variant: AppCartVariant.full,
                  initialState: AppCartState.defaultState,
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_dark_theme.png'),
      );
    });

    testWidgets('large item list', (tester) async {
      final manyItems = List.generate(10, (index) => AppCartItem(
        id: 'item_$index',
        name: 'Product ${index + 1}',
        price: 10.0 + (index * 5),
        quantity: 1 + (index % 3),
        imageUrl: 'https://example.com/product${index + 1}.jpg',
        description: 'Product description for item ${index + 1}',
      ));

      await tester.pumpWidget(createCartWidget(
        items: manyItems,
        variant: AppCartVariant.full,
        state: AppCartState.defaultState,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_many_items.png'),
      );
    });

    testWidgets('focused state', (tester) async {
      await tester.pumpWidget(createCartWidget(
        variant: AppCartVariant.full,
        state: AppCartState.focus,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_focus.png'),
      );
    });

    testWidgets('pressed state', (tester) async {
      await tester.pumpWidget(createCartWidget(
        variant: AppCartVariant.full,
        state: AppCartState.pressed,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_pressed.png'),
      );
    });

    testWidgets('selected state', (tester) async {
      await tester.pumpWidget(createCartWidget(
        variant: AppCartVariant.full,
        state: AppCartState.selected,
      ));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AppCartWidget),
        matchesGoldenFile('golden/cart_widget_selected.png'),
      );
    });
  });
}