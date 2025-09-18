import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('AppProfilePreferences', () {
    testWidgets('renders correctly with basic configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppProfilePreferences(
              config: AppProfilePreferencesConfigDefaults.basicProfile,
              onSave: (data) {},
            ),
          ),
        ),
      );

      expect(find.byType(AppProfilePreferences), findsOneWidget);
      expect(find.text('Información Personal'), findsOneWidget);
      expect(find.text('Nombre'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
    });

    testWidgets('renders save and cancel buttons when callbacks provided', (tester) async {
      bool savePressed = false;
      bool cancelPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppProfilePreferences(
              config: AppProfilePreferencesConfigDefaults.basicProfile,
              onSave: (data) => savePressed = true,
              onCancel: () => cancelPressed = true,
            ),
          ),
        ),
      );

      expect(find.text('Guardar cambios'), findsOneWidget);
      expect(find.text('Cancelar cambios'), findsOneWidget);

      await tester.tap(find.text('Guardar cambios'));
      await tester.pump();
      expect(savePressed, true);

      await tester.tap(find.text('Cancelar cambios'));
      await tester.pump();
      expect(cancelPressed, true);
    });

    testWidgets('updates form data when field values change', (tester) async {
      AppProfileFormData? lastFormData;

      await tester.pumpWidget(
        MaterialApp(
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
              ),
              onFormChanged: (data) => lastFormData = data,
            ),
          ),
        ),
      );

      final textField = find.byType(TextFormField);
      await tester.enterText(textField, 'Juan Pérez');
      await tester.pump();

      expect(lastFormData?.values['name'], 'Juan Pérez');
      expect(lastFormData?.hasUnsavedChanges, true);
    });

    testWidgets('renders different field types correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                fields: [
                  AppProfileField(
                    id: 'header',
                    type: AppProfileFieldType.header,
                    label: 'Sección Header',
                  ),
                  AppProfileField(
                    id: 'text_field',
                    type: AppProfileFieldType.text,
                    label: 'Campo de texto',
                  ),
                  AppProfileField(
                    id: 'toggle_field',
                    type: AppProfileFieldType.toggle,
                    label: 'Toggle',
                    value: true,
                  ),
                  AppProfileField(
                    id: 'select_field',
                    type: AppProfileFieldType.select,
                    label: 'Selección',
                    options: [
                      AppProfileFieldOption(
                        value: 'option1',
                        label: 'Opción 1',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Sección Header'), findsOneWidget);
      expect(find.text('Campo de texto'), findsOneWidget);
      expect(find.text('Toggle'), findsOneWidget);
      expect(find.text('Selección'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
      expect(find.byType(DropdownButtonFormField), findsOneWidget);
    });

    testWidgets('validates required fields', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                fields: [
                  AppProfileField(
                    id: 'required_field',
                    type: AppProfileFieldType.text,
                    label: 'Campo requerido',
                    required: true,
                    validation: AppProfileFieldValidation(
                      required: true,
                      errorMessage: 'Este campo es obligatorio',
                    ),
                  ),
                ],
              ),
              onSave: (data) {},
            ),
          ),
        ),
      );

      // Intentar guardar sin llenar el campo requerido
      await tester.tap(find.text('Guardar cambios'));
      await tester.pump();

      expect(find.text('Este campo es obligatorio'), findsOneWidget);
    });

    testWidgets('respects disabled state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                state: AppProfileState.disabled,
                fields: [
                  AppProfileField(
                    id: 'text_field',
                    type: AppProfileFieldType.text,
                    label: 'Campo de texto',
                  ),
                ],
              ),
              enabled: false,
              onSave: (data) {},
            ),
          ),
        ),
      );

      expect(tester.widget<ElevatedButton>(find.byType(ElevatedButton).first).onPressed, isNull);
    });

    testWidgets('renders skeleton state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                state: AppProfileState.skeleton,
                fields: [
                  AppProfileField(
                    id: 'text_field',
                    type: AppProfileFieldType.text,
                    label: 'Campo de texto',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // En estado skeleton no deberían aparecer los campos normales
      expect(find.text('Campo de texto'), findsNothing);
      expect(find.byType(TextFormField), findsNothing);
    });

    testWidgets('handles toggle field interactions', (tester) async {
      AppProfileFormData? lastFormData;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                fields: [
                  AppProfileField(
                    id: 'notifications',
                    type: AppProfileFieldType.toggle,
                    label: 'Notificaciones',
                    value: false,
                  ),
                ],
              ),
              onFormChanged: (data) => lastFormData = data,
            ),
          ),
        ),
      );

      // Verificar estado inicial
      final switchWidget = tester.widget<Switch>(find.byType(Switch));
      expect(switchWidget.value, false);

      // Tocar el switch
      await tester.tap(find.byType(Switch));
      await tester.pump();

      expect(lastFormData?.values['notifications'], true);
    });

    testWidgets('handles select field interactions', (tester) async {
      AppProfileFormData? lastFormData;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                fields: [
                  AppProfileField(
                    id: 'theme',
                    type: AppProfileFieldType.select,
                    label: 'Tema',
                    options: [
                      AppProfileFieldOption(
                        value: 'light',
                        label: 'Claro',
                      ),
                      AppProfileFieldOption(
                        value: 'dark',
                        label: 'Oscuro',
                      ),
                    ],
                  ),
                ],
              ),
              onFormChanged: (data) => lastFormData = data,
            ),
          ),
        ),
      );

      // Tocar el dropdown
      await tester.tap(find.byType(DropdownButtonFormField));
      await tester.pumpAndSettle();

      // Seleccionar una opción
      await tester.tap(find.text('Oscuro').last);
      await tester.pumpAndSettle();

      expect(lastFormData?.values['theme'], 'dark');
    });

    testWidgets('applies custom colors', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
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
                  fieldBackgroundColor: Colors.yellow,
                ),
              ),
              onSave: (data) {},
            ),
          ),
        ),
      );

      final elevatedButton = find.byType(ElevatedButton);
      expect(elevatedButton, findsOneWidget);

      final buttonWidget = tester.widget<ElevatedButton>(elevatedButton);
      final buttonStyle = buttonWidget.style!;
      expect(
        buttonStyle.backgroundColor?.resolve({WidgetState.pressed}),
        Colors.purple,
      );
    });

    testWidgets('triggers validation callbacks', (tester) async {
      AppProfileFieldValidationResult? lastValidation;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppProfilePreferences(
              config: const AppProfilePreferencesConfig(
                fields: [
                  AppProfileField(
                    id: 'email',
                    type: AppProfileFieldType.email,
                    label: 'Email',
                    validation: AppProfileFieldValidation(
                      required: true,
                    ),
                  ),
                ],
              ),
              onFieldValidated: (validation) => lastValidation = validation,
            ),
          ),
        ),
      );

      final textField = find.byType(TextFormField);
      await tester.enterText(textField, 'invalid-email');
      await tester.pump();

      // La validación debería fallar
      expect(lastValidation?.fieldId, 'email');
      expect(lastValidation?.isValid, false);
    });
  });

  group('AppProfilePreferencesConfig', () {
    test('creates instance with default values', () {
      const config = AppProfilePreferencesConfig();

      expect(config.variant, AppProfileVariant.sections);
      expect(config.state, AppProfileState.defaultState);
      expect(config.fields, isEmpty);
    });

    test('creates instance with custom values', () {
      const config = AppProfilePreferencesConfig(
        variant: AppProfileVariant.sections,
        state: AppProfileState.loading,
        fields: [
          AppProfileField(
            id: 'test',
            type: AppProfileFieldType.text,
            label: 'Test',
          ),
        ],
      );

      expect(config.variant, AppProfileVariant.sections);
      expect(config.state, AppProfileState.loading);
      expect(config.fields.length, 1);
      expect(config.fields.first.id, 'test');
    });
  });

  group('AppProfileField', () {
    test('creates instance with required values', () {
      const field = AppProfileField(
        id: 'test_field',
        type: AppProfileFieldType.text,
        label: 'Test Field',
      );

      expect(field.id, 'test_field');
      expect(field.type, AppProfileFieldType.text);
      expect(field.label, 'Test Field');
      expect(field.required, false);
      expect(field.enabled, true);
      expect(field.readonly, false);
    });

    test('creates instance with all values', () {
      const field = AppProfileField(
        id: 'test_field',
        type: AppProfileFieldType.email,
        label: 'Test Field',
        value: 'test@example.com',
        placeholder: 'Enter email',
        description: 'Your email address',
        required: true,
        enabled: false,
        readonly: true,
        importance: AppProfileFieldImportance.high,
        icon: Icons.email,
      );

      expect(field.id, 'test_field');
      expect(field.type, AppProfileFieldType.email);
      expect(field.label, 'Test Field');
      expect(field.value, 'test@example.com');
      expect(field.placeholder, 'Enter email');
      expect(field.description, 'Your email address');
      expect(field.required, true);
      expect(field.enabled, false);
      expect(field.readonly, true);
      expect(field.importance, AppProfileFieldImportance.high);
      expect(field.icon, Icons.email);
    });
  });

  group('AppProfileFormData', () {
    test('creates instance with default values', () {
      const formData = AppProfileFormData();

      expect(formData.values, isEmpty);
      expect(formData.validations, isEmpty);
      expect(formData.errors, isEmpty);
      expect(formData.isValid, true);
      expect(formData.hasUnsavedChanges, false);
      expect(formData.saveAttempts, 0);
    });

    test('creates instance with custom values', () {
      final now = DateTime.now();
      final formData = AppProfileFormData(
        values: const {'name': 'John'},
        errors: const {'email': 'Invalid email'},
        isValid: false,
        hasUnsavedChanges: true,
        lastModified: now,
        saveAttempts: 2,
      );

      expect(formData.values['name'], 'John');
      expect(formData.errors['email'], 'Invalid email');
      expect(formData.isValid, false);
      expect(formData.hasUnsavedChanges, true);
      expect(formData.lastModified, now);
      expect(formData.saveAttempts, 2);
    });
  });

  group('AppProfileValidators', () {
    test('email validator works correctly', () {
      expect(AppProfileValidators.email('test@example.com'), isNull);
      expect(AppProfileValidators.email('invalid-email'), isNotNull);
      expect(AppProfileValidators.email(''), isNull); // Empty is allowed
      expect(AppProfileValidators.email(null), isNull); // Null is allowed
    });

    test('phone validator works correctly', () {
      expect(AppProfileValidators.phone('+34 600 123 456'), isNull);
      expect(AppProfileValidators.phone('600123456'), isNull);
      expect(AppProfileValidators.phone('invalid-phone'), isNotNull);
      expect(AppProfileValidators.phone(''), isNull); // Empty is allowed
      expect(AppProfileValidators.phone(null), isNull); // Null is allowed
    });

    test('required validator works correctly', () {
      expect(AppProfileValidators.required('value'), isNull);
      expect(AppProfileValidators.required(''), isNotNull);
      expect(AppProfileValidators.required('   '), isNotNull); // Only whitespace
      expect(AppProfileValidators.required(null), isNotNull);
    });

    test('minLength validator works correctly', () {
      final validator = AppProfileValidators.minLength(5);
      expect(validator('12345'), isNull);
      expect(validator('123456'), isNull);
      expect(validator('1234'), isNotNull);
      expect(validator(null), isNotNull);
    });

    test('maxLength validator works correctly', () {
      final validator = AppProfileValidators.maxLength(5);
      expect(validator('12345'), isNull);
      expect(validator('1234'), isNull);
      expect(validator('123456'), isNotNull);
      expect(validator(null), isNull); // Null is allowed
    });
  });

  group('Extension methods', () {
    test('AppProfileStateExtension works correctly', () {
      expect(AppProfileState.defaultState.displayName, 'Default');
      expect(AppProfileState.loading.displayName, 'Loading');
      expect(AppProfileState.disabled.displayName, 'Disabled');

      expect(AppProfileState.defaultState.isInteractive, true);
      expect(AppProfileState.disabled.isInteractive, false);
      expect(AppProfileState.loading.isInteractive, false);

      expect(AppProfileState.loading.isLoading, true);
      expect(AppProfileState.skeleton.isLoading, true);
      expect(AppProfileState.defaultState.isLoading, false);
    });

    test('AppProfileFieldA11yExtensions works correctly', () {
      const field = AppProfileField(
        id: 'test',
        type: AppProfileFieldType.text,
        label: 'Test',
        importance: AppProfileFieldImportance.high,
      );

      expect(field.accessibilityPriority, 75);
      expect(field.semanticRole, 'text field');
      expect(field.needsSpecialAnnouncements, false);

      const criticalField = AppProfileField(
        id: 'critical',
        type: AppProfileFieldType.toggle,
        label: 'Critical',
        importance: AppProfileFieldImportance.critical,
      );

      expect(criticalField.accessibilityPriority, 100);
      expect(criticalField.semanticRole, 'switch');
      expect(criticalField.needsSpecialAnnouncements, true);
    });
  });
}