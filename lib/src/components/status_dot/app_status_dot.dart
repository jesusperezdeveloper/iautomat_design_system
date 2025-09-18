import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Enumeración que define las variantes del status dot
enum StatusDotVariant {
  /// Indica éxito o estado positivo
  success,

  /// Indica información general
  info,

  /// Indica advertencia o precaución
  warn,

  /// Indica error o estado crítico
  error,
}

/// Enumeración que define los estados posibles del status dot
enum AppStatusDotState {
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
extension AppStatusDotStateExtension on AppStatusDotState {
  /// Verifica si el estado permite interacciones
  bool get canInteract =>
      this != AppStatusDotState.disabled && this != AppStatusDotState.loading;
}

/// Widget de status dot adaptable a diferentes plataformas
/// con soporte para Material 3, accesibilidad y RTL
class AppStatusDot extends StatefulWidget {
  /// Variante/tipo del status dot
  final StatusDotVariant status;

  /// Etiqueta descriptiva del estado
  final String? label;

  /// Estado actual del componente
  final AppStatusDotState state;

  /// Tamaño del dot
  final double size;

  /// Color personalizado del dot (sobrescribe el color del status)
  final Color? dotColor;

  /// Color personalizado del texto
  final Color? labelColor;

  /// Espaciado entre el dot y la etiqueta
  final double spacing;

  /// Padding interno
  final EdgeInsetsGeometry? padding;

  /// Mostrar animación pulsante
  final bool animate;

  /// Duración de la animación
  final Duration animationDuration;

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

  /// Callback cuando cambia el foco
  final ValueChanged<bool>? onFocusChange;

  /// Estilo de fuente personalizado para la etiqueta
  final TextStyle? labelStyle;

  /// Posición de la etiqueta respecto al dot
  final MainAxisAlignment alignment;

  /// Crea un AppStatusDot con configuración personalizable
  const AppStatusDot({
    super.key,
    required this.status,
    this.label,
    this.state = AppStatusDotState.defaultState,
    this.size = 8.0,
    this.dotColor,
    this.labelColor,
    this.spacing = 8.0,
    this.padding,
    this.animate = false,
    this.animationDuration = const Duration(milliseconds: 1000),
    this.rtlSupport = true,
    this.accessibilitySupport = true,
    this.accessibilityLabel,
    this.accessibilityHint,
    this.onTap,
    this.onHover,
    this.onFocusChange,
    this.labelStyle,
    this.alignment = MainAxisAlignment.start,
  });

  /// Factory constructor para crear un status dot de éxito
  factory AppStatusDot.success({
    Key? key,
    String? label,
    AppStatusDotState state = AppStatusDotState.defaultState,
    double size = 8.0,
    Color? dotColor,
    Color? labelColor,
    double spacing = 8.0,
    EdgeInsetsGeometry? padding,
    bool animate = false,
    Duration animationDuration = const Duration(milliseconds: 1000),
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    VoidCallback? onTap,
    VoidCallback? onHover,
    ValueChanged<bool>? onFocusChange,
    TextStyle? labelStyle,
    MainAxisAlignment alignment = MainAxisAlignment.start,
  }) {
    return AppStatusDot(
      key: key,
      status: StatusDotVariant.success,
      label: label,
      state: state,
      size: size,
      dotColor: dotColor,
      labelColor: labelColor,
      spacing: spacing,
      padding: padding,
      animate: animate,
      animationDuration: animationDuration,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onTap: onTap,
      onHover: onHover,
      onFocusChange: onFocusChange,
      labelStyle: labelStyle,
      alignment: alignment,
    );
  }

  /// Factory constructor para crear un status dot de información
  factory AppStatusDot.info({
    Key? key,
    String? label,
    AppStatusDotState state = AppStatusDotState.defaultState,
    double size = 8.0,
    Color? dotColor,
    Color? labelColor,
    double spacing = 8.0,
    EdgeInsetsGeometry? padding,
    bool animate = false,
    Duration animationDuration = const Duration(milliseconds: 1000),
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    VoidCallback? onTap,
    VoidCallback? onHover,
    ValueChanged<bool>? onFocusChange,
    TextStyle? labelStyle,
    MainAxisAlignment alignment = MainAxisAlignment.start,
  }) {
    return AppStatusDot(
      key: key,
      status: StatusDotVariant.info,
      label: label,
      state: state,
      size: size,
      dotColor: dotColor,
      labelColor: labelColor,
      spacing: spacing,
      padding: padding,
      animate: animate,
      animationDuration: animationDuration,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onTap: onTap,
      onHover: onHover,
      onFocusChange: onFocusChange,
      labelStyle: labelStyle,
      alignment: alignment,
    );
  }

