import 'package:flutter/material.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

class AppCheckoutFormsStory extends StatefulWidget {
  const AppCheckoutFormsStory({super.key});

  @override
  State<AppCheckoutFormsStory> createState() => _AppCheckoutFormsStoryState();
}

class _AppCheckoutFormsStoryState extends State<AppCheckoutFormsStory>
    with TickerProviderStateMixin {
  AppCheckoutVariant _selectedVariant = AppCheckoutVariant.address;
  AppCheckoutState _selectedState = AppCheckoutState.defaultState;
  bool _isDarkMode = false;
  bool _isRTL = false;
  bool _autoValidate = true;
  bool _showSubmitButton = true;

  AppCheckoutFormData? _lastSubmittedData;
  String _submitStatus = '';

  // Campos personalizados para demostración
  List<AppCheckoutField> _customFields = [];

  @override
  void initState() {
    super.initState();
    _customFields = _selectedVariant.defaultFields;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppCheckoutForms Story',
      theme: _isDarkMode ? ThemeData.dark(useMaterial3: true) : ThemeData.light(useMaterial3: true),
      home: Directionality(
        textDirection: _isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('AppCheckoutForms Story'),
            actions: [
              IconButton(
                icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
                onPressed: () => setState(() => _isDarkMode = !_isDarkMode),
                tooltip: _isDarkMode ? 'Modo claro' : 'Modo oscuro',
              ),
              IconButton(
                icon: const Icon(Icons.translate),
                onPressed: () => setState(() => _isRTL = !_isRTL),
                tooltip: _isRTL ? 'LTR' : 'RTL',
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildControls(),
                const SizedBox(height: 24),
                _buildFormDemo(),
                const SizedBox(height: 32),
                if (_lastSubmittedData != null) _buildSubmissionResult(),
                const SizedBox(height: 32),
                _buildExamples(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Controles',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Variante
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Variante:', style: TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      SegmentedButton<AppCheckoutVariant>(
                        segments: const [
                          ButtonSegment(
                            value: AppCheckoutVariant.address,
                            label: Text('Dirección'),
                            icon: Icon(Icons.location_on),
                          ),
                          ButtonSegment(
                            value: AppCheckoutVariant.payment,
                            label: Text('Pago'),
                            icon: Icon(Icons.payment),
                          ),
                        ],
                        selected: {_selectedVariant},
                        onSelectionChanged: (Set<AppCheckoutVariant> selection) {
                          setState(() {
                            _selectedVariant = selection.first;
                            _customFields = _selectedVariant.defaultFields;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Estado:', style: TextStyle(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      DropdownButton<AppCheckoutState>(
                        value: _selectedState,
                        isExpanded: true,
                        items: AppCheckoutState.values.map((state) {
                          return DropdownMenuItem(
                            value: state,
                            child: Text(state.displayName),
                          );
                        }).toList(),
                        onChanged: (state) {
                          if (state != null) {
                            setState(() => _selectedState = state);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Opciones
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                FilterChip(
                  label: const Text('Auto Validar'),
                  selected: _autoValidate,
                  onSelected: (value) => setState(() => _autoValidate = value),
                ),
                FilterChip(
                  label: const Text('Mostrar Botón'),
                  selected: _showSubmitButton,
                  onSelected: (value) => setState(() => _showSubmitButton = value),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Demo - ${_selectedVariant.displayName} (${_selectedState.displayName})',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxHeight: 600),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AppCheckoutForms(
                  fields: _customFields,
                  variant: _selectedVariant,
                  initialState: _selectedState,
                  autoValidate: _autoValidate,
                  showSubmitButton: _showSubmitButton,
                  onSubmit: _handleSubmit,
                  onFieldChanged: _handleFieldChanged,
                  onValidationChanged: _handleValidationChanged,
                ),
              ),
            ),
            if (_submitStatus.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  border: Border.all(color: Colors.green.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green.shade600),
                    const SizedBox(width: 8),
                    Expanded(child: Text(_submitStatus)),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSubmissionResult() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Último Envío',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Estado: ${_lastSubmittedData!.isValid ? "✅ Válido" : "❌ Inválido"}'),
            Text('Campos modificados: ${_lastSubmittedData!.isDirty ? "Sí" : "No"}'),
            Text('Enviado: ${_lastSubmittedData!.isSubmitted ? "Sí" : "No"}'),
            Text('ID de envío: ${_lastSubmittedData!.submissionId ?? "N/A"}'),
            const SizedBox(height: 12),
            const Text('Valores:', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _lastSubmittedData!.values.entries.map((entry) {
                  // Enmascarar datos sensibles para display
                  final field = _customFields.firstWhere(
                    (f) => f.key == entry.key,
                    orElse: () => AppCheckoutField(
                      key: entry.key,
                      label: entry.key,
                      type: AppCheckoutFieldType.text,
                    ),
                  );

                  String displayValue = entry.value?.toString() ?? '';
                  if (field.sensitive && displayValue.isNotEmpty) {
                    if (field.type == AppCheckoutFieldType.creditCard) {
                      displayValue = '**** **** **** ${displayValue.replaceAll(RegExp(r'\D'), '').substring(displayValue.replaceAll(RegExp(r'\D'), '').length - 4)}';
                    } else {
                      displayValue = '*' * displayValue.length;
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text('${entry.key}: $displayValue'),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ejemplos de Uso',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        // Formulario de dirección simple
        _buildExampleSection(
          'Formulario de Dirección Completo',
          'Incluye todos los campos estándar para capturar información de envío',
          [
            _buildExampleCard(
              'Dirección - Todos los campos',
              AppCheckoutForms.address(
                onSubmit: _handleExampleSubmit,
              ),
              height: 500,
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Formulario de pago
        _buildExampleSection(
          'Formulario de Pago Seguro',
          'Captura información de tarjeta de crédito con validación',
          [
            _buildExampleCard(
              'Pago - Información de tarjeta',
              AppCheckoutForms.payment(
                onSubmit: _handleExampleSubmit,
              ),
              height: 450,
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Formularios personalizados
        _buildExampleSection(
          'Formularios Personalizados',
          'Configuraciones específicas y campos personalizados',
          [
            _buildExampleCard(
              'Registro de usuario simple',
              AppCheckoutForms(
                fields: const [
                  AppCheckoutField(
                    key: 'fullName',
                    label: 'Nombre completo',
                    type: AppCheckoutFieldType.text,
                    required: true,
                    flex: 2,
                  ),
                  AppCheckoutField(
                    key: 'email',
                    label: 'Correo electrónico',
                    type: AppCheckoutFieldType.email,
                    required: true,
                    flex: 2,
                  ),
                  AppCheckoutField(
                    key: 'password',
                    label: 'Contraseña',
                    type: AppCheckoutFieldType.password,
                    required: true,
                    flex: 1,
                  ),
                  AppCheckoutField(
                    key: 'confirmPassword',
                    label: 'Confirmar contraseña',
                    type: AppCheckoutFieldType.password,
                    required: true,
                    flex: 1,
                  ),
                  AppCheckoutField(
                    key: 'terms',
                    label: 'Acepto los términos y condiciones',
                    type: AppCheckoutFieldType.checkbox,
                    required: true,
                    flex: 2,
                  ),
                ],
                submitButtonText: 'Crear Cuenta',
                onSubmit: _handleExampleSubmit,
              ),
              height: 400,
            ),
            _buildExampleCard(
              'Configuración personalizada',
              AppCheckoutForms(
                fields: const [
                  AppCheckoutField(
                    key: 'company',
                    label: 'Empresa',
                    type: AppCheckoutFieldType.text,
                    placeholder: 'Nombre de tu empresa',
                    helperText: 'Opcional para facturas corporativas',
                  ),
                  AppCheckoutField(
                    key: 'industry',
                    label: 'Industria',
                    type: AppCheckoutFieldType.dropdown,
                    options: ['Tecnología', 'Salud', 'Educación', 'Finanzas', 'Otro'],
                  ),
                  AppCheckoutField(
                    key: 'employees',
                    label: 'Número de empleados',
                    type: AppCheckoutFieldType.dropdown,
                    options: ['1-10', '11-50', '51-200', '200+'],
                  ),
                ],
                config: AppCheckoutFormsConfig(
                  colors: AppCheckoutColors(
                    backgroundColor: Color(0xFFF8F9FA),
                    borderColor: Colors.blue,
                    focusedBorderColor: Colors.indigo.shade700,
                    labelColor: Colors.indigo,
                    buttonPrimaryColor: Colors.green,
                    headerColor: Colors.purple,
                  ),
                  spacing: AppCheckoutSpacing(
                    padding: 20.0,
                    fieldSpacing: 16.0,
                    borderRadius: 12.0,
                  ),
                ),
                submitButtonText: 'Guardar Información',
                onSubmit: _handleExampleSubmit,
              ),
              height: 350,
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Estados especiales
        _buildExampleSection(
          'Estados Especiales',
          'Diferentes estados del formulario para casos específicos',
          [
            _buildExampleCard(
              'Estado de carga',
              AppCheckoutForms(
                fields: const [
                  AppCheckoutField(
                    key: 'processing',
                    label: 'Procesando...',
                    type: AppCheckoutFieldType.text,
                    placeholder: 'Este formulario está procesando',
                  ),
                ],
                initialState: AppCheckoutState.loading,
                showSubmitButton: false,
              ),
              height: 200,
            ),
            _buildExampleCard(
              'Estado skeleton',
              AppCheckoutForms(
                fields: const [
                  AppCheckoutField(
                    key: 'loading1',
                    label: 'Campo 1',
                    type: AppCheckoutFieldType.text,
                  ),
                  AppCheckoutField(
                    key: 'loading2',
                    label: 'Campo 2',
                    type: AppCheckoutFieldType.email,
                  ),
                ],
                initialState: AppCheckoutState.skeleton,
                showSubmitButton: false,
              ),
              height: 200,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExampleSection(String title, String description, List<Widget> examples) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        const SizedBox(height: 12),
        ...examples.map((example) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: example,
        )),
      ],
    );
  }

  Widget _buildExampleCard(String title, Widget child, {double height = 400}) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmit(AppCheckoutFormData data) {
    setState(() {
      _lastSubmittedData = data;
      _submitStatus = 'Formulario enviado exitosamente a las ${DateTime.now().toString().substring(11, 19)}';
    });

    // Simular procesamiento
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _submitStatus = '';
        });
      }
    });

    // Mostrar dialog con información del envío
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${_selectedVariant.displayName} Enviado'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Formulario válido: ${data.isValid ? "Sí" : "No"}'),
            Text('Campos completados: ${data.values.length}'),
            Text('ID de envío: ${data.submissionId}'),
            const SizedBox(height: 8),
            const Text('Los datos se han enviado correctamente y se procesarán según las políticas de privacidad aplicables.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  void _handleExampleSubmit(AppCheckoutFormData data) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Ejemplo enviado: ${data.values.length} campos'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _handleFieldChanged(String fieldKey, dynamic value) {
    // Log cambios para debugging
    debugPrint('Campo cambiado: $fieldKey = $value');
  }

  void _handleValidationChanged(AppCheckoutFormData data) {
    // Log cambios de validación para debugging
    final validFields = data.validations.values.where((v) => v.isValid).length;
    final totalFields = data.validations.length;
    debugPrint('Validación: $validFields/$totalFields campos válidos');
  }
}