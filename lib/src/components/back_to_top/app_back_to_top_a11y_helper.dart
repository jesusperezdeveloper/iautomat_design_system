import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

import 'app_back_to_top_config.dart';

class DSBackToTopA11yHelper {
  static DSBackToTopA11yHelper? _instance;

  DSBackToTopA11yHelper._();

  factory DSBackToTopA11yHelper() {
    return _instance ??= DSBackToTopA11yHelper._();
  }

  String getButtonLabel(DSBackToTopConfig config) {
    final accessibility = config.accessibility!;

    if (accessibility.customLabel != null) {
      return accessibility.customLabel!;
    }

    switch (config.state) {
      case DSBackToTopState.loading:
        return accessibility.loadingLabel;
      case DSBackToTopState.disabled:
        return accessibility.disabledLabel;
      default:
        return accessibility.label;
    }
  }

  String getButtonHint(DSBackToTopConfig config) {
    final accessibility = config.accessibility!;

    if (accessibility.customHint != null) {
      return accessibility.customHint!;
    }

    switch (config.state) {
      case DSBackToTopState.loading:
        return 'Desplazándose al inicio de la página';
      case DSBackToTopState.disabled:
        return 'El botón no está disponible en este momento';
      default:
        return accessibility.hint;
    }
  }

  void announceButtonVisible() {
    SemanticsService.announce(
      'Botón para volver al inicio disponible',
      TextDirection.ltr,
    );
  }

  void announceButtonHidden() {
    SemanticsService.announce(
      'Botón para volver al inicio ocultado',
      TextDirection.ltr,
    );
  }

  void announceScrollStart() {
    SemanticsService.announce(
      'Desplazándose al inicio de la página',
      TextDirection.ltr,
    );
  }

  void announceScrollComplete() {
    SemanticsService.announce(
      'Página desplazada al inicio',
      TextDirection.ltr,
    );
  }

  void announceScrollError(String error) {
    SemanticsService.announce(
      'Error al desplazarse: $error',
      TextDirection.ltr,
    );
  }

  void announceStateChange(DSBackToTopState state) {
    String message;

    switch (state) {
      case DSBackToTopState.loading:
        message = 'Desplazándose';
        break;
      case DSBackToTopState.disabled:
        message = 'Botón no disponible';
        break;
      case DSBackToTopState.hover:
        message = 'Botón resaltado';
        break;
      case DSBackToTopState.focus:
        message = 'Botón enfocado';
        break;
      case DSBackToTopState.selected:
        message = 'Botón seleccionado';
        break;
      case DSBackToTopState.pressed:
        message = 'Botón presionado';
        break;
      default:
        return; // No announcement needed for default state
    }

    SemanticsService.announce(message, TextDirection.ltr);
  }

  void announcePositionChange(DSBackToTopPosition position) {
    String positionName;

    switch (position) {
      case DSBackToTopPosition.bottomRight:
        positionName = 'inferior derecha';
        break;
      case DSBackToTopPosition.bottomLeft:
        positionName = 'inferior izquierda';
        break;
      case DSBackToTopPosition.bottomCenter:
        positionName = 'inferior centro';
        break;
      case DSBackToTopPosition.topRight:
        positionName = 'superior derecha';
        break;
      case DSBackToTopPosition.topLeft:
        positionName = 'superior izquierda';
        break;
      case DSBackToTopPosition.topCenter:
        positionName = 'superior centro';
        break;
      case DSBackToTopPosition.centerRight:
        positionName = 'centro derecha';
        break;
      case DSBackToTopPosition.centerLeft:
        positionName = 'centro izquierda';
        break;
    }

    SemanticsService.announce(
      'Botón reposicionado en $positionName',
      TextDirection.ltr,
    );
  }

  void announceScrollProgress(double progress) {
    if (progress <= 0.0) return;

    final percentage = (progress * 100).round();
    if (percentage % 25 == 0) { // Announce at 25%, 50%, 75%, 100%
      SemanticsService.announce(
        'Desplazamiento $percentage% completado',
        TextDirection.ltr,
      );
    }
  }

  void announceKeyboardShortcuts() {
    const message = 'Usa la tecla Inicio para ir al principio de la página. '
        'Presiona Enter o Espacio para activar el botón. '
        'Usa Tab para navegar entre elementos.';

    SemanticsService.announce(message, TextDirection.ltr);
  }

  SemanticsProperties getButtonSemantics(
    DSBackToTopConfig config,
    VoidCallback? onPressed,
  ) {
    final accessibility = config.accessibility!;

    return SemanticsProperties(
      button: true,
      enabled: config.state != DSBackToTopState.disabled,
      focusable: accessibility.focusable,
      label: getButtonLabel(config),
      hint: getButtonHint(config),
      onTap: onPressed,
    );
  }

  Widget wrapWithSemantics(
    Widget child,
    DSBackToTopConfig config,
    VoidCallback? onPressed,
  ) {
    if (!config.accessibility!.enabled) {
      return child;
    }

    final semantics = getButtonSemantics(config, onPressed);

    return Semantics.fromProperties(
      properties: semantics,
      child: child,
    );
  }

  void handleKeyboardNavigation(
    LogicalKeyboardKey key,
    VoidCallback? onActivate,
    VoidCallback? onCancel,
  ) {
    switch (key) {
      case LogicalKeyboardKey.enter:
      case LogicalKeyboardKey.space:
        onActivate?.call();
        break;

      case LogicalKeyboardKey.escape:
        onCancel?.call();
        break;

      case LogicalKeyboardKey.home:
        // Home key is a natural shortcut for "go to top"
        onActivate?.call();
        break;
    }
  }

  FocusNode createFocusNode(String label) {
    return FocusNode(
      debugLabel: 'DSBackToTop_$label',
      canRequestFocus: true,
    );
  }

