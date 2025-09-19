import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ds_role_visibility_config.dart';

class DSRoleVisibilityPlatformAdapter {
  static DSRoleVisibilityPlatformAdapter? _instance;

  DSRoleVisibilityPlatformAdapter._();

  factory DSRoleVisibilityPlatformAdapter() {
    return _instance ??= DSRoleVisibilityPlatformAdapter._();
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

  DSRoleVisibilityColors getDefaultColors(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DSRoleVisibilityColors(
      primaryColor: colorScheme.primary,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      borderColor: colorScheme.outline,
      focusColor: colorScheme.primary.withValues(alpha: 0.2),
      hoverColor: colorScheme.primary.withValues(alpha: 0.1),
      loadingColor: colorScheme.primary,
      errorColor: colorScheme.error,
      errorBackgroundColor: colorScheme.errorContainer,
      errorBorderColor: colorScheme.error,
      errorTextColor: colorScheme.onErrorContainer,
      errorIconColor: colorScheme.error,
      disabledColor: colorScheme.onSurface.withValues(alpha: 0.38),
      disabledBackgroundColor: colorScheme.surface.withValues(alpha: 0.12),
    );
  }

  DSRoleVisibilityAnimations getDefaultAnimations() {
    return DSRoleVisibilityAnimations(
      duration: Duration(milliseconds: isWeb ? 200 : 300),
      curve: isIOS ? Curves.easeInOut : Curves.fastOutSlowIn,
      enableAnimations: true,
      respectReducedMotion: true,
    );
  }

  DSRoleVisibilityBehavior getDefaultBehavior() {
    return DSRoleVisibilityBehavior(
      preserveSpaceWhenHidden: false,
      showErrorMessages: true,
      enableDebugMode: kDebugMode,
      cacheResults: !kDebugMode,
      cacheDuration: const Duration(minutes: 5),
      enableLogging: kDebugMode,
      automaticRefresh: false,
      refreshInterval: const Duration(minutes: 10),
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
      // Simplemente imprimimos el mensaje para debugging
      debugPrint('Screen reader announcement: $message');
    } catch (e) {
      debugPrint('Screen reader announcement error: $e');
    }
  }

  EdgeInsets getPlatformPadding(DSRoleVisibilityPadding padding) {
    final double horizontalMultiplier = isWeb ? 1.2 : 1.0;
    final double verticalMultiplier = isIOS ? 1.1 : 1.0;

    return EdgeInsets.symmetric(
      horizontal: padding.horizontal * horizontalMultiplier,
      vertical: padding.vertical * verticalMultiplier,
    );
  }

  BorderRadius getPlatformBorderRadius(DSRoleVisibilityBorderRadius borderRadius) {
    final double radiusMultiplier = isIOS ? 1.2 : 1.0;

    return BorderRadius.circular(borderRadius.radius * radiusMultiplier);
  }

  TextStyle getPlatformTextStyle(BuildContext context, DSRoleVisibilityTextStyle textStyle) {
    final theme = Theme.of(context);
    final baseStyle = theme.textTheme.bodyMedium ?? const TextStyle();

    double fontSizeMultiplier = 1.0;
    if (isWeb) fontSizeMultiplier = 1.1;
    if (isIOS) fontSizeMultiplier = 1.05;

    return baseStyle.copyWith(
      fontSize: (textStyle.fontSize ?? baseStyle.fontSize ?? 14) * fontSizeMultiplier,
      fontWeight: textStyle.fontWeight ?? baseStyle.fontWeight,
      color: textStyle.color ?? baseStyle.color,
      letterSpacing: textStyle.letterSpacing ?? (isAndroid ? 0.1 : 0.0),
      height: textStyle.height ?? (isIOS ? 1.2 : 1.1),
    );
  }

  Duration getAnimationDuration(DSRoleVisibilityAnimations animations) {
    if (!animations.enableAnimations) return Duration.zero;

    if (animations.respectReducedMotion) {
      // Check for reduced motion preference
      final mediaQuery = WidgetsBinding.instance.platformDispatcher.accessibilityFeatures;
      if (mediaQuery.reduceMotion) {
        return Duration(milliseconds: 100);
      }
    }

    return animations.duration;
  }

  Curve getAnimationCurve(DSRoleVisibilityAnimations animations) {
    if (!animations.enableAnimations) return Curves.linear;
    return animations.curve;
  }

  BoxShadow getPlatformShadow(DSRoleVisibilityShadow shadow) {
    if (isWeb) {
      return BoxShadow(
        color: shadow.color.withValues(alpha: shadow.opacity * 0.8),
        blurRadius: shadow.blurRadius * 0.8,
        offset: shadow.offset,
        spreadRadius: shadow.spreadRadius * 0.8,
      );
    }

    if (isIOS) {
      return BoxShadow(
        color: shadow.color.withValues(alpha: shadow.opacity),
        blurRadius: shadow.blurRadius,
        offset: shadow.offset,
        spreadRadius: shadow.spreadRadius,
      );
    }

    // Android
    return BoxShadow(
      color: shadow.color.withValues(alpha: shadow.opacity * 1.2),
      blurRadius: shadow.blurRadius * 1.1,
      offset: shadow.offset,
      spreadRadius: shadow.spreadRadius,
    );
  }

  InputDecoration getPlatformInputDecoration(
    BuildContext context,
    DSRoleVisibilityInputDecoration decoration,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InputDecoration(
      labelText: decoration.labelText,
      hintText: decoration.hintText,
      helperText: decoration.helperText,
      errorText: decoration.errorText,
      prefixIcon: decoration.prefixIcon,
      suffixIcon: decoration.suffixIcon,
      filled: decoration.filled,
      fillColor: decoration.fillColor ?? colorScheme.surface,
      border: _getPlatformInputBorder(decoration.border),
      enabledBorder: _getPlatformInputBorder(decoration.enabledBorder),
      focusedBorder: _getPlatformInputBorder(decoration.focusedBorder),
      errorBorder: _getPlatformInputBorder(decoration.errorBorder),
      disabledBorder: _getPlatformInputBorder(decoration.disabledBorder),
      contentPadding: getPlatformPadding(decoration.contentPadding),
    );
  }

  InputBorder _getPlatformInputBorder(InputBorder? border) {
    if (border == null) return const OutlineInputBorder();

    if (border is OutlineInputBorder) {
      return border.copyWith(
        borderRadius: BorderRadius.circular(
          isIOS ? 8.0 : 4.0,
        ),
      );
    }

    return border;
  }

  SystemUiOverlayStyle getSystemUIOverlayStyle(
    BuildContext context,
    DSRoleVisibilityColors colors,
  ) {
    final brightness = Theme.of(context).brightness;

    if (isIOS) {
      return brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark;
    }

    return SystemUiOverlayStyle(
      statusBarColor: colors.backgroundColor?.withValues(alpha: 0.8),
      statusBarIconBrightness: brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
      systemNavigationBarColor: colors.backgroundColor,
      systemNavigationBarIconBrightness: brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
    );
  }

  Future<bool> checkPlatformPermissions(List<String> permissions) async {
    // Mock implementation - in real app, use permission_handler package
    return true;
  }

  String getPlatformSpecificMessage(String baseMessage) {
    if (isIOS) {
      return baseMessage.replaceAll('Tap', 'Touch');
    }
    if (isAndroid) {
      return baseMessage.replaceAll('Touch', 'Tap');
    }
    if (isWeb) {
      return baseMessage.replaceAll('Tap', 'Click');
    }
    return baseMessage;
  }

  void logPlatformInfo(String message) {
    if (kDebugMode) {
      final platform = isIOS ? 'iOS' : isAndroid ? 'Android' : isWeb ? 'Web' : 'Desktop';
      debugPrint('[DSRoleVisibility-$platform] $message');
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