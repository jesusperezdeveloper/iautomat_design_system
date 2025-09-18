import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_role_visibility_config.dart';

class AppRoleVisibilityA11yHelper {
  final AppRoleVisibilityConfig config;
  final void Function(String)? onAnnouncementRequested;

  AppRoleVisibilityA11yHelper({
    required this.config,
    this.onAnnouncementRequested,
  });

  void announceVisibilityChange(AppRoleEvaluationResult result) {
    if (config.accessibility?.enableA11yAnnouncements != true) return;

    String message;
    if (result.hasAccess) {
      message = config.accessibility?.accessGrantedMessage ?? 'Access granted';
    } else {
      message = config.accessibility?.accessDeniedMessage ??
                 result.error?.message ??
                 'Access denied';
    }

    onAnnouncementRequested?.call(message);
  }

  void announceRoleChange(List<AppRole> newRoles) {
    if (config.accessibility?.enableA11yAnnouncements != true) return;

    final message = config.accessibility?.roleChangeMessage ??
                   'User roles updated: ${newRoles.map((r) => r.displayName ?? r.name).join(', ')}';

    onAnnouncementRequested?.call(message);
  }

  void announceError(AppRoleValidationError error) {
    if (config.accessibility?.enableA11yAnnouncements != true) return;

    final message = config.accessibility?.errorAnnouncementMessage ??
                   'Error: ${error.message}';

    onAnnouncementRequested?.call(message);
  }

  String getAccessibilityLabel(AppRole role) {
    if (role.accessibility?.label != null) {
      return role.accessibility!.label!;
    }

    final level = role.level != null ? ' level ${role.level}' : '';
    return '${role.displayName ?? role.name}$level role';
  }

  String getAccessibilityHint(AppRole role) {
    if (role.accessibility?.hint != null) {
      return role.accessibility!.hint!;
    }

    switch (role.type) {
      case AppRoleType.user:
        return 'Basic user access level';
      case AppRoleType.admin:
        return 'Administrative access level';
      case AppRoleType.editor:
        return 'Content editing access level';
      case AppRoleType.moderator:
        return 'Content moderation access level';
      case AppRoleType.guest:
        return 'Limited guest access';
      case AppRoleType.custom:
        return 'Custom role with specific permissions';
    }
  }

  String getAccessibilityValue(AppRole role) {
    if (role.accessibility?.value != null) {
      return role.accessibility!.value!;
    }

    final permissions = role.permissions;
    if (permissions.isNotEmpty) {
      return 'Permissions: ${permissions.join(', ')}';
    }

    return 'No specific permissions defined';
  }

  Widget wrapWithAccessibility({
    required Widget child,
    required AppRole role,
    bool excludeSemantics = false,
    VoidCallback? onTap,
  }) {
    if (excludeSemantics) {
      return ExcludeSemantics(child: child);
    }

    return Semantics(
      label: getAccessibilityLabel(role),
      hint: getAccessibilityHint(role),
      value: getAccessibilityValue(role),
      button: onTap != null,
      enabled: role.enabled,
      focusable: role.accessibility?.focusable ?? true,
      onTap: onTap,
      child: child,
    );
  }

