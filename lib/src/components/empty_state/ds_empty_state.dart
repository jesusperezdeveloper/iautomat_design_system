import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Enumeración que define las variantes del empty state
enum EmptyStateVariant {
  /// Empty state con ilustración prominente
  illustration,

  /// Empty state enfocado en call-to-action
  cta,
}

/// Enumeración que define los estados posibles del empty state
enum DSEmptyStateState {
  /// Estado por defecto
  defaultState,

  /// Estado cuando el cursor está sobre el componente
  hover,

  /// Estado cuando el componente está siendo presionado
  pressed,

  /// Estado cuando el componente tiene foco
  focus,

  /// Estado cuando el componente está seleccionado
  selected,

  /// Estado cuando el componente está deshabilitado
  disabled,

  /// Estado de carga
  loading,

  /// Estado esqueleto para loading placeholders
  skeleton,
}

/// Extension para verificar si un estado puede interactuar
extension DSEmptyStateStateExtension on DSEmptyStateState {
  /// Verifica si el estado permite interacciones
  bool get canInteract =>
      this != DSEmptyStateState.disabled && this != DSEmptyStateState.loading;
}

/// Representa una acción del empty state
class EmptyStateAction {
  /// Texto del botón/acción
  final String text;

  /// Callback cuando se ejecuta la acción
  final VoidCallback? onPressed;

  /// Icono opcional para la acción
  final IconData? icon;

  /// Si la acción es primaria (button style)
  final bool isPrimary;

  /// Si la acción está deshabilitada
  final bool isEnabled;

  const EmptyStateAction({
    required this.text,
    this.onPressed,
    this.icon,
    this.isPrimary = false,
    this.isEnabled = true,
  });
}

/// Widget de empty state adaptable a diferentes plataformas
/// con soporte para Material 3, accesibilidad y RTL
class DSEmptyState extends StatefulWidget {
  /// Variante del empty state
  final EmptyStateVariant variant;

  /// Título principal
  final String title;

  /// Descripción o subtítulo
  final String? description;

  /// Lista de acciones disponibles
  final List<EmptyStateAction> actions;

  /// Estado actual del componente
  final DSEmptyStateState state;

  /// Widget de ilustración personalizada
  final Widget? illustration;

  /// Icono por defecto cuando no hay ilustración
  final IconData? defaultIcon;

  /// Color del título
  final Color? titleColor;

  /// Color de la descripción
  final Color? descriptionColor;

  /// Color de fondo del componente
  final Color? backgroundColor;

  /// Padding interno
  final EdgeInsetsGeometry? padding;

  /// Espaciado entre elementos
  final double spacing;

  /// Soporte para RTL
  final bool rtlSupport;

  /// Soporte para accesibilidad
  final bool accessibilitySupport;

  /// Etiqueta de accesibilidad personalizada
  final String? accessibilityLabel;

  /// Descripción de accesibilidad personalizada
  final String? accessibilityHint;

  /// Callback cuando se hace tap en el componente
  final VoidCallback? onTap;

  /// Callback cuando se hace hover (desktop)
  final VoidCallback? onHover;

  /// Duración de la animación
  final Duration animationDuration;

  /// Tamaño máximo del contenido
  final double maxWidth;

  /// Alineación del contenido
  final CrossAxisAlignment alignment;

  /// Crea un DSEmptyState con configuración personalizable
  const DSEmptyState({
    super.key,
    this.variant = EmptyStateVariant.illustration,
    required this.title,
    this.description,
    this.actions = const [],
    this.state = DSEmptyStateState.defaultState,
    this.illustration,
    this.defaultIcon,
    this.titleColor,
    this.descriptionColor,
    this.backgroundColor,
    this.padding,
    this.spacing = 16.0,
    this.rtlSupport = true,
    this.accessibilitySupport = true,
    this.accessibilityLabel,
    this.accessibilityHint,
    this.onTap,
    this.onHover,
    this.animationDuration = const Duration(milliseconds: 200),
    this.maxWidth = 400.0,
    this.alignment = CrossAxisAlignment.center,
  });