  /// Factory constructor para crear un status dot de advertencia
  factory AppStatusDot.warn({
    Key? key,
    String? label,
    AppStatusDotState state = AppStatusDotState.defaultState,
    double size = 8.0,
    Color? dotColor,
    Color? labelColor,
    double spacing = 8.0,
    EdgeInsetsGeometry? padding,
    bool animate = false,
    Duration animationDuration = const Duration(milliseconds: 1000),
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    VoidCallback? onTap,
    VoidCallback? onHover,
    ValueChanged<bool>? onFocusChange,
    TextStyle? labelStyle,
    MainAxisAlignment alignment = MainAxisAlignment.start,
  }) {
    return AppStatusDot(
      key: key,
      status: StatusDotVariant.warn,
      label: label,
      state: state,
      size: size,
      dotColor: dotColor,
      labelColor: labelColor,
      spacing: spacing,
      padding: padding,
      animate: animate,
      animationDuration: animationDuration,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onTap: onTap,
      onHover: onHover,
      onFocusChange: onFocusChange,
      labelStyle: labelStyle,
      alignment: alignment,
    );
  }

  /// Factory constructor para crear un status dot de error
  factory AppStatusDot.error({
    Key? key,
    String? label,
    AppStatusDotState state = AppStatusDotState.defaultState,
    double size = 8.0,
    Color? dotColor,
    Color? labelColor,
    double spacing = 8.0,
    EdgeInsetsGeometry? padding,
    bool animate = false,
    Duration animationDuration = const Duration(milliseconds: 1000),
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    VoidCallback? onTap,
    VoidCallback? onHover,
    ValueChanged<bool>? onFocusChange,
    TextStyle? labelStyle,
    MainAxisAlignment alignment = MainAxisAlignment.start,
  }) {
    return AppStatusDot(
      key: key,
      status: StatusDotVariant.error,
      label: label,
      state: state,
      size: size,
      dotColor: dotColor,
      labelColor: labelColor,
      spacing: spacing,
      padding: padding,
      animate: animate,
      animationDuration: animationDuration,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onTap: onTap,
      onHover: onHover,
      onFocusChange: onFocusChange,
      labelStyle: labelStyle,
      alignment: alignment,
    );
  }

  /// Crea una copia del widget con los valores especificados sobrescritos
  AppStatusDot copyWith({
    StatusDotVariant? status,
    String? label,
    AppStatusDotState? state,
    double? size,
    Color? dotColor,
    Color? labelColor,
    double? spacing,
    EdgeInsetsGeometry? padding,
    bool? animate,
    Duration? animationDuration,
    bool? rtlSupport,
    bool? accessibilitySupport,
    String? accessibilityLabel,
    String? accessibilityHint,
    VoidCallback? onTap,
    VoidCallback? onHover,
    ValueChanged<bool>? onFocusChange,
    TextStyle? labelStyle,
    MainAxisAlignment? alignment,
  }) {
    return AppStatusDot(
      key: key,
      status: status ?? this.status,
      label: label ?? this.label,
      state: state ?? this.state,
      size: size ?? this.size,
      dotColor: dotColor ?? this.dotColor,
      labelColor: labelColor ?? this.labelColor,
      spacing: spacing ?? this.spacing,
      padding: padding ?? this.padding,
      animate: animate ?? this.animate,
      animationDuration: animationDuration ?? this.animationDuration,
      rtlSupport: rtlSupport ?? this.rtlSupport,
      accessibilitySupport: accessibilitySupport ?? this.accessibilitySupport,
      accessibilityLabel: accessibilityLabel ?? this.accessibilityLabel,
      accessibilityHint: accessibilityHint ?? this.accessibilityHint,
      onTap: onTap ?? this.onTap,
      onHover: onHover ?? this.onHover,
      onFocusChange: onFocusChange ?? this.onFocusChange,
      labelStyle: labelStyle ?? this.labelStyle,
      alignment: alignment ?? this.alignment,
    );
  }

  @override
  State<AppStatusDot> createState() => _AppStatusDotState();
}

class _AppStatusDotState extends State<AppStatusDot>
    with TickerProviderStateMixin {
  late AnimationController _pulseAnimationController;
  late Animation<double> _pulseAnimation;

  bool _isHovering = false;
  bool _isPressed = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    _pulseAnimationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.3,
    ).animate(CurvedAnimation(
      parent: _pulseAnimationController,
      curve: Curves.easeInOut,
    ));

    if (widget.animate) {
      _pulseAnimationController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(AppStatusDot oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate != oldWidget.animate) {
      if (widget.animate) {
        _pulseAnimationController.repeat(reverse: true);
      } else {
        _pulseAnimationController.stop();
      }
    }
  }

