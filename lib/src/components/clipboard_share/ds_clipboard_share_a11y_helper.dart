import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

import 'ds_clipboard_share_config.dart';

class DSClipboardShareA11yHelper {
  static DSClipboardShareA11yHelper? _instance;

  DSClipboardShareA11yHelper._();

  factory DSClipboardShareA11yHelper() {
    return _instance ??= DSClipboardShareA11yHelper._();
  }

  String getShareButtonLabel(DSClipboardShareConfig config) {
    final accessibility = config.accessibility!;

    if (config.state == DSClipboardShareState.disabled) {
      return accessibility.disabledLabel;
    }

    if (config.state == DSClipboardShareState.loading) {
      return accessibility.loadingLabel;
    }

    return accessibility.shareLabel;
  }

  String getShareButtonHint(DSClipboardShareConfig config) {
    final accessibility = config.accessibility!;

    if (config.state == DSClipboardShareState.disabled) {
      return accessibility.disabledLabel;
    }

    return accessibility.shareHint;
  }

  String getCopyButtonLabel(DSClipboardShareConfig config) {
    final accessibility = config.accessibility!;

    if (config.state == DSClipboardShareState.disabled) {
      return accessibility.disabledLabel;
    }

    if (config.state == DSClipboardShareState.loading) {
      return accessibility.loadingLabel;
    }

    return accessibility.copyLabel;
  }

  String getCopyButtonHint(DSClipboardShareConfig config) {
    final accessibility = config.accessibility!;

    if (config.state == DSClipboardShareState.disabled) {
      return accessibility.disabledLabel;
    }

    return accessibility.copyHint;
  }

  void announceShareSuccess() {
    SemanticsService.announce(
      'Contenido compartido exitosamente',
      TextDirection.ltr,
    );
  }

  void announceShareError(String error) {
    SemanticsService.announce('Error al compartir: $error', TextDirection.ltr);
  }

  void announceCopySuccess() {
    SemanticsService.announce(
      'Contenido copiado al portapapeles',
      TextDirection.ltr,
    );
  }

  void announceCopyError(String error) {
    SemanticsService.announce('Error al copiar: $error', TextDirection.ltr);
  }

  void announceStateChange(DSClipboardShareState state) {
    String message;

    switch (state) {
      case DSClipboardShareState.loading:
        message = 'Procesando';
        break;
      case DSClipboardShareState.disabled:
        message = 'No disponible';
        break;
      case DSClipboardShareState.selected:
        message = 'Seleccionado';
        break;
      case DSClipboardShareState.focus:
        message = 'Enfocado';
        break;
      default:
        return;
    }

    SemanticsService.announce(message, TextDirection.ltr);
  }

  void announceFileSelection(List<DSShareFile> files) {
    final count = files.length;
    final message = count == 1
        ? 'Un archivo seleccionado'
        : '$count archivos seleccionados';

    SemanticsService.announce(message, TextDirection.ltr);
  }

  void announceShareOption(String optionName) {
    SemanticsService.announce('Compartir vía $optionName', TextDirection.ltr);
  }

  void announceNavigationHint() {
    const message =
        'Usa las flechas para navegar entre opciones. '
        'Presiona Enter para compartir. '
        'Presiona Escape para cancelar.';

    SemanticsService.announce(message, TextDirection.ltr);
  }

  SemanticsProperties getShareButtonSemantics(
    DSClipboardShareConfig config,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
  ) {
    final accessibility = config.accessibility!;

    return SemanticsProperties(
      button: accessibility.focusable,
      enabled: config.state != DSClipboardShareState.disabled,
      label: getShareButtonLabel(config),
      hint: getShareButtonHint(config),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }

  SemanticsProperties getCopyButtonSemantics(
    DSClipboardShareConfig config,
    VoidCallback? onTap,
  ) {
    final accessibility = config.accessibility!;

    return SemanticsProperties(
      button: accessibility.focusable,
      enabled: config.state != DSClipboardShareState.disabled,
      label: getCopyButtonLabel(config),
      hint: getCopyButtonHint(config),
      onTap: onTap,
    );
  }

  Widget wrapWithSemantics(
    Widget child,
    DSClipboardShareConfig config,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
  ) {
    if (!config.accessibility!.enabled) {
      return child;
    }

    final semantics = getShareButtonSemantics(config, onTap, onLongPress);

    return Semantics.fromProperties(properties: semantics, child: child);
  }

  void handleKeyboardNavigation(
    LogicalKeyboardKey key,
    VoidCallback? onShare,
    VoidCallback? onCopy,
    VoidCallback? onCancel,
  ) {
    switch (key) {
      case LogicalKeyboardKey.enter:
      case LogicalKeyboardKey.space:
        onShare?.call();
        break;

      case LogicalKeyboardKey.keyC:
        if (HardwareKeyboard.instance.isControlPressed ||
            HardwareKeyboard.instance.isMetaPressed) {
          onCopy?.call();
        }
        break;

      case LogicalKeyboardKey.escape:
        onCancel?.call();
        break;
    }
  }

  FocusNode createFocusNode(String label) {
    return FocusNode(
      debugLabel: 'DSClipboardShare_$label',
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

  double getScaledTextSize(double baseSize, BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return baseSize * mediaQuery.textScaler.scale(baseSize);
  }

  Duration getReducedMotionDuration(Duration originalDuration) {
    return Duration(
      milliseconds: (originalDuration.inMilliseconds * 0.3).round(),
    );
  }

  String formatFileSize(int sizeInBytes) {
    if (sizeInBytes < 1024) {
      return '$sizeInBytes B';
    } else if (sizeInBytes < 1048576) {
      return '${(sizeInBytes / 1024).toStringAsFixed(1)} KB';
    } else if (sizeInBytes < 1073741824) {
      return '${(sizeInBytes / 1048576).toStringAsFixed(1)} MB';
    } else {
      return '${(sizeInBytes / 1073741824).toStringAsFixed(1)} GB';
    }
  }

  String getFileTypeDescription(String mimeType) {
    if (mimeType.startsWith('image/')) {
      return 'Imagen';
    } else if (mimeType.startsWith('video/')) {
      return 'Video';
    } else if (mimeType.startsWith('audio/')) {
      return 'Audio';
    } else if (mimeType.contains('pdf')) {
      return 'Documento PDF';
    } else if (mimeType.contains('document') || mimeType.contains('text')) {
      return 'Documento';
    } else {
      return 'Archivo';
    }
  }

  Color getContrastColor(Color backgroundColor) {
    // Calcula el contraste para determinar si usar texto claro u oscuro
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

  void dispose(FocusNode? focusNode) {
    focusNode?.dispose();
  }
}
