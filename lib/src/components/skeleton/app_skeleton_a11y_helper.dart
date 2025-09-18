import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

import 'app_skeleton_config.dart';

class AppSkeletonA11yHelper {
  static AppSkeletonA11yHelper? _instance;

  AppSkeletonA11yHelper._();

  factory AppSkeletonA11yHelper() {
    return _instance ??= AppSkeletonA11yHelper._();
  }

  String getSkeletonLabel(AppSkeletonConfig config) {
    final accessibility = config.accessibility!;

    if (accessibility.customLabel != null) {
      return accessibility.customLabel!;
    }

    switch (config.state) {
      case AppSkeletonState.loading:
      case AppSkeletonState.skeleton:
        return accessibility.loadingLabel;
      case AppSkeletonState.disabled:
        return accessibility.disabledLabel;
      default:
        return accessibility.loadingLabel;
    }
  }

  String getSkeletonHint(AppSkeletonConfig config) {
    final accessibility = config.accessibility!;

    if (accessibility.hint != null) {
      return accessibility.hint!;
    }

    switch (config.state) {
      case AppSkeletonState.loading:
      case AppSkeletonState.skeleton:
        return 'El contenido se está cargando, por favor espere';
      case AppSkeletonState.disabled:
        return 'El contenido no está disponible en este momento';
      default:
        return 'Elemento de carga';
    }
  }

  String getShapeDescription(AppSkeletonShape shape) {
    switch (shape) {
      case AppSkeletonShape.circle:
        return 'Elemento circular';
      case AppSkeletonShape.avatar:
        return 'Avatar o imagen de perfil';
      case AppSkeletonShape.button:
        return 'Botón';
      case AppSkeletonShape.card:
        return 'Tarjeta de contenido';
      case AppSkeletonShape.text:
        return 'Texto';
      case AppSkeletonShape.line:
        return 'Línea separadora';
      case AppSkeletonShape.roundedRectangle:
        return 'Elemento rectangular con bordes redondeados';
      case AppSkeletonShape.rectangle:
        return 'Elemento rectangular';
    }
  }

  void announceLoadingStart() {
    SemanticsService.announce(
      'Comenzando a cargar contenido',
      TextDirection.ltr,
    );
  }

  void announceLoadingComplete() {
    SemanticsService.announce(
      'Contenido cargado completamente',
      TextDirection.ltr,
    );
  }

  void announceLoadingError(String? error) {
    final message = error != null
        ? 'Error al cargar contenido: $error'
        : 'Error al cargar contenido';

    SemanticsService.announce(message, TextDirection.ltr);
  }

  void announceStateChange(AppSkeletonState state) {
    String message;

    switch (state) {
      case AppSkeletonState.loading:
      case AppSkeletonState.skeleton:
        message = 'Cargando';
        break;
      case AppSkeletonState.disabled:
        message = 'No disponible';
        break;
      case AppSkeletonState.hover:
        message = 'Elemento resaltado';
        break;
      case AppSkeletonState.focus:
        message = 'Elemento enfocado';
        break;
      case AppSkeletonState.selected:
        message = 'Elemento seleccionado';
        break;
      case AppSkeletonState.pressed:
        message = 'Elemento presionado';
        break;
      default:
        return; // No announcement needed for default state
    }

    SemanticsService.announce(message, TextDirection.ltr);
  }

  void announceContentUpdate(String contentType) {
    SemanticsService.announce('$contentType actualizado', TextDirection.ltr);
  }

  void announceSkeletonGroup(int itemCount, String contentType) {
    final message = itemCount == 1
        ? 'Cargando 1 elemento de $contentType'
        : 'Cargando $itemCount elementos de $contentType';

    SemanticsService.announce(message, TextDirection.ltr);
  }

  SemanticsProperties getSkeletonSemantics(
    AppSkeletonConfig config,
    AppSkeletonShape shape,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
  ) {
    final accessibility = config.accessibility!;

    return SemanticsProperties(
      enabled: config.state != AppSkeletonState.disabled,
      focusable: accessibility.focusable,
      label: '${getShapeDescription(shape)} - ${getSkeletonLabel(config)}',
      hint: getSkeletonHint(config),
      onTap: onTap,
      onLongPress: onLongPress,
      liveRegion:
          config.state == AppSkeletonState.loading ||
          config.state == AppSkeletonState.skeleton,
    );
  }

