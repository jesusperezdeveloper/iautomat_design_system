import 'package:flutter/material.dart';
import 'package:iautomat_design_system/src/components/tour/app_tour.dart';
import 'package:iautomat_design_system/src/components/tour/app_tour_config.dart';

/// Story examples for DSTour component
///
/// This file provides interactive examples demonstrating:
/// - Basic coachmarks tour with multiple steps
/// - Custom styling and positioning
/// - Different tour configurations
/// - Platform-adaptive behavior
/// - RTL support
/// - Accessibility features
class TourStoryPage extends StatefulWidget {
  const TourStoryPage({super.key});

  @override
  State<TourStoryPage> createState() => _TourStoryPageState();
}

class _TourStoryPageState extends State<TourStoryPage> {
  bool _isTourActive = false;
  bool _isCustomTourActive = false;
  bool _isRtlTourActive = false;

  // GlobalKeys for tour targets
  final GlobalKey _appBarKey = GlobalKey();
  final GlobalKey _fabKey = GlobalKey();
  final GlobalKey _drawerKey = GlobalKey();
  final GlobalKey _menuKey = GlobalKey();
  final GlobalKey _searchKey = GlobalKey();
  final GlobalKey _profileKey = GlobalKey();
  final GlobalKey _settingsKey = GlobalKey();

  late List<DSTourStep> _basicTourSteps;
  late List<DSTourStep> _customTourSteps;
  late List<DSTourStep> _rtlTourSteps;

  @override
  void initState() {
    super.initState();
    _setupTourSteps();
  }

