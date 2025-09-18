import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppBreadcrumbs', () {
    const defaultItems = [
      AppBreadcrumbItem(
        id: 'home',
        title: 'Inicio',
        icon: Icon(Icons.home, size: 16),
        type: AppBreadcrumbType.icon,
      ),
      AppBreadcrumbItem(
        id: 'products',
        title: 'Productos',
        type: AppBreadcrumbType.text,
      ),
      AppBreadcrumbItem(
        id: 'electronics',
        title: 'Electrónicos',
        type: AppBreadcrumbType.text,
      ),
    ];

    Widget createBreadcrumbsApp({
      AppBreadcrumbsConfig? config,
      List<AppBreadcrumbItem>? items,
      ValueChanged<AppBreadcrumbItem>? onTap,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: AppBreadcrumbs(
            config: config ?? const AppBreadcrumbsConfig(),
            items: items,
            onTap: onTap,
          ),
        ),
      );
    }

    testWidgets('renders basic breadcrumbs correctly', (tester) async {
      await tester.pumpWidget(createBreadcrumbsApp(items: defaultItems));
      await tester.pumpAndSettle();

      expect(find.text('Inicio'), findsNothing);
      expect(find.text('Productos'), findsOneWidget);
      expect(find.text('Electrónicos'), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsWidgets);
    });

    testWidgets('shows loading state correctly', (tester) async {
      await tester.pumpWidget(createBreadcrumbsApp(
        config: const AppBreadcrumbsConfig(
          state: AppBreadcrumbsState.loading,
        ),
        items: defaultItems,
      ));
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Cargando navegación...'), findsOneWidget);
    });

    testWidgets('shows skeleton state correctly', (tester) async {
      await tester.pumpWidget(createBreadcrumbsApp(
        config: const AppBreadcrumbsConfig(
          state: AppBreadcrumbsState.skeleton,
        ),
        items: defaultItems,
      ));
      await tester.pumpAndSettle();

      expect(find.byType(Container), findsWidgets);
    });

    testWidgets('handles empty items list', (tester) async {
      await tester.pumpWidget(createBreadcrumbsApp(items: []));
      await tester.pumpAndSettle();

      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('shows home item when showHome is true', (tester) async {
      await tester.pumpWidget(createBreadcrumbsApp(
        config: const AppBreadcrumbsConfig(showHome: true),
        items: [
          const AppBreadcrumbItem(
            id: 'products',
            title: 'Productos',
            type: AppBreadcrumbType.text,
          ),
        ],
      ));
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.text('Productos'), findsOneWidget);
    });

    testWidgets('handles item tap correctly', (tester) async {
      AppBreadcrumbItem? tappedItem;

      await tester.pumpWidget(createBreadcrumbsApp(
        items: defaultItems,
        onTap: (item) {
          tappedItem = item;
        },
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Productos'));
      await tester.pumpAndSettle();

      expect(tappedItem?.id, equals('products'));
    });

    testWidgets('does not allow tapping on last item', (tester) async {
      bool wasTapped = false;

      await tester.pumpWidget(createBreadcrumbsApp(
        items: defaultItems,
        onTap: (item) {
          wasTapped = true;
        },
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Electrónicos'));
      await tester.pumpAndSettle();

      expect(wasTapped, isFalse);
    });

    testWidgets('does not allow tapping when disabled', (tester) async {
      bool wasTapped = false;

      await tester.pumpWidget(createBreadcrumbsApp(
        config: const AppBreadcrumbsConfig(
          state: AppBreadcrumbsState.disabled,
        ),
        items: defaultItems,
        onTap: (item) {
          wasTapped = true;
        },
      ));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Productos'));
      await tester.pumpAndSettle();

      expect(wasTapped, isFalse);
    });

    group('Collapsing variant', () {
      const longItems = [
        AppBreadcrumbItem(
          id: 'home',
          title: 'Inicio',
          type: AppBreadcrumbType.text,
        ),
        AppBreadcrumbItem(
          id: 'level1',
          title: 'Nivel 1',
          type: AppBreadcrumbType.text,
        ),
        AppBreadcrumbItem(
          id: 'level2',
          title: 'Nivel 2',
          type: AppBreadcrumbType.text,
        ),
        AppBreadcrumbItem(
          id: 'level3',
          title: 'Nivel 3',
          type: AppBreadcrumbType.text,
        ),
        AppBreadcrumbItem(
          id: 'level4',
          title: 'Nivel 4',
          type: AppBreadcrumbType.text,
        ),
        AppBreadcrumbItem(
          id: 'current',
          title: 'Actual',
          type: AppBreadcrumbType.text,
        ),
      ];

      testWidgets('shows ellipsis when items exceed maxVisibleItems',
          (tester) async {
        await tester.pumpWidget(createBreadcrumbsApp(
          config: const AppBreadcrumbsConfig(
            variant: AppBreadcrumbsVariant.collapsing,
            maxVisibleItems: 3,
            behavior: AppBreadcrumbsBehavior(
              collapseMode: AppBreadcrumbsCollapseMode.ellipsis,
            ),
          ),
          items: longItems,
        ));
        await tester.pumpAndSettle();

        expect(find.text('...'), findsOneWidget);
        expect(find.text('Inicio'), findsOneWidget);
        expect(find.text('Actual'), findsOneWidget);
      });

      testWidgets('shows dropdown when collapse mode is dropdown',
          (tester) async {
        await tester.pumpWidget(createBreadcrumbsApp(
          config: const AppBreadcrumbsConfig(
            variant: AppBreadcrumbsVariant.collapsing,
            maxVisibleItems: 3,
            behavior: AppBreadcrumbsBehavior(
              collapseMode: AppBreadcrumbsCollapseMode.dropdown,
            ),
          ),
          items: longItems,
        ));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.more_horiz), findsOneWidget);
        expect(find.byType(PopupMenuButton<AppBreadcrumbItem>), findsOneWidget);
      });

      testWidgets('opens dropdown menu on tap', (tester) async {
        await tester.pumpWidget(createBreadcrumbsApp(
          config: const AppBreadcrumbsConfig(
            variant: AppBreadcrumbsVariant.collapsing,
            maxVisibleItems: 3,
            behavior: AppBreadcrumbsBehavior(
              collapseMode: AppBreadcrumbsCollapseMode.dropdown,
            ),
          ),
          items: longItems,
        ));
        await tester.pumpAndSettle();

        await tester.tap(find.byIcon(Icons.more_horiz));
        await tester.pumpAndSettle();

        expect(find.text('Nivel 2'), findsOneWidget);
        expect(find.text('Nivel 3'), findsOneWidget);
      });

      testWidgets('does not show collapse indicator when items fit',
          (tester) async {
        await tester.pumpWidget(createBreadcrumbsApp(
          config: const AppBreadcrumbsConfig(
            variant: AppBreadcrumbsVariant.collapsing,
            maxVisibleItems: 5,
          ),
          items: defaultItems,
        ));
        await tester.pumpAndSettle();

        expect(find.text('...'), findsNothing);
        expect(find.byIcon(Icons.more_horiz), findsNothing);
      });
    });

    group('Separators', () {
      testWidgets('shows chevron separator by default', (tester) async {
        await tester.pumpWidget(createBreadcrumbsApp(items: defaultItems));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.chevron_right), findsWidgets);
      });

      testWidgets('shows custom separator when provided', (tester) async {
        await tester.pumpWidget(createBreadcrumbsApp(
          config: const AppBreadcrumbsConfig(
            separator: AppBreadcrumbSeparator(
              type: AppBreadcrumbSeparatorType.slash,
            ),
          ),
          items: defaultItems,
        ));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.keyboard_arrow_right), findsWidgets);
      });

      testWidgets('shows text separator when provided', (tester) async {
        await tester.pumpWidget(createBreadcrumbsApp(
          config: const AppBreadcrumbsConfig(
            separator: AppBreadcrumbSeparator(
              type: AppBreadcrumbSeparatorType.custom,
              text: ' > ',
            ),
          ),
          items: defaultItems,
        ));
        await tester.pumpAndSettle();

        expect(find.text(' > '), findsWidgets);
      });
    });

    group('Item types', () {
      testWidgets('renders text-only items correctly', (tester) async {
        const items = [
          AppBreadcrumbItem(
            id: 'text',
            title: 'Text Item',
            type: AppBreadcrumbType.text,
          ),
        ];

        await tester.pumpWidget(createBreadcrumbsApp(items: items));
        await tester.pumpAndSettle();

        expect(find.text('Text Item'), findsOneWidget);
      });

      testWidgets('renders icon-only items correctly', (tester) async {
        const items = [
          AppBreadcrumbItem(
            id: 'icon',
            title: 'Icon Item',
            icon: Icon(Icons.folder, size: 16),
            type: AppBreadcrumbType.icon,
          ),
        ];

        await tester.pumpWidget(createBreadcrumbsApp(items: items));
        await tester.pumpAndSettle();

        expect(find.byIcon(Icons.folder), findsOneWidget);
      });

      testWidgets('renders text with icon items correctly', (tester) async {
        const items = [
          AppBreadcrumbItem(
            id: 'textWithIcon',
            title: 'Text with Icon',
            icon: Icon(Icons.star, size: 16),
            type: AppBreadcrumbType.textWithIcon,
          ),
        ];

        await tester.pumpWidget(createBreadcrumbsApp(items: items));
        await tester.pumpAndSettle();

        expect(find.text('Text with Icon'), findsOneWidget);
        expect(find.byIcon(Icons.star), findsOneWidget);
      });
    });

    group('RTL support', () {
      testWidgets('applies RTL directionality when isRtl is true',
          (tester) async {
        await tester.pumpWidget(createBreadcrumbsApp(
          config: const AppBreadcrumbsConfig(isRtl: true),
          items: defaultItems,
        ));
        await tester.pumpAndSettle();

        final directionalities = tester.widgetList<Directionality>(
          find.byType(Directionality),
        );

        // Buscar el Directionality del breadcrumb (no el del MaterialApp)
        bool foundRtl = false;
        for (final directionality in directionalities) {
          if (directionality.textDirection == TextDirection.rtl) {
            foundRtl = true;
            break;
          }
        }
        expect(foundRtl, isTrue);
      });
    });

    group('Accessibility', () {
      testWidgets('provides semantic labels when a11y is enabled',
          (tester) async {
        await tester.pumpWidget(createBreadcrumbsApp(
          config: const AppBreadcrumbsConfig(enableA11y: true),
          items: defaultItems,
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Semantics), findsWidgets);
      });

      testWidgets('provides tooltips when enabled', (tester) async {
        await tester.pumpWidget(createBreadcrumbsApp(
          config: const AppBreadcrumbsConfig(
            behavior: AppBreadcrumbsBehavior(showTooltips: true),
          ),
          items: [
            const AppBreadcrumbItem(
              id: 'item',
              title: 'Item',
              tooltip: 'Item tooltip',
              type: AppBreadcrumbType.text,
            ),
          ],
        ));
        await tester.pumpAndSettle();

        expect(find.byType(Tooltip), findsWidgets);
      });
    });
  });
}
