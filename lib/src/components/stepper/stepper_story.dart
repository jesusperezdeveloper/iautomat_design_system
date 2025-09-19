import 'package:flutter/material.dart';
import 'ds_stepper.dart';
import 'stepper_config.dart';

class DSStepperStory extends StatefulWidget {
  const DSStepperStory({super.key});

  @override
  State<DSStepperStory> createState() => _DSStepperStoryState();
}

class _DSStepperStoryState extends State<DSStepperStory> {
  int _currentVerticalStep = 0;
  int _currentHorizontalStep = 1;
  int _currentValidationStep = 0;
  int _currentCustomStep = 0;

  final List<DSStep> _basicSteps = [
    const DSStep(
      title: 'Información Personal',
      subtitle: 'Ingresa tus datos básicos',
      state: DSStepState.completed,
      content: Text('Formulario de información personal aquí'),
    ),
    const DSStep(
      title: 'Dirección',
      subtitle: 'Agrega tu dirección de envío',
      state: DSStepState.active,
      content: Text('Formulario de dirección aquí'),
    ),
    const DSStep(
      title: 'Pago',
      subtitle: 'Configura tu método de pago',
      state: DSStepState.inactive,
      content: Text('Formulario de pago aquí'),
    ),
    const DSStep(
      title: 'Confirmación',
      subtitle: 'Revisa y confirma tu pedido',
      state: DSStepState.inactive,
      isOptional: true,
      content: Text('Confirmación del pedido aquí'),
    ),
  ];

  final List<DSStep> _validationSteps = [
    const DSStep(
      title: 'Paso 1',
      subtitle: 'Primer paso completado',
      state: DSStepState.completed,
    ),
    const DSStep(
      title: 'Paso 2',
      subtitle: 'Paso actual con error',
      state: DSStepState.error,
      errorText: 'Hay un error en este paso',
    ),
    const DSStep(
      title: 'Paso 3',
      subtitle: 'Paso deshabilitado',
      state: DSStepState.disabled,
    ),
  ];

