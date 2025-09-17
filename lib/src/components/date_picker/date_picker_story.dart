import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/date_picker/app_date_picker.dart';
import 'package:iautomat_design_system/src/components/date_picker/date_picker_config.dart';

/// Storybook examples for AppDatePicker component
///
/// This file contains various configurations and usage examples
/// of the AppDatePicker component for demonstration and testing purposes.
class AppDatePickerStory {
  static Widget get title => const Text(
        'AppDatePicker',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      );

  static Widget get description => const Text(
        'A comprehensive date picker component with multiple variants, states, and platform-adaptive behavior.',
      );

  /// Basic date picker examples
  static List<StoryExample> get basicExamples => [
        StoryExample(
          name: 'Date Picker - Default',
          description: 'Basic date picker with default configuration',
          widget: _DatePickerExample(),
        ),
        StoryExample(
          name: 'Time Picker - Default',
          description: 'Basic time picker with default configuration',
          widget: _TimePickerExample(),
        ),
        StoryExample(
          name: 'Date Range Picker - Default',
          description: 'Basic date range picker with default configuration',
          widget: _DateRangePickerExample(),
        ),
      ];

  /// State examples
  static List<StoryExample> get stateExamples => [
        StoryExample(
          name: 'All States - Date Picker',
          description: 'Date picker showing all possible states',
          widget: _StateExamplesWidget(),
        ),
        StoryExample(
          name: 'Disabled State',
          description: 'Date picker in disabled state',
          widget: _DisabledExample(),
        ),
        StoryExample(
          name: 'Loading State',
          description: 'Date picker in loading state',
          widget: _LoadingExample(),
        ),
        StoryExample(
          name: 'Skeleton State',
          description: 'Date picker in skeleton loading state',
          widget: _SkeletonExample(),
        ),
      ];

  /// Customization examples
  static List<StoryExample> get customizationExamples => [
        StoryExample(
          name: 'Custom Configuration',
          description: 'Date picker with custom styling and configuration',
          widget: _CustomConfigExample(),
        ),
        StoryExample(
          name: 'With Validation',
          description: 'Date picker with validation and error states',
          widget: _ValidationExample(),
        ),
        StoryExample(
          name: 'Different Locales',
          description: 'Date picker with different locale settings',
          widget: _LocaleExample(),
        ),
        StoryExample(
          name: 'Custom Icons',
          description: 'Date picker with custom prefix and suffix icons',
          widget: _CustomIconsExample(),
        ),
      ];

  /// Platform examples
  static List<StoryExample> get platformExamples => [
        StoryExample(
          name: 'Platform Adaptive',
          description: 'Date picker that adapts to platform (iOS/Android/Web)',
          widget: _PlatformAdaptiveExample(),
        ),
        StoryExample(
          name: 'Cupertino Style',
          description: 'Date picker forced to use Cupertino style',
          widget: _CupertinoExample(),
        ),
        StoryExample(
          name: 'Material Style',
          description: 'Date picker forced to use Material style',
          widget: _MaterialExample(),
        ),
      ];

  /// Form integration examples
  static List<StoryExample> get formExamples => [
        StoryExample(
          name: 'Form Integration',
          description: 'Date picker integrated within a form',
          widget: _FormIntegrationExample(),
        ),
        StoryExample(
          name: 'Multiple Date Pickers',
          description: 'Multiple date pickers in a single form',
          widget: _MultiplePickersExample(),
        ),
      ];

  /// Accessibility examples
  static List<StoryExample> get accessibilityExamples => [
        StoryExample(
          name: 'With Semantic Labels',
          description: 'Date picker with proper semantic labels for accessibility',
          widget: _AccessibilityExample(),
        ),
        StoryExample(
          name: 'Keyboard Navigation',
          description: 'Date picker optimized for keyboard navigation',
          widget: _KeyboardNavigationExample(),
        ),
      ];

  /// RTL examples
  static List<StoryExample> get rtlExamples => [
        StoryExample(
          name: 'RTL Support',
          description: 'Date picker with Right-to-Left text direction',
          widget: _RTLExample(),
        ),
      ];

  /// All examples grouped by category
  static Map<String, List<StoryExample>> get allExamples => {
        'Basic Usage': basicExamples,
        'States': stateExamples,
        'Customization': customizationExamples,
        'Platform Adaptive': platformExamples,
        'Form Integration': formExamples,
        'Accessibility': accessibilityExamples,
        'RTL Support': rtlExamples,
      };
}

