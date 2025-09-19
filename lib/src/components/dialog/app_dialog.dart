import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Enumeración que define las variantes del dialog
enum DialogVariant {
  /// Dialog pequeño para confirmaciones simples
  sm,

  /// Dialog mediano para contenido estándar
  md,

  /// Dialog grande para contenido extenso
  lg,

  /// Dialog para acciones destructivas/peligrosas
  destructive,

  /// Dialog optimizado para formularios
  form,
}

/// Enumeración que define los estados posibles del dialog
enum DSDialogState {
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
extension DSDialogStateExtension on DSDialogState {
  /// Verifica si el estado permite interacciones
  bool get canInteract => !{
        DSDialogState.disabled,
        DSDialogState.loading,
        DSDialogState.skeleton,
      }.contains(this);
}

/// Clase que representa una acción del dialog
class DialogAction {
  /// Constructor de DialogAction
  const DialogAction({
    required this.label,
    this.onPressed,
    this.isPrimary = false,
    this.isDestructive = false,
    this.isEnabled = true,
    this.icon,
  });

  /// Texto de la acción
  final String label;

  /// Callback cuando se presiona la acción
  final VoidCallback? onPressed;

  /// Indica si es la acción primaria
  final bool isPrimary;

  /// Indica si es una acción destructiva
  final bool isDestructive;

  /// Indica si la acción está habilitada
  final bool isEnabled;

  /// Icono opcional para la acción
  final IconData? icon;
}

/// Widget de dialog altamente configurable y accesible
///
/// Proporciona diferentes variantes (sm, md, lg, destructive, form) con soporte
/// completo para plataformas, RTL, accesibilidad y Material 3.
class DSDialog extends StatefulWidget {
  /// Constructor principal del dialog
  const DSDialog({
    super.key,
    required this.variant,
    this.title,
    this.content,
    this.actions = const [],
    this.state = DSDialogState.defaultState,
    this.barrierDismissible = true,
    this.titleStyle,
    this.contentStyle,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.padding,
    this.rtlSupport = true,
    this.accessibilitySupport = true,
    this.accessibilityLabel,
    this.accessibilityHint,
    this.onStateChange,
  });

  /// Factory constructor para crear un dialog pequeño
  factory DSDialog.sm({
    Key? key,
    String? title,
    Widget? content,
    List<DialogAction> actions = const [],
    DSDialogState state = DSDialogState.defaultState,
    bool barrierDismissible = true,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    EdgeInsetsGeometry? padding,
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    ValueChanged<DSDialogState>? onStateChange,
  }) {
    return DSDialog(
      key: key,
      variant: DialogVariant.sm,
      title: title,
      content: content,
      actions: actions,
      state: state,
      barrierDismissible: barrierDismissible,
      titleStyle: titleStyle,
      contentStyle: contentStyle,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      padding: padding,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onStateChange: onStateChange,
    );
  }

  /// Factory constructor para crear un dialog mediano
  factory DSDialog.md({
    Key? key,
    String? title,
    Widget? content,
    List<DialogAction> actions = const [],
    DSDialogState state = DSDialogState.defaultState,
    bool barrierDismissible = true,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    EdgeInsetsGeometry? padding,
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    ValueChanged<DSDialogState>? onStateChange,
  }) {
    return DSDialog(
      key: key,
      variant: DialogVariant.md,
      title: title,
      content: content,
      actions: actions,
      state: state,
      barrierDismissible: barrierDismissible,
      titleStyle: titleStyle,
      contentStyle: contentStyle,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      padding: padding,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onStateChange: onStateChange,
    );
  }

  /// Factory constructor para crear un dialog grande
  factory DSDialog.lg({
    Key? key,
    String? title,
    Widget? content,
    List<DialogAction> actions = const [],
    DSDialogState state = DSDialogState.defaultState,
    bool barrierDismissible = true,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    EdgeInsetsGeometry? padding,
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    ValueChanged<DSDialogState>? onStateChange,
  }) {
    return DSDialog(
      key: key,
      variant: DialogVariant.lg,
      title: title,
      content: content,
      actions: actions,
      state: state,
      barrierDismissible: barrierDismissible,
      titleStyle: titleStyle,
      contentStyle: contentStyle,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      padding: padding,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onStateChange: onStateChange,
    );
  }

  /// Factory constructor para crear un dialog destructivo
  factory DSDialog.destructive({
    Key? key,
    String? title,
    Widget? content,
    List<DialogAction> actions = const [],
    DSDialogState state = DSDialogState.defaultState,
    bool barrierDismissible = true,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    EdgeInsetsGeometry? padding,
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    ValueChanged<DSDialogState>? onStateChange,
  }) {
    return DSDialog(
      key: key,
      variant: DialogVariant.destructive,
      title: title,
      content: content,
      actions: actions,
      state: state,
      barrierDismissible: barrierDismissible,
      titleStyle: titleStyle,
      contentStyle: contentStyle,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      padding: padding,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onStateChange: onStateChange,
    );
  }