  final List<DSStep> _customSteps = [
    DSStep(
      title: 'Inicio',
      subtitle: 'Paso con icono personalizado',
      state: DSStepState.completed,
      icon: const Icon(Icons.home, color: Colors.white),
      content: Container(
        padding: const EdgeInsets.all(16),
        child: const Text('Contenido del paso de inicio'),
      ),
    ),
    DSStep(
      title: 'Configuración',
      subtitle: 'Configurar preferencias',
      state: DSStepState.active,
      icon: const Icon(Icons.settings, color: Colors.white),
      content: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Configuraciones:'),
            SwitchListTile(
              title: const Text('Notificaciones'),
              value: true,
              onChanged: (value) {},
            ),
            SwitchListTile(
              title: const Text('Modo oscuro'),
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    ),
    DSStep(
      title: 'Finalizar',
      subtitle: 'Completar configuración',
      state: DSStepState.inactive,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      content: Container(
        padding: const EdgeInsets.all(16),
        child: const Text('Paso final'),
      ),
    ),
  ];

  void _continueStep(
      List<DSStep> steps, int currentStep, Function(int) updateStep) {
    if (currentStep < steps.length - 1) {
      updateStep(currentStep + 1);
    }
  }

  void _cancelStep(int currentStep, Function(int) updateStep) {
    if (currentStep > 0) {
      updateStep(currentStep - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DSStepper Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStorySection(
              'Vertical Stepper',
              'Stepper vertical básico con pasos interactivos',
              SizedBox(
                height: 400,
                child: DSStepper(
                  currentStep: _currentVerticalStep,
                  steps: _basicSteps,
                  variant: DSStepperVariant.vertical,
                  onStepContinue: () => _continueStep(
                    _basicSteps,
                    _currentVerticalStep,
                    (step) => setState(() => _currentVerticalStep = step),
                  ),
                  onStepCancel: () => _cancelStep(
                    _currentVerticalStep,
                    (step) => setState(() => _currentVerticalStep = step),
                  ),
                  onStepTapped: (step) =>
                      setState(() => _currentVerticalStep = step),
                ),
              ),
            ),
            _buildStorySection(
              'Horizontal Stepper',
              'Stepper horizontal con navegación por pasos',
              SizedBox(
                height: 300,
                child: DSStepper(
                  currentStep: _currentHorizontalStep,
                  steps: _basicSteps,
                  variant: DSStepperVariant.horizontal,
                  onStepContinue: () => _continueStep(
                    _basicSteps,
                    _currentHorizontalStep,
                    (step) => setState(() => _currentHorizontalStep = step),
                  ),
                  onStepCancel: () => _cancelStep(
                    _currentHorizontalStep,
                    (step) => setState(() => _currentHorizontalStep = step),
                  ),
                  onStepTapped: (step) =>
                      setState(() => _currentHorizontalStep = step),
                ),
              ),
            ),
            _buildStorySection(
              'Estados de Validación',
              'Stepper mostrando diferentes estados de validación',
              SizedBox(
                height: 300,
                child: DSStepper(
                  currentStep: _currentValidationStep,
                  steps: _validationSteps,
                  variant: DSStepperVariant.vertical,
                  onStepContinue: () => _continueStep(
                    _validationSteps,
                    _currentValidationStep,
                    (step) => setState(() => _currentValidationStep = step),
                  ),
                  onStepCancel: () => _cancelStep(
                    _currentValidationStep,
                    (step) => setState(() => _currentValidationStep = step),
                  ),
                  onStepTapped: (step) =>
                      setState(() => _currentValidationStep = step),
                ),
              ),
            ),
            _buildStorySection(
              'Stepper con Iconos Personalizados',
              'Stepper con iconos y contenido personalizado',
              SizedBox(
                height: 400,
                child: DSStepper(
                  currentStep: _currentCustomStep,
                  steps: _customSteps,
                  variant: DSStepperVariant.vertical,
                  onStepContinue: () => _continueStep(
                    _customSteps,
                    _currentCustomStep,
                    (step) => setState(() => _currentCustomStep = step),
                  ),
                  onStepCancel: () => _cancelStep(
                    _currentCustomStep,
                    (step) => setState(() => _currentCustomStep = step),
                  ),
                  onStepTapped: (step) =>
                      setState(() => _currentCustomStep = step),
                ),
              ),
            ),
            _buildStorySection(
              'Estados del Componente',
              'Diferentes estados del stepper',
              Column(
                children: [
                  const Text('Estado Deshabilitado'),
                  SizedBox(
                    height: 200,
                    child: DSStepper(
                      currentStep: 0,
                      steps: _basicSteps.take(2).toList(),
                      enabled: false,
                      variant: DSStepperVariant.vertical,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Estado de Carga'),
                  SizedBox(
                    height: 100,
                    child: DSStepper(
                      currentStep: 0,
                      steps: _basicSteps.take(2).toList(),
                      overrideState: DSStepperState.loading,
                      variant: DSStepperVariant.vertical,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Estado Skeleton'),
                  SizedBox(
                    height: 100,
                    child: DSStepper(
                      currentStep: 0,
                      steps: _basicSteps.take(2).toList(),
                      overrideState: DSStepperState.skeleton,
                      variant: DSStepperVariant.vertical,
                    ),
                  ),
                ],
              ),
            ),
            _buildStorySection(
              'Configuración Personalizada',
              'Stepper con configuración y colores personalizados',
              SizedBox(
                height: 300,
                child: DSStepper(
                  currentStep: 1,
                  steps: _basicSteps,
                  variant: DSStepperVariant.vertical,
                  config: const DSStepperConfig(
                    stepRadius: 16.0,
                    stepBorderWidth: 3.0,
                    horizontalSpacing: 24.0,
                    verticalSpacing: 32.0,
                    showOptionalBadge: true,
                    compactMode: false,
                  ),
                  onStepTapped: (step) {},
                ),
              ),
            ),
            _buildStorySection(
              'Controles Personalizados',
              'Stepper con botones de control personalizados',
              SizedBox(
                height: 300,
                child: DSStepper(
                  currentStep: 1,
                  steps: _basicSteps,
                  variant: DSStepperVariant.vertical,
                  controlsBuilder: DSStepperControlsBuilder(
                    continueButton: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Siguiente'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                    cancelButton: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Atrás'),
                    ),
                  ),
                ),
              ),
            ),
            _buildStorySection(
              'Tema Oscuro',
              'Stepper en tema oscuro',
              Theme(
                data: ThemeData.dark(),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ThemeData.dark().colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SizedBox(
                    height: 300,
                    child: DSStepper(
                      currentStep: 1,
                      steps: _basicSteps,
                      variant: DSStepperVariant.vertical,
                      onStepTapped: (step) {},
                    ),
                  ),
                ),
              ),
            ),
            _buildStorySection(
              'Soporte RTL',
              'Stepper con dirección de texto de derecha a izquierda',
              Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: 300,
                  child: DSStepper(
                    currentStep: 1,
                    steps: const [
                      DSStep(
                        title: 'المعلومات الشخصية',
                        subtitle: 'أدخل بياناتك الأساسية',
                        state: DSStepState.completed,
                      ),
                      DSStep(
                        title: 'العنوان',
                        subtitle: 'أضف عنوان الشحن',
                        state: DSStepState.active,
                      ),
                      DSStep(
                        title: 'الدفع',
                        subtitle: 'اختر طريقة الدفع',
                        state: DSStepState.inactive,
                      ),
                    ],
                    variant: DSStepperVariant.vertical,
                    onStepTapped: (step) {},
                  ),
                ),
              ),
            ),
            _buildStorySection(
              'Stepper Compacto',
              'Versión compacta para espacios reducidos',
              SizedBox(
                height: 250,
                child: DSStepper(
                  currentStep: 1,
                  steps: _basicSteps,
                  variant: DSStepperVariant.vertical,
                  dense: true,
                  config: const DSStepperConfig(
                    compactMode: true,
                    minimumStepHeight: 32.0,
                    stepRadius: 12.0,
                    horizontalSpacing: 12.0,
                    verticalSpacing: 16.0,
                  ),
                  onStepTapped: (step) {},
                ),
              ),
            ),
            _buildStorySection(
              'Sin Controles',
              'Stepper sin botones de control',
              SizedBox(
                height: 250,
                child: DSStepper(
                  currentStep: 1,
                  steps: _basicSteps,
                  variant: DSStepperVariant.vertical,
                  showControls: false,
                  onStepTapped: (step) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStorySection(String title, String description, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}
