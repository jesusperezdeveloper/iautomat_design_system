import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

import 'ds_accordion_config.dart';

class DSAccordionA11yHelper {
  static DSAccordionA11yHelper? _instance;

  DSAccordionA11yHelper._();

  factory DSAccordionA11yHelper() {
    return _instance ??= DSAccordionA11yHelper._();
  }

  String getAccordionSemanticLabel(DSAccordionConfig config) {
    final variant = config.variant == DSAccordionVariant.single
        ? 'acordeón simple'
        : 'acordeón múltiple';

    return 'Componente $variant';
  }

  String getItemSemanticLabel(
    DSAccordionItem item,
    bool isExpanded,
    DSAccordionConfig config,
  ) {
    final expandedText = isExpanded ? 'expandido' : 'contraído';
    return '${item.title}, $expandedText';
  }

  String getItemSemanticHint(
    DSAccordionItem item,
    bool isExpanded,
    DSAccordionConfig config,
  ) {
    if (config.state == DSAccordionState.disabled) {
      return config.accessibility?.disabledLabel ?? 'Deshabilitado';
    }

    if (config.state == DSAccordionState.loading) {
      return config.accessibility?.loadingLabel ?? 'Cargando';
    }

    final action = isExpanded ? 'contraer' : 'expandir';
    return 'Presiona para $action';
  }

  String getItemSemanticValue(
    DSAccordionItem item,
    bool isExpanded,
    DSAccordionConfig config,
  ) {
    return isExpanded
        ? config.accessibility?.expandedLabel ?? 'Expandido'
        : config.accessibility?.collapsedLabel ?? 'Contraído';
  }

  SemanticsProperties getAccordionSemantics(DSAccordionConfig config) {
    return SemanticsProperties(label: getAccordionSemanticLabel(config));
  }

  SemanticsProperties getItemSemantics(
    DSAccordionItem item,
    bool isExpanded,
    DSAccordionConfig config,
    VoidCallback? onTap,
  ) {
    final accessibility = config.accessibility!;

    return SemanticsProperties(
      button: accessibility.focusable,
      enabled: config.state != DSAccordionState.disabled,
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

  void announceStateChange(DSAccordionState state) {
    String message;

    switch (state) {
      case DSAccordionState.loading:
        message = 'Cargando';
        break;
      case DSAccordionState.disabled:
        message = 'Deshabilitado';
        break;
      case DSAccordionState.selected:
        message = 'Seleccionado';
        break;
      case DSAccordionState.focus:
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
    DSAccordionItem item,
    bool isExpanded,
    DSAccordionConfig config,
    VoidCallback? onTap,
  ) {
    if (!config.accessibility!.enabled) {
      return child;
    }

    final semantics = getItemSemantics(item, isExpanded, config, onTap);

    return Semantics.fromProperties(properties: semantics, child: child);
  }

  Widget wrapAccordionWithSemantics(Widget child, DSAccordionConfig config) {
    if (!config.accessibility!.enabled) {
      return child;
    }

    final semantics = getAccordionSemantics(config);

    return Semantics.fromProperties(properties: semantics, child: child);
  }

  FocusNode createFocusNode(String itemKey) {
    return FocusNode(
      debugLabel: 'DSAccordion_$itemKey',
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
    List<DSAccordionItem> items,
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
    List<DSAccordionItem> items,
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
    List<DSAccordionItem> items,
    Map<String, FocusNode> focusNodes,
  ) {
    final currentIndex = items.indexWhere((item) => (item.key) == currentKey);

    if (currentIndex > 0) {
      final previousKey = items[currentIndex - 1].key;
      requestFocus(focusNodes[previousKey]!);
    }
  }

  void _focusFirstItem(
    List<DSAccordionItem> items,
    Map<String, FocusNode> focusNodes,
  ) {
    if (items.isNotEmpty) {
      final firstKey = items.first.key;
      requestFocus(focusNodes[firstKey]!);
    }
  }

  void _focusLastItem(
    List<DSAccordionItem> items,
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
