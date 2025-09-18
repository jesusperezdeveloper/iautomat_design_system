import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_profile_preferences_config.dart';

/// Adaptador para comportamiento específico de plataforma en AppProfilePreferences
///
/// Maneja diferencias entre Android, iOS y Web para optimizar UX
class AppProfilePreferencesPlatformAdapter {
  final AppProfilePreferencesConfig config;
  final BuildContext context;

  AppProfilePreferencesPlatformAdapter({
    required this.config,
    required this.context,
  });

  /// Configura el manejo del teclado según la plataforma
  void setupKeyboardHandling() {
    final behavior = config.behavior ?? const AppProfileBehavior();

    switch (behavior.keyboardBehavior) {
      case AppProfileKeyboardBehavior.adaptive:
        _setupAdaptiveKeyboard();
        break;
      case AppProfileKeyboardBehavior.alwaysVisible:
        _setupAlwaysVisibleKeyboard();
        break;
      case AppProfileKeyboardBehavior.dismissOnScroll:
        _setupDismissOnScrollKeyboard();
        break;
      case AppProfileKeyboardBehavior.dismissOnTap:
        _setupDismissOnTapKeyboard();
        break;
    }
  }

  void _setupAdaptiveKeyboard() {
    if (isDesktop) {
      // En desktop, el teclado siempre está disponible
      return;
    }

    if (isWeb) {
      _setupWebKeyboard();
    } else if (isAndroid) {
      _setupAndroidKeyboard();
    } else if (isIOS) {
      _setupIOSKeyboard();
    }
  }

  void _setupAlwaysVisibleKeyboard() {
    // Implementar lógica para mantener teclado siempre visible
  }

  void _setupDismissOnScrollKeyboard() {
    // Configurar dismissal del teclado al hacer scroll
    if (isMobile) {
      // En móvil, configurar GestureDetector para detectar scroll
    }
  }

  void _setupDismissOnTapKeyboard() {
    // Configurar dismissal del teclado al tocar fuera de campos
    if (isMobile) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }

  void _setupWebKeyboard() {
    // Configuración específica para web
  }

  void _setupAndroidKeyboard() {
    // Configuración específica para Android
    _configureAndroidSystemUI();
  }

  void _setupIOSKeyboard() {
    // Configuración específica para iOS
    _configureIOSSystemUI();
  }

  void _configureAndroidSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  void _configureIOSSystemUI() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  /// Obtiene el padding seguro según la plataforma
  EdgeInsets getSafePadding() {
    final mediaQuery = MediaQuery.of(context);
    final spacing = config.spacing ?? const AppProfileSpacing();

    EdgeInsets basePadding = spacing.screenPadding;

    if (isIOS) {
      basePadding = basePadding.copyWith(
        top: basePadding.top + mediaQuery.padding.top,
        bottom: basePadding.bottom + mediaQuery.padding.bottom,
      );
    }

    if (isAndroid) {
      basePadding = basePadding.copyWith(
        bottom: basePadding.bottom + mediaQuery.padding.bottom,
      );
    }

    return basePadding;
  }

  /// Obtiene el comportamiento de scroll según la plataforma
  ScrollPhysics getScrollPhysics() {
    final behavior = config.behavior ?? const AppProfileBehavior();

    switch (behavior.scrollBehavior) {
      case AppProfileScrollBehavior.adaptive:
        if (isIOS) {
          return const BouncingScrollPhysics();
        } else {
          return const ClampingScrollPhysics();
        }
      case AppProfileScrollBehavior.smooth:
        return const BouncingScrollPhysics();
      case AppProfileScrollBehavior.clamping:
        return const ClampingScrollPhysics();
    }
  }

  /// Configura haptic feedback según la plataforma
  void triggerHapticFeedback(HapticFeedbackType type) {
    if (!isMobile) return;

    switch (type) {
      case HapticFeedbackType.light:
        HapticFeedback.lightImpact();
        break;
      case HapticFeedbackType.medium:
        HapticFeedback.mediumImpact();
        break;
      case HapticFeedbackType.heavy:
        HapticFeedback.heavyImpact();
        break;
      case HapticFeedbackType.success:
        if (isIOS) {
          HapticFeedback.lightImpact();
        } else {
          HapticFeedback.vibrate();
        }
        break;
      case HapticFeedbackType.error:
        if (isIOS) {
          HapticFeedback.heavyImpact();
        } else {
          HapticFeedback.vibrate();
        }
        break;
      case HapticFeedbackType.selection:
        HapticFeedback.selectionClick();
        break;
    }
  }

  /// Obtiene la duración de animación optimizada para la plataforma
  Duration getOptimizedAnimationDuration() {
    final animation = config.animation ?? const AppProfileAnimation();

    if (isIOS) {
      return Duration(
        milliseconds: (animation.duration.inMilliseconds * 1.2).round(),
      );
    }

    if (isAndroid) {
      return Duration(
        milliseconds: (animation.duration.inMilliseconds * 0.8).round(),
      );
    }

    return animation.duration;
  }

  /// Obtiene la curva de animación optimizada para la plataforma
  Curve getOptimizedAnimationCurve() {
    final animation = config.animation ?? const AppProfileAnimation();

    if (isIOS) {
      return Curves.easeInOutCubic;
    }

    if (isAndroid) {
      return Curves.easeInOut;
    }

    return animation.curve;
  }

  /// Liberar recursos específicos de plataforma
  void dispose() {
    if (isAndroid) {
      // Restaurar system UI si es necesario
    }

    if (isIOS) {
      // Limpiar configuraciones de iOS
    }
  }

  // Getters para detección de plataforma

  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isWeb => kIsWeb;
  bool get isMobile => isAndroid || isIOS;
  bool get isDesktop => !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

  /// Verifica si la plataforma soporta haptic feedback
  bool get supportsHaptics => isMobile;
}

/// Tipos de haptic feedback disponibles
enum HapticFeedbackType {
  light,
  medium,
  heavy,
  success,
  error,
  selection,
}