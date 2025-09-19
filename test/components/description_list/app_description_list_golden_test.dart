import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/src/components/description_list/app_description_list.dart';
import 'package:iautomat_design_system/src/components/description_list/description_list_config.dart';

void main() {
  group('DSDescriptionList Golden Tests', () {
    testWidgets('lista básica con elementos simples', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                items: [
                  DSDescriptionListItem(
                    term: 'Nombre',
                    description: 'Juan Pérez',
                  ),
                  DSDescriptionListItem(
                    term: 'Email',
                    description: 'juan.perez@example.com',
                  ),
                  DSDescriptionListItem(
                    term: 'Teléfono',
                    description: '+1 (555) 123-4567',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_basic.png'),
      );
    });

    testWidgets('lista con iconos', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                items: [
                  DSDescriptionListItem(
                    term: 'Usuario',
                    description: 'Juan Pérez',
                    icon: Icons.person,
                    iconColor: Colors.blue,
                  ),
                  DSDescriptionListItem(
                    term: 'Email',
                    description: 'juan.perez@example.com',
                    icon: Icons.email,
                    iconColor: Colors.green,
                  ),
                  DSDescriptionListItem(
                    term: 'Teléfono',
                    description: '+1 (555) 123-4567',
                    icon: Icons.phone,
                    iconColor: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_with_icons.png'),
      );
    });

    testWidgets('lista con descripción secundaria', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                items: [
                  DSDescriptionListItem(
                    term: 'Dirección',
                    description: '123 Main St, Ciudad, Estado',
                    secondaryDescription: 'Dirección principal de envío',
                  ),
                  DSDescriptionListItem(
                    term: 'Teléfono',
                    description: '+1 (555) 123-4567',
                    secondaryDescription: 'Número principal de contacto',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_with_secondary.png'),
      );
    });

    testWidgets('lista con dividers', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                items: [
                  DSDescriptionListItem(
                    term: 'Nombre',
                    description: 'Juan Pérez',
                    divider: true,
                  ),
                  DSDescriptionListItem(
                    term: 'Email',
                    description: 'juan.perez@example.com',
                    divider: true,
                  ),
                  DSDescriptionListItem(
                    term: 'Teléfono',
                    description: '+1 (555) 123-4567',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_with_dividers.png'),
      );
    });

    testWidgets('lista con elementos leading y trailing', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                items: [
                  DSDescriptionListItem(
                    term: 'Email',
                    description: 'juan.perez@example.com',
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.email, color: Colors.blue),
                    ),
                    trailing: const Icon(Icons.open_in_new),
                  ),
                  DSDescriptionListItem(
                    term: 'Estado',
                    description: 'Activo',
                    leading:
                        const Icon(Icons.circle, color: Colors.green, size: 12),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_leading_trailing.png'),
      );
    });

    testWidgets('lista en estado hover', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                state: DSDescriptionListState.hover,
                items: [
                  DSDescriptionListItem(
                    term: 'Elemento Hover',
                    description: 'Este elemento está en hover',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_hover.png'),
      );
    });

    testWidgets('lista en estado pressed', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                state: DSDescriptionListState.pressed,
                items: [
                  DSDescriptionListItem(
                    term: 'Elemento Pressed',
                    description: 'Este elemento está presionado',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_pressed.png'),
      );
    });

    testWidgets('lista en estado focus', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                state: DSDescriptionListState.focus,
                items: [
                  DSDescriptionListItem(
                    term: 'Elemento Focus',
                    description: 'Este elemento tiene foco',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_focus.png'),
      );
    });

    testWidgets('lista en estado selected', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                state: DSDescriptionListState.selected,
                items: [
                  DSDescriptionListItem(
                    term: 'Elemento Selected',
                    description: 'Este elemento está seleccionado',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_selected.png'),
      );
    });

    testWidgets('lista en estado disabled', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                state: DSDescriptionListState.disabled,
                items: [
                  DSDescriptionListItem(
                    term: 'Elemento Disabled',
                    description: 'Este elemento está deshabilitado',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_disabled.png'),
      );
    });

    testWidgets('lista en estado skeleton', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                state: DSDescriptionListState.skeleton,
                items: [
                  DSDescriptionListItem(
                    term: 'Cargando...',
                    description: 'Cargando...',
                  ),
                  DSDescriptionListItem(
                    term: 'Cargando...',
                    description: 'Cargando...',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_skeleton.png'),
      );
    });

    testWidgets('lista con layout vertical', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                layout: DSDescriptionListLayout.vertical,
                items: [
                  DSDescriptionListItem(
                    term: 'Nombre',
                    description: 'Juan Pérez',
                    icon: Icons.person,
                  ),
                  DSDescriptionListItem(
                    term: 'Email',
                    description: 'juan.perez@example.com',
                    icon: Icons.email,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_vertical.png'),
      );
    });

    testWidgets('lista con layout horizontal', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                layout: DSDescriptionListLayout.horizontal,
                items: [
                  DSDescriptionListItem(
                    term: 'Nombre',
                    description: 'Juan Pérez',
                    icon: Icons.person,
                  ),
                  DSDescriptionListItem(
                    term: 'Email',
                    description: 'juan.perez@example.com',
                    icon: Icons.email,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_horizontal.png'),
      );
    });

    testWidgets('lista con densidad compact', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                density: DSDescriptionListDensity.compact,
                items: [
                  DSDescriptionListItem(
                    term: 'Compact',
                    description: 'Densidad compacta',
                  ),
                  DSDescriptionListItem(
                    term: 'Small',
                    description: 'Espacio reducido',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_compact.png'),
      );
    });

    testWidgets('lista con densidad comfortable', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                density: DSDescriptionListDensity.comfortable,
                items: [
                  DSDescriptionListItem(
                    term: 'Comfortable',
                    description: 'Densidad cómoda',
                  ),
                  DSDescriptionListItem(
                    term: 'Spacious',
                    description: 'Más espacio',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_comfortable.png'),
      );
    });

    testWidgets('lista con estilo personalizado', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                style: DSDescriptionListStyle(
                  backgroundColor: Colors.blue.withValues(alpha: 0.05),
                  borderColor: Colors.blue,
                  borderWidth: 2,
                  borderRadius: 16,
                  padding: const EdgeInsets.all(20),
                  itemStyle: DSDescriptionListItemStyle(
                    termTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    descriptionTextStyle: TextStyle(
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
                items: const [
                  DSDescriptionListItem(
                    term: 'Custom',
                    description: 'Estilo personalizado',
                  ),
                  DSDescriptionListItem(
                    term: 'Style',
                    description: 'Con colores azules',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_custom_style.png'),
      );
    });

    testWidgets('lista con tema oscuro', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                items: [
                  DSDescriptionListItem(
                    term: 'Dark Theme',
                    description: 'Lista con tema oscuro',
                    icon: Icons.dark_mode,
                  ),
                  DSDescriptionListItem(
                    term: 'Night Mode',
                    description: 'Modo nocturno activo',
                    icon: Icons.nights_stay,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_dark_theme.png'),
      );
    });

    testWidgets('lista con elementos highlighted', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                items: [
                  DSDescriptionListItem(
                    term: 'Normal',
                    description: 'Elemento normal',
                  ),
                  DSDescriptionListItem(
                    term: 'Highlighted',
                    description: 'Elemento resaltado',
                    highlighted: true,
                  ),
                  DSDescriptionListItem(
                    term: 'Another Normal',
                    description: 'Otro elemento normal',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_highlighted.png'),
      );
    });

    testWidgets('lista con espaciado large', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                spacing: DSDescriptionListSpacing.large,
                items: [
                  DSDescriptionListItem(
                    term: 'Large Spacing',
                    description: 'Espaciado grande',
                  ),
                  DSDescriptionListItem(
                    term: 'More Space',
                    description: 'Más espacio entre elementos',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_large_spacing.png'),
      );
    });

    testWidgets('lista con widgets personalizados', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                items: [
                  DSDescriptionListItem(
                    term: 'Original Term',
                    description: 'Original Description',
                    termWidget: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Custom Term',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    descriptionWidget: const Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text('Custom Description Widget'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_custom_widgets.png'),
      );
    });

    testWidgets('lista con alineación center', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                alignment: DSDescriptionListAlignment.center,
                items: [
                  DSDescriptionListItem(
                    term: 'Centered',
                    description: 'Contenido centrado',
                  ),
                  DSDescriptionListItem(
                    term: 'Alignment',
                    description: 'Alineación al centro',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_center_alignment.png'),
      );
    });

    testWidgets('lista completa con múltiples características', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DSDescriptionList.responsive(
                items: [
                  DSDescriptionListItem(
                    term: 'Usuario Premium',
                    description: 'Juan Pérez González',
                    secondaryDescription: 'Miembro desde 2020',
                    icon: Icons.person,
                    iconColor: Colors.blue,
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.star, color: Colors.blue),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green),
                      ),
                      child: const Text(
                        'Activo',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    highlighted: true,
                    divider: true,
                  ),
                  const DSDescriptionListItem(
                    term: 'Email',
                    description: 'juan.perez@premium.com',
                    icon: Icons.email,
                    iconColor: Colors.green,
                    divider: true,
                  ),
                  const DSDescriptionListItem(
                    term: 'Plan',
                    description: 'Premium Plus',
                    secondaryDescription: 'Renovación automática: 15 Feb 2024',
                    icon: Icons.workspace_premium,
                    iconColor: Colors.amber,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(DSDescriptionList),
        matchesGoldenFile('description_list_complete.png'),
      );
    });
  });
}
