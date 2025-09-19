import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_skeleton_config.dart';

enum HapticFeedbackType {
  lightImpact,
  mediumImpact,
  heavyImpact,
  selectionClick,
  vibrate,
}

class DSSkeletonPlatformAdapter {
  static DSSkeletonPlatformAdapter? _instance;

  DSSkeletonPlatformAdapter._();

  factory DSSkeletonPlatformAdapter() {
    return _instance ??= DSSkeletonPlatformAdapter._();
  }

  bool get isMobile => !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  bool get isIOS => !kIsWeb && Platform.isIOS;
  bool get isAndroid => !kIsWeb && Platform.isAndroid;
  bool get isWeb => kIsWeb;
  bool get isDesktop =>
      !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
  bool get isMacOS => !kIsWeb && Platform.isMacOS;
  bool get isWindows => !kIsWeb && Platform.isWindows;
  bool get isLinux => !kIsWeb && Platform.isLinux;

  Duration getDefaultAnimationDuration() {
    if (isIOS) {
      return const Duration(milliseconds: 300);
    } else if (isAndroid) {
      return const Duration(milliseconds: 200);
    } else {
      return const Duration(milliseconds: 250);
    }
  }

  Duration getShimmerDuration() {
    if (isIOS) {
      return const Duration(milliseconds: 1500);
    } else if (isAndroid) {
      return const Duration(milliseconds: 1200);
    } else {
      return const Duration(milliseconds: 1300);
    }
  }

  Curve getDefaultAnimationCurve() {
    if (isIOS) {
      return Curves.easeInOut;
    } else if (isAndroid) {
      return Curves.fastOutSlowIn;
    } else {
      return Curves.easeInOut;
    }
  }

  double getDefaultBorderRadius(DSSkeletonShape shape) {
    switch (shape) {
      case DSSkeletonShape.circle:
      case DSSkeletonShape.avatar:
        return 50.0;
      case DSSkeletonShape.button:
        if (isIOS) return 8.0;
        if (isAndroid) return 4.0;
        return 6.0;
      case DSSkeletonShape.card:
        if (isIOS) return 12.0;
        if (isAndroid) return 8.0;
        return 10.0;
      case DSSkeletonShape.text:
        return 4.0;
      case DSSkeletonShape.line:
        return 0.0;
      case DSSkeletonShape.roundedRectangle:
        if (isIOS) return 16.0;
        if (isAndroid) return 12.0;
        return 14.0;
      case DSSkeletonShape.rectangle:
        return 0.0;
    }
  }

  EdgeInsets getDefaultPadding() {
    if (isIOS) {
      return const EdgeInsets.all(16.0);
    } else if (isAndroid) {
      return const EdgeInsets.all(12.0);
    } else {
      return const EdgeInsets.all(14.0);
    }
  }

  EdgeInsets getDefaultMargin() {
    if (isIOS) {
      return const EdgeInsets.all(8.0);
    } else if (isAndroid) {
      return const EdgeInsets.all(6.0);
    } else {
      return const EdgeInsets.all(7.0);
    }
  }

  double getDefaultElevation() {
    if (isIOS) {
      return 2.0;
    } else if (isAndroid) {
      return 4.0;
    } else {
      return 3.0;
    }
  }

  Color getDefaultBackgroundColor(BuildContext context) {
    final theme = Theme.of(context);

    if (isIOS) {
      return theme.colorScheme.surfaceContainerHighest;
    } else if (isAndroid) {
      return theme.colorScheme.surfaceContainer;
    } else {
      return theme.colorScheme.surfaceContainerHigh;
    }
  }

  Color getDefaultShimmerColor(BuildContext context) {
    final theme = Theme.of(context);

    if (isIOS) {
      return theme.colorScheme.onSurface.withValues(alpha: 0.3);
    } else if (isAndroid) {
      return theme.colorScheme.onSurface.withValues(alpha: 0.4);
    } else {
      return theme.colorScheme.onSurface.withValues(alpha: 0.35);
    }
  }

  Color getDefaultHighlightColor(BuildContext context) {
    final theme = Theme.of(context);

    if (isIOS) {
      return theme.colorScheme.surface.withValues(alpha: 0.8);
    } else if (isAndroid) {
      return theme.colorScheme.surface.withValues(alpha: 0.9);
    } else {
      return theme.colorScheme.surface.withValues(alpha: 0.85);
    }
  }

  double getDefaultOpacity() {
    if (isIOS) {
      return 0.8;
    } else if (isAndroid) {
      return 0.7;
    } else {
      return 0.75;
    }
  }

  double getDefaultShimmerOpacity() {
    if (isIOS) {
      return 0.3;
    } else if (isAndroid) {
      return 0.4;
    } else {
      return 0.35;
    }
  }