  Widget wrapWithSemantics(
    Widget child,
    AppSkeletonConfig config,
    AppSkeletonShape shape,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
  ) {
    if (!config.accessibility!.enabled) {
      return child;
    }

    final semantics = getSkeletonSemantics(config, shape, onTap, onLongPress);

    return Semantics.fromProperties(properties: semantics, child: child);
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
    }
  }

  FocusNode createFocusNode(String label) {
    return FocusNode(debugLabel: 'AppSkeleton_$label', canRequestFocus: true);
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

  void announceProgressUpdate(
    int currentItem,
    int totalItems,
    String contentType,
  ) {
    if (totalItems <= 1) return;

    final percentage = ((currentItem / totalItems) * 100).round();
    SemanticsService.announce(
      'Cargando $contentType: $percentage% completado',
      TextDirection.ltr,
    );
  }

  void announceSkeletonTimeout() {
    SemanticsService.announce(
      'La carga está tomando más tiempo del esperado',
      TextDirection.ltr,
    );
  }

  Widget wrapWithLiveRegion(
    Widget child,
    AppSkeletonConfig config,
    String contentDescription,
  ) {
    if (!config.accessibility!.enabled) {
      return child;
    }

    if (config.state == AppSkeletonState.loading ||
        config.state == AppSkeletonState.skeleton) {
      return Semantics(liveRegion: true, child: child);
    }

    return child;
  }

  void announceSkeletonBatch(List<AppSkeletonShape> shapes) {
    if (shapes.isEmpty) return;

    final shapeGroups = <AppSkeletonShape, int>{};
    for (final shape in shapes) {
      shapeGroups[shape] = (shapeGroups[shape] ?? 0) + 1;
    }

    final descriptions = shapeGroups.entries
        .map((entry) {
          final count = entry.value;
          final description = getShapeDescription(entry.key);
          return count == 1 ? '1 $description' : '$count ${description}s';
        })
        .join(', ');

    SemanticsService.announce('Cargando: $descriptions', TextDirection.ltr);
  }

  EdgeInsets getAccessibilityPadding(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final scaleFactor = mediaQuery.textScaler.scale(1.0);

    // Aumentar el padding para usuarios con texto grande
    if (scaleFactor > 1.5) {
      return const EdgeInsets.all(16.0);
    } else if (scaleFactor > 1.2) {
      return const EdgeInsets.all(12.0);
    }

    return const EdgeInsets.all(8.0);
  }

  double getAccessibilityMinimumSize(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    // Asegurar que los elementos sean lo suficientemente grandes para tocar
    if (mediaQuery.accessibleNavigation) {
      return 48.0; // Material Design minimum touch target
    }

    return 24.0;
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

  AppSkeletonConfig adjustForAccessibility(
    AppSkeletonConfig config,
    BuildContext context,
  ) {
    final mediaQuery = MediaQuery.of(context);
    final scaleFactor = mediaQuery.textScaler.scale(1.0);

    // Ajustar el spacing para texto grande
    var adjustedSpacing = config.spacing;
    if (scaleFactor > 1.0) {
      adjustedSpacing = adjustedSpacing?.copyWith(
        padding: getAccessibilityPadding(context),
        width: adjustedSpacing.width != null
            ? adjustedSpacing.width! * scaleFactor
            : null,
        height: adjustedSpacing.height != null
            ? adjustedSpacing.height! * scaleFactor
            : null,
      );
    }

    // Desactivar animaciones si el usuario prefiere movimiento reducido
    var adjustedAnimations = config.animations;
    if (shouldUseReducedMotion(context)) {
      adjustedAnimations = adjustedAnimations?.copyWith(
        enabled: false,
        shimmerEnabled: false,
        pulseEnabled: false,
      );
    }

    // Ajustar colores para alto contraste
    var adjustedColors = config.colors;
    if (mediaQuery.accessibleNavigation) {
      adjustedColors = adjustedColors?.copyWith(
        opacity: 1.0,
        shimmerOpacity: 0.8,
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
}