  void _setupTourSteps() {
    _basicTourSteps = [
      DSTourStep(
        id: 'step_1',
        targetKey: _appBarKey,
        title: 'Barra de Aplicación',
        description: 'Aquí encontrarás el título de la aplicación y las acciones principales.',
        position: DSTourPosition.bottom,
        alignment: DSTourAlignment.center,
      ),
      DSTourStep(
        id: 'step_2',
        targetKey: _drawerKey,
        title: 'Menú de Navegación',
        description: 'Toca aquí para abrir el menú lateral con todas las opciones de navegación.',
        position: DSTourPosition.right,
        alignment: DSTourAlignment.center,
      ),
      DSTourStep(
        id: 'step_3',
        targetKey: _searchKey,
        title: 'Búsqueda',
        description: 'Utiliza esta función para encontrar contenido específico rápidamente.',
        position: DSTourPosition.bottom,
        alignment: DSTourAlignment.end,
      ),
      DSTourStep(
        id: 'step_4',
        targetKey: _fabKey,
        title: 'Botón de Acción',
        description: 'Este botón flotante te permite crear nuevo contenido fácilmente.',
        position: DSTourPosition.top,
        alignment: DSTourAlignment.center,
      ),
    ];

    _customTourSteps = [
      DSTourStep(
        id: 'custom_1',
        targetKey: _profileKey,
        title: 'Perfil de Usuario',
        description: 'Gestiona tu perfil y configuración personal desde aquí.',
        position: DSTourPosition.auto,
        targetRadius: 16.0,
      ),
      DSTourStep(
        id: 'custom_2',
        targetKey: _settingsKey,
        title: 'Configuración',
        description: 'Accede a todas las opciones de configuración de la aplicación.',
        position: DSTourPosition.left,
        targetPadding: const EdgeInsets.all(12.0),
      ),
    ];

    _rtlTourSteps = [
      DSTourStep(
        id: 'rtl_1',
        targetKey: _menuKey,
        title: 'القائمة الجانبية',
        description: 'اضغط هنا للوصول إلى القائمة الجانبية مع جميع خيارات التنقل.',
        position: DSTourPosition.bottom,
      ),
      DSTourStep(
        id: 'rtl_2',
        targetKey: _searchKey,
        title: 'البحث',
        description: 'استخدم هذه الميزة للعثور على المحتوى المحدد بسرعة.',
        position: DSTourPosition.bottom,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: _appBarKey,
        title: const Text('DSTour Stories'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          key: _drawerKey,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            key: _searchKey,
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            key: _menuKey,
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStorySection(
                  'Tour Básico',
                  'Tour simple con coachmarks y múltiples pasos',
                  [
                    _buildDemoCard(
                      'Tour de Introducción',
                      'Un tour básico que muestra las funcionalidades principales',
                      Icons.tour,
                      () => _startBasicTour(),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                _buildStorySection(
                  'Tour Personalizado',
                  'Tour con estilos y configuración personalizada',
                  [
                    _buildDemoCard(
                      'Tour con Estilo Custom',
                      'Tour con colores personalizados y configuración avanzada',
                      Icons.palette,
                      () => _startCustomTour(),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                _buildStorySection(
                  'Tour RTL',
                  'Tour optimizado para idiomas de derecha a izquierda',
                  [
                    _buildDemoCard(
                      'Tour en Árabe',
                      'Demostración del tour con soporte RTL completo',
                      Icons.language,
                      () => _startRtlTour(),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                _buildStorySection(
                  'Elementos de Destino',
                  'Elementos que sirven como targets para el tour',
                  [
                    _buildTargetCard('Perfil', Icons.person, _profileKey),
                    const SizedBox(height: 16),
                    _buildTargetCard('Configuración', Icons.settings, _settingsKey),
                  ],
                ),
                const SizedBox(height: 100), // Space for FAB
              ],
            ),
          ),

          // Tours
          if (_isTourActive)
            DSTour(
              config: const DSTourConfig(
                variant: DSTourVariant.coachmarks,
                enableSkip: true,
                enableKeyboardNavigation: true,
                showProgress: true,
              ),
              steps: _basicTourSteps,
              onFinish: () => setState(() => _isTourActive = false),
              onSkip: () => setState(() => _isTourActive = false),
            ),

          if (_isCustomTourActive)
            DSTour(
              config: const DSTourConfig(
                variant: DSTourVariant.coachmarks,
                enableSkip: true,
                enableKeyboardNavigation: true,
                showProgress: true,
                colors: DSTourColors(
                  backgroundColor: Color(0xFF2E3440),
                  overlayColor: Color(0xAA000000),
                  textColor: Color(0xFFECEFF4),
                  titleColor: Color(0xFFD8DEE9),
                  buttonColor: Color(0xFF5E81AC),
                  buttonTextColor: Color(0xFFECEFF4),
                  progressColor: Color(0xFF88C0D0),
                  targetHighlightColor: Color(0xFF81A1C1),
                  targetBorderColor: Color(0xFF5E81AC),
                ),
                spacing: DSTourSpacing(
                  borderRadius: 12.0,
                  elevation: 12.0,
                  targetPadding: 16.0,
                ),
              ),
              steps: _customTourSteps,
              onFinish: () => setState(() => _isCustomTourActive = false),
              onSkip: () => setState(() => _isCustomTourActive = false),
            ),

          if (_isRtlTourActive)
            Directionality(
              textDirection: TextDirection.rtl,
              child: DSTour(
                config: const DSTourConfig(
                  variant: DSTourVariant.coachmarks,
                  enableSkip: true,
                  enableKeyboardNavigation: true,
                  showProgress: true,
                  isRtl: true,
                  controls: DSTourControls(
                    skipButtonText: 'تخطي',
                    nextButtonText: 'التالي',
                    previousButtonText: 'السابق',
                    finishButtonText: 'إنهاء',
                  ),
                ),
                steps: _rtlTourSteps,
                onFinish: () => setState(() => _isRtlTourActive = false),
                onSkip: () => setState(() => _isRtlTourActive = false),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: _fabKey,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStorySection(String title, String description, List<Widget> demos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),
        ...demos,
      ],
    );
  }

  Widget _buildDemoCard(
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.play_arrow, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTargetCard(String title, IconData icon, GlobalKey key) {
    return Card(
      key: key,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }

  void _startBasicTour() {
    setState(() {
      _isTourActive = true;
    });
  }

  void _startCustomTour() {
    setState(() {
      _isCustomTourActive = true;
    });
  }

  void _startRtlTour() {
    setState(() {
      _isRtlTourActive = true;
    });
  }
}

/// Example of how to use DSTour in a real application
class TourStoryExample extends StatelessWidget {
  const TourStoryExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const TourStoryPage();
  }
}