/// Configuración de la aplicación para diferentes entornos
class AppConfig {
  /// Detecta si la app está en modo producción
  static const bool isProduction = bool.fromEnvironment('dart.vm.product');

  /// Nombre de la aplicación
  static const String appName = 'IAutomat Design System';

  /// Versión actual del Design System
  static const String version = '1.0.0';

  /// Build number
  static const String buildNumber = '1';

  /// URL de producción
  static const String productionUrl = 'https://iautomatdesignsystem.web.app';

  /// Habilitar analytics solo en producción
  static const bool enableAnalytics = isProduction;

  /// Mostrar overlay de performance solo en desarrollo
  static const bool showPerformanceOverlay = !isProduction;

  /// Habilitar logs de debug
  static const bool enableDebugLogs = !isProduction;

  /// Timeouts de red
  static const Duration networkTimeout = Duration(seconds: 30);

  /// Cache duration
  static const Duration cacheExpiration = Duration(hours: 1);

  /// Configuración de temas
  static const int maxRecentThemes = 5;
  static const int maxFavoriteThemes = 20;

  /// Feature flags
  static const bool enableExperimentalFeatures = !isProduction;
  static const bool enableBetaThemes = true;
  static const bool enableCustomThemeCreator = false; // Coming soon

  /// Enlaces externos
  static const String githubRepo = 'https://github.com/iautomat/iautomat_design_system';
  static const String documentationUrl = 'https://iautomatdesignsystem.web.app/docs';
  static const String issuesUrl = 'https://github.com/iautomat/iautomat_design_system/issues';

  /// Información de la empresa
  static const String companyName = 'IAutomat';
  static const String companyUrl = 'https://iautomat.com';
  static const String supportEmail = 'support@iautomat.com';

  /// SEO y metadata
  static const String appDescription =
      'Professional Flutter Design System with 100+ themes and 70+ components. '
      'Built with Material 3 for modern, accessible, and beautiful applications.';

  static const List<String> keywords = [
    'flutter',
    'design system',
    'ui components',
    'material design',
    'themes',
    'iautomat',
    'flutter package',
    'dart',
  ];

  /// Obtener configuración según el entorno
  static String get environmentName {
    if (isProduction) return 'Production';
    return 'Development';
  }

  /// Log helper
  static void log(String message) {
    if (enableDebugLogs) {
      // ignore: avoid_print
      print('[${DateTime.now().toIso8601String()}] $message');
    }
  }
}