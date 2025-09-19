import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_clipboard_share_config.dart';

class DSClipboardSharePlatformAdapter {
  static DSClipboardSharePlatformAdapter? _instance;

  DSClipboardSharePlatformAdapter._();

  factory DSClipboardSharePlatformAdapter() {
    return _instance ??= DSClipboardSharePlatformAdapter._();
  }

  bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  bool get isWeb => kIsWeb;
  bool get isMobile => isIOS || isAndroid;
  bool get isDesktop => !isMobile && !isWeb;

  bool get supportsHapticFeedback => isMobile;
  bool get supportsNativeShare => isMobile || isWeb;
  bool get supportsClipboard => true;
  bool get supportsDragAndDrop => isDesktop || isWeb;

  IconData getShareIcon() {
    if (isIOS) {
      return Icons.ios_share;
    } else if (isAndroid) {
      return Icons.share;
    } else {
      return Icons.share_outlined;
    }
  }

  String getShareLabel() {
    if (isIOS) {
      return 'Compartir';
    } else if (isAndroid) {
      return 'Compartir';
    } else {
      return 'Compartir contenido';
    }
  }

  String getCopyLabel() {
    return 'Copiar';
  }

  bool supportsEmail() {
    return true;
  }

  bool supportsWhatsApp() {
    return isMobile;
  }

  bool supportsTelegram() {
    return isMobile;
  }

  bool supportsTwitter() {
    return true;
  }

  bool supportsFacebook() {
    return true;
  }

