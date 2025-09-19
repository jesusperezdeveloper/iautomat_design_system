import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Enumeración que define las variantes del progress indicator
enum ProgressVariant {
  /// Progress indicator lineal (barra horizontal)
  linear,

  /// Progress indicator circular
  circular,
}

/// Enumeración que define los estados posibles del progress indicator
enum DSProgressState {
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
extension DSProgressStateExtension on DSProgressState {
  /// Verifica si el estado permite interacciones
  bool get canInteract =>
      this != DSProgressState.disabled && this != DSProgressState.loading;
}

/// Widget de progress indicator adaptable a diferentes plataformas
/// con soporte para Material 3, accesibilidad y RTL
class DSProgress extends StatefulWidget {
  /// Variante del progress indicator
  final ProgressVariant variant;

  /// Valor del progreso (0.0 a 1.0). Si es null, el indicator es indeterminado
  final double? value;

  /// Etiqueta descriptiva del progreso
  final String? label;

  /// Estado actual del componente
  final DSProgressState state;

  /// Color de fondo del progress indicator
  final Color? backgroundColor;

  /// Color del progreso
  final Color? valueColor;

  /// Color del texto de la etiqueta
  final Color? labelColor;

  /// Altura para progress linear (ignorado en circular)
  final double? strokeWidth;

  /// Radio para progress circular (ignorado en linear)
  final double? radius;

  /// Padding interno
  final EdgeInsetsGeometry? padding;

  /// Soporte para RTL
  final bool rtlSupport;

  /// Soporte para accesibilidad
  final bool accessibilitySupport;

  /// Etiqueta de accesibilidad personalizada
  final String? accessibilityLabel;

  /// Descripción de accesibilidad personalizada
  final String? accessibilityHint;

  /// Callback cuando se hace hover (desktop)
  final VoidCallback? onHover;

  /// Callback cuando se hace tap
  final VoidCallback? onTap;

  /// Duración de la animación
  final Duration animationDuration;

  /// Crea un DSProgress con configuración personalizable
  const DSProgress({
    super.key,
    this.variant = ProgressVariant.linear,
    this.value,
    this.label,
    this.state = DSProgressState.defaultState,
    this.backgroundColor,
    this.valueColor,
    this.labelColor,
    this.strokeWidth,
    this.radius,
    this.padding,
    this.rtlSupport = true,
    this.accessibilitySupport = true,
    this.accessibilityLabel,
    this.accessibilityHint,
    this.onHover,
    this.onTap,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  /// Factory constructor para crear un progress linear
  factory DSProgress.linear({
    Key? key,
    double? value,
    String? label,
    DSProgressState state = DSProgressState.defaultState,
    Color? backgroundColor,
    Color? valueColor,
    Color? labelColor,
    double? strokeWidth,
    EdgeInsetsGeometry? padding,
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    VoidCallback? onHover,
    VoidCallback? onTap,
    Duration animationDuration = const Duration(milliseconds: 200),
  }) {
    return DSProgress(
      key: key,
      variant: ProgressVariant.linear,
      value: value,
      label: label,
      state: state,
      backgroundColor: backgroundColor,
      valueColor: valueColor,
      labelColor: labelColor,
      strokeWidth: strokeWidth,
      padding: padding,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onHover: onHover,
      onTap: onTap,
      animationDuration: animationDuration,
    );
  }

  /// Factory constructor para crear un progress circular
  factory DSProgress.circular({
    Key? key,
    double? value,
    String? label,
    DSProgressState state = DSProgressState.defaultState,
    Color? backgroundColor,
    Color? valueColor,
    Color? labelColor,
    double? strokeWidth,
    double? radius,
    EdgeInsetsGeometry? padding,
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    VoidCallback? onHover,
    VoidCallback? onTap,
    Duration animationDuration = const Duration(milliseconds: 200),
  }) {
    return DSProgress(
      key: key,
      variant: ProgressVariant.circular,
      value: value,
      label: label,
      state: state,
      backgroundColor: backgroundColor,
      valueColor: valueColor,
      labelColor: labelColor,
      strokeWidth: strokeWidth,
      radius: radius,
      padding: padding,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onHover: onHover,
      onTap: onTap,
      animationDuration: animationDuration,
    );
  }

  /// Crea una copia del widget con los valores especificados sobrescritos
  DSProgress copyWith({
    ProgressVariant? variant,
    double? value,
    String? label,
    DSProgressState? state,
    Color? backgroundColor,
    Color? valueColor,
    Color? labelColor,
    double? strokeWidth,
    double? radius,
    EdgeInsetsGeometry? padding,
    bool? rtlSupport,
    bool? accessibilitySupport,
    String? accessibilityLabel,
    String? accessibilityHint,
    VoidCallback? onHover,
    VoidCallback? onTap,
    Duration? animationDuration,
  }) {
    return DSProgress(
      key: key,
      variant: variant ?? this.variant,
      value: value ?? this.value,
      label: label ?? this.label,
      state: state ?? this.state,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      valueColor: valueColor ?? this.valueColor,
      labelColor: labelColor ?? this.labelColor,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      radius: radius ?? this.radius,
      padding: padding ?? this.padding,
      rtlSupport: rtlSupport ?? this.rtlSupport,
      accessibilitySupport: accessibilitySupport ?? this.accessibilitySupport,
      accessibilityLabel: accessibilityLabel ?? this.accessibilityLabel,
      accessibilityHint: accessibilityHint ?? this.accessibilityHint,
      onHover: onHover ?? this.onHover,
      onTap: onTap ?? this.onTap,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }

  @override
  State<DSProgress> createState() => _DSProgressState();
}

class _DSProgressState extends State<DSProgress>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
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
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool get _isInteractive =>
      widget.state.canInteract &&
      (widget.onTap != null || widget.onHover != null);

  bool get _isIndeterminate => widget.value == null;

  DSProgressState get _currentState {
    if (widget.state != DSProgressState.defaultState) return widget.state;
    if (_isPressed) return DSProgressState.pressed;
    if (_isFocused) return DSProgressState.focus;
    if (_isHovering) return DSProgressState.hover;
    return DSProgressState.defaultState;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isRTL =
        widget.rtlSupport && Directionality.of(context) == TextDirection.rtl;

    Widget child = _buildProgressIndicator(context, theme, colorScheme);

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
    if (isRTL && widget.variant == ProgressVariant.linear) {
      child = Transform.scale(
        scaleX: -1.0,
        child: child,
      );
    }

    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, _) => Opacity(
        opacity: _fadeAnimation.value,
        child: child,
      ),
    );
  }

