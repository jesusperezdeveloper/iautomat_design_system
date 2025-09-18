import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

import 'app_accordion_config.dart';

class AppAccordionA11yHelper {
  static AppAccordionA11yHelper? _instance;

  AppAccordionA11yHelper._();

  factory AppAccordionA11yHelper() {
    return _instance ??= AppAccordionA11yHelper._();
  }

  String getAccordionSemanticLabel(AppAccordionConfig config) {
    final variant = config.variant == AppAccordionVariant.single
        ? 'acordeón simple'
        : 'acordeón múltiple';

    return 'Componente $variant';
  }

  String getItemSemanticLabel(
    AppAccordionItem item,
    bool isExpanded,
    AppAccordionConfig config,
  ) {
    final expandedText = isExpanded ? 'expandido' : 'contraído';
    return '${item.title}, $expandedText';
  }

  String getItemSemanticHint(
    AppAccordionItem item,
    bool isExpanded,
    AppAccordionConfig config,
  ) {
    if (config.state == AppAccordionState.disabled) {
      return config.accessibility?.disabledLabel ?? 'Deshabilitado';
    }

    if (config.state == AppAccordionState.loading) {
      return config.accessibility?.loadingLabel ?? 'Cargando';
    }

    final action = isExpanded ? 'contraer' : 'expandir';
    return 'Presiona para $action';
  }

  String getItemSemanticValue(
    AppAccordionItem item,
    bool isExpanded,
    AppAccordionConfig config,
  ) {
    return isExpanded
        ? config.accessibility?.expandedLabel ?? 'Expandido'
        : config.accessibility?.collapsedLabel ?? 'Contraído';
  }

  SemanticsProperties getAccordionSemantics(AppAccordionConfig config) {
    return SemanticsProperties(label: getAccordionSemanticLabel(config));
  }

  SemanticsProperties getItemSemantics(
    AppAccordionItem item,
    bool isExpanded,
    AppAccordionConfig config,
    VoidCallback? onTap,
  ) {
    final accessibility = config.accessibility!;

    return SemanticsProperties(
      button: accessibility.focusable,
      enabled: config.state != AppAccordionState.disabled,
      expanded: isExpanded,
      label: getItemSemanticLabel(item, isExpanded, config),
      hint: getItemSemanticHint(item, isExpanded, config),
      value: getItemSemanticValue(item, isExpanded, config),
      onTap: onTap,
      onIncrease: !isExpanded ? onTap : null,
      onDecrease: isExpanded ? onTap : null,
    );
  }

  void announceExpansionChange(String itemKey, bool expanded) {
    final message = expanded
        ? 'Elemento $itemKey expandido'
        : 'Elemento $itemKey contraído';

    SemanticsService.announce(message, TextDirection.ltr);
  }

  void announceStateChange(AppAccordionState state) {
    String message;

    switch (state) {
      case AppAccordionState.loading:
        message = 'Cargando';
        break;
      case AppAccordionState.disabled:
        message = 'Deshabilitado';
        break;
      case AppAccordionState.selected:
        message = 'Seleccionado';
        break;
      case AppAccordionState.focus:
        message = 'Enfocado';
        break;
      default:
        return;
    }

    SemanticsService.announce(message, TextDirection.ltr);
  }

  void announceNavigationHint() {
    const message =
        'Usa las flechas arriba y abajo para navegar entre elementos. '
        'Presiona Enter o Espacio para expandir o contraer.';

    SemanticsService.announce(message, TextDirection.ltr);
  }

  Widget wrapWithSemantics(
    Widget child,
    AppAccordionItem item,
    bool isExpanded,
    AppAccordionConfig config,
    VoidCallback? onTap,
  ) {
    if (!config.accessibility!.enabled) {
      return child;
    }

    final semantics = getItemSemantics(item, isExpanded, config, onTap);

    return Semantics.fromProperties(properties: semantics, child: child);
  }

  Widget wrapAccordionWithSemantics(Widget child, AppAccordionConfig config) {
    if (!config.accessibility!.enabled) {
      return child;
    }

    final semantics = getAccordionSemantics(config);

    return Semantics.fromProperties(properties: semantics, child: child);
  }

  FocusNode createFocusNode(String itemKey) {
    return FocusNode(
      debugLabel: 'AppAccordion_$itemKey',
      canRequestFocus: true,
    );
  }

  void requestFocus(FocusNode focusNode) {
    if (focusNode.canRequestFocus) {
      focusNode.requestFocus();
    }
  }

  void handleKeyboardNavigation(
    LogicalKeyboardKey key,
    String currentItemKey,
    List<AppAccordionItem> items,
    Map<String, FocusNode> focusNodes,
    Function(String, bool) onExpansionChanged,
    Set<String> expandedKeys,
  ) {
    switch (key) {
      case LogicalKeyboardKey.enter:
      case LogicalKeyboardKey.space:
        final isExpanded = expandedKeys.contains(currentItemKey);
        onExpansionChanged(currentItemKey, !isExpanded);
        break;

      case LogicalKeyboardKey.arrowDown:
        _focusNextItem(currentItemKey, items, focusNodes);
        break;

      case LogicalKeyboardKey.arrowUp:
        _focusPreviousItem(currentItemKey, items, focusNodes);
        break;

      case LogicalKeyboardKey.home:
        _focusFirstItem(items, focusNodes);
        break;

      case LogicalKeyboardKey.end:
        _focusLastItem(items, focusNodes);
        break;

      case LogicalKeyboardKey.escape:
        _clearFocus(focusNodes);
        break;
    }
  }

  void _focusNextItem(
    String currentKey,
    List<AppAccordionItem> items,
    Map<String, FocusNode> focusNodes,
  ) {
    final currentIndex = items.indexWhere((item) => (item.key) == currentKey);

    if (currentIndex < items.length - 1) {
      final nextKey = items[currentIndex + 1].key;
      requestFocus(focusNodes[nextKey]!);
    }
  }

  void _focusPreviousItem(
    String currentKey,
    List<AppAccordionItem> items,
    Map<String, FocusNode> focusNodes,
  ) {
    final currentIndex = items.indexWhere((item) => (item.key) == currentKey);

    if (currentIndex > 0) {
      final previousKey = items[currentIndex - 1].key;
      requestFocus(focusNodes[previousKey]!);
    }
  }

  void _focusFirstItem(
    List<AppAccordionItem> items,
    Map<String, FocusNode> focusNodes,
  ) {
    if (items.isNotEmpty) {
      final firstKey = items.first.key;
      requestFocus(focusNodes[firstKey]!);
    }
  }

  void _focusLastItem(
    List<AppAccordionItem> items,
    Map<String, FocusNode> focusNodes,
  ) {
    if (items.isNotEmpty) {
      final lastKey = items.last.key;
      requestFocus(focusNodes[lastKey]!);
    }
  }

  void _clearFocus(Map<String, FocusNode> focusNodes) {
    for (final focusNode in focusNodes.values) {
      if (focusNode.hasFocus) {
        focusNode.unfocus();
        break;
      }
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

  void dispose(Map<String, FocusNode> focusNodes) {
    for (final focusNode in focusNodes.values) {
      focusNode.dispose();
    }
    focusNodes.clear();
  }
}
