import 'package:flutter/material.dart';
import 'app_stepper.dart';
import 'stepper_config.dart';

class AppStepperStory extends StatefulWidget {
  const AppStepperStory({super.key});

  @override
  State<AppStepperStory> createState() => _AppStepperStoryState();
}

class _AppStepperStoryState extends State<AppStepperStory> {
  int _currentVerticalStep = 0;
  int _currentHorizontalStep = 1;
  int _currentValidationStep = 0;
  int _currentCustomStep = 0;

  final List<AppStep> _basicSteps = [
    const AppStep(
      title: 'Información Personal',
      subtitle: 'Ingresa tus datos básicos',
      state: AppStepState.completed,
      content: Text('Formulario de información personal aquí'),
    ),
    const AppStep(
      title: 'Dirección',
      subtitle: 'Agrega tu dirección de envío',
      state: AppStepState.active,
      content: Text('Formulario de dirección aquí'),
    ),
    const AppStep(
      title: 'Pago',
      subtitle: 'Configura tu método de pago',
      state: AppStepState.inactive,
      content: Text('Formulario de pago aquí'),
    ),
    const AppStep(
      title: 'Confirmación',
      subtitle: 'Revisa y confirma tu pedido',
      state: AppStepState.inactive,
      isOptional: true,
      content: Text('Confirmación del pedido aquí'),
    ),
  ];

  final List<AppStep> _validationSteps = [
    const AppStep(
      title: 'Paso 1',
      subtitle: 'Primer paso completado',
      state: AppStepState.completed,
    ),
    const AppStep(
      title: 'Paso 2',
      subtitle: 'Paso actual con error',
      state: AppStepState.error,
      errorText: 'Hay un error en este paso',
    ),
    const AppStep(
      title: 'Paso 3',
      subtitle: 'Paso deshabilitado',
      state: AppStepState.disabled,
    ),
  ];

  final List<AppStep> _customSteps = [
    AppStep(
      title: 'Inicio',
      subtitle: 'Paso con icono personalizado',
      state: AppStepState.completed,
      icon: const Icon(Icons.home, color: Colors.white),
      content: Container(
        padding: const EdgeInsets.all(16),
        child: const Text('Contenido del paso de inicio'),
      ),
    ),
    AppStep(
      title: 'Configuración',
      subtitle: 'Configurar preferencias',
      state: AppStepState.active,
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
    AppStep(
      title: 'Finalizar',
      subtitle: 'Completar configuración',
      state: AppStepState.inactive,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      content: Container(
        padding: const EdgeInsets.all(16),
        child: const Text('Paso final'),
      ),
    ),
  ];

  void _continueStep(List<AppStep> steps, int currentStep, Function(int) updateStep) {
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
        title: const Text('AppStepper Stories'),
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
                child: AppStepper(
                  currentStep: _currentVerticalStep,
                  steps: _basicSteps,
                  variant: AppStepperVariant.vertical,
                  onStepContinue: () => _continueStep(
                    _basicSteps,
                    _currentVerticalStep,
                    (step) => setState(() => _currentVerticalStep = step),
                  ),
                  onStepCancel: () => _cancelStep(
                    _currentVerticalStep,
                    (step) => setState(() => _currentVerticalStep = step),
                  ),
                  onStepTapped: (step) => setState(() => _currentVerticalStep = step),
                ),
              ),
            ),
            _buildStorySection(
              'Horizontal Stepper',
              'Stepper horizontal con navegación por pasos',
              SizedBox(
                height: 300,
                child: AppStepper(
                  currentStep: _currentHorizontalStep,
                  steps: _basicSteps,
                  variant: AppStepperVariant.horizontal,
                  onStepContinue: () => _continueStep(
                    _basicSteps,
                    _currentHorizontalStep,
                    (step) => setState(() => _currentHorizontalStep = step),
                  ),
                  onStepCancel: () => _cancelStep(
                    _currentHorizontalStep,
                    (step) => setState(() => _currentHorizontalStep = step),
                  ),
                  onStepTapped: (step) => setState(() => _currentHorizontalStep = step),
                ),
              ),
            ),
            _buildStorySection(
              'Estados de Validación',
              'Stepper mostrando diferentes estados de validación',
              SizedBox(
                height: 300,
                child: AppStepper(
                  currentStep: _currentValidationStep,
                  steps: _validationSteps,
                  variant: AppStepperVariant.vertical,
                  onStepContinue: () => _continueStep(
                    _validationSteps,
                    _currentValidationStep,
                    (step) => setState(() => _currentValidationStep = step),
                  ),
                  onStepCancel: () => _cancelStep(
                    _currentValidationStep,
                    (step) => setState(() => _currentValidationStep = step),
                  ),
                  onStepTapped: (step) => setState(() => _currentValidationStep = step),
                ),
              ),
            ),
            _buildStorySection(
              'Stepper con Iconos Personalizados',
              'Stepper con iconos y contenido personalizado',
              SizedBox(
                height: 400,
                child: AppStepper(
                  currentStep: _currentCustomStep,
                  steps: _customSteps,
                  variant: AppStepperVariant.vertical,
                  onStepContinue: () => _continueStep(
                    _customSteps,
                    _currentCustomStep,
                    (step) => setState(() => _currentCustomStep = step),
                  ),
                  onStepCancel: () => _cancelStep(
                    _currentCustomStep,
                    (step) => setState(() => _currentCustomStep = step),
                  ),
                  onStepTapped: (step) => setState(() => _currentCustomStep = step),
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
                    child: AppStepper(
                      currentStep: 0,
                      steps: _basicSteps.take(2).toList(),
                      enabled: false,
                      variant: AppStepperVariant.vertical,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Estado de Carga'),
                  SizedBox(
                    height: 100,
                    child: AppStepper(
                      currentStep: 0,
                      steps: _basicSteps.take(2).toList(),
                      overrideState: AppStepperState.loading,
                      variant: AppStepperVariant.vertical,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Estado Skeleton'),
                  SizedBox(
                    height: 100,
                    child: AppStepper(
                      currentStep: 0,
                      steps: _basicSteps.take(2).toList(),
                      overrideState: AppStepperState.skeleton,
                      variant: AppStepperVariant.vertical,
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
                child: AppStepper(
                  currentStep: 1,
                  steps: _basicSteps,
                  variant: AppStepperVariant.vertical,
                  config: const AppStepperConfig(
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
                child: AppStepper(
                  currentStep: 1,
                  steps: _basicSteps,
                  variant: AppStepperVariant.vertical,
                  controlsBuilder: AppStepperControlsBuilder(
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
                    child: AppStepper(
                      currentStep: 1,
                      steps: _basicSteps,
                      variant: AppStepperVariant.vertical,
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
                  child: AppStepper(
                    currentStep: 1,
                    steps: const [
                      AppStep(
                        title: 'المعلومات الشخصية',
                        subtitle: 'أدخل بياناتك الأساسية',
                        state: AppStepState.completed,
                      ),
                      AppStep(
                        title: 'العنوان',
                        subtitle: 'أضف عنوان الشحن',
                        state: AppStepState.active,
                      ),
                      AppStep(
                        title: 'الدفع',
                        subtitle: 'اختر طريقة الدفع',
                        state: AppStepState.inactive,
                      ),
                    ],
                    variant: AppStepperVariant.vertical,
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
                child: AppStepper(
                  currentStep: 1,
                  steps: _basicSteps,
                  variant: AppStepperVariant.vertical,
                  dense: true,
                  config: const AppStepperConfig(
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
                child: AppStepper(
                  currentStep: 1,
                  steps: _basicSteps,
                  variant: AppStepperVariant.vertical,
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