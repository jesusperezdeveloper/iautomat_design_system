import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_back_to_top_config.dart';

enum HapticFeedbackType {
  lightImpact,
  mediumImpact,
  heavyImpact,
  selectionClick,
  vibrate,
}

class AppBackToTopPlatformAdapter {
  static AppBackToTopPlatformAdapter? _instance;

  AppBackToTopPlatformAdapter._();

  factory AppBackToTopPlatformAdapter() {
    return _instance ??= AppBackToTopPlatformAdapter._();
  }

  bool get isMobile => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;
  bool get isDesktop => !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
  bool get isMacOS => !kIsWeb && Platform.isMacOS;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isLinux => !kIsWeb && Platform.isLinux;

  Duration getDefaultAnimationDuration() {
    if (isIOS) {
      return const Duration(milliseconds: 300);
    } else if (isAndroid) {
      return const Duration(milliseconds: 250);
    } else if (isWeb) {
      return const Duration(milliseconds: 200);
    } else {
      return const Duration(milliseconds: 250);
    }
  }

  Duration getDefaultScrollDuration() {
    if (isIOS) {
      return const Duration(milliseconds: 600);
    } else if (isAndroid) {
      return const Duration(milliseconds: 500);
    } else if (isWeb) {
      return const Duration(milliseconds: 800);
    } else {
      return const Duration(milliseconds: 600);
    }
  }

  Curve getDefaultAnimationCurve() {
    if (isIOS) {
      return Curves.easeInOut;
    } else if (isAndroid) {
      return Curves.fastOutSlowIn;
    } else if (isWeb) {
      return Curves.easeOut;
    } else {
      return Curves.easeInOut;
    }
  }

  Curve getDefaultScrollCurve() {
    if (isIOS) {
      return Curves.easeOut;
    } else if (isAndroid) {
      return Curves.fastOutSlowIn;
    } else if (isWeb) {
      return Curves.easeInOut;
    } else {
      return Curves.easeOut;
    }
  }

  double getDefaultSize() {
    if (isIOS) {
      return 56.0;
    } else if (isAndroid) {
      return 56.0;
    } else if (isWeb) {
      return 48.0;
    } else {
      return 52.0;
    }
  }

  double getDefaultIconSize() {
    if (isIOS) {
      return 24.0;
    } else if (isAndroid) {
      return 24.0;
    } else if (isWeb) {
      return 20.0;
    } else {
      return 22.0;
    }
  }

  double getDefaultBorderRadius() {
    if (isIOS) {
      return 28.0;
    } else if (isAndroid) {
      return 28.0;
    } else if (isWeb) {
      return 24.0;
    } else {
      return 26.0;
    }
  }

  EdgeInsets getDefaultMargin() {
    if (isIOS) {
      return const EdgeInsets.all(16.0);
    } else if (isAndroid) {
      return const EdgeInsets.all(16.0);
    } else if (isWeb) {
      return const EdgeInsets.all(24.0);
    } else {
      return const EdgeInsets.all(20.0);
    }
  }

  double getDefaultElevation() {
    if (isIOS) {
      return 8.0;
    } else if (isAndroid) {
      return 6.0;
    } else if (isWeb) {
      return 4.0;
    } else {
      return 6.0;
    }
  }

  double getDefaultShowAfterPixels() {
    if (isIOS) {
      return 200.0;
    } else if (isAndroid) {
      return 200.0;
    } else if (isWeb) {
      return 300.0;
    } else {
      return 250.0;
    }
  }

  bool getDefaultAutoHide() {
    if (isIOS) {
      return false;
    } else if (isAndroid) {
      return false;
    } else if (isWeb) {
      return true;
    } else {
      return false;
    }
  }

  bool getDefaultShowOnScrollUp() {
    if (isIOS) {
      return false;
    } else if (isAndroid) {
      return false;
    } else if (isWeb) {
      return true;
    } else {
      return false;
    }
  }

  bool getDefaultHapticFeedback() {
    return isMobile; // Only mobile devices support haptic feedback
  }

  bool getDefaultShowTooltip() {
    if (isWeb || isDesktop) {
      return true; // Web and desktop benefit from tooltips
    } else {
      return false; // Mobile devices typically don't need tooltips for FABs
    }
  }

  AppBackToTopPosition getDefaultPosition() {
    if (isIOS) {
      return AppBackToTopPosition.bottomRight;
    } else if (isAndroid) {
      return AppBackToTopPosition.bottomRight;
    } else if (isWeb) {
      return AppBackToTopPosition.bottomRight;
    } else {
      return AppBackToTopPosition.bottomRight;
    }
  }

  AppBackToTopScrollBehavior getDefaultScrollBehavior() {
    if (isIOS) {
      return AppBackToTopScrollBehavior.easeOut;
    } else if (isAndroid) {
      return AppBackToTopScrollBehavior.smooth;
    } else if (isWeb) {
      return AppBackToTopScrollBehavior.smooth;
    } else {
      return AppBackToTopScrollBehavior.smooth;
    }
  }

  Color getDefaultBackgroundColor(BuildContext context) {
    final theme = Theme.of(context);

    if (isIOS) {
      return theme.colorScheme.primary;
    } else if (isAndroid) {
      return theme.colorScheme.primary;
    } else if (isWeb) {
      return theme.colorScheme.primaryContainer;
    } else {
      return theme.colorScheme.primary;
    }
  }