/// Data class for story examples
class StoryExample {
  final String name;
  final String description;
  final Widget widget;

  const StoryExample({
    required this.name,
    required this.description,
    required this.widget,
  });
}

// Example Widgets

class _DatePickerExample extends StatefulWidget {
  @override
  _DatePickerExampleState createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<_DatePickerExample> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppDatePicker(
            variant: AppDatePickerVariant.date,
            value: selectedDate,
            onChanged: (date) => setState(() => selectedDate = date),
            labelText: 'Fecha de nacimiento',
            hintText: 'Selecciona tu fecha de nacimiento',
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          ),
          const SizedBox(height: 16),
          Text('Fecha seleccionada: ${selectedDate?.toString() ?? 'Ninguna'}'),
        ],
      ),
    );
  }
}

class _TimePickerExample extends StatefulWidget {
  @override
  _TimePickerExampleState createState() => _TimePickerExampleState();
}

class _TimePickerExampleState extends State<_TimePickerExample> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppDatePicker(
            variant: AppDatePickerVariant.time,
            value: selectedTime,
            onChanged: (time) => setState(() => selectedTime = time),
            labelText: 'Hora de reunión',
            hintText: 'Selecciona la hora',
            use24HourFormat: false,
          ),
          const SizedBox(height: 16),
          Text('Hora seleccionada: ${selectedTime?.format(context) ?? 'Ninguna'}'),
        ],
      ),
    );
  }
}

class _DateRangePickerExample extends StatefulWidget {
  @override
  _DateRangePickerExampleState createState() => _DateRangePickerExampleState();
}

class _DateRangePickerExampleState extends State<_DateRangePickerExample> {
  AppDateRange? selectedRange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppDatePicker(
            variant: AppDatePickerVariant.range,
            value: selectedRange,
            onChanged: (range) => setState(() => selectedRange = range),
            labelText: 'Período de vacaciones',
            hintText: 'Selecciona el rango de fechas',
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365)),
          ),
          const SizedBox(height: 16),
          Text('Rango seleccionado: ${_formatRange(selectedRange)}'),
        ],
      ),
    );
  }

  String _formatRange(AppDateRange? range) {
    if (range == null || range.isEmpty) return 'Ninguno';
    if (range.isPartial) {
      return 'Inicio: ${range.start?.toString() ?? 'No seleccionado'}';
    }
    return '${range.start} - ${range.end}';
  }
}

class _StateExamplesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStateExample('Default', AppDatePickerState.defaultState),
          const SizedBox(height: 12),
          _buildStateExample('Hover', AppDatePickerState.hover),
          const SizedBox(height: 12),
          _buildStateExample('Focus', AppDatePickerState.focus),
          const SizedBox(height: 12),
          _buildStateExample('Selected', AppDatePickerState.selected, DateTime.now()),
          const SizedBox(height: 12),
          _buildStateExample('Disabled', AppDatePickerState.disabled),
          const SizedBox(height: 12),
          _buildStateExample('Loading', AppDatePickerState.loading),
          const SizedBox(height: 12),
          _buildStateExample('Skeleton', AppDatePickerState.skeleton),
        ],
      ),
    );
  }

  Widget _buildStateExample(String stateName, AppDatePickerState state, [DateTime? value]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(stateName, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        AppDatePicker(
          variant: AppDatePickerVariant.date,
          state: state,
          value: value,
          onChanged: state == AppDatePickerState.disabled ? null : (_) {},
          labelText: 'Fecha $stateName',
          hintText: 'Estado: $stateName',
        ),
      ],
    );
  }
}

class _DisabledExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppDatePicker(
        variant: AppDatePickerVariant.date,
        enabled: false,
        labelText: 'Fecha (Deshabilitada)',
        hintText: 'Este campo está deshabilitado',
        onChanged: null,
      ),
    );
  }
}

class _LoadingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppDatePicker(
        variant: AppDatePickerVariant.date,
        state: AppDatePickerState.loading,
        labelText: 'Cargando datos...',
        hintText: 'Por favor espera',
        onChanged: (_) {},
      ),
    );
  }
}

class _SkeletonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppDatePicker(
        variant: AppDatePickerVariant.date,
        state: AppDatePickerState.skeleton,
        labelText: 'Cargando...',
        onChanged: (_) {},
      ),
    );
  }
}

