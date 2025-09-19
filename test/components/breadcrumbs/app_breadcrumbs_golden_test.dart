import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSBreadcrumbs Golden Tests', () {
    const defaultItems = [
      DSBreadcrumbItem(
        id: 'home',
        title: 'Inicio',
        icon: Icon(Icons.home, size: 16),
        type: DSBreadcrumbType.icon,
      ),
      DSBreadcrumbItem(
        id: 'products',
        title: 'Productos',
        type: DSBreadcrumbType.text,
      ),
      DSBreadcrumbItem(
        id: 'electronics',
        title: 'Electrónicos',
        type: DSBreadcrumbType.text,
      ),
    ];

    const longItems = [
      DSBreadcrumbItem(
        id: 'home',
        title: 'Inicio',
        type: DSBreadcrumbType.text,
      ),
      DSBreadcrumbItem(
        id: 'level1',
        title: 'Nivel 1',
        type: DSBreadcrumbType.text,
      ),
      DSBreadcrumbItem(
        id: 'level2',
        title: 'Nivel 2',
        type: DSBreadcrumbType.text,
      ),
      DSBreadcrumbItem(
        id: 'level3',
        title: 'Nivel 3',
        type: DSBreadcrumbType.text,
      ),
      DSBreadcrumbItem(
        id: 'level4',
        title: 'Nivel 4',
        type: DSBreadcrumbType.text,
      ),
      DSBreadcrumbItem(
        id: 'current',
        title: 'Página Actual',
        type: DSBreadcrumbType.text,
      ),
    ];

    Widget createBreadcrumbsTestApp({
      required DSBreadcrumbsConfig config,
      required List<DSBreadcrumbItem> items,
    }) {
      return MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: 600,
            padding: const EdgeInsets.all(16),
            child: DSBreadcrumbs(
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
          config: const DSBreadcrumbsConfig(
            variant: DSBreadcrumbsVariant.defaultVariant,
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
          config: const DSBreadcrumbsConfig(
            variant: DSBreadcrumbsVariant.defaultVariant,
            showHome: true,
          ),
          items: [
            const DSBreadcrumbItem(
              id: 'products',
              title: 'Productos',
              type: DSBreadcrumbType.text,
            ),
            const DSBreadcrumbItem(
              id: 'electronics',
              title: 'Electrónicos',
              type: DSBreadcrumbType.text,
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
          config: const DSBreadcrumbsConfig(
            variant: DSBreadcrumbsVariant.collapsing,
            maxVisibleItems: 3,
            behavior: DSBreadcrumbsBehavior(
              collapseMode: DSBreadcrumbsCollapseMode.ellipsis,
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
          config: const DSBreadcrumbsConfig(
            variant: DSBreadcrumbsVariant.collapsing,
            maxVisibleItems: 3,
            behavior: DSBreadcrumbsBehavior(
              collapseMode: DSBreadcrumbsCollapseMode.dropdown,
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
          config: const DSBreadcrumbsConfig(
            state: DSBreadcrumbsState.loading,
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
          config: const DSBreadcrumbsConfig(
            state: DSBreadcrumbsState.skeleton,
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
          config: const DSBreadcrumbsConfig(
            state: DSBreadcrumbsState.disabled,
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
        const DSBreadcrumbSeparator(
          type: DSBreadcrumbSeparatorType.chevron,
        ),
        const DSBreadcrumbSeparator(
          type: DSBreadcrumbSeparatorType.slash,
        ),
        const DSBreadcrumbSeparator(
          type: DSBreadcrumbSeparatorType.arrow,
        ),
        const DSBreadcrumbSeparator(
          type: DSBreadcrumbSeparatorType.dot,
        ),
        const DSBreadcrumbSeparator(
          type: DSBreadcrumbSeparatorType.custom,
          text: ' | ',
        ),
      ];

      for (int i = 0; i < separatorVariants.length; i++) {
        await tester.pumpWidget(
          createBreadcrumbsTestApp(
            config: DSBreadcrumbsConfig(
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
        DSBreadcrumbItem(
          id: 'text',
          title: 'Solo Texto',
          type: DSBreadcrumbType.text,
        ),
        DSBreadcrumbItem(
          id: 'icon',
          title: 'Solo Icono',
          icon: Icon(Icons.folder, size: 16),
          type: DSBreadcrumbType.icon,
        ),
        DSBreadcrumbItem(
          id: 'text_with_icon',
          title: 'Texto con Icono',
          icon: Icon(Icons.star, size: 16),
          type: DSBreadcrumbType.textWithIcon,
        ),
        DSBreadcrumbItem(
          id: 'current',
          title: 'Actual',
          type: DSBreadcrumbType.text,
        ),
      ];

      await tester.pumpWidget(
        createBreadcrumbsTestApp(
          config: const DSBreadcrumbsConfig(),
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
          config: const DSBreadcrumbsConfig(
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
          config: const DSBreadcrumbsConfig(
            colors: DSBreadcrumbsColors(
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
          config: const DSBreadcrumbsConfig(
            spacing: DSBreadcrumbsSpacing(
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
