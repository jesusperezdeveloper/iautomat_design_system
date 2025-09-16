import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppBreadcrumbs Golden Tests', () {
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
        title: 'Página Actual',
        type: AppBreadcrumbType.text,
      ),
    ];

    Widget createBreadcrumbsTestApp({
      required AppBreadcrumbsConfig config,
      required List<AppBreadcrumbItem> items,
    }) {
      return MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: 600,
            padding: const EdgeInsets.all(16),
            child: AppBreadcrumbs(
              config: config,
              items: items,
            ),
          ),
        ),
      );
    }

    testWidgets('default variant - basic breadcrumbs', (tester) async {
      await tester.pumpWidget(
        createBreadcrumbsTestApp(
          config: const AppBreadcrumbsConfig(
            variant: AppBreadcrumbsVariant.defaultVariant,
          ),
          items: defaultItems,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('breadcrumbs_default_basic.png'),
      );
    });

    testWidgets('default variant - with home icon', (tester) async {
      await tester.pumpWidget(
        createBreadcrumbsTestApp(
          config: const AppBreadcrumbsConfig(
            variant: AppBreadcrumbsVariant.defaultVariant,
            showHome: true,
          ),
          items: [
            const AppBreadcrumbItem(
              id: 'products',
              title: 'Productos',
              type: AppBreadcrumbType.text,
            ),
            const AppBreadcrumbItem(
              id: 'electronics',
              title: 'Electrónicos',
              type: AppBreadcrumbType.text,
            ),
          ],
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('breadcrumbs_default_with_home.png'),
      );
    });

    testWidgets('collapsing variant - ellipsis mode', (tester) async {
      await tester.pumpWidget(
        createBreadcrumbsTestApp(
          config: const AppBreadcrumbsConfig(
            variant: AppBreadcrumbsVariant.collapsing,
            maxVisibleItems: 3,
            behavior: AppBreadcrumbsBehavior(
              collapseMode: AppBreadcrumbsCollapseMode.ellipsis,
            ),
          ),
          items: longItems,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('breadcrumbs_collapsing_ellipsis.png'),
      );
    });

    testWidgets('collapsing variant - dropdown mode', (tester) async {
      await tester.pumpWidget(
        createBreadcrumbsTestApp(
          config: const AppBreadcrumbsConfig(
            variant: AppBreadcrumbsVariant.collapsing,
            maxVisibleItems: 3,
            behavior: AppBreadcrumbsBehavior(
              collapseMode: AppBreadcrumbsCollapseMode.dropdown,
            ),
          ),
          items: longItems,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('breadcrumbs_collapsing_dropdown.png'),
      );
    });

    testWidgets('loading state', (tester) async {
      await tester.pumpWidget(
        createBreadcrumbsTestApp(
          config: const AppBreadcrumbsConfig(
            state: AppBreadcrumbsState.loading,
          ),
          items: defaultItems,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('breadcrumbs_loading_state.png'),
      );
    });

    testWidgets('skeleton state', (tester) async {
      await tester.pumpWidget(
        createBreadcrumbsTestApp(
          config: const AppBreadcrumbsConfig(
            state: AppBreadcrumbsState.skeleton,
          ),
          items: defaultItems,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('breadcrumbs_skeleton_state.png'),
      );
    });

    testWidgets('disabled state', (tester) async {
      await tester.pumpWidget(
        createBreadcrumbsTestApp(
          config: const AppBreadcrumbsConfig(
            state: AppBreadcrumbsState.disabled,
          ),
          items: defaultItems,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('breadcrumbs_disabled_state.png'),
      );
    });

    testWidgets('different separators', (tester) async {
      final separatorVariants = [
        const AppBreadcrumbSeparator(
          type: AppBreadcrumbSeparatorType.chevron,
        ),
        const AppBreadcrumbSeparator(
          type: AppBreadcrumbSeparatorType.slash,
        ),
        const AppBreadcrumbSeparator(
          type: AppBreadcrumbSeparatorType.arrow,
        ),
        const AppBreadcrumbSeparator(
          type: AppBreadcrumbSeparatorType.dot,
        ),
        const AppBreadcrumbSeparator(
          type: AppBreadcrumbSeparatorType.custom,
          text: ' | ',
        ),
      ];

      for (int i = 0; i < separatorVariants.length; i++) {
        await tester.pumpWidget(
          createBreadcrumbsTestApp(
            config: AppBreadcrumbsConfig(
              separator: separatorVariants[i],
            ),
            items: defaultItems,
          ),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MaterialApp),
          matchesGoldenFile('breadcrumbs_separator_$i.png'),
        );
      }
    });

    testWidgets('different item types', (tester) async {
      const itemTypeVariants = [
        AppBreadcrumbItem(
          id: 'text',
          title: 'Solo Texto',
          type: AppBreadcrumbType.text,
        ),
        AppBreadcrumbItem(
          id: 'icon',
          title: 'Solo Icono',
          icon: Icon(Icons.folder, size: 16),
          type: AppBreadcrumbType.icon,
        ),
        AppBreadcrumbItem(
          id: 'text_with_icon',
          title: 'Texto con Icono',
          icon: Icon(Icons.star, size: 16),
          type: AppBreadcrumbType.textWithIcon,
        ),
        AppBreadcrumbItem(
          id: 'current',
          title: 'Actual',
          type: AppBreadcrumbType.text,
        ),
      ];

      await tester.pumpWidget(
        createBreadcrumbsTestApp(
          config: const AppBreadcrumbsConfig(),
          items: itemTypeVariants,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('breadcrumbs_item_types.png'),
      );
    });

    testWidgets('RTL direction', (tester) async {
      await tester.pumpWidget(
        createBreadcrumbsTestApp(
          config: const AppBreadcrumbsConfig(
            isRtl: true,
          ),
          items: defaultItems,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('breadcrumbs_rtl.png'),
      );
    });

    testWidgets('custom colors', (tester) async {
      await tester.pumpWidget(
        createBreadcrumbsTestApp(
          config: const AppBreadcrumbsConfig(
            colors: AppBreadcrumbsColors(
              backgroundColor: Color(0xFFF5F5F5),
              textColor: Color(0xFF333333),
              selectedTextColor: Color(0xFF2196F3),
              separatorColor: Color(0xFF757575),
              borderColor: Color(0xFFE0E0E0),
            ),
          ),
          items: defaultItems,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('breadcrumbs_custom_colors.png'),
      );
    });

    testWidgets('custom spacing', (tester) async {
      await tester.pumpWidget(
        createBreadcrumbsTestApp(
          config: const AppBreadcrumbsConfig(
            spacing: AppBreadcrumbsSpacing(
              itemPadding: 12.0,
              separatorSpacing: 8.0,
              containerPadding: 24.0,
              iconSpacing: 6.0,
              minHeight: 60.0,
            ),
          ),
          items: defaultItems,
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('breadcrumbs_custom_spacing.png'),
      );
    });
  });
}