  Color getDefaultForegroundColor(BuildContext context) {
    final theme = Theme.of(context);

    if (isIOS) {
      return theme.colorScheme.onPrimary;
    } else if (isAndroid) {
      return theme.colorScheme.onPrimary;
    } else if (isWeb) {
      return theme.colorScheme.onPrimaryContainer;
    } else {
      return theme.colorScheme.onPrimary;
    }
  }

  Color getDefaultShadowColor(BuildContext context) {
    final theme = Theme.of(context);

    if (isIOS) {
      return theme.shadowColor.withValues(alpha: 0.3);
    } else if (isAndroid) {
      return theme.shadowColor.withValues(alpha: 0.4);
    } else if (isWeb) {
      return theme.shadowColor.withValues(alpha: 0.2);
    } else {
      return theme.shadowColor.withValues(alpha: 0.3);
    }
  }

  double getDefaultOpacity() {
    if (isIOS) {
      return 1.0;
    } else if (isAndroid) {
      return 1.0;
    } else if (isWeb) {
      return 0.95;
    } else {
      return 1.0;
    }
  }

  Duration getAutoHideDelay() {
    if (isWeb) {
      return const Duration(seconds: 5); // Web users expect auto-hide
    } else {
      return const Duration(seconds: 30); // Mobile users prefer manual control
    }
  }

  Future<void> triggerHapticFeedback([HapticFeedbackType type = HapticFeedbackType.lightImpact]) async {
    if (!isMobile) return;

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
      // Haptic feedback might not be available on all devices
      debugPrint('Haptic feedback error: $e');
    }
  }

  bool supportsHapticFeedback() {
    return isMobile;
  }

  bool supportsTooltips() {
    return true; // All platforms support tooltips in some form
  }

  bool supportsAutoHide() {
    return true; // All platforms can implement auto-hide
  }

  bool supportsSmoothScrolling() {
    return true; // All platforms support smooth scrolling
  }

  bool isAccessibilityEnabled(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.accessibleNavigation;
  }

  bool shouldUseReducedMotion(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.disableAnimations;
  }

  double getAccessibilityScaleFactor(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.textScaler.scale(1.0);
  }

  AppBackToTopConfig getPlatformOptimizedConfig(BuildContext context) {
    return AppBackToTopConfig(
      variant: AppBackToTopVariant.webOnly,
      colors: AppBackToTopColors(
        backgroundColor: getDefaultBackgroundColor(context),
        foregroundColor: getDefaultForegroundColor(context),
        shadowColor: getDefaultShadowColor(context),
        opacity: getDefaultOpacity(),
      ),
      spacing: AppBackToTopSpacing(
        size: getDefaultSize(),
        iconSize: getDefaultIconSize(),
        borderRadius: getDefaultBorderRadius(),
        margin: getDefaultMargin(),
        elevation: getDefaultElevation(),
        position: getDefaultPosition(),
      ),
      animations: AppBackToTopAnimations(
        duration: getDefaultAnimationDuration(),
        scrollDuration: getDefaultScrollDuration(),
        curve: getDefaultAnimationCurve(),
        scrollCurve: getDefaultScrollCurve(),
        scrollBehavior: getDefaultScrollBehavior(),
      ),
      accessibility: const AppBackToTopAccessibility(
        enabled: true,
        focusable: true,
      ),
      behavior: AppBackToTopBehavior(
        showAfterPixels: getDefaultShowAfterPixels(),
        autoHide: getDefaultAutoHide(),
        showOnScrollUp: getDefaultShowOnScrollUp(),
        hapticFeedback: getDefaultHapticFeedback(),
        showTooltip: getDefaultShowTooltip(),
        autoHideDelay: getAutoHideDelay(),
      ),
    );
  }

  AppBackToTopConfig adjustForAccessibility(
    AppBackToTopConfig config,
    BuildContext context,
  ) {
    if (shouldUseReducedMotion(context)) {
      return config.copyWith(
        animations: config.animations?.copyWith(
          enabled: false,
          fadeEnabled: false,
          scaleEnabled: false,
        ),
      );
    }

    final scaleFactor = getAccessibilityScaleFactor(context);
    if (scaleFactor > 1.0) {
      return config.copyWith(
        spacing: config.spacing?.copyWith(
          size: (config.spacing?.size ?? 56) * scaleFactor,
          iconSize: (config.spacing?.iconSize ?? 24) * scaleFactor,
        ),
      );
    }

    return config;
  }

  IconData getDefaultIcon() {
    if (isIOS) {
      return Icons.keyboard_arrow_up_rounded;
    } else if (isAndroid) {
      return Icons.keyboard_arrow_up;
    } else if (isWeb) {
      return Icons.expand_less;
    } else {
      return Icons.keyboard_arrow_up;
    }
  }

  String getDefaultTooltip() {
    if (isWeb) {
      return 'Volver al inicio de la página';
    } else {
      return 'Volver al inicio';
    }
  }

  bool shouldShowByDefault() {
    // Web typically shows the button more prominently
    return isWeb;
  }

  double getMinimumTouchTarget() {
    if (isIOS) {
      return 44.0; // iOS Human Interface Guidelines
    } else if (isAndroid) {
      return 48.0; // Material Design Guidelines
    } else {
      return 44.0; // General accessibility standard
    }
  }

  EdgeInsets getAccessibilityPadding(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final scaleFactor = mediaQuery.textScaler.scale(1.0);

    if (scaleFactor > 1.5) {
      return const EdgeInsets.all(20.0);
    } else if (scaleFactor > 1.2) {
      return const EdgeInsets.all(16.0);
    }

    return const EdgeInsets.all(12.0);
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
}