  Widget _buildProgressIndicator(
      BuildContext context, ThemeData theme, ColorScheme colorScheme) {
    final backgroundColor = widget.backgroundColor ??
        colorScheme.surfaceContainerHighest.withValues(alpha: 0.3);
    final valueColor = widget.valueColor ?? colorScheme.primary;

    switch (widget.variant) {
      case ProgressVariant.linear:
        return _buildLinearProgress(backgroundColor, valueColor);
      case ProgressVariant.circular:
        return _buildCircularProgress(backgroundColor, valueColor);
    }
  }

  Widget _buildLinearProgress(Color backgroundColor, Color valueColor) {
    final height = widget.strokeWidth ?? 4.0;

    Widget progress = SizedBox(
      height: height,
      child: LinearProgressIndicator(
        value: _isIndeterminate ? null : widget.value,
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
      ),
    );

    // Agregar etiqueta si existe
    if (widget.label != null) {
      final theme = Theme.of(context);
      final labelColor = widget.labelColor ?? theme.colorScheme.onSurface;
      final percentage =
          widget.value != null ? '${(widget.value! * 100).round()}%' : '';

      progress = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label!,
                style: theme.textTheme.bodySmall?.copyWith(color: labelColor),
              ),
              if (percentage.isNotEmpty)
                Text(
                  percentage,
                  style: theme.textTheme.bodySmall?.copyWith(color: labelColor),
                ),
            ],
          ),
          const SizedBox(height: 8),
          progress,
        ],
      );
    }

    return progress;
  }

  Widget _buildCircularProgress(Color backgroundColor, Color valueColor) {
    final size = (widget.radius ?? 20.0) * 2;
    final strokeWidth = widget.strokeWidth ?? 4.0;

    Widget progress = SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        value: _isIndeterminate ? null : widget.value,
        backgroundColor: backgroundColor,
        valueColor: AlwaysStoppedAnimation<Color>(valueColor),
        strokeWidth: strokeWidth,
      ),
    );

    // Agregar etiqueta si existe
    if (widget.label != null) {
      final theme = Theme.of(context);
      final labelColor = widget.labelColor ?? theme.colorScheme.onSurface;

      progress = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          progress,
          const SizedBox(height: 12),
          Text(
            widget.label!,
            style: theme.textTheme.bodySmall?.copyWith(color: labelColor),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    return progress;
  }

  Widget _applyStateEffects(Widget child, ThemeData theme) {
    switch (_currentState) {
      case DSProgressState.hover:
        return Transform.scale(
          scale: 1.02,
          child: child,
        );
      case DSProgressState.pressed:
        return Transform.scale(
          scale: 0.98,
          child: child,
        );
      case DSProgressState.focus:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: theme.colorScheme.primary.withValues(alpha: 0.7),
              width: 2,
            ),
          ),
          child: child,
        );
      case DSProgressState.disabled:
        return Opacity(
          opacity: 0.5,
          child: child,
        );
      case DSProgressState.selected:
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
          ),
          child: child,
        );
      case DSProgressState.loading:
        return _buildLoadingChild(child);
      case DSProgressState.skeleton:
        return _buildSkeletonChild(child);
      case DSProgressState.defaultState:
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
              width: 16,
              height: 16,
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
        borderRadius: BorderRadius.circular(8),
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
      child: child,
    );
  }

  Widget _wrapWithSemantics(Widget child) {
    final percentage =
        widget.value != null ? '${(widget.value! * 100).round()}%' : 'loading';

    return Semantics(
      label: widget.accessibilityLabel ?? widget.label ?? 'Progress indicator',
      value: percentage,
      hint:
          widget.accessibilityHint ?? 'Shows current progress of an operation',
      child: child,
    );
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