  bool getDefaultShimmerEnabled() {
    // iOS prefers subtle animations
    if (isIOS) return true;
    // Android supports more prominent animations
    if (isAndroid) return true;
    // Web/Desktop have good performance for animations
    return true;
  }

  bool getDefaultPulseEnabled() {
    // iOS generally avoids pulse animations
    if (isIOS) return false;
    // Android can handle pulse animations well
    if (isAndroid) return true;
    // Web/Desktop depend on device performance
    return false;
  }

  double getShimmerSpeed() {
    if (isIOS) {
      return 1.2; // Slower, more subtle
    } else if (isAndroid) {
      return 1.5; // Standard speed
    } else {
      return 1.3; // Medium speed
    }
  }

  Future<void> triggerHapticFeedback(HapticFeedbackType type) async {
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

  BoxShadow? getDefaultShadow(BuildContext context) {
    if (isWeb) {
      // Web shadows should be subtle
      return BoxShadow(
        color: Theme.of(context).shadowColor.withValues(alpha: 0.1),
        blurRadius: 2,
        offset: const Offset(0, 1),
      );
    }

    if (isIOS) {
      return BoxShadow(
        color: Theme.of(context).shadowColor.withValues(alpha: 0.15),
        blurRadius: 4,
        offset: const Offset(0, 2),
      );
    }

    if (isAndroid) {
      return BoxShadow(
        color: Theme.of(context).shadowColor.withValues(alpha: 0.2),
        blurRadius: 6,
        offset: const Offset(0, 3),
      );
    }

    return BoxShadow(
      color: Theme.of(context).shadowColor.withValues(alpha: 0.15),
      blurRadius: 4,
      offset: const Offset(0, 2),
    );
  }

  bool supportsCustomAnimations() {
    // All platforms support custom animations, but performance varies
    return true;
  }

  bool supportsComplexShimmers() {
    // iOS and modern Android support complex shimmers well
    if (isIOS || isAndroid) return true;
    // Web depends on browser and device
    if (isWeb) return true;
    // Desktop generally has good performance
    return true;
  }

  bool supportsHapticFeedback() {
    return isMobile;
  }

  bool supportsAccessibilityAnnouncements() {
    return true; // All platforms support some form of accessibility
  }

  TextDirection getDefaultTextDirection() {
    // Platform doesn't directly affect text direction,
    // but some platforms may have locale preferences
    return TextDirection.ltr;
  }

  DSSkeletonConfig getPlatformOptimizedConfig(
    DSSkeletonShape shape,
    BuildContext context,
  ) {
    return DSSkeletonConfig(
      variant: DSSkeletonVariant.universal,
      state: DSSkeletonState.skeleton,
      colors: DSSkeletonColors(
        backgroundColor: getDefaultBackgroundColor(context),
        shimmerColor: getDefaultShimmerColor(context),
        highlightColor: getDefaultHighlightColor(context),
        opacity: getDefaultOpacity(),
        shimmerOpacity: getDefaultShimmerOpacity(),
      ),
      spacing: DSSkeletonSpacing(
        borderRadius: getDefaultBorderRadius(shape),
        padding: getDefaultPadding(),
        margin: getDefaultMargin(),
        elevation: getDefaultElevation(),
      ),
      animations: DSSkeletonAnimations(
        duration: getShimmerDuration(),
        fadeInDuration: getDefaultAnimationDuration(),
        curve: getDefaultAnimationCurve(),
        shimmerSpeed: getShimmerSpeed(),
        enabled: true,
        shimmerEnabled: getDefaultShimmerEnabled(),
        pulseEnabled: getDefaultPulseEnabled(),
      ),
      accessibility: const DSSkeletonAccessibility(
        enabled: true,
        focusable: false, // Skeletons are generally not focusable
      ),
      behavior: const DSSkeletonBehavior(
        animateOnLoad: true,
        hideOnContent: true,
        maintainSize: true,
        showBorder: false,
        showShadow: false,
      ),
    );
  }

  bool shouldUseReducedMotion(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.disableAnimations;
  }

  double getAccessibilityScaleFactor(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.textScaler.scale(1.0);
  }

  bool isHighContrastMode(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return mediaQuery.accessibleNavigation;
  }

  DSSkeletonConfig adjustForAccessibility(
    DSSkeletonConfig config,
    BuildContext context,
  ) {
    if (shouldUseReducedMotion(context)) {
      return config.copyWith(
        animations: config.animations?.copyWith(
          enabled: false,
          shimmerEnabled: false,
          pulseEnabled: false,
        ),
      );
    }

    if (isHighContrastMode(context)) {
      return config.copyWith(
        colors: config.colors?.copyWith(opacity: 1.0, shimmerOpacity: 0.8),
      );
    }

    return config;
  }
}