  Widget buildFocusableWrapper({
    required Widget child,
    required AppRole role,
    FocusNode? focusNode,
    VoidCallback? onFocusChange,
    bool autofocus = false,
  }) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      onFocusChange: (hasFocus) {
        if (hasFocus && config.accessibility?.enableA11yAnnouncements == true) {
          final message = 'Focused on ${getAccessibilityLabel(role)}';
          onAnnouncementRequested?.call(message);
        }
        onFocusChange?.call();
      },
      child: wrapWithAccessibility(
        role: role,
        child: child,
      ),
    );
  }

  KeyEventResult handleKeyboardNavigation(
    FocusNode node,
    KeyEvent event,
    List<AppRole> availableRoles,
    int currentIndex,
    void Function(int) onIndexChanged,
  ) {
    if (event is! KeyDownEvent) {
      return KeyEventResult.ignored;
    }

    final key = event.logicalKey;

    if (key == LogicalKeyboardKey.arrowUp || key == LogicalKeyboardKey.arrowLeft) {
      final newIndex = currentIndex > 0 ? currentIndex - 1 : availableRoles.length - 1;
      onIndexChanged(newIndex);
      return KeyEventResult.handled;
    }

    if (key == LogicalKeyboardKey.arrowDown || key == LogicalKeyboardKey.arrowRight) {
      final newIndex = currentIndex < availableRoles.length - 1 ? currentIndex + 1 : 0;
      onIndexChanged(newIndex);
      return KeyEventResult.handled;
    }

    if (key == LogicalKeyboardKey.home) {
      onIndexChanged(0);
      return KeyEventResult.handled;
    }

    if (key == LogicalKeyboardKey.end) {
      onIndexChanged(availableRoles.length - 1);
      return KeyEventResult.handled;
    }

    if (key == LogicalKeyboardKey.enter || key == LogicalKeyboardKey.space) {
      // Trigger selection or action
      if (config.accessibility?.enableA11yAnnouncements == true) {
        final role = availableRoles[currentIndex];
        final message = 'Selected ${getAccessibilityLabel(role)}';
        onAnnouncementRequested?.call(message);
      }
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  Widget buildScreenReaderContent({
    required AppRoleEvaluationResult result,
    required Widget visibleChild,
  }) {
    if (!result.hasAccess) {
      return Semantics(
        label: 'Content hidden due to insufficient permissions',
        hint: result.error?.message ?? 'Access denied',
        hidden: true,
        child: visibleChild,
      );
    }

    return Semantics(
      label: 'Content visible with current permissions',
      hint: 'Matched roles: ${result.matchedRoles.map((r) => getAccessibilityLabel(r)).join(', ')}',
      child: visibleChild,
    );
  }

  List<Widget> buildAccessibilityActions(
    List<AppRole> roles,
    void Function(AppRole) onRoleSelected,
  ) {
    return roles.map((role) {
      return const SizedBox.shrink();
    }).toList();
  }

  double getAccessibilityPriority(AppRole role) {
    final importance = role.importance ?? AppRoleImportance.medium;

    switch (importance) {
      case AppRoleImportance.low:
        return 25.0;
      case AppRoleImportance.medium:
        return 50.0;
      case AppRoleImportance.high:
        return 75.0;
      case AppRoleImportance.critical:
        return 100.0;
    }
  }

  bool shouldAnnounceRole(AppRole role) {
    if (config.accessibility?.enableA11yAnnouncements != true) return false;

    final importance = role.importance ?? AppRoleImportance.medium;
    return importance.index >= AppRoleImportance.high.index;
  }

  void announceDebugInfo(AppRoleEvaluationResult result) {
    if (config.behavior?.enableDebugMode != true) return;
    if (config.accessibility?.enableA11yAnnouncements != true) return;

    final debugMessage = 'Debug: ${result.matchedRoles.length} roles matched, '
                        'access ${result.hasAccess ? 'granted' : 'denied'}';

    onAnnouncementRequested?.call(debugMessage);
  }

  Widget buildHighContrastWrapper({
    required Widget child,
    required AppRole role,
  }) {
    return Builder(
      builder: (context) {
        final mediaQuery = MediaQuery.of(context);
        final highContrast = mediaQuery.highContrast;

        if (!highContrast) return child;

        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: child,
        );
      },
    );
  }

  Widget buildReducedMotionWrapper({
    required Widget child,
    required Animation<double> animation,
  }) {
    return Builder(
      builder: (context) {
        final mediaQuery = MediaQuery.of(context);
        final reduceMotion = mediaQuery.disableAnimations;

        if (reduceMotion) {
          return child;
        }

        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) => child ?? const SizedBox.shrink(),
          child: child,
        );
      },
    );
  }
}

class SubmitFormIntent extends Intent {
  const SubmitFormIntent();
}

class CancelIntent extends Intent {
  const CancelIntent();
}