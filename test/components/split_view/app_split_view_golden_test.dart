import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppSplitView Golden Tests', () {
    const startWidget = Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(Icons.dashboard, size: 48),
            SizedBox(height: 8),
            Text('Panel Izquierdo'),
            Text('Contenido del panel principal'),
          ],
        ),
      ),
    );

    const endWidget = Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(Icons.settings, size: 48),
            SizedBox(height: 8),
            Text('Panel Derecho'),
            Text('Contenido secundario'),
          ],
        ),
      ),
    );

    Widget createSplitViewTestApp({
      required AppSplitViewConfig config,
      Widget? start,
      Widget? end,
    }) {
      return MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: 600,
            height: 400,
            padding: const EdgeInsets.all(16),
            child: AppSplitView(
              config: config,
              start: start ?? startWidget,
              end: end ?? endWidget,
            ),
          ),
        ),
      );
    }

    testWidgets('resizable variant - horizontal', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            variant: AppSplitViewVariant.resizable,
            direction: AppSplitViewDirection.horizontal,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_resizable_horizontal.png'),
      );
    });

    testWidgets('resizable variant - vertical', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            variant: AppSplitViewVariant.resizable,
            direction: AppSplitViewDirection.vertical,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_resizable_vertical.png'),
      );
    });

    testWidgets('twoPane variant - horizontal', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            variant: AppSplitViewVariant.twoPane,
            direction: AppSplitViewDirection.horizontal,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_twopane_horizontal.png'),
      );
    });

    testWidgets('twoPane variant - vertical', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            variant: AppSplitViewVariant.twoPane,
            direction: AppSplitViewDirection.vertical,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_twopane_vertical.png'),
      );
    });

    testWidgets('loading state', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            state: AppSplitViewState.loading,
          ),
        ),
      );
      await tester.pump();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_loading_state.png'),
      );
    });

    testWidgets('skeleton state', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            state: AppSplitViewState.skeleton,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_skeleton_state.png'),
      );
    });

    testWidgets('disabled state', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            state: AppSplitViewState.disabled,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_disabled_state.png'),
      );
    });

    testWidgets('custom colors', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            colors: AppSplitViewColors(
              backgroundColor: Color(0xFFF5F5F5),
              startPaneColor: Color(0xFFE3F2FD),
              endPaneColor: Color(0xFFF3E5F5),
              dividerColor: Color(0xFF2196F3),
              handleColor: Color(0xFF1976D2),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_custom_colors.png'),
      );
    });

    testWidgets('custom spacing', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            spacing: AppSplitViewSpacing(
              dividerWidth: 4.0,
              handleWidth: 16.0,
              padding: 12.0,
              borderRadius: 8.0,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_custom_spacing.png'),
      );
    });

    testWidgets('different ratios', (tester) async {
      final ratios = [0.3, 0.5, 0.7];

      for (int i = 0; i < ratios.length; i++) {
        await tester.pumpWidget(
          createSplitViewTestApp(
            config: AppSplitViewConfig(
              initialRatio: ratios[i],
            ),
          ),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(MaterialApp),
          matchesGoldenFile('split_view_ratio_$i.png'),
        );
      }
    });

    testWidgets('RTL direction', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            isRtl: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_rtl.png'),
      );
    });

    testWidgets('hover state simulation', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            variant: AppSplitViewVariant.resizable,
            state: AppSplitViewState.hover,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_hover_state.png'),
      );
    });

    testWidgets('focus state simulation', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            variant: AppSplitViewVariant.resizable,
            state: AppSplitViewState.focus,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_focus_state.png'),
      );
    });

    testWidgets('pressed state simulation', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            variant: AppSplitViewVariant.resizable,
            state: AppSplitViewState.pressed,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_pressed_state.png'),
      );
    });

    testWidgets('custom elevation', (tester) async {
      await tester.pumpWidget(
        createSplitViewTestApp(
          config: const AppSplitViewConfig(
            elevation: AppSplitViewElevation(
              defaultElevation: 4.0,
              dividerElevation: 2.0,
              shadowColor: Colors.black26,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('split_view_custom_elevation.png'),
      );
    });
  });
}