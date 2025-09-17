import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/description_list/app_description_list.dart';
import 'package:iautomat_design_system/src/components/description_list/description_list_config.dart';

void main() {
  group('AppDescriptionList', () {
    testWidgets('renderiza correctamente con elementos básicos', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Nombre',
          description: 'Juan Pérez',
        ),
        AppDescriptionListItem(
          term: 'Email',
          description: 'juan.perez@example.com',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
            ),
          ),
        ),
      );

      expect(find.text('Nombre'), findsOneWidget);
      expect(find.text('Juan Pérez'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('juan.perez@example.com'), findsOneWidget);
    });

    testWidgets('muestra iconos cuando están especificados', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Usuario',
          description: 'Juan Pérez',
          icon: Icons.person,
        ),
        AppDescriptionListItem(
          term: 'Email',
          description: 'juan.perez@example.com',
          icon: Icons.email,
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.email), findsOneWidget);
    });

    testWidgets('muestra descripción secundaria cuando está presente', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Dirección',
          description: '123 Main St',
          secondaryDescription: 'Dirección principal',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
            ),
          ),
        ),
      );

      expect(find.text('Dirección'), findsOneWidget);
      expect(find.text('123 Main St'), findsOneWidget);
      expect(find.text('Dirección principal'), findsOneWidget);
    });

    testWidgets('maneja interacciones de tap correctamente', (tester) async {
      bool tapped = false;
      final items = [
        AppDescriptionListItem(
          term: 'Email',
          description: 'test@example.com',
          onTap: () {
            tapped = true;
          },
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Email'));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('respeta el estado disabled', (tester) async {
      bool tapped = false;
      final items = [
        AppDescriptionListItem(
          term: 'Email',
          description: 'test@example.com',
          onTap: () {
            tapped = true;
          },
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
              enabled: false,
            ),
          ),
        ),
      );

      await tester.tap(find.text('Email'));
      await tester.pump();

      expect(tapped, isFalse);
    });

    testWidgets('muestra skeleton cuando está en estado loading', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Cargando',
          description: 'Cargando...',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
              state: AppDescriptionListState.skeleton,
            ),
          ),
        ),
      );

      // Verificar que se muestre el skeleton
      expect(find.byType(Container), findsAtLeastNWidgets(1));
    });

    testWidgets('aplica estilos personalizados correctamente', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      const customStyle = AppDescriptionListStyle(
        backgroundColor: Colors.blue,
        borderRadius: 16,
        padding: EdgeInsets.all(20),
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
              style: customStyle,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration?;

      expect(decoration?.color, equals(Colors.blue));
      expect(container.padding, equals(const EdgeInsets.all(20)));
    });

    testWidgets('cambia layout según el ancho de pantalla', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      // Simular pantalla móvil
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
              layout: AppDescriptionListLayout.adaptive,
            ),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);

      // Simular pantalla desktop
      await tester.binding.setSurfaceSize(const Size(1200, 800));
      await tester.pump();

      expect(find.text('Test'), findsOneWidget);

      // Restaurar tamaño normal
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('muestra widgets leading y trailing cuando están presentes', (tester) async {
      const leadingIcon = Icon(Icons.star, key: Key('leading'));
      const trailingIcon = Icon(Icons.arrow_forward, key: Key('trailing'));

      const items = [
        AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
          leading: leadingIcon,
          trailing: trailingIcon,
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('leading')), findsOneWidget);
      expect(find.byKey(const Key('trailing')), findsOneWidget);
    });

    testWidgets('maneja diferentes densidades correctamente', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      for (final density in AppDescriptionListDensity.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDescriptionList.responsive(
                items: items,
                density: density,
              ),
            ),
          ),
        );

        expect(find.text('Test'), findsOneWidget);
      }
    });

    testWidgets('maneja diferentes espaciados correctamente', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      for (final spacing in AppDescriptionListSpacing.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: AppDescriptionList.responsive(
                items: items,
                spacing: spacing,
              ),
            ),
          ),
        );

        expect(find.text('Test'), findsOneWidget);
      }
    });

    testWidgets('muestra dividers cuando están habilitados', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'First',
          description: 'First Description',
          divider: true,
        ),
        AppDescriptionListItem(
          term: 'Second',
          description: 'Second Description',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
            ),
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('usa widgets personalizados cuando están proporcionados', (tester) async {
      const customTermWidget = Text('Custom Term', key: Key('custom-term'));
      const customDescriptionWidget = Text('Custom Description', key: Key('custom-description'));

      const items = [
        AppDescriptionListItem(
          term: 'Original Term',
          description: 'Original Description',
          termWidget: customTermWidget,
          descriptionWidget: customDescriptionWidget,
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('custom-term')), findsOneWidget);
      expect(find.byKey(const Key('custom-description')), findsOneWidget);
      expect(find.text('Original Term'), findsNothing);
      expect(find.text('Original Description'), findsNothing);
    });

    testWidgets('maneja animaciones cuando están habilitadas', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
              animation: AppDescriptionListAnimation(
                enabled: true,
                type: AppDescriptionListAnimationType.fade,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(FadeTransition), findsOneWidget);
    });

    testWidgets('aplica configuración responsive correctamente', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      const responsive = AppDescriptionListResponsive(
        mobileBreakpoint: 600,
        tabletBreakpoint: 900,
        mobileLayout: AppDescriptionListLayout.vertical,
        tabletLayout: AppDescriptionListLayout.horizontal,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
              responsive: responsive,
            ),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('maneja tooltip cuando está presente', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
              tooltip: 'Lista de descripción',
            ),
          ),
        ),
      );

      expect(find.byType(Tooltip), findsOneWidget);
    });

    testWidgets('oculta el widget cuando visible es false', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
              visible: false,
            ),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.text('Test'), findsNothing);
    });

    testWidgets('mantiene el foco correctamente', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
              onTap: () {},
            ),
          ),
        ),
      );

      final focusNode = tester.widget<Focus>(find.byType(Focus)).focusNode;
      expect(focusNode, isNotNull);
    });

    testWidgets('maneja gestos de hover correctamente', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      bool hovered = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
              onHover: () {
                hovered = true;
              },
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      final mouseRegion = find.byType(MouseRegion);
      await gesture.moveTo(tester.getCenter(mouseRegion));
      await tester.pump();

      expect(hovered, isTrue);
    });

    testWidgets('aplica semántica correctamente', (tester) async {
      const items = [
        AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppDescriptionList.responsive(
              items: items,
              semanticLabel: 'Lista de información',
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(Semantics), findsAtLeastNWidgets(1));
    });

    group('AppDescriptionListConfig', () {
      test('isInteractive devuelve true cuando hay callbacks', () {
        const config = AppDescriptionListConfig(
          onTap: _mockCallback,
        );

        expect(config.isInteractive, isTrue);
      });

      test('isDisabled devuelve true cuando enabled es false', () {
        const config = AppDescriptionListConfig(
          enabled: false,
        );

        expect(config.isDisabled, isTrue);
      });

      test('isLoading devuelve true cuando loading es true', () {
        const config = AppDescriptionListConfig(
          loading: true,
        );

        expect(config.isLoading, isTrue);
      });

      test('shouldShowSkeleton devuelve true cuando skeleton es true', () {
        const config = AppDescriptionListConfig(
          skeleton: true,
        );

        expect(config.shouldShowSkeleton, isTrue);
      });
    });

    group('AppDescriptionListItem', () {
      test('hasSecondaryDescription devuelve true cuando está presente', () {
        const item = AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
          secondaryDescription: 'Secondary',
        );

        expect(item.hasSecondaryDescription, isTrue);
      });

      test('hasIcon devuelve true cuando icon está presente', () {
        const item = AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
          icon: Icons.star,
        );

        expect(item.hasIcon, isTrue);
      });

      test('isInteractive devuelve true cuando hay callbacks', () {
        final item = AppDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
          onTap: _mockCallback,
        );

        expect(item.isInteractive, isTrue);
      });
    });

    group('Extensions', () {
      test('AppDescriptionListDensity extensions funcionan correctamente', () {
        expect(AppDescriptionListDensity.compact.verticalSpacing, equals(8.0));
        expect(AppDescriptionListDensity.normal.verticalSpacing, equals(12.0));
        expect(AppDescriptionListDensity.comfortable.verticalSpacing, equals(16.0));

        expect(AppDescriptionListDensity.compact.horizontalSpacing, equals(12.0));
        expect(AppDescriptionListDensity.normal.horizontalSpacing, equals(16.0));
        expect(AppDescriptionListDensity.comfortable.horizontalSpacing, equals(24.0));
      });

      test('AppDescriptionListSpacing extension funciona correctamente', () {
        expect(AppDescriptionListSpacing.none.value, equals(0.0));
        expect(AppDescriptionListSpacing.small.value, equals(8.0));
        expect(AppDescriptionListSpacing.normal.value, equals(16.0));
        expect(AppDescriptionListSpacing.large.value, equals(24.0));
      });

      test('AppDescriptionListLayout extensions funcionan correctamente', () {
        expect(AppDescriptionListLayout.vertical.isVertical, isTrue);
        expect(AppDescriptionListLayout.horizontal.isHorizontal, isTrue);
        expect(AppDescriptionListLayout.grid.isGrid, isTrue);
        expect(AppDescriptionListLayout.adaptive.isAdaptive, isTrue);
      });

      test('AppDescriptionListState extensions funcionan correctamente', () {
        expect(AppDescriptionListState.hover.isInteractiveState, isTrue);
        expect(AppDescriptionListState.pressed.isInteractiveState, isTrue);
        expect(AppDescriptionListState.focus.isInteractiveState, isTrue);
        expect(AppDescriptionListState.disabled.isDisabledState, isTrue);
        expect(AppDescriptionListState.loading.isLoadingState, isTrue);
        expect(AppDescriptionListState.skeleton.isSkeletonState, isTrue);
        expect(AppDescriptionListState.selected.isSelectedState, isTrue);
      });
    });

    group('AppDescriptionListResponsive', () {
      test('getLayoutForWidth devuelve layout correcto', () {
        const responsive = AppDescriptionListResponsive(
          mobileBreakpoint: 600,
          tabletBreakpoint: 900,
          mobileLayout: AppDescriptionListLayout.vertical,
          tabletLayout: AppDescriptionListLayout.horizontal,
          desktopLayout: AppDescriptionListLayout.grid,
        );

        expect(responsive.getLayoutForWidth(400), equals(AppDescriptionListLayout.vertical));
        expect(responsive.getLayoutForWidth(700), equals(AppDescriptionListLayout.horizontal));
        expect(responsive.getLayoutForWidth(1000), equals(AppDescriptionListLayout.grid));
      });

      test('getDensityForWidth devuelve densidad correcta', () {
        const responsive = AppDescriptionListResponsive(
          mobileBreakpoint: 600,
          tabletBreakpoint: 900,
          mobileDensity: AppDescriptionListDensity.compact,
          tabletDensity: AppDescriptionListDensity.normal,
          desktopDensity: AppDescriptionListDensity.comfortable,
        );

        expect(responsive.getDensityForWidth(400), equals(AppDescriptionListDensity.compact));
        expect(responsive.getDensityForWidth(700), equals(AppDescriptionListDensity.normal));
        expect(responsive.getDensityForWidth(1000), equals(AppDescriptionListDensity.comfortable));
      });

      test('getColumnsForWidth devuelve número correcto de columnas', () {
        const responsive = AppDescriptionListResponsive(
          mobileBreakpoint: 600,
          tabletBreakpoint: 900,
          mobileColumns: 1,
          tabletColumns: 2,
          desktopColumns: 3,
        );

        expect(responsive.getColumnsForWidth(400), equals(1));
        expect(responsive.getColumnsForWidth(700), equals(2));
        expect(responsive.getColumnsForWidth(1000), equals(3));
      });
    });
  });
}

void _mockCallback() {
  // Mock callback para testing
}