  /// Factory constructor para crear un empty state con ilustración
  factory DSEmptyState.illustration({
    Key? key,
    required String title,
    String? description,
    List<EmptyStateAction> actions = const [],
    DSEmptyStateState state = DSEmptyStateState.defaultState,
    Widget? illustration,
    IconData? defaultIcon,
    Color? titleColor,
    Color? descriptionColor,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    double spacing = 20.0,
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    VoidCallback? onTap,
    VoidCallback? onHover,
    Duration animationDuration = const Duration(milliseconds: 200),
    double maxWidth = 400.0,
    CrossAxisAlignment alignment = CrossAxisAlignment.center,
  }) {
    return DSEmptyState(
      key: key,
      variant: EmptyStateVariant.illustration,
      title: title,
      description: description,
      actions: actions,
      state: state,
      illustration: illustration,
      defaultIcon: defaultIcon ?? Icons.inbox_outlined,
      titleColor: titleColor,
      descriptionColor: descriptionColor,
      backgroundColor: backgroundColor,
      padding: padding,
      spacing: spacing,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onTap: onTap,
      onHover: onHover,
      animationDuration: animationDuration,
      maxWidth: maxWidth,
      alignment: alignment,
    );
  }

  /// Factory constructor para crear un empty state enfocado en CTA
  factory DSEmptyState.cta({
    Key? key,
    required String title,
    String? description,
    List<EmptyStateAction> actions = const [],
    DSEmptyStateState state = DSEmptyStateState.defaultState,
    Widget? illustration,
    IconData? defaultIcon,
    Color? titleColor,
    Color? descriptionColor,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    double spacing = 12.0,
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    VoidCallback? onTap,
    VoidCallback? onHover,
    Duration animationDuration = const Duration(milliseconds: 200),
    double maxWidth = 350.0,
    CrossAxisAlignment alignment = CrossAxisAlignment.center,
  }) {
    return DSEmptyState(
      key: key,
      variant: EmptyStateVariant.cta,
      title: title,
      description: description,
      actions: actions,
      state: state,
      illustration: illustration,
      defaultIcon: defaultIcon ?? Icons.add_circle_outline,
      titleColor: titleColor,
      descriptionColor: descriptionColor,
      backgroundColor: backgroundColor,
      padding: padding,
      spacing: spacing,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onTap: onTap,
      onHover: onHover,
      animationDuration: animationDuration,
      maxWidth: maxWidth,
      alignment: alignment,
    );
  }

  /// Crea una copia del widget con los valores especificados sobrescritos
  DSEmptyState copyWith({
    EmptyStateVariant? variant,
    String? title,
    String? description,
    List<EmptyStateAction>? actions,
    DSEmptyStateState? state,
    Widget? illustration,
    IconData? defaultIcon,
    Color? titleColor,
    Color? descriptionColor,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    double? spacing,
    bool? rtlSupport,
    bool? accessibilitySupport,
    String? accessibilityLabel,
    String? accessibilityHint,
    VoidCallback? onTap,
    VoidCallback? onHover,
    Duration? animationDuration,
    double? maxWidth,
    CrossAxisAlignment? alignment,
  }) {
    return DSEmptyState(
      key: key,
      variant: variant ?? this.variant,
      title: title ?? this.title,
      description: description ?? this.description,
      actions: actions ?? this.actions,
      state: state ?? this.state,
      illustration: illustration ?? this.illustration,
      defaultIcon: defaultIcon ?? this.defaultIcon,
      titleColor: titleColor ?? this.titleColor,
      descriptionColor: descriptionColor ?? this.descriptionColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      padding: padding ?? this.padding,
      spacing: spacing ?? this.spacing,
      rtlSupport: rtlSupport ?? this.rtlSupport,
      accessibilitySupport: accessibilitySupport ?? this.accessibilitySupport,
      accessibilityLabel: accessibilityLabel ?? this.accessibilityLabel,
      accessibilityHint: accessibilityHint ?? this.accessibilityHint,
      onTap: onTap ?? this.onTap,
      onHover: onHover ?? this.onHover,
      animationDuration: animationDuration ?? this.animationDuration,
      maxWidth: maxWidth ?? this.maxWidth,
      alignment: alignment ?? this.alignment,
    );
  }

  @override
  State<DSEmptyState> createState() => _DSEmptyStateState();
}