  void requestFocus(FocusNode focusNode) {
    if (focusNode.canRequestFocus) {
      focusNode.requestFocus();
    }
  }

  bool isAccessibilityFeatureEnabled(AccessibilityFeatures features) {
    return features.accessibleNavigation ||
           features.boldText ||
           features.highContrast ||
           features.invertColors ||
           features.reduceMotion;
  }

  double getScaledSize(double baseSize, BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return baseSize * mediaQuery.textScaler.scale(baseSize);
  }

  Duration getReducedMotionDuration(Duration originalDuration) {
    return Duration(
      milliseconds: (originalDuration.inMilliseconds * 0.3).round(),
    );
  }

  Color getHighContrastColor(Color originalColor, BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    if (mediaQuery.accessibleNavigation) {
      // En modo de alto contraste, usar colores más prominentes
      final theme = Theme.of(context);
      final isDark = theme.brightness == Brightness.dark;

      return isDark ? Colors.white : Colors.black;
    }

    return originalColor;
  }

  bool shouldUseReducedMotion(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.disableAnimations;
  }

  void announceVisibilityChange(bool visible, double scrollPosition) {
    if (visible) {
      SemanticsService.announce(
        'Botón volver al inicio ahora visible. Posición de desplazamiento: ${scrollPosition.round()} píxeles',
        TextDirection.ltr,
      );
    } else {
      SemanticsService.announce(
        'Botón volver al inicio ocultado',
        TextDirection.ltr,
      );
    }
  }

  void announceAutoHide(Duration delay) {
    SemanticsService.announce(
      'El botón se ocultará automáticamente en ${delay.inSeconds} segundos',
      TextDirection.ltr,
    );
  }

  void announceScrollBehaviorChange(DSBackToTopScrollBehavior behavior) {
    String behaviorName;

    switch (behavior) {
      case DSBackToTopScrollBehavior.smooth:
        behaviorName = 'suave';
        break;
      case DSBackToTopScrollBehavior.instant:
        behaviorName = 'instantáneo';
        break;
      case DSBackToTopScrollBehavior.easeIn:
        behaviorName = 'aceleración gradual';
        break;
      case DSBackToTopScrollBehavior.easeOut:
        behaviorName = 'desaceleración gradual';
        break;
      case DSBackToTopScrollBehavior.easeInOut:
        behaviorName = 'aceleración y desaceleración';
        break;
    }

    SemanticsService.announce(
      'Comportamiento de desplazamiento cambiado a $behaviorName',
      TextDirection.ltr,
    );
  }

  EdgeInsets getAccessibilityPadding(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final scaleFactor = mediaQuery.textScaler.scale(1.0);

    // Aumentar el padding para usuarios con texto grande
    if (scaleFactor > 1.5) {
      return const EdgeInsets.all(20.0);
    } else if (scaleFactor > 1.2) {
      return const EdgeInsets.all(16.0);
    }

    return const EdgeInsets.all(12.0);
  }

  double getAccessibilityMinimumSize(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    // Asegurar que el botón sea lo suficientemente grande para tocar
    if (mediaQuery.accessibleNavigation) {
      return 48.0; // Material Design minimum touch target
    }

    return 44.0; // iOS minimum touch target
  }

  Color getContrastColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  bool meetsContrastRatio(
    Color foreground,
    Color background, {
    double ratio = 4.5,
  }) {
    final foregroundLuminance = foreground.computeLuminance() + 0.05;
    final backgroundLuminance = background.computeLuminance() + 0.05;

    final contrast = foregroundLuminance > backgroundLuminance
        ? foregroundLuminance / backgroundLuminance
        : backgroundLuminance / foregroundLuminance;

    return contrast >= ratio;
  }

  DSBackToTopConfig adjustForAccessibility(
    DSBackToTopConfig config,
    BuildContext context,
  ) {
    final mediaQuery = MediaQuery.of(context);
    final scaleFactor = mediaQuery.textScaler.scale(1.0);

    // Ajustar el tamaño para texto grande
    var adjustedSpacing = config.spacing;
    if (scaleFactor > 1.0) {
      adjustedSpacing = adjustedSpacing?.copyWith(
        size: getScaledSize(adjustedSpacing.size, context),
        iconSize: getScaledSize(adjustedSpacing.iconSize, context),
        margin: getAccessibilityPadding(context),
      );
    }

    // Desactivar animaciones si el usuario prefiere movimiento reducido
    var adjustedAnimations = config.animations;
    if (shouldUseReducedMotion(context)) {
      adjustedAnimations = adjustedAnimations?.copyWith(
        enabled: false,
        fadeEnabled: false,
        scaleEnabled: false,
        duration: getReducedMotionDuration(adjustedAnimations.duration),
        scrollDuration: getReducedMotionDuration(adjustedAnimations.scrollDuration),
      );
    }

    // Ajustar colores para alto contraste
    var adjustedColors = config.colors;
    if (mediaQuery.accessibleNavigation) {
      adjustedColors = adjustedColors?.copyWith(
        opacity: 1.0,
      );
    }

    return config.copyWith(
      spacing: adjustedSpacing,
      animations: adjustedAnimations,
      colors: adjustedColors,
    );
  }

  void dispose(FocusNode? focusNode) {
    focusNode?.dispose();
  }

  void announceTooltipAvailable(String tooltip) {
    SemanticsService.announce(
      'Información adicional disponible: $tooltip',
      TextDirection.ltr,
    );
  }

  void announceGestureInstructions() {
    const message = 'Para volver al inicio: toca el botón, usa la tecla Inicio, '
        'o desliza hacia arriba y mantén presionado.';

    SemanticsService.announce(message, TextDirection.ltr);
  }
}