class _CustomConfigExample extends StatefulWidget {
  @override
  _CustomConfigExampleState createState() => _CustomConfigExampleState();
}

class _CustomConfigExampleState extends State<_CustomConfigExample> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppDatePicker(
        variant: AppDatePickerVariant.date,
        value: selectedDate,
        onChanged: (date) => setState(() => selectedDate = date),
        labelText: 'Fecha personalizada',
        hintText: 'Estilo personalizado',
        config: const AppDatePickerConfig(
          borderRadius: 20.0,
          borderWidth: 3.0,
          enableShadow: true,
          shadowBlurRadius: 8.0,
          shadowOffset: Offset(0, 4),
          animationDuration: Duration(milliseconds: 400),
          pressedScale: 0.9,
        ),
      ),
    );
  }
}

class _ValidationExample extends StatefulWidget {
  @override
  _ValidationExampleState createState() => _ValidationExampleState();
}

class _ValidationExampleState extends State<_ValidationExample> {
  DateTime? selectedDate;
  String? errorText;

  void _validateDate(DateTime? date) {
    setState(() {
      if (date == null) {
        errorText = 'La fecha es requerida';
      } else if (date.isAfter(DateTime.now())) {
        errorText = 'La fecha no puede ser futura';
      } else {
        errorText = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppDatePicker(
        variant: AppDatePickerVariant.date,
        value: selectedDate,
        onChanged: (date) {
          setState(() => selectedDate = date);
          _validateDate(date);
        },
        labelText: 'Fecha de nacimiento',
        hintText: 'No puede ser futura',
        errorText: errorText,
        lastDate: DateTime.now(),
      ),
    );
  }
}

class _LocaleExample extends StatefulWidget {
  @override
  _LocaleExampleState createState() => _LocaleExampleState();
}

class _LocaleExampleState extends State<_LocaleExample> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppDatePicker(
        variant: AppDatePickerVariant.date,
        value: selectedDate,
        onChanged: (date) => setState(() => selectedDate = date),
        labelText: 'Fecha con locale español',
        hintText: 'Formato español',
        locale: const Locale('es', 'ES'),
      ),
    );
  }
}

class _CustomIconsExample extends StatefulWidget {
  @override
  _CustomIconsExampleState createState() => _CustomIconsExampleState();
}

class _CustomIconsExampleState extends State<_CustomIconsExample> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppDatePicker(
        variant: AppDatePickerVariant.date,
        value: selectedDate,
        onChanged: (date) => setState(() => selectedDate = date),
        labelText: 'Fecha con iconos personalizados',
        hintText: 'Iconos personalizados',
        prefixIcon: const Icon(Icons.event_note),
        suffixIcon: const Icon(Icons.arrow_drop_down),
      ),
    );
  }
}

class _PlatformAdaptiveExample extends StatefulWidget {
  @override
  _PlatformAdaptiveExampleState createState() => _PlatformAdaptiveExampleState();
}

class _PlatformAdaptiveExampleState extends State<_PlatformAdaptiveExample> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppDatePicker(
        variant: AppDatePickerVariant.date,
        value: selectedDate,
        onChanged: (date) => setState(() => selectedDate = date),
        labelText: 'Fecha adaptativa',
        hintText: 'Se adapta a la plataforma',
        adaptivePlatform: true,
      ),
    );
  }
}

class _CupertinoExample extends StatefulWidget {
  @override
  _CupertinoExampleState createState() => _CupertinoExampleState();
}

class _CupertinoExampleState extends State<_CupertinoExample> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppDatePicker(
        variant: AppDatePickerVariant.date,
        value: selectedDate,
        onChanged: (date) => setState(() => selectedDate = date),
        labelText: 'Fecha estilo Cupertino',
        hintText: 'Siempre estilo iOS',
        adaptivePlatform: true, // This would show Cupertino on iOS
      ),
    );
  }
}

class _MaterialExample extends StatefulWidget {
  @override
  _MaterialExampleState createState() => _MaterialExampleState();
}

class _MaterialExampleState extends State<_MaterialExample> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppDatePicker(
        variant: AppDatePickerVariant.date,
        value: selectedDate,
        onChanged: (date) => setState(() => selectedDate = date),
        labelText: 'Fecha estilo Material',
        hintText: 'Siempre estilo Android',
        adaptivePlatform: false, // Forces Material design
      ),
    );
  }
}

