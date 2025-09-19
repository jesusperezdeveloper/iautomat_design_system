import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/semantics.dart';

import 'ds_accordion_config.dart';

class DSAccordionPlatformAdapter {
  static DSAccordionPlatformAdapter? _instance;

  DSAccordionPlatformAdapter._();

  factory DSAccordionPlatformAdapter() {
    return _instance ??= DSAccordionPlatformAdapter._();
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

  DSAccordionColors getDefaultColors(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DSAccordionColors(
      backgroundColor: colorScheme.surface,
      surfaceColor: colorScheme.surfaceContainerHighest,
      headerColor: colorScheme.surface,
      headerExpandedColor: colorScheme.surfaceContainer,
      contentColor: colorScheme.surfaceContainerLow,
      borderColor: theme.dividerColor,
      dividerColor: theme.dividerColor,
      titleColor: colorScheme.onSurface,
      subtitleColor: colorScheme.onSurfaceVariant,
      expansionIconColor: colorScheme.onSurfaceVariant,
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

  DSAccordionSpacing getDefaultSpacing() {
    return DSAccordionSpacing(
      headerPadding: EdgeInsets.symmetric(
        horizontal: isWeb ? 24.0 : 16.0,
        vertical: isWeb ? 16.0 : 12.0,
      ),
      contentPadding: EdgeInsets.all(isWeb ? 24.0 : 16.0),
      titleSubtitleSpacing: 4.0,
      iconTextSpacing: 8.0,
      minHeaderHeight: 56.0,
      minInteractiveSize: isMobile ? 44.0 : 40.0,
    );
  }

  DSAccordionTypography getDefaultTypography(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DSAccordionTypography(
      titleStyle: textTheme.bodyLarge ?? const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
      subtitleStyle: textTheme.bodyMedium ?? const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.4,
      ),
    );
  }

  DSAccordionAnimations getDefaultAnimations() {
    return DSAccordionAnimations(
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

  DSAccordionBehavior getDefaultBehavior() {
    return DSAccordionBehavior(
      showDebugInfo: kDebugMode,
      enableHoverEffects: !isMobile,
      showFocusIndicator: !isMobile,
      enableHapticFeedback: isMobile,
      cacheStyles: !kDebugMode,
      platformAdaptive: true,
    );
  }

  DSAccordionAccessibilityConfig getDefaultAccessibility() {
    return const DSAccordionAccessibilityConfig(
      enabled: true,
      semanticRole: 'expandable',
      focusable: true,
      excludeSemantics: false,
      loadingLabel: 'Cargando',
      disabledLabel: 'Deshabilitado',
      expandedLabel: 'Expandido',
      collapsedLabel: 'Contraído',
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
      SemanticsService.announce(message, textDirection);
    } catch (e) {
      debugPrint('Screen reader announcement error: $e');
    }
  }

  Duration getAnimationDuration(DSAccordionAnimations animations) {
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

  Curve getAnimationCurve(DSAccordionAnimations animations) {
    if (!animations.enabled) return Curves.linear;
    return animations.stateCurve;
  }

  String getPlatformSpecificMessage(String baseMessage) {
    if (isIOS) {
      return baseMessage.replaceAll('Presiona', 'Toca');
    }
    if (isAndroid) {
      return baseMessage.replaceAll('Toca', 'Presiona');
    }
    if (isWeb) {
      return baseMessage.replaceAll('Presiona', 'Haz clic');
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
      debugPrint('[DSAccordion-$platform] $message');
    }
  }

  DSAccordionConfig adaptConfigForPlatform(
    DSAccordionConfig config,
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

  EdgeInsets adaptPaddingForRTL(
    EdgeInsets padding,
    BuildContext context,
  ) {
    if (!isRTL(context)) return padding;

    return EdgeInsets.only(
      left: padding.right,
      top: padding.top,
      right: padding.left,
      bottom: padding.bottom,
    );
  }

  MainAxisAlignment getMainAxisAlignmentForRTL(
    MainAxisAlignment alignment,
    BuildContext context,
  ) {
    if (!isRTL(context)) return alignment;

    switch (alignment) {
      case MainAxisAlignment.start:
        return MainAxisAlignment.end;
      case MainAxisAlignment.end:
        return MainAxisAlignment.start;
      default:
        return alignment;
    }
  }

  CrossAxisAlignment getCrossAxisAlignmentForRTL(
    CrossAxisAlignment alignment,
    BuildContext context,
  ) {
    if (!isRTL(context)) return alignment;

    switch (alignment) {
      case CrossAxisAlignment.start:
        return CrossAxisAlignment.end;
      case CrossAxisAlignment.end:
        return CrossAxisAlignment.start;
      default:
        return alignment;
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