  @override
  void dispose() {
    _pulseAnimationController.dispose();
    super.dispose();
  }

  bool get _isInteractive =>
      widget.state.canInteract &&
      (widget.onTap != null || widget.onHover != null);

  AppStatusDotState get _currentState {
    if (widget.state != AppStatusDotState.defaultState) return widget.state;
    if (_isPressed) return AppStatusDotState.pressed;
    if (_isFocused) return AppStatusDotState.focus;
    if (_isHovering) return AppStatusDotState.hover;
    return AppStatusDotState.defaultState;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isRTL = widget.rtlSupport && Directionality.of(context) == TextDirection.rtl;

    Widget child = _buildStatusDotContent(context, theme, colorScheme, isRTL);

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

    return child;
  }

  Widget _buildStatusDotContent(
      BuildContext context, ThemeData theme, ColorScheme colorScheme, bool isRTL) {
    final dotColor = _getDotColor(colorScheme);
    final labelColor = _getLabelColor(theme, colorScheme);

    Widget dot = _buildDot(dotColor);

    if (widget.label == null) {
      return dot;
    }

    final labelWidget = _buildLabel(theme, labelColor);

    // Organizar el layout según RTL y alignment
    List<Widget> children;
    if (isRTL) {
      children = [labelWidget, SizedBox(width: widget.spacing), dot];
    } else {
      children = [dot, SizedBox(width: widget.spacing), labelWidget];
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: widget.alignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildDot(Color color) {
    Widget dot = Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );

    if (widget.animate) {
      dot = AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _pulseAnimation.value,
            child: dot,
          );
        },
      );
    }

    return dot;
  }

  Widget _buildLabel(ThemeData theme, Color color) {
    final defaultStyle = theme.textTheme.bodySmall?.copyWith(color: color);
    final effectiveStyle = widget.labelStyle?.copyWith(color: color) ?? defaultStyle;

    return Text(
      widget.label!,
      style: effectiveStyle,
    );
  }

  Color _getDotColor(ColorScheme colorScheme) {
    if (widget.dotColor != null) return widget.dotColor!;

    switch (widget.status) {
      case StatusDotVariant.success:
        return Colors.green;
      case StatusDotVariant.info:
        return colorScheme.primary;
      case StatusDotVariant.warn:
        return Colors.orange;
      case StatusDotVariant.error:
        return colorScheme.error;
    }
  }

  Color _getLabelColor(ThemeData theme, ColorScheme colorScheme) {
    return widget.labelColor ?? colorScheme.onSurface;
  }

  Widget _applyStateEffects(Widget child, ThemeData theme) {
    switch (_currentState) {
      case AppStatusDotState.hover:
        return Transform.scale(
          scale: 1.1,
          child: child,
        );
      case AppStatusDotState.pressed:
        return Transform.scale(
          scale: 0.95,
          child: child,
        );
      case AppStatusDotState.focus:
        return Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.colorScheme.primary.withValues(alpha: 0.7),
              width: 1,
            ),
          ),
          child: child,
        );
      case AppStatusDotState.disabled:
        return Opacity(
          opacity: 0.5,
          child: child,
        );
      case AppStatusDotState.selected:
        return Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
          ),
          child: child,
        );
      case AppStatusDotState.loading:
        return _buildLoadingChild(child);
      case AppStatusDotState.skeleton:
        return _buildSkeletonChild(child);
      case AppStatusDotState.defaultState:
        return child;
    }
  }

  Widget _buildLoadingChild(Widget child) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0.5,
          child: child,
        ),
        SizedBox(
          width: widget.size + 8,
          height: widget.size + 8,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            color: Theme.of(context).colorScheme.primary,
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
      onFocusChange: (isFocused) {
        _handleFocusChange(isFocused);
        widget.onFocusChange?.call(isFocused);
      },
      onKeyEvent: _handleKeyEvent,
      child: child,
    );
  }

  Widget _wrapWithSemantics(Widget child) {
    final statusDescription = _getStatusDescription();
    final label = widget.accessibilityLabel ??
                  (widget.label != null ? '$statusDescription ${widget.label}' : statusDescription);

    return Semantics(
      label: label,
      hint: widget.accessibilityHint ?? 'Status indicator',
      button: widget.onTap != null,
      focusable: _isInteractive,
      child: child,
    );
  }

  String _getStatusDescription() {
    switch (widget.status) {
      case StatusDotVariant.success:
        return 'Success status';
      case StatusDotVariant.info:
        return 'Info status';
      case StatusDotVariant.warn:
        return 'Warning status';
      case StatusDotVariant.error:
        return 'Error status';
    }
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