class _FormIntegrationExample extends StatefulWidget {
  @override
  _FormIntegrationExampleState createState() => _FormIntegrationExampleState();
}

class _FormIntegrationExampleState extends State<_FormIntegrationExample> {
  final _formKey = GlobalKey<FormState>();
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? startTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppDatePicker(
              variant: AppDatePickerVariant.date,
              value: startDate,
              onChanged: (date) => setState(() => startDate = date),
              labelText: 'Fecha de inicio',
              hintText: 'Selecciona fecha de inicio',
              validator: (value) => value == null ? 'Fecha requerida' : null,
            ),
            const SizedBox(height: 16),
            AppDatePicker(
              variant: AppDatePickerVariant.date,
              value: endDate,
              onChanged: (date) => setState(() => endDate = date),
              labelText: 'Fecha de fin',
              hintText: 'Selecciona fecha de fin',
              firstDate: startDate,
              validator: (value) {
                if (value == null) return 'Fecha requerida';
                if (startDate != null && value.isBefore(startDate!)) {
                  return 'Debe ser posterior a la fecha de inicio';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            AppDatePicker(
              variant: AppDatePickerVariant.time,
              value: startTime,
              onChanged: (time) => setState(() => startTime = time),
              labelText: 'Hora de inicio',
              hintText: 'Selecciona la hora',
              validator: (value) => value == null ? 'Hora requerida' : null,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Formulario válido!')),
                  );
                }
              },
              child: const Text('Validar'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MultiplePickersExample extends StatefulWidget {
  @override
  _MultiplePickersExampleState createState() => _MultiplePickersExampleState();
}

class _MultiplePickersExampleState extends State<_MultiplePickersExample> {
  DateTime? checkIn;
  DateTime? checkOut;
  AppDateRange? vacationRange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AppDatePicker(
            variant: AppDatePickerVariant.date,
            value: checkIn,
            onChanged: (date) => setState(() => checkIn = date),
            labelText: 'Check-in',
            hintText: 'Fecha de entrada',
          ),
          const SizedBox(height: 16),
          AppDatePicker(
            variant: AppDatePickerVariant.date,
            value: checkOut,
            onChanged: (date) => setState(() => checkOut = date),
            labelText: 'Check-out',
            hintText: 'Fecha de salida',
            firstDate: checkIn,
          ),
          const SizedBox(height: 16),
          AppDatePicker(
            variant: AppDatePickerVariant.range,
            value: vacationRange,
            onChanged: (range) => setState(() => vacationRange = range),
            labelText: 'Período de vacaciones',
            hintText: 'Rango de fechas',
          ),
        ],
      ),
    );
  }
}

class _AccessibilityExample extends StatefulWidget {
  @override
  _AccessibilityExampleState createState() => _AccessibilityExampleState();
}

class _AccessibilityExampleState extends State<_AccessibilityExample> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AppDatePicker(
        variant: AppDatePickerVariant.date,
        value: selectedDate,
        onChanged: (date) => setState(() => selectedDate = date),
        labelText: 'Fecha de cita médica',
        hintText: 'Selecciona una fecha para tu cita',
        semanticLabel: 'Selector de fecha para cita médica, toca para abrir calendario',
        helperText: 'Usa el calendario para seleccionar una fecha disponible',
      ),
    );
  }
}

class _KeyboardNavigationExample extends StatefulWidget {
  @override
  _KeyboardNavigationExampleState createState() => _KeyboardNavigationExampleState();
}

class _KeyboardNavigationExampleState extends State<_KeyboardNavigationExample> {
  DateTime? selectedDate;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('Usa Tab para navegar, Enter/Space para activar'),
          const SizedBox(height: 16),
          AppDatePicker(
            variant: AppDatePickerVariant.date,
            value: selectedDate,
            onChanged: (date) => setState(() => selectedDate = date),
            labelText: 'Fecha con navegación por teclado',
            hintText: 'Navegable por teclado',
            focusNode: _focusNode,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}

class _RTLExample extends StatefulWidget {
  @override
  _RTLExampleState createState() => _RTLExampleState();
}

class _RTLExampleState extends State<_RTLExample> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppDatePicker(
          variant: AppDatePickerVariant.date,
          value: selectedDate,
          onChanged: (date) => setState(() => selectedDate = date),
          labelText: 'تاریخ انتخاب کنید',
          hintText: 'یک تاریخ انتخاب کنید',
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}