class _DSEmptyStateState extends State<DSEmptyState>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  bool _isHovering = false;
  bool _isPressed = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(_animationController);
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool get _isInteractive =>
      widget.state.canInteract &&
      (widget.onTap != null ||
          widget.onHover != null ||
          widget.actions.isNotEmpty);

  DSEmptyStateState get _currentState {
    if (widget.state != DSEmptyStateState.defaultState) return widget.state;
    if (_isPressed) return DSEmptyStateState.pressed;
    if (_isFocused) return DSEmptyStateState.focus;
    if (_isHovering) return DSEmptyStateState.hover;
    return DSEmptyStateState.defaultState;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isRTL =
        widget.rtlSupport && Directionality.of(context) == TextDirection.rtl;

    Widget child = _buildEmptyStateContent(context, theme, colorScheme);

    // Aplicar efectos de estado
    child = _applyStateEffects(child, theme);

    // Agregar interactividad si es necesario
    if (_isInteractive) {
      child = _wrapWithInteractivity(child);
    }

    // Agregar accesibilidad
    if (widget.accessibilitySupport) {
      child = _wrapWithSemantics(child);
    }

    // Aplicar padding
    if (widget.padding != null) {
      child = Padding(
        padding: widget.padding!,
        child: child,
      );
    }

    // Soporte RTL
    if (isRTL) {
      child = Directionality(
        textDirection: TextDirection.rtl,
        child: child,
      );
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) => Opacity(
        opacity: _fadeAnimation.value,
        child: Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        ),
      ),
    );
  }

  Widget _buildEmptyStateContent(
      BuildContext context, ThemeData theme, ColorScheme colorScheme) {
    return Container(
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
      decoration: widget.backgroundColor != null
          ? BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(12),
            )
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: widget.alignment,
        children: [
          if (widget.variant == EmptyStateVariant.illustration)
            _buildIllustration(theme, colorScheme),
          _buildContent(theme, colorScheme),
          if (widget.actions.isNotEmpty) _buildActions(theme, colorScheme),
        ],
      ),
    );
  }

  Widget _buildIllustration(ThemeData theme, ColorScheme colorScheme) {
    final illustrationSize =
        widget.variant == EmptyStateVariant.illustration ? 120.0 : 60.0;

    Widget illustration = widget.illustration ??
        Icon(
          widget.defaultIcon ?? Icons.inbox_outlined,
          size: illustrationSize,
          color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
        );

    return Padding(
      padding: EdgeInsets.only(bottom: widget.spacing),
      child: illustration,
    );
  }

  Widget _buildContent(ThemeData theme, ColorScheme colorScheme) {
    final titleColor = widget.titleColor ?? colorScheme.onSurface;
    final descriptionColor =
        widget.descriptionColor ?? colorScheme.onSurfaceVariant;

    final titleStyle = widget.variant == EmptyStateVariant.illustration
        ? theme.textTheme.headlineSmall
        : theme.textTheme.titleLarge;

    final descriptionStyle = widget.variant == EmptyStateVariant.illustration
        ? theme.textTheme.bodyLarge
        : theme.textTheme.bodyMedium;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: widget.alignment,
      children: [
        Text(
          widget.title,
          style: titleStyle?.copyWith(
            color: titleColor,
            fontWeight: FontWeight.w600,
          ),
          textAlign: _getTextAlign(),
        ),
        if (widget.description != null) ...[
          SizedBox(height: widget.spacing * 0.5),
          Text(
            widget.description!,
            style: descriptionStyle?.copyWith(color: descriptionColor),
            textAlign: _getTextAlign(),
          ),
        ],
      ],
    );
  }

  Widget _buildActions(ThemeData theme, ColorScheme colorScheme) {
    final actionsSpacing = widget.variant == EmptyStateVariant.cta ? 8.0 : 12.0;

    return Padding(
      padding: EdgeInsets.only(top: widget.spacing),
      child: Wrap(
        spacing: actionsSpacing,
        runSpacing: actionsSpacing,
        alignment: _getWrapAlignment(),
        children: widget.actions
            .map((action) => _buildActionButton(action, theme))
            .toList(),
      ),
    );
  }

  Widget _buildActionButton(EmptyStateAction action, ThemeData theme) {
    if (action.isPrimary) {
      return ElevatedButton.icon(
        onPressed: action.isEnabled ? action.onPressed : null,
        icon: action.icon != null ? Icon(action.icon) : null,
        label: Text(action.text),
      );
    } else {
      return action.icon != null
          ? TextButton.icon(
              onPressed: action.isEnabled ? action.onPressed : null,
              icon: Icon(action.icon),
              label: Text(action.text),
            )
          : TextButton(
              onPressed: action.isEnabled ? action.onPressed : null,
              child: Text(action.text),
            );
    }
  }

  TextAlign _getTextAlign() {
    switch (widget.alignment) {
      case CrossAxisAlignment.start:
        return TextAlign.start;
      case CrossAxisAlignment.end:
        return TextAlign.end;
      case CrossAxisAlignment.center:
      default:
        return TextAlign.center;
    }
  }

  WrapAlignment _getWrapAlignment() {
    switch (widget.alignment) {
      case CrossAxisAlignment.start:
        return WrapAlignment.start;
      case CrossAxisAlignment.end:
        return WrapAlignment.end;
      case CrossAxisAlignment.center:
      default:
        return WrapAlignment.center;
    }
  }

  Widget _applyStateEffects(Widget child, ThemeData theme) {
    switch (_currentState) {
      case DSEmptyStateState.hover:
        return Transform.scale(
          scale: 1.02,
          child: child,
        );
      case DSEmptyStateState.pressed:
        return Transform.scale(
          scale: 0.98,
          child: child,
        );
      case DSEmptyStateState.focus:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.colorScheme.primary.withValues(alpha: 0.7),
              width: 2,
            ),
          ),
          child: child,
        );
      case DSEmptyStateState.disabled:
        return Opacity(
          opacity: 0.5,
          child: child,
        );
      case DSEmptyStateState.selected:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
          ),
          child: child,
        );
      case DSEmptyStateState.loading:
        return _buildLoadingChild(child);
      case DSEmptyStateState.skeleton:
        return _buildSkeletonChild(child);
      case DSEmptyStateState.defaultState:
        return child;
    }
  }

  Widget _buildLoadingChild(Widget child) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: child,
        ),
        Positioned.fill(
          child: Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkeletonChild(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  Widget _wrapWithInteractivity(Widget child) {
    final isDesktop = kIsWeb ||
        (!kIsWeb &&
            (Platform.isWindows || Platform.isMacOS || Platform.isLinux));

    if (isDesktop) {
      child = MouseRegion(
        onEnter: (_) => _handleHoverChange(true),
        onExit: (_) => _handleHoverChange(false),
        child: child,
      );
    }

    if (widget.onTap != null) {
      child = GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => _handlePressedChange(true),
        onTapUp: (_) => _handlePressedChange(false),
        onTapCancel: () => _handlePressedChange(false),
        child: child,
      );
    }

    return Focus(
      onFocusChange: _handleFocusChange,
      onKeyEvent: _handleKeyEvent,
      child: child,
    );
  }

  Widget _wrapWithSemantics(Widget child) {
    final actionsText = widget.actions.isNotEmpty
        ? 'Available actions: ${widget.actions.map((a) => a.text).join(', ')}'
        : '';

    return Semantics(
      label: widget.accessibilityLabel ?? widget.title,
      value: widget.description ?? '',
      hint: widget.accessibilityHint ?? 'Empty state screen. $actionsText',
      button: widget.onTap != null,
      child: child,
    );
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.enter ||
          event.logicalKey == LogicalKeyboardKey.space) {
        widget.onTap?.call();
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  void _handleHoverChange(bool isHovering) {
    if (!_isInteractive) return;

    setState(() {
      _isHovering = isHovering;
    });

    if (isHovering) {
      widget.onHover?.call();
    }
  }

  void _handlePressedChange(bool isPressed) {
    if (!_isInteractive) return;

    setState(() {
      _isPressed = isPressed;
    });
  }

  void _handleFocusChange(bool isFocused) {
    if (!_isInteractive) return;

    setState(() {
      _isFocused = isFocused;
    });
  }
}