  Future<void> shareViaEmail(DSShareData data, String? subject) async {
    final emailUri = Uri(
      scheme: 'mailto',
      query: Uri.encodeQueryComponent(
        'subject=${subject ?? ''}&body=${data.text ?? ''}',
      ),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  Future<void> shareViaWhatsApp(DSShareData data) async {
    final whatsappUri = Uri.parse(
      'whatsapp://send?text=${Uri.encodeComponent(data.text ?? '')}',
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    }
  }

  Future<void> shareViaTelegram(DSShareData data) async {
    final telegramUri = Uri.parse(
      'tg://msg_url?url=${Uri.encodeComponent(data.url ?? '')}&text=${Uri.encodeComponent(data.text ?? '')}',
    );

    if (await canLaunchUrl(telegramUri)) {
      await launchUrl(telegramUri);
    }
  }

  Future<void> shareViaTwitter(DSShareData data) async {
    final twitterUri = Uri.parse(
      'https://twitter.com/intent/tweet?text=${Uri.encodeComponent(data.text ?? '')}',
    );

    if (await canLaunchUrl(twitterUri)) {
      await launchUrl(twitterUri);
    }
  }

  Future<void> shareViaFacebook(DSShareData data) async {
    final facebookUri = Uri.parse(
      'https://www.facebook.com/sharer/sharer.php?u=${Uri.encodeComponent(data.url ?? '')}',
    );

    if (await canLaunchUrl(facebookUri)) {
      await launchUrl(facebookUri);
    }
  }

  DSClipboardShareColors getDefaultColors(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DSClipboardShareColors(
      backgroundColor: colorScheme.surface,
      primaryButtonColor: colorScheme.primary,
      secondaryButtonColor: colorScheme.secondary,
      primaryTextColor: colorScheme.onPrimary,
      secondaryTextColor: colorScheme.onSurface,
      iconColor: colorScheme.onPrimary,
      borderColor: colorScheme.outline,
      overlayColor: colorScheme.primary.withValues(alpha: 0.1),
      successColor: Colors.green,
      errorColor: colorScheme.error,
      hoverColor: colorScheme.primary.withValues(alpha: 0.08),
      pressedColor: colorScheme.primary.withValues(alpha: 0.12),
      focusColor: colorScheme.primary,
      selectedColor: colorScheme.primary.withValues(alpha: 0.1),
      disabledColor: theme.disabledColor,
      loadingColor: colorScheme.primary.withValues(alpha: 0.6),
      skeletonBaseColor: colorScheme.surfaceContainerHighest,
      skeletonHighlightColor: colorScheme.surface,
    );
  }

  DSClipboardShareSpacing getDefaultSpacing() {
    return DSClipboardShareSpacing(
      containerPadding: EdgeInsets.all(isWeb ? 20.0 : 16.0),
      buttonPadding: EdgeInsets.symmetric(
        horizontal: isWeb ? 20.0 : 16.0,
        vertical: isWeb ? 14.0 : 12.0,
      ),
      modalPadding: EdgeInsets.all(isWeb ? 28.0 : 24.0),
      previewPadding: const EdgeInsets.all(12.0),
      itemSpacing: 16.0,
      iconSpacing: 8.0,
      borderRadius: 12.0,
      buttonBorderRadius: 8.0,
      modalHeight: null,
      modalMaxWidth: isWeb ? 500.0 : 400.0,
      iconSize: 24.0,
      largeIconSize: 48.0,
    );
  }

  DSClipboardShareTypography getDefaultTypography(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DSClipboardShareTypography(
      titleStyle: textTheme.titleLarge,
      subtitleStyle: textTheme.titleMedium,
      bodyStyle: textTheme.bodyLarge,
      buttonStyle: textTheme.labelLarge,
      labelStyle: textTheme.labelMedium,
      captionStyle: textTheme.bodySmall,
      errorStyle: textTheme.bodyMedium?.copyWith(
        color: Theme.of(context).colorScheme.error,
      ),
      previewStyle: textTheme.bodyMedium,
    );
  }

  DSClipboardShareAnimations getDefaultAnimations() {
    return DSClipboardShareAnimations(
      stateDuration: Duration(
        milliseconds: isWeb
            ? 150
            : isIOS
            ? 200
            : 300,
      ),
      modalDuration: const Duration(milliseconds: 300),
      confirmationDuration: const Duration(milliseconds: 2000),
      skeletonDuration: const Duration(milliseconds: 1200),
      stateCurve: isIOS ? Curves.easeInOut : Curves.fastOutSlowIn,
      modalCurve: Curves.easeOutCubic,
      skeletonCurve: Curves.easeInOut,
      enabled: true,
      respectReducedMotion: true,
    );
  }

  DSClipboardShareBehavior getDefaultBehavior() {
    return DSClipboardShareBehavior(
      showDebugInfo: kDebugMode,
      enableHoverEffects: !isMobile,
      showFocusIndicator: !isMobile,
      enableHapticFeedback: isMobile,
      cacheStyles: !kDebugMode,
      platformAdaptive: true,
      autoCloseAfterShare: true,
      showShareHistory: false,
      enableDragAndDrop: isDesktop || isWeb,
      validateUrls: true,
      sanitizeHtml: true,
    );
  }

  DSClipboardShareAccessibility getDefaultAccessibility() {
    return DSClipboardShareAccessibility(
      enabled: true,
      semanticRole: 'button',
      focusable: true,
      excludeSemantics: false,
      shareLabel: isIOS ? 'Compartir' : 'Compartir contenido',
      copyLabel: 'Copiar al portapapeles',
      loadingLabel: 'Procesando',
      disabledLabel: 'No disponible',
      successLabel: 'Compartido exitosamente',
      errorLabel: 'Error al compartir',
      shareHint: isIOS
          ? 'Toca para compartir'
          : isAndroid
          ? 'Presiona para compartir'
          : 'Haz clic para compartir',
      copyHint: isIOS
          ? 'Mantén presionado para copiar'
          : isAndroid
          ? 'Mantén presionado para copiar'
          : 'Clic derecho para copiar',
    );
  }

  Future<void> triggerHapticFeedback({
    HapticFeedbackType type = HapticFeedbackType.lightImpact,
  }) async {
    if (!supportsHapticFeedback) return;

    try {
      switch (type) {
        case HapticFeedbackType.lightImpact:
          await HapticFeedback.lightImpact();
          break;
        case HapticFeedbackType.mediumImpact:
          await HapticFeedback.mediumImpact();
          break;
        case HapticFeedbackType.heavyImpact:
          await HapticFeedback.heavyImpact();
          break;
        case HapticFeedbackType.selectionClick:
          await HapticFeedback.selectionClick();
          break;
        case HapticFeedbackType.vibrate:
          await HapticFeedback.vibrate();
          break;
      }
    } catch (e) {
      debugPrint('Haptic feedback error: $e');
    }
  }

  Duration getAnimationDuration(DSClipboardShareAnimations animations) {
    if (!animations.enabled) return Duration.zero;

    if (animations.respectReducedMotion) {
      final mediaQuery =
          WidgetsBinding.instance.platformDispatcher.accessibilityFeatures;
      if (mediaQuery.reduceMotion) {
        return const Duration(milliseconds: 100);
      }
    }

    return animations.stateDuration;
  }

  Curve getAnimationCurve(DSClipboardShareAnimations animations) {
    if (!animations.enabled) return Curves.linear;
    return animations.stateCurve;
  }

  void logPlatformInfo(String message) {
    if (kDebugMode) {
      final platform = isIOS
          ? 'iOS'
          : isAndroid
          ? 'Android'
          : isWeb
          ? 'Web'
          : 'Desktop';
      debugPrint('[DSClipboardShare-$platform] $message');
    }
  }

  DSClipboardShareConfig adaptConfigForPlatform(
    DSClipboardShareConfig config,
    BuildContext context,
  ) {
    return config.copyWith(
      colors: config.colors ?? getDefaultColors(context),
      spacing: config.spacing ?? getDefaultSpacing(),
      typography: config.typography ?? getDefaultTypography(context),
      animations: config.animations ?? getDefaultAnimations(),
      behavior: config.behavior ?? getDefaultBehavior(),
      accessibility: config.accessibility ?? getDefaultAccessibility(),
    );
  }

  TextDirection getTextDirection(BuildContext context) {
    return Directionality.of(context);
  }

  bool isRTL(BuildContext context) {
    return getTextDirection(context) == TextDirection.rtl;
  }

  EdgeInsets adaptPaddingForRTL(EdgeInsets padding, BuildContext context) {
    if (!isRTL(context)) return padding;

    return EdgeInsets.only(
      left: padding.right,
      top: padding.top,
      right: padding.left,
      bottom: padding.bottom,
    );
  }

  Future<bool> validateFileSize(List<DSShareFile> files, int maxSize) async {
    for (final file in files) {
      if (file.size != null && file.size! > maxSize) {
        return false;
      }
    }
    return true;
  }

  Future<List<DSShareFile>> compressImages(
    List<DSShareFile> files,
    int quality,
  ) async {
    final compressedFiles = <DSShareFile>[];

    for (final file in files) {
      if (file.isImage) {
        // Aquí implementarías la compresión real de imagen
        // Por ahora solo retornamos el archivo original
        compressedFiles.add(file);
      } else {
        compressedFiles.add(file);
      }
    }

    return compressedFiles;
  }

  String sanitizeHtml(String input) {
    // Implementación básica de sanitización HTML
    return input
        .replaceAll('<script', '&lt;script')
        .replaceAll('</script>', '&lt;/script&gt;')
        .replaceAll('<iframe', '&lt;iframe')
        .replaceAll('javascript:', '');
  }

  bool validateUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }
}

enum HapticFeedbackType {
  lightImpact,
  mediumImpact,
  heavyImpact,
  selectionClick,
  vibrate,
}