  /// Factory constructor para crear un dialog de formulario
  factory DSDialog.form({
    Key? key,
    String? title,
    Widget? content,
    List<DialogAction> actions = const [],
    DSDialogState state = DSDialogState.defaultState,
    bool barrierDismissible = true,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    EdgeInsetsGeometry? padding,
    bool rtlSupport = true,
    bool accessibilitySupport = true,
    String? accessibilityLabel,
    String? accessibilityHint,
    ValueChanged<DSDialogState>? onStateChange,
  }) {
    return DSDialog(
      key: key,
      variant: DialogVariant.form,
      title: title,
      content: content,
      actions: actions,
      state: state,
      barrierDismissible: barrierDismissible,
      titleStyle: titleStyle,
      contentStyle: contentStyle,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      padding: padding,
      rtlSupport: rtlSupport,
      accessibilitySupport: accessibilitySupport,
      accessibilityLabel: accessibilityLabel,
      accessibilityHint: accessibilityHint,
      onStateChange: onStateChange,
    );
  }

  /// Variante del dialog
  final DialogVariant variant;

  /// Título del dialog
  final String? title;

  /// Contenido del dialog
  final Widget? content;

  /// Lista de acciones del dialog
  final List<DialogAction> actions;

  /// Estado actual del dialog
  final DSDialogState state;

  /// Si el dialog puede ser cerrado tocando fuera de él
  final bool barrierDismissible;

  /// Estilo del título
  final TextStyle? titleStyle;

  /// Estilo del contenido
  final TextStyle? contentStyle;

  /// Color de fondo del dialog
  final Color? backgroundColor;

  /// Elevación del dialog
  final double? elevation;

  /// Forma del dialog
  final ShapeBorder? shape;

  /// Padding interno del dialog
  final EdgeInsetsGeometry? padding;

  /// Soporte para RTL
  final bool rtlSupport;

  /// Soporte para accesibilidad
  final bool accessibilitySupport;

  /// Etiqueta de accesibilidad
  final String? accessibilityLabel;

  /// Pista de accesibilidad
  final String? accessibilityHint;

  /// Callback cuando cambia el estado
  final ValueChanged<DSDialogState>? onStateChange;

  @override
  State<DSDialog> createState() => _DSDialogState();

  /// Método estático para mostrar el dialog
  static Future<T?> show<T>({
    required BuildContext context,
    required DSDialog dialog,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: dialog.barrierDismissible,
      builder: (context) => dialog,
    );
  }
}

class _DSDialogState extends State<DSDialog>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late FocusNode _focusNode;
  DSDialogState _currentState = DSDialogState.defaultState;

  @override
  void initState() {
    super.initState();
    _currentState = widget.state;
    _focusNode = FocusNode();
    _setupAnimations();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _updateState(DSDialogState newState) {
    if (_currentState != newState && mounted) {
      setState(() {
        _currentState = newState;
      });
      widget.onStateChange?.call(newState);
    }
  }

  Size _getDialogSize() {
    switch (widget.variant) {
      case DialogVariant.sm:
        return const Size(320, 200);
      case DialogVariant.md:
        return const Size(480, 320);
      case DialogVariant.lg:
        return const Size(640, 480);
      case DialogVariant.destructive:
        return const Size(400, 240);
      case DialogVariant.form:
        return const Size(560, 400);
    }
  }

  Color _getBackgroundColor(ColorScheme colorScheme) {
    if (widget.backgroundColor != null) return widget.backgroundColor!;

    switch (widget.variant) {
      case DialogVariant.destructive:
        return colorScheme.errorContainer;
      case DialogVariant.form:
        return colorScheme.surface;
      default:
        return colorScheme.surface;
    }
  }

  double _getElevation() {
    if (widget.elevation != null) return widget.elevation!;
    return 24.0;
  }

  ShapeBorder _getShape() {
    if (widget.shape != null) return widget.shape!;
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    );
  }

  EdgeInsetsGeometry _getPadding() {
    if (widget.padding != null) return widget.padding!;

    switch (widget.variant) {
      case DialogVariant.sm:
        return const EdgeInsets.all(16);
      case DialogVariant.md:
        return const EdgeInsets.all(20);
      case DialogVariant.lg:
        return const EdgeInsets.all(24);
      case DialogVariant.destructive:
        return const EdgeInsets.all(20);
      case DialogVariant.form:
        return const EdgeInsets.all(24);
    }
  }

