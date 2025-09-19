import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/description_list/ds_description_list.dart';
import 'package:iautomat_design_system/src/components/description_list/description_list_config.dart';

void main() {
  group('DSDescriptionList', () {
    testWidgets('renderiza correctamente con elementos básicos',
        (tester) async {
      const items = [
        DSDescriptionListItem(
          term: 'Nombre',
          description: 'Juan Pérez',
        ),
        DSDescriptionListItem(
          term: 'Email',
          description: 'juan.perez@example.com',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
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
        DSDescriptionListItem(
          term: 'Usuario',
          description: 'Juan Pérez',
          icon: Icons.person,
        ),
        DSDescriptionListItem(
          term: 'Email',
          description: 'juan.perez@example.com',
          icon: Icons.email,
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
              items: items,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.email), findsOneWidget);
    });

    testWidgets('muestra descripción secundaria cuando está presente',
        (tester) async {
      const items = [
        DSDescriptionListItem(
          term: 'Dirección',
          description: '123 Main St',
          secondaryDescription: 'Dirección principal',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
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
        DSDescriptionListItem(
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
            body: DSDescriptionList.responsive(
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
        DSDescriptionListItem(
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
            body: DSDescriptionList.responsive(
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

    testWidgets('muestra skeleton cuando está en estado loading',
        (tester) async {
      const items = [
        DSDescriptionListItem(
          term: 'Cargando',
          description: 'Cargando...',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
              items: items,
              state: DSDescriptionListState.skeleton,
            ),
          ),
        ),
      );

      // Verificar que se muestre el skeleton
      expect(find.byType(Container), findsAtLeastNWidgets(1));
    });

    testWidgets('aplica estilos personalizados correctamente', (tester) async {
      const items = [
        DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      const customStyle = DSDescriptionListStyle(
        backgroundColor: Colors.blue,
        borderRadius: 16,
        padding: EdgeInsets.all(20),
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
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
        DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      // Simular pantalla móvil
      await tester.binding.setSurfaceSize(const Size(400, 800));
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
              items: items,
              layout: DSDescriptionListLayout.adaptive,
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

    testWidgets('muestra widgets leading y trailing cuando están presentes',
        (tester) async {
      const leadingIcon = Icon(Icons.star, key: Key('leading'));
      const trailingIcon = Icon(Icons.arrow_forward, key: Key('trailing'));

      const items = [
        DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
          leading: leadingIcon,
          trailing: trailingIcon,
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
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
        DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      for (final density in DSDescriptionListDensity.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDescriptionList.responsive(
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
        DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      for (final spacing in DSDescriptionListSpacing.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DSDescriptionList.responsive(
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
        DSDescriptionListItem(
          term: 'First',
          description: 'First Description',
          divider: true,
        ),
        DSDescriptionListItem(
          term: 'Second',
          description: 'Second Description',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
              items: items,
            ),
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('usa widgets personalizados cuando están proporcionados',
        (tester) async {
      const customTermWidget = Text('Custom Term', key: Key('custom-term'));
      const customDescriptionWidget =
          Text('Custom Description', key: Key('custom-description'));

      const items = [
        DSDescriptionListItem(
          term: 'Original Term',
          description: 'Original Description',
          termWidget: customTermWidget,
          descriptionWidget: customDescriptionWidget,
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
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
        DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
              items: items,
              animation: DSDescriptionListAnimation(
                enabled: true,
                type: DSDescriptionListAnimationType.fade,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(FadeTransition), findsOneWidget);
    });

    testWidgets('aplica configuración responsive correctamente',
        (tester) async {
      const items = [
        DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      const responsive = DSDescriptionListResponsive(
        mobileBreakpoint: 600,
        tabletBreakpoint: 900,
        mobileLayout: DSDescriptionListLayout.vertical,
        tabletLayout: DSDescriptionListLayout.horizontal,
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
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
        DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
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
        DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
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
        DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
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
        DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      bool hovered = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
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
        DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSDescriptionList.responsive(
              items: items,
              semanticLabel: 'Lista de información',
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byType(Semantics), findsAtLeastNWidgets(1));
    });

    group('DSDescriptionListConfig', () {
      test('isInteractive devuelve true cuando hay callbacks', () {
        const config = DSDescriptionListConfig(
          onTap: _mockCallback,
        );

        expect(config.isInteractive, isTrue);
      });

      test('isDisabled devuelve true cuando enabled es false', () {
        const config = DSDescriptionListConfig(
          enabled: false,
        );

        expect(config.isDisabled, isTrue);
      });

      test('isLoading devuelve true cuando loading es true', () {
        const config = DSDescriptionListConfig(
          loading: true,
        );

        expect(config.isLoading, isTrue);
      });

      test('shouldShowSkeleton devuelve true cuando skeleton es true', () {
        const config = DSDescriptionListConfig(
          skeleton: true,
        );

        expect(config.shouldShowSkeleton, isTrue);
      });
    });

    group('DSDescriptionListItem', () {
      test('hasSecondaryDescription devuelve true cuando está presente', () {
        const item = DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
          secondaryDescription: 'Secondary',
        );

        expect(item.hasSecondaryDescription, isTrue);
      });

      test('hasIcon devuelve true cuando icon está presente', () {
        const item = DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
          icon: Icons.star,
        );

        expect(item.hasIcon, isTrue);
      });

      test('isInteractive devuelve true cuando hay callbacks', () {
        final item = DSDescriptionListItem(
          term: 'Test',
          description: 'Test Description',
          onTap: _mockCallback,
        );

        expect(item.isInteractive, isTrue);
      });
    });

    group('Extensions', () {
      test('DSDescriptionListDensity extensions funcionan correctamente', () {
        expect(DSDescriptionListDensity.compact.verticalSpacing, equals(8.0));
        expect(DSDescriptionListDensity.normal.verticalSpacing, equals(12.0));
        expect(DSDescriptionListDensity.comfortable.verticalSpacing,
            equals(16.0));

        expect(
            DSDescriptionListDensity.compact.horizontalSpacing, equals(12.0));
        expect(
            DSDescriptionListDensity.normal.horizontalSpacing, equals(16.0));
        expect(DSDescriptionListDensity.comfortable.horizontalSpacing,
            equals(24.0));
      });

      test('DSDescriptionListSpacing extension funciona correctamente', () {
        expect(DSDescriptionListSpacing.none.value, equals(0.0));
        expect(DSDescriptionListSpacing.small.value, equals(8.0));
        expect(DSDescriptionListSpacing.normal.value, equals(16.0));
        expect(DSDescriptionListSpacing.large.value, equals(24.0));
      });

      test('DSDescriptionListLayout extensions funcionan correctamente', () {
        expect(DSDescriptionListLayout.vertical.isVertical, isTrue);
        expect(DSDescriptionListLayout.horizontal.isHorizontal, isTrue);
        expect(DSDescriptionListLayout.grid.isGrid, isTrue);
        expect(DSDescriptionListLayout.adaptive.isAdaptive, isTrue);
      });

      test('DSDescriptionListState extensions funcionan correctamente', () {
        expect(DSDescriptionListState.hover.isInteractiveState, isTrue);
        expect(DSDescriptionListState.pressed.isInteractiveState, isTrue);
        expect(DSDescriptionListState.focus.isInteractiveState, isTrue);
        expect(DSDescriptionListState.disabled.isDisabledState, isTrue);
        expect(DSDescriptionListState.loading.isLoadingState, isTrue);
        expect(DSDescriptionListState.skeleton.isSkeletonState, isTrue);
        expect(DSDescriptionListState.selected.isSelectedState, isTrue);
      });
    });

    group('DSDescriptionListResponsive', () {
      test('getLayoutForWidth devuelve layout correcto', () {
        const responsive = DSDescriptionListResponsive(
          mobileBreakpoint: 600,
          tabletBreakpoint: 900,
          mobileLayout: DSDescriptionListLayout.vertical,
          tabletLayout: DSDescriptionListLayout.horizontal,
          desktopLayout: DSDescriptionListLayout.grid,
        );

        expect(responsive.getLayoutForWidth(400),
            equals(DSDescriptionListLayout.vertical));
        expect(responsive.getLayoutForWidth(700),
            equals(DSDescriptionListLayout.horizontal));
        expect(responsive.getLayoutForWidth(1000),
            equals(DSDescriptionListLayout.grid));
      });

      test('getDensityForWidth devuelve densidad correcta', () {
        const responsive = DSDescriptionListResponsive(
          mobileBreakpoint: 600,
          tabletBreakpoint: 900,
          mobileDensity: DSDescriptionListDensity.compact,
          tabletDensity: DSDescriptionListDensity.normal,
          desktopDensity: DSDescriptionListDensity.comfortable,
        );

        expect(responsive.getDensityForWidth(400),
            equals(DSDescriptionListDensity.compact));
        expect(responsive.getDensityForWidth(700),
            equals(DSDescriptionListDensity.normal));
        expect(responsive.getDensityForWidth(1000),
            equals(DSDescriptionListDensity.comfortable));
      });

      test('getColumnsForWidth devuelve número correcto de columnas', () {
        const responsive = DSDescriptionListResponsive(
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
