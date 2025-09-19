import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/tour/app_tour.dart';
import 'package:iautomat_design_system/src/components/tour/app_tour_config.dart';

void main() {
  group('DSTour Golden Tests', () {
    late GlobalKey targetKey1;
    late GlobalKey targetKey2;
    late GlobalKey targetKey3;

    setUp(() {
      targetKey1 = GlobalKey();
      targetKey2 = GlobalKey();
      targetKey3 = GlobalKey();
    });

    Widget buildTestWidget({
      required DSTourConfig config,
      required List<DSTourStep> steps,
      ThemeData? theme,
      TextDirection? textDirection,
    }) {
      return MaterialApp(
        theme: theme ?? ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: Directionality(
          textDirection: textDirection ?? TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Tour Test'),
              leading: Container(
                key: targetKey1,
                child: const Icon(Icons.menu),
              ),
              actions: [
                Container(
                  key: targetKey2,
                  child: const Icon(Icons.search),
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    key: targetKey3,
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text('Target Content'),
                    ),
                  ),
                  DSTour(
                    config: config,
                    steps: steps,
                    onFinish: () {},
                    onSkip: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('basic tour default state', (tester) async {
      final steps = [
        DSTourStep(
          id: 'step_1',
          targetKey: targetKey1,
          title: 'Menú Principal',
          description: 'Aquí puedes acceder al menú de navegación principal.',
          position: DSTourPosition.bottom,
        ),
      ];

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(
          variant: DSTourVariant.coachmarks,
          enableA11y: false, // Disable for golden test consistency
        ),
        steps: steps,
      ));

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/basic_tour_default.png'),
      );
    });

    testWidgets('tour with progress indicator', (tester) async {
      final steps = [
        DSTourStep(
          id: 'step_1',
          targetKey: targetKey2,
          title: 'Búsqueda',
          description: 'Utiliza esta función para buscar contenido.',
          position: DSTourPosition.bottom,
        ),
        DSTourStep(
          id: 'step_2',
          targetKey: targetKey3,
          title: 'Contenido',
          description: 'Este es el área principal de contenido.',
          position: DSTourPosition.top,
        ),
      ];

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(
          variant: DSTourVariant.coachmarks,
          showProgress: true,
          enableA11y: false,
        ),
        steps: steps,
      ));

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/tour_with_progress.png'),
      );
    });

    testWidgets('tour without skip button', (tester) async {
      final steps = [
        DSTourStep(
          id: 'step_1',
          targetKey: targetKey3,
          title: 'Elemento Central',
          description: 'Este es un elemento importante en el centro.',
          position: DSTourPosition.auto,
        ),
      ];

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(
          variant: DSTourVariant.coachmarks,
          enableSkip: false,
          enableA11y: false,
        ),
        steps: steps,
      ));

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/tour_no_skip_button.png'),
      );
    });

    testWidgets('tour with custom colors', (tester) async {
      final steps = [
        DSTourStep(
          id: 'step_1',
          targetKey: targetKey1,
          title: 'Tour Personalizado',
          description: 'Este tour tiene colores personalizados para mejor integración visual.',
          position: DSTourPosition.right,
        ),
      ];

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(
          variant: DSTourVariant.coachmarks,
          enableA11y: false,
          colors: DSTourColors(
            backgroundColor: Color(0xFF2E3440),
            overlayColor: Color(0xAA434C5E),
            textColor: Color(0xFFECEFF4),
            titleColor: Color(0xFFD8DEE9),
            buttonColor: Color(0xFF5E81AC),
            buttonTextColor: Color(0xFFECEFF4),
            progressColor: Color(0xFF88C0D0),
            targetHighlightColor: Color(0xFF81A1C1),
            targetBorderColor: Color(0xFF5E81AC),
          ),
        ),
        steps: steps,
      ));

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/tour_custom_colors.png'),
      );
    });

    testWidgets('tour with custom spacing', (tester) async {
      final steps = [
        DSTourStep(
          id: 'step_1',
          targetKey: targetKey2,
          title: 'Espaciado Personalizado',
          description: 'Este tour demuestra el uso de espaciado personalizado.',
          position: DSTourPosition.bottom,
          targetRadius: 16.0,
          targetPadding: const EdgeInsets.all(20.0),
        ),
      ];

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(
          variant: DSTourVariant.coachmarks,
          enableA11y: false,
          spacing: DSTourSpacing(
            borderRadius: 16.0,
            elevation: 12.0,
            padding: EdgeInsets.all(20.0),
            contentPadding: EdgeInsets.all(16.0),
            targetPadding: 24.0,
          ),
        ),
        steps: steps,
      ));

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/tour_custom_spacing.png'),
      );
    });

    testWidgets('tour dark theme', (tester) async {
      final steps = [
        DSTourStep(
          id: 'step_1',
          targetKey: targetKey3,
          title: 'Tema Oscuro',
          description: 'El tour se adapta automáticamente al tema oscuro de la aplicación.',
          position: DSTourPosition.top,
        ),
      ];

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(
          variant: DSTourVariant.coachmarks,
          enableA11y: false,
        ),
        steps: steps,
        theme: ThemeData.dark(useMaterial3: true),
      ));

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/tour_dark_theme.png'),
      );
    });

    testWidgets('tour RTL layout', (tester) async {
      final steps = [
        DSTourStep(
          id: 'step_1',
          targetKey: targetKey1,
          title: 'القائمة الرئيسية',
          description: 'يمكنك الوصول إلى قائمة التنقل الرئيسية من هنا.',
          position: DSTourPosition.bottom,
        ),
      ];

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(
          variant: DSTourVariant.coachmarks,
          isRtl: true,
          enableA11y: false,
          controls: DSTourControls(
            skipButtonText: 'تخطي',
            nextButtonText: 'التالي',
            finishButtonText: 'إنهاء',
          ),
        ),
        steps: steps,
        textDirection: TextDirection.rtl,
      ));

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/tour_rtl_layout.png'),
      );
    });

    testWidgets('tour loading state', (tester) async {
      final steps = [
        DSTourStep(
          id: 'step_1',
          targetKey: targetKey2,
          title: 'Estado de Carga',
          description: 'El tour puede mostrar diferentes estados visuales.',
          position: DSTourPosition.auto,
        ),
      ];

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(
          variant: DSTourVariant.coachmarks,
          state: DSTourState.loading,
          enableA11y: false,
        ),
        steps: steps,
      ));

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/tour_loading_state.png'),
      );
    });

    testWidgets('tour multiple steps', (tester) async {
      final steps = [
        DSTourStep(
          id: 'step_1',
          targetKey: targetKey1,
          title: 'Primer Paso',
          description: 'Este es el primer paso de un tour con múltiples pasos.',
          position: DSTourPosition.bottom,
        ),
        DSTourStep(
          id: 'step_2',
          targetKey: targetKey2,
          title: 'Segundo Paso',
          description: 'Continuamos con el segundo paso del tour.',
          position: DSTourPosition.bottom,
        ),
        DSTourStep(
          id: 'step_3',
          targetKey: targetKey3,
          title: 'Tercer Paso',
          description: 'Este es el paso final del tour de ejemplo.',
          position: DSTourPosition.top,
        ),
      ];

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(
          variant: DSTourVariant.coachmarks,
          showProgress: true,
          enableA11y: false,
        ),
        steps: steps,
      ));

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/tour_multiple_steps.png'),
      );
    });

    testWidgets('tour minimal configuration', (tester) async {
      final steps = [
        DSTourStep(
          id: 'step_1',
          targetKey: targetKey3,
          title: 'Configuración Mínima',
          description: 'Tour con la configuración más básica posible.',
          position: DSTourPosition.auto,
        ),
      ];

      await tester.pumpWidget(buildTestWidget(
        config: const DSTourConfig(
          variant: DSTourVariant.coachmarks,
          enableSkip: false,
          showProgress: false,
          enableA11y: false,
        ),
        steps: steps,
      ));

      await tester.pump();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('goldens/tour_minimal.png'),
      );
    });
  });
}