import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

void main() {
  group('DSProfilePreferences', () {
    testWidgets('renders correctly with basic configuration', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSProfilePreferences(
              config: DSProfilePreferencesConfigDefaults.basicProfile,
              onSave: (data) {},
            ),
          ),
        ),
      );

      expect(find.byType(DSProfilePreferences), findsOneWidget);
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
            body: DSProfilePreferences(
              config: DSProfilePreferencesConfigDefaults.basicProfile,
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
      DSProfileFormData? lastFormData;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSProfilePreferences(
              config: const DSProfilePreferencesConfig(
                fields: [
                  DSProfileField(
                    id: 'name',
                    type: DSProfileFieldType.text,
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
            body: DSProfilePreferences(
              config: const DSProfilePreferencesConfig(
                fields: [
                  DSProfileField(
                    id: 'header',
                    type: DSProfileFieldType.header,
                    label: 'Sección Header',
                  ),
                  DSProfileField(
                    id: 'text_field',
                    type: DSProfileFieldType.text,
                    label: 'Campo de texto',
                  ),
                  DSProfileField(
                    id: 'toggle_field',
                    type: DSProfileFieldType.toggle,
                    label: 'Toggle',
                    value: true,
                  ),
                  DSProfileField(
                    id: 'select_field',
                    type: DSProfileFieldType.select,
                    label: 'Selección',
                    options: [
                      DSProfileFieldOption(
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
            body: DSProfilePreferences(
              config: const DSProfilePreferencesConfig(
                fields: [
                  DSProfileField(
                    id: 'required_field',
                    type: DSProfileFieldType.text,
                    label: 'Campo requerido',
                    required: true,
                    validation: DSProfileFieldValidation(
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
            body: DSProfilePreferences(
              config: const DSProfilePreferencesConfig(
                state: DSProfileState.disabled,
                fields: [
                  DSProfileField(
                    id: 'text_field',
                    type: DSProfileFieldType.text,
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
            body: DSProfilePreferences(
              config: const DSProfilePreferencesConfig(
                state: DSProfileState.skeleton,
                fields: [
                  DSProfileField(
                    id: 'text_field',
                    type: DSProfileFieldType.text,
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
      DSProfileFormData? lastFormData;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSProfilePreferences(
              config: const DSProfilePreferencesConfig(
                fields: [
                  DSProfileField(
                    id: 'notifications',
                    type: DSProfileFieldType.toggle,
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
      DSProfileFormData? lastFormData;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSProfilePreferences(
              config: const DSProfilePreferencesConfig(
                fields: [
                  DSProfileField(
                    id: 'theme',
                    type: DSProfileFieldType.select,
                    label: 'Tema',
                    options: [
                      DSProfileFieldOption(
                        value: 'light',
                        label: 'Claro',
                      ),
                      DSProfileFieldOption(
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
            body: DSProfilePreferences(
              config: const DSProfilePreferencesConfig(
                fields: [
                  DSProfileField(
                    id: 'name',
                    type: DSProfileFieldType.text,
                    label: 'Nombre',
                  ),
                ],
                colors: DSProfileColors(
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
      DSProfileFieldValidationResult? lastValidation;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DSProfilePreferences(
              config: const DSProfilePreferencesConfig(
                fields: [
                  DSProfileField(
                    id: 'email',
                    type: DSProfileFieldType.email,
                    label: 'Email',
                    validation: DSProfileFieldValidation(
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

  group('DSProfilePreferencesConfig', () {
    test('creates instance with default values', () {
      const config = DSProfilePreferencesConfig();

      expect(config.variant, DSProfileVariant.sections);
      expect(config.state, DSProfileState.defaultState);
      expect(config.fields, isEmpty);
    });

    test('creates instance with custom values', () {
      const config = DSProfilePreferencesConfig(
        variant: DSProfileVariant.sections,
        state: DSProfileState.loading,
        fields: [
          DSProfileField(
            id: 'test',
            type: DSProfileFieldType.text,
            label: 'Test',
          ),
        ],
      );

      expect(config.variant, DSProfileVariant.sections);
      expect(config.state, DSProfileState.loading);
      expect(config.fields.length, 1);
      expect(config.fields.first.id, 'test');
    });
  });

  group('DSProfileField', () {
    test('creates instance with required values', () {
      const field = DSProfileField(
        id: 'test_field',
        type: DSProfileFieldType.text,
        label: 'Test Field',
      );

      expect(field.id, 'test_field');
      expect(field.type, DSProfileFieldType.text);
      expect(field.label, 'Test Field');
      expect(field.required, false);
      expect(field.enabled, true);
      expect(field.readonly, false);
    });

    test('creates instance with all values', () {
      const field = DSProfileField(
        id: 'test_field',
        type: DSProfileFieldType.email,
        label: 'Test Field',
        value: 'test@example.com',
        placeholder: 'Enter email',
        description: 'Your email address',
        required: true,
        enabled: false,
        readonly: true,
        importance: DSProfileFieldImportance.high,
        icon: Icons.email,
      );

      expect(field.id, 'test_field');
      expect(field.type, DSProfileFieldType.email);
      expect(field.label, 'Test Field');
      expect(field.value, 'test@example.com');
      expect(field.placeholder, 'Enter email');
      expect(field.description, 'Your email address');
      expect(field.required, true);
      expect(field.enabled, false);
      expect(field.readonly, true);
      expect(field.importance, DSProfileFieldImportance.high);
      expect(field.icon, Icons.email);
    });
  });

  group('DSProfileFormData', () {
    test('creates instance with default values', () {
      const formData = DSProfileFormData();

      expect(formData.values, isEmpty);
      expect(formData.validations, isEmpty);
      expect(formData.errors, isEmpty);
      expect(formData.isValid, true);
      expect(formData.hasUnsavedChanges, false);
      expect(formData.saveAttempts, 0);
    });

    test('creates instance with custom values', () {
      final now = DateTime.now();
      final formData = DSProfileFormData(
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

  group('DSProfileValidators', () {
    test('email validator works correctly', () {
      expect(DSProfileValidators.email('test@example.com'), isNull);
      expect(DSProfileValidators.email('invalid-email'), isNotNull);
      expect(DSProfileValidators.email(''), isNull); // Empty is allowed
      expect(DSProfileValidators.email(null), isNull); // Null is allowed
    });

    test('phone validator works correctly', () {
      expect(DSProfileValidators.phone('+34 600 123 456'), isNull);
      expect(DSProfileValidators.phone('600123456'), isNull);
      expect(DSProfileValidators.phone('invalid-phone'), isNotNull);
      expect(DSProfileValidators.phone(''), isNull); // Empty is allowed
      expect(DSProfileValidators.phone(null), isNull); // Null is allowed
    });

    test('required validator works correctly', () {
      expect(DSProfileValidators.required('value'), isNull);
      expect(DSProfileValidators.required(''), isNotNull);
      expect(DSProfileValidators.required('   '), isNotNull); // Only whitespace
      expect(DSProfileValidators.required(null), isNotNull);
    });

    test('minLength validator works correctly', () {
      final validator = DSProfileValidators.minLength(5);
      expect(validator('12345'), isNull);
      expect(validator('123456'), isNull);
      expect(validator('1234'), isNotNull);
      expect(validator(null), isNotNull);
    });

    test('maxLength validator works correctly', () {
      final validator = DSProfileValidators.maxLength(5);
      expect(validator('12345'), isNull);
      expect(validator('1234'), isNull);
      expect(validator('123456'), isNotNull);
      expect(validator(null), isNull); // Null is allowed
    });
  });

  group('Extension methods', () {
    test('DSProfileStateExtension works correctly', () {
      expect(DSProfileState.defaultState.displayName, 'Default');
      expect(DSProfileState.loading.displayName, 'Loading');
      expect(DSProfileState.disabled.displayName, 'Disabled');

      expect(DSProfileState.defaultState.isInteractive, true);
      expect(DSProfileState.disabled.isInteractive, false);
      expect(DSProfileState.loading.isInteractive, false);

      expect(DSProfileState.loading.isLoading, true);
      expect(DSProfileState.skeleton.isLoading, true);
      expect(DSProfileState.defaultState.isLoading, false);
    });

    test('DSProfileFieldA11yExtensions works correctly', () {
      const field = DSProfileField(
        id: 'test',
        type: DSProfileFieldType.text,
        label: 'Test',
        importance: DSProfileFieldImportance.high,
      );

      expect(field.accessibilityPriority, 75);
      expect(field.semanticRole, 'text field');
      expect(field.needsSpecialAnnouncements, false);

      const criticalField = DSProfileField(
        id: 'critical',
        type: DSProfileFieldType.toggle,
        label: 'Critical',
        importance: DSProfileFieldImportance.critical,
      );

      expect(criticalField.accessibilityPriority, 100);
      expect(criticalField.semanticRole, 'switch');
      expect(criticalField.needsSpecialAnnouncements, true);
    });
  });
}