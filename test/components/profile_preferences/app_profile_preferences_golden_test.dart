import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppProfilePreferences Golden Tests', () {
    testWidgets('Basic Profile - Light Theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: AppProfilePreferences(
              config: AppProfilePreferencesConfigDefaults.basicProfile,
              onSave: (data) {},
              onCancel: () {},
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppProfilePreferences),
        matchesGoldenFile('profile_preferences_basic_light.png'),
      );
    });

    testWidgets('Basic Profile - Dark Theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: AppProfilePreferences(
              config: AppProfilePreferencesConfigDefaults.basicProfile,
              onSave: (data) {},
              onCancel: () {},
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppProfilePreferences),
        matchesGoldenFile('profile_preferences_basic_dark.png'),
      );
    });

    testWidgets('Full Profile Configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: AppProfilePreferences(
              config: AppProfilePreferencesConfigDefaults.fullProfile,
              onSave: (data) {},
              onCancel: () {},
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppProfilePreferences),
        matchesGoldenFile('profile_preferences_full.png'),
      );
    });

    testWidgets('All Field Types', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                fields: [
                  AppProfileField(
                    id: 'header',
                    type: AppProfileFieldType.header,
                    label: 'Configuración',
                  ),
                  AppProfileField(
                    id: 'text',
                    type: AppProfileFieldType.text,
                    label: 'Texto',
                    icon: Icons.text_fields,
                  ),
                  AppProfileField(
                    id: 'email',
                    type: AppProfileFieldType.email,
                    label: 'Email',
                    icon: Icons.email,
                  ),
                  AppProfileField(
                    id: 'toggle',
                    type: AppProfileFieldType.toggle,
                    label: 'Activar',
                    icon: Icons.toggle_on,
                    value: true,
                  ),
                  AppProfileField(
                    id: 'select',
                    type: AppProfileFieldType.select,
                    label: 'Selección',
                    icon: Icons.arrow_drop_down,
                    options: [
                      AppProfileFieldOption(
                        value: 'option1',
                        label: 'Opción 1',
                      ),
                    ],
                  ),
                ],
              ),
              onSave: (data) {},
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppProfilePreferences),
        matchesGoldenFile('profile_preferences_all_fields.png'),
      );
    });

    testWidgets('Disabled State', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                state: AppProfileState.disabled,
                fields: [
                  AppProfileField(
                    id: 'name',
                    type: AppProfileFieldType.text,
                    label: 'Nombre',
                  ),
                ],
              ),
              enabled: false,
              onSave: (data) {},
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppProfilePreferences),
        matchesGoldenFile('profile_preferences_disabled.png'),
      );
    });

    testWidgets('Loading State', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                state: AppProfileState.loading,
                fields: [
                  AppProfileField(
                    id: 'name',
                    type: AppProfileFieldType.text,
                    label: 'Nombre',
                  ),
                ],
              ),
              onSave: (data) {},
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppProfilePreferences),
        matchesGoldenFile('profile_preferences_loading.png'),
      );
    });

    testWidgets('Custom Colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                fields: [
                  AppProfileField(
                    id: 'name',
                    type: AppProfileFieldType.text,
                    label: 'Nombre',
                  ),
                ],
                colors: AppProfileColors(
                  primaryButtonColor: Colors.purple,
                  fieldBackgroundColor: Color(0xFFF0F0F0),
                  borderColor: Colors.purple,
                ),
              ),
              onSave: (data) {},
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(AppProfilePreferences),
        matchesGoldenFile('profile_preferences_custom_colors.png'),
      );
    });

    group('Responsive Layout', () {
      testWidgets('Mobile Layout (360x640)', (tester) async {
        tester.view.physicalSize = const Size(360, 640);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: AppProfilePreferences(
                config: AppProfilePreferencesConfigDefaults.fullProfile,
                onSave: (data) {},
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(AppProfilePreferences),
          matchesGoldenFile('profile_preferences_mobile.png'),
        );

        addTearDown(tester.view.resetPhysicalSize);
      });

      testWidgets('Tablet Layout (768x1024)', (tester) async {
        tester.view.physicalSize = const Size(768, 1024);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: AppProfilePreferences(
                config: AppProfilePreferencesConfigDefaults.fullProfile,
                onSave: (data) {},
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(AppProfilePreferences),
          matchesGoldenFile('profile_preferences_tablet.png'),
        );

        addTearDown(tester.view.resetPhysicalSize);
      });

      testWidgets('Desktop Layout (1200x800)', (tester) async {
        tester.view.physicalSize = const Size(1200, 800);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: AppProfilePreferences(
                config: AppProfilePreferencesConfigDefaults.fullProfile,
                onSave: (data) {},
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(AppProfilePreferences),
          matchesGoldenFile('profile_preferences_desktop.png'),
        );

        addTearDown(tester.view.resetPhysicalSize);
      });
    });

    group('RTL Support', () {
      testWidgets('RTL Layout - Arabic', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                body: AppProfilePreferences(
                  config: const AppProfilePreferencesConfig(
                    fields: [
                      AppProfileField(
                        id: 'name',
                        type: AppProfileFieldType.text,
                        label: 'الاسم',
                        icon: Icons.person,
                      ),
                      AppProfileField(
                        id: 'email',
                        type: AppProfileFieldType.email,
                        label: 'البريد الإلكتروني',
                        icon: Icons.email,
                      ),
                    ],
                  ),
                  onSave: (data) {},
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(AppProfilePreferences),
          matchesGoldenFile('profile_preferences_rtl.png'),
        );
      });
    });

    group('Field States', () {
      testWidgets('Field with Error', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: AppProfilePreferences(
                config: const AppProfilePreferencesConfig(
                  fields: [
                    AppProfileField(
                      id: 'email',
                      type: AppProfileFieldType.email,
                      label: 'Email',
                      required: true,
                    ),
                  ],
                ),
                initialData: const AppProfileFormData(
                  values: {'email': 'invalid-email'},
                  errors: {'email': 'Email inválido'},
                  isValid: false,
                ),
                onSave: (data) {},
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(AppProfilePreferences),
          matchesGoldenFile('profile_preferences_field_error.png'),
        );
      });

      testWidgets('Required Field Indicator', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.light(),
            home: Scaffold(
              body: AppProfilePreferences(
                config: const AppProfilePreferencesConfig(
                  fields: [
                    AppProfileField(
                      id: 'required_field',
                      type: AppProfileFieldType.text,
                      label: 'Campo Obligatorio',
                      required: true,
                      icon: Icons.star,
                    ),
                    AppProfileField(
                      id: 'optional_field',
                      type: AppProfileFieldType.text,
                      label: 'Campo Opcional',
                      required: false,
                      icon: Icons.info,
                    ),
                  ],
                ),
                onSave: (data) {},
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(AppProfilePreferences),
          matchesGoldenFile('profile_preferences_required_fields.png'),
        );
      });
    });
  });
}