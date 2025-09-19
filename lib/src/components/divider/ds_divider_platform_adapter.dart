import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ds_divider_config.dart';

class DSDividerPlatformAdapter {
  static DSDividerPlatformAdapter? _instance;

  DSDividerPlatformAdapter._();

  factory DSDividerPlatformAdapter() {
    return _instance ??= DSDividerPlatformAdapter._();
  }

  bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  bool get isWeb => kIsWeb;
  bool get isMobile => isIOS || isAndroid;
  bool get isDesktop => !isMobile && !isWeb;

  bool get supportsHapticFeedback => isMobile;
  bool get supportsScreenReaderAnnouncements => true;
  bool get supportsHighContrast => !isWeb;
  bool get supportsReducedMotion => true;

  DSDividerColors getDefaultColors(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DSDividerColors(
      defaultColor: theme.dividerColor,
      hoverColor: colorScheme.primary.withValues(alpha: 0.1),
      pressedColor: colorScheme.primary.withValues(alpha: 0.2),
      focusColor: colorScheme.primary,
      selectedColor: colorScheme.primary,
      disabledColor: theme.disabledColor,
      loadingColor: colorScheme.primary.withValues(alpha: 0.6),
      skeletonBaseColor: colorScheme.surfaceContainerHighest,
      skeletonHighlightColor: colorScheme.surface,
    );
  }

  DSDividerSpacing getDefaultSpacing() {
    return DSDividerSpacing(
      defaultIndent: isWeb ? 24.0 : 16.0,
      defaultEndIndent: isWeb ? 24.0 : 16.0,
      defaultThickness: isWeb ? 1.5 : 1.0,
      defaultHeight: isWeb ? 1.5 : 1.0,
      defaultWidth: isWeb ? 1.5 : 1.0,
      minInteractiveSize: isMobile ? 44.0 : 40.0,
      interactivePadding: EdgeInsets.all(isMobile ? 8.0 : 6.0),
    );
  }

  DSDividerAnimations getDefaultAnimations() {
    return DSDividerAnimations(
      stateDuration: Duration(
        milliseconds: isWeb
            ? 150
            : isIOS
            ? 200
            : 300,
      ),
      skeletonDuration: const Duration(milliseconds: 1200),
      stateCurve: isIOS ? Curves.easeInOut : Curves.fastOutSlowIn,
      skeletonCurve: Curves.easeInOut,
      enabled: true,
      respectReducedMotion: true,
    );
  }

  DSDividerBehavior getDefaultBehavior() {
    return DSDividerBehavior(
      showDebugInfo: kDebugMode,
      enableHoverEffects: !isMobile,
      showFocusIndicator: !isMobile,
      enableHapticFeedback: isMobile,
      cacheStyles: !kDebugMode,
      platformAdaptive: true,
    );
  }

  DSDividerAccessibilityConfig getDefaultAccessibility() {
    return const DSDividerAccessibilityConfig(
      enabled: true,
      semanticRole: 'separator',
      focusable: false,
      excludeSemantics: false,
      loadingLabel: 'Cargando',
      disabledLabel: 'Deshabilitado',
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

  Future<void> announceToScreenReader(
    String message, {
    TextDirection textDirection = TextDirection.ltr,
  }) async {
    if (!supportsScreenReaderAnnouncements) return;

    try {
      debugPrint('Screen reader announcement: $message');
    } catch (e) {
      debugPrint('Screen reader announcement error: $e');
    }
  }

  Duration getAnimationDuration(DSDividerAnimations animations) {
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

  Curve getAnimationCurve(DSDividerAnimations animations) {
    if (!animations.enabled) return Curves.linear;
    return animations.stateCurve;
  }

  String getPlatformSpecificMessage(String baseMessage) {
    if (isIOS) {
      return baseMessage.replaceAll('Tap', 'Toca');
    }
    if (isAndroid) {
      return baseMessage.replaceAll('Touch', 'Presiona');
    }
    if (isWeb) {
      return baseMessage.replaceAll('Tap', 'Haz clic');
    }
    return baseMessage;
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
      debugPrint('[DSDivider-$platform] $message');
    }
  }

  DSDividerConfig adaptConfigForPlatform(
    DSDividerConfig config,
    BuildContext context,
  ) {
    return config.copyWith(
      colors: config.colors ?? getDefaultColors(context),
      spacing: config.spacing ?? getDefaultSpacing(),
      animations: config.animations ?? getDefaultAnimations(),
      behavior: config.behavior ?? getDefaultBehavior(),
      accessibility: config.accessibility ?? getDefaultAccessibility(),
    );
  }
}

enum HapticFeedbackType {
  lightImpact,
  mediumImpact,
  heavyImpact,
  selectionClick,
  vibrate,
}