  String _getAccessibilityLabel() {
    if (widget.accessibilityLabel != null) return widget.accessibilityLabel!;

    switch (widget.variant) {
      case DialogVariant.sm:
        return 'Dialog pequeño';
      case DialogVariant.md:
        return 'Dialog mediano';
      case DialogVariant.lg:
        return 'Dialog grande';
      case DialogVariant.destructive:
        return 'Dialog de confirmación destructiva';
      case DialogVariant.form:
        return 'Dialog de formulario';
    }
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.escape) {
        if (widget.barrierDismissible) {
          Navigator.of(context).pop();
          return KeyEventResult.handled;
        }
      }
    }
    return KeyEventResult.ignored;
  }

  Widget _buildTitle(ThemeData theme) {
    if (widget.title == null) return const SizedBox.shrink();

    final titleStyle = widget.titleStyle ??
        theme.textTheme.headlineSmall?.copyWith(
          color: widget.variant == DialogVariant.destructive
              ? theme.colorScheme.onErrorContainer
              : theme.colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        );

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        widget.title!,
        style: titleStyle,
        textAlign: widget.rtlSupport && Directionality.of(context) == TextDirection.rtl
            ? TextAlign.right
            : TextAlign.left,
      ),
    );
  }

  Widget _buildContent(ThemeData theme) {
    if (widget.content == null) return const SizedBox.shrink();

    final contentStyle = widget.contentStyle ??
        theme.textTheme.bodyMedium?.copyWith(
          color: widget.variant == DialogVariant.destructive
              ? theme.colorScheme.onErrorContainer
              : theme.colorScheme.onSurface,
        );

    return Padding(
      padding: widget.actions.isNotEmpty
          ? const EdgeInsets.only(bottom: 24)
          : EdgeInsets.zero,
      child: DefaultTextStyle(
        style: contentStyle ?? const TextStyle(),
        child: widget.content!,
      ),
    );
  }

  Widget _buildActions(ThemeData theme) {
    if (widget.actions.isEmpty) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: widget.actions.asMap().entries.map((entry) {
        final index = entry.key;
        final action = entry.value;

        return Padding(
          padding: EdgeInsets.only(
            left: index > 0 ? 8 : 0,
          ),
          child: _buildActionButton(action, theme),
        );
      }).toList(),
    );
  }

  Widget _buildActionButton(DialogAction action, ThemeData theme) {
    final isDestructive = action.isDestructive || widget.variant == DialogVariant.destructive;

    if (action.isPrimary || isDestructive) {
      return FilledButton(
        onPressed: action.isEnabled ? action.onPressed : null,
        style: FilledButton.styleFrom(
          backgroundColor: isDestructive
              ? theme.colorScheme.error
              : theme.colorScheme.primary,
          foregroundColor: isDestructive
              ? theme.colorScheme.onError
              : theme.colorScheme.onPrimary,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (action.icon != null) ...[
              Icon(action.icon!, size: 16),
              const SizedBox(width: 8),
            ],
            Text(action.label),
          ],
        ),
      );
    } else {
      return TextButton(
        onPressed: action.isEnabled ? action.onPressed : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (action.icon != null) ...[
              Icon(action.icon!, size: 16),
              const SizedBox(width: 8),
            ],
            Text(action.label),
          ],
        ),
      );
    }
  }

  Widget _buildStateWrapper(Widget child) {
    switch (_currentState) {
      case DSDialogState.disabled:
        return Opacity(
          opacity: 0.5,
          child: AbsorbPointer(child: child),
        );
      case DSDialogState.loading:
        return _buildLoadingChild(child);
      case DSDialogState.skeleton:
        return _buildSkeletonChild(child);
      case DSDialogState.focus:
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: child,
        );
      case DSDialogState.defaultState:
      case DSDialogState.hover:
      case DSDialogState.pressed:
      case DSDialogState.selected:
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
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const CircularProgressIndicator(),
        ),
      ],
    );
  }

  Widget _buildSkeletonChild(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Opacity(
        opacity: 0.3,
        child: child,
      ),
    );
  }

  Widget _wrapWithInteractivity(Widget child) {
    final isDesktop = kIsWeb ||
        (!kIsWeb &&
            (Platform.isWindows || Platform.isMacOS || Platform.isLinux));

    if (isDesktop) {
      return MouseRegion(
        onEnter: (_) => _updateState(DSDialogState.hover),
        onExit: (_) => _updateState(DSDialogState.defaultState),
        child: GestureDetector(
          onTapDown: (_) => _updateState(DSDialogState.pressed),
          onTapUp: (_) => _updateState(DSDialogState.hover),
          onTapCancel: () => _updateState(DSDialogState.defaultState),
          child: child,
        ),
      );
    } else {
      return GestureDetector(
        onTapDown: (_) => _updateState(DSDialogState.pressed),
        onTapUp: (_) => _updateState(DSDialogState.defaultState),
        onTapCancel: () => _updateState(DSDialogState.defaultState),
        child: child,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = _getDialogSize();

    Widget dialogContent = Container(
      width: size.width,
      constraints: BoxConstraints(
        maxHeight: size.height,
        maxWidth: size.width,
      ),
      child: Material(
        type: MaterialType.card,
        color: _getBackgroundColor(theme.colorScheme),
        elevation: _getElevation(),
        shape: _getShape(),
        child: Padding(
          padding: _getPadding(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(theme),
              Flexible(child: _buildContent(theme)),
              _buildActions(theme),
            ],
          ),
        ),
      ),
    );

    if (widget.accessibilitySupport) {
      dialogContent = Semantics(
        label: _getAccessibilityLabel(),
        hint: widget.accessibilityHint,
        child: dialogContent,
      );
    }

    dialogContent = Focus(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: dialogContent,
    );

    dialogContent = _buildStateWrapper(dialogContent);

    if (_currentState.canInteract) {
      dialogContent = _wrapWithInteractivity(dialogContent);
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: dialogContent,
            ),
          ),
        );
      },
    );
  }
}