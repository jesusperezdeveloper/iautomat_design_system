import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_auth_screens_config.dart';

/// Adaptador para comportamiento específico de plataforma en AppAuthScreens
///
/// Maneja diferencias entre Android, iOS y Web para optimizar UX
class AppAuthScreensPlatformAdapter {
  final AppAuthScreensConfig config;
  final BuildContext context;

  AppAuthScreensPlatformAdapter({
    required this.config,
    required this.context,
  });

  /// Configura el manejo del teclado según la plataforma
  void setupKeyboardHandling() {
    final behavior = config.behavior ?? const AppAuthBehavior();

    switch (behavior.keyboardBehavior) {
      case AppAuthKeyboardBehavior.adaptive:
        _setupAdaptiveKeyboard();
        break;
      case AppAuthKeyboardBehavior.alwaysVisible:
        _setupAlwaysVisibleKeyboard();
        break;
      case AppAuthKeyboardBehavior.dismissOnScroll:
        _setupDismissOnScrollKeyboard();
        break;
      case AppAuthKeyboardBehavior.dismissOnTap:
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
    // Esto puede requerir workarounds específicos de plataforma
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
    // Manejar navegación por teclado, shortcuts, etc.
  }

  void _setupAndroidKeyboard() {
    // Configuración específica para Android
    // Manejar soft keyboard, navigation bar, etc.
    _configureAndroidSystemUI();
  }

  void _setupIOSKeyboard() {
    // Configuración específica para iOS
    // Manejar safe area, notch, home indicator, etc.
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
    final spacing = config.spacing ?? const AppAuthSpacing();

    EdgeInsets basePadding = spacing.screenPadding;

    if (isIOS) {
      // En iOS, considerar notch y home indicator
      basePadding = basePadding.copyWith(
        top: basePadding.top + mediaQuery.padding.top,
        bottom: basePadding.bottom + mediaQuery.padding.bottom,
      );
    }

    if (isAndroid) {
      // En Android, considerar navigation bar
      basePadding = basePadding.copyWith(
        bottom: basePadding.bottom + mediaQuery.padding.bottom,
      );
    }

    return basePadding;
  }

  /// Obtiene el tipo de input decoration según la plataforma
  InputDecorationTheme getInputDecorationTheme() {
    final colors = config.colors ?? const AppAuthColors();
    final spacing = config.spacing ?? const AppAuthSpacing();

    if (isIOS) {
      return InputDecorationTheme(
        filled: true,
        fillColor: colors.fieldBackgroundColor ?? Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          borderSide: BorderSide(
            color: colors.fieldBorderColor ?? Colors.grey[300]!,
            width: spacing.borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          borderSide: BorderSide(
            color: colors.fieldFocusedBorderColor ?? Colors.blue,
            width: spacing.focusedBorderWidth,
          ),
        ),
        contentPadding: spacing.fieldPadding,
      );
    }

    if (isAndroid) {
      return InputDecorationTheme(
        filled: true,
        fillColor: colors.fieldBackgroundColor ?? Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          borderSide: BorderSide(
            color: colors.fieldBorderColor ?? Colors.grey[400]!,
            width: spacing.borderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
          borderSide: BorderSide(
            color: colors.fieldFocusedBorderColor ?? Colors.blue,
            width: spacing.focusedBorderWidth,
          ),
        ),
        contentPadding: spacing.fieldPadding,
      );
    }

    // Web/Desktop default
    return InputDecorationTheme(
      filled: true,
      fillColor: colors.fieldBackgroundColor ?? Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
        borderSide: BorderSide(
          color: colors.fieldBorderColor ?? Colors.grey,
          width: spacing.borderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacing.fieldBorderRadius),
        borderSide: BorderSide(
          color: colors.fieldFocusedBorderColor ?? Colors.blue,
          width: spacing.focusedBorderWidth,
        ),
      ),
      contentPadding: spacing.fieldPadding,
    );
  }

  /// Obtiene el estilo de botón según la plataforma
  ButtonStyle getPrimaryButtonStyle() {
    final colors = config.colors ?? const AppAuthColors();
    final spacing = config.spacing ?? const AppAuthSpacing();

    if (isIOS) {
      return ElevatedButton.styleFrom(
        backgroundColor: colors.buttonPrimaryBackgroundColor ?? Colors.blue,
        foregroundColor: colors.buttonPrimaryTextColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacing.buttonBorderRadius),
        ),
        padding: spacing.buttonPadding,
        minimumSize: Size(double.infinity, spacing.buttonMinHeight),
        elevation: 0,
      );
    }

    if (isAndroid) {
      return ElevatedButton.styleFrom(
        backgroundColor: colors.buttonPrimaryBackgroundColor ?? Colors.blue,
        foregroundColor: colors.buttonPrimaryTextColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacing.buttonBorderRadius),
        ),
        padding: spacing.buttonPadding,
        minimumSize: Size(double.infinity, spacing.buttonMinHeight),
        elevation: spacing.elevation,
      );
    }

    // Web/Desktop
    return ElevatedButton.styleFrom(
      backgroundColor: colors.buttonPrimaryBackgroundColor ?? Colors.blue,
      foregroundColor: colors.buttonPrimaryTextColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacing.buttonBorderRadius),
      ),
      padding: spacing.buttonPadding,
      minimumSize: Size(double.infinity, spacing.buttonMinHeight),
      elevation: spacing.elevation,
    );
  }

  /// Obtiene el comportamiento de scroll según la plataforma
  ScrollPhysics getScrollPhysics() {
    if (isIOS) {
      return const BouncingScrollPhysics();
    }

    if (isAndroid) {
      return const ClampingScrollPhysics();
    }

    // Web/Desktop
    return const ClampingScrollPhysics();
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
    final animation = config.animation ?? const AppAuthAnimation();

    if (isIOS) {
      // iOS prefiere animaciones más fluidas y lentas
      return Duration(
        milliseconds: (animation.duration.inMilliseconds * 1.2).round(),
      );
    }

    if (isAndroid) {
      // Android prefiere animaciones más rápidas
      return Duration(
        milliseconds: (animation.duration.inMilliseconds * 0.8).round(),
      );
    }

    // Web/Desktop - duración estándar
    return animation.duration;
  }

  /// Obtiene la curva de animación optimizada para la plataforma
  Curve getOptimizedAnimationCurve() {
    final animation = config.animation ?? const AppAuthAnimation();

    if (isIOS) {
      // iOS usa curvas más suaves
      return Curves.easeInOutCubic;
    }

    if (isAndroid) {
      // Android usa Material motion
      return Curves.easeInOut;
    }

    // Web/Desktop
    return animation.curve;
  }

  /// Configurar autofill según la plataforma
  void configureAutofill() {
    final behavior = config.behavior ?? const AppAuthBehavior();
    if (!behavior.enableAutofill) return;

    if (isAndroid || isIOS) {
      // Configurar autofill service hints
      // Esto se maneja principalmente a nivel de campo individual
    }
  }

  /// Liberar recursos específicos de plataforma
  void dispose() {
    // Limpiar configuraciones específicas de plataforma
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

  /// Verifica si la plataforma soporta biometría
  bool get supportsBiometrics => isMobile;

  /// Verifica si la plataforma soporta autofill
  bool get supportsAutofill => isMobile || isWeb;

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