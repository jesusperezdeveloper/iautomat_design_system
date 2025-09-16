import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'button_styles.dart';
import '../../theme/app_theme.dart';
import '../../theme/spacing.dart';

/// Componente de botón personalizado para el Design System de IAutomat
///
/// AppButton es el componente base para todos los botones en la aplicación.
/// Proporciona una interfaz consistente y accesible con múltiples variantes,
/// tamaños y estados.
///
/// Características:
/// - 5 variantes: primary, secondary, outline, ghost, danger
/// - 3 tamaños: small, medium, large
/// - Estados: enabled, disabled, loading
/// - Soporte para iconos leading y trailing
/// - Full width opcional
/// - Accesibilidad completa
/// - Feedback táctil
/// - Animaciones fluidas
///
/// Ejemplo de uso:
/// ```dart
/// AppButton(
///   text: 'Guardar',
///   variant: ButtonVariant.primary,
///   size: ButtonSize.medium,
///   onPressed: () => print('Pressed'),
///   leadingIcon: Icons.save,
/// )
/// ```
class AppButton extends StatefulWidget {
  /// Texto del botón
  final String text;

  /// Variante del botón (primary, secondary, etc.)
  final ButtonVariant variant;

  /// Tamaño del botón (small, medium, large)
  final ButtonSize size;

  /// Callback cuando se presiona el botón
  final VoidCallback? onPressed;

  /// Callback cuando se mantiene presionado el botón
  final VoidCallback? onLongPress;

  /// Si el botón está en estado de carga
  final bool isLoading;

  /// Icono al inicio del botón
  final IconData? leadingIcon;

  /// Icono al final del botón
  final IconData? trailingIcon;

  /// Widget personalizado al inicio (toma precedencia sobre leadingIcon)
  final Widget? leadingWidget;

  /// Widget personalizado al final (toma precedencia sobre trailingIcon)
  final Widget? trailingWidget;

  /// Si el botón debe ocupar todo el ancho disponible
  final bool isFullWidth;

  /// Estilo personalizado que se aplica sobre el estilo base
  final ButtonStyle? style;

  /// Tooltip del botón
  final String? tooltip;

  /// Clave semántica para testing y accesibilidad
  final String? semanticsLabel;

  /// Si se debe activar feedback táctil al presionar
  final bool enableFeedback;

  /// Duración personalizada para la animación de loading
  final Duration? loadingAnimationDuration;

  /// Color personalizado para el indicador de loading
  final Color? loadingIndicatorColor;

  /// Crear un AppButton
  const AppButton({
    super.key,
    required this.text,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.onPressed,
    this.onLongPress,
    this.isLoading = false,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingWidget,
    this.trailingWidget,
    this.isFullWidth = false,
    this.style,
    this.tooltip,
    this.semanticsLabel,
    this.enableFeedback = true,
    this.loadingAnimationDuration,
    this.loadingIndicatorColor,
  });

  /// Constructor para botón primary (atajo)
  const AppButton.primary({
    super.key,
    required this.text,
    this.size = ButtonSize.medium,
    this.onPressed,
    this.onLongPress,
    this.isLoading = false,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingWidget,
    this.trailingWidget,
    this.isFullWidth = false,
    this.style,
    this.tooltip,
    this.semanticsLabel,
    this.enableFeedback = true,
    this.loadingAnimationDuration,
    this.loadingIndicatorColor,
  }) : variant = ButtonVariant.primary;

  /// Constructor para botón secondary (atajo)
  const AppButton.secondary({
    super.key,
    required this.text,
    this.size = ButtonSize.medium,
    this.onPressed,
    this.onLongPress,
    this.isLoading = false,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingWidget,
    this.trailingWidget,
    this.isFullWidth = false,
    this.style,
    this.tooltip,
    this.semanticsLabel,
    this.enableFeedback = true,
    this.loadingAnimationDuration,
    this.loadingIndicatorColor,
  }) : variant = ButtonVariant.secondary;

  /// Constructor para botón outline (atajo)
  const AppButton.outline({
    super.key,
    required this.text,
    this.size = ButtonSize.medium,
    this.onPressed,
    this.onLongPress,
    this.isLoading = false,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingWidget,
    this.trailingWidget,
    this.isFullWidth = false,
    this.style,
    this.tooltip,
    this.semanticsLabel,
    this.enableFeedback = true,
    this.loadingAnimationDuration,
    this.loadingIndicatorColor,
  }) : variant = ButtonVariant.outline;

  /// Constructor para botón ghost (atajo)
  const AppButton.ghost({
    super.key,
    required this.text,
    this.size = ButtonSize.medium,
    this.onPressed,
    this.onLongPress,
    this.isLoading = false,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingWidget,
    this.trailingWidget,
    this.isFullWidth = false,
    this.style,
    this.tooltip,
    this.semanticsLabel,
    this.enableFeedback = true,
    this.loadingAnimationDuration,
    this.loadingIndicatorColor,
  }) : variant = ButtonVariant.ghost;

  /// Constructor para botón danger (atajo)
  const AppButton.danger({
    super.key,
    required this.text,
    this.size = ButtonSize.medium,
    this.onPressed,
    this.onLongPress,
    this.isLoading = false,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingWidget,
    this.trailingWidget,
    this.isFullWidth = false,
    this.style,
    this.tooltip,
    this.semanticsLabel,
    this.enableFeedback = true,
    this.loadingAnimationDuration,
    this.loadingIndicatorColor,
  }) : variant = ButtonVariant.danger;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.loadingAnimationDuration ?? AppTheme.durationFast,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: AppTheme.curveStandard,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final sizeConfig = AppButtonStyles.getSizeConfig(widget.size);

    // Estado del botón
    final isEnabled = widget.onPressed != null && !widget.isLoading;
    final isDisabled = !isEnabled;

    // Estilo del botón
    final buttonStyle = AppButtonStyles.getVariantStyle(
      widget.variant,
      widget.size,
      isDark: isDark,
    ).merge(widget.style);

    // Contenido del botón
    Widget content = _buildButtonContent(context, sizeConfig, isDark);

    // Botón base según variante
    Widget button = _buildButton(context, buttonStyle, content, isEnabled);

    // Full width wrapper
    if (widget.isFullWidth) {
      button = SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    // Tooltip wrapper
    if (widget.tooltip != null) {
      button = Tooltip(
        message: widget.tooltip!,
        child: button,
      );
    }

    // Semántica y accesibilidad
    button = Semantics(
      label: widget.semanticsLabel ?? widget.text,
      hint: AppButtonStyles.getSemanticsProperties(
        widget.variant,
        widget.text,
        isEnabled,
        widget.isLoading,
      ).hint,
      button: true,
      enabled: isEnabled,
      child: button,
    );

    // Animación de escala al presionar
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: button,
        );
      },
    );
  }

  /// Construye el botón apropiado según la variante
  Widget _buildButton(
    BuildContext context,
    ButtonStyle style,
    Widget content,
    bool isEnabled,
  ) {
    final VoidCallback? onPressed = isEnabled ? _handlePressed : null;
    final VoidCallback? onLongPress =
        isEnabled && widget.onLongPress != null ? _handleLongPressed : null;

    switch (widget.variant) {
      case ButtonVariant.primary:
      case ButtonVariant.secondary:
      case ButtonVariant.danger:
        return ElevatedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style,
          child: content,
        );

      case ButtonVariant.outline:
        return OutlinedButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style,
          child: content,
        );

      case ButtonVariant.ghost:
        return TextButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          style: style,
          child: content,
        );
    }
  }

  /// Construye el contenido interno del botón
  Widget _buildButtonContent(
    BuildContext context,
    _ButtonSizeConfig sizeConfig,
    bool isDark,
  ) {
    final List<Widget> children = [];

    // Leading icon/widget
    if (widget.isLoading && widget.leadingWidget == null && widget.leadingIcon == null) {
      children.add(_buildLoadingIndicator(sizeConfig, isDark));
      children.add(AppSpacing.horizontalXs);
    } else if (widget.leadingWidget != null) {
      children.add(widget.leadingWidget!);
      children.add(AppSpacing.horizontalXs);
    } else if (widget.leadingIcon != null && !widget.isLoading) {
      children.add(Icon(
        widget.leadingIcon,
        size: sizeConfig.iconSize,
      ));
      children.add(AppSpacing.horizontalXs);
    }

    // Texto
    children.add(
      Flexible(
        child: Text(
          widget.text,
          style: sizeConfig.textStyle,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );

    // Trailing icon/widget
    if (widget.trailingWidget != null) {
      children.add(AppSpacing.horizontalXs);
      children.add(widget.trailingWidget!);
    } else if (widget.trailingIcon != null) {
      children.add(AppSpacing.horizontalXs);
      children.add(Icon(
        widget.trailingIcon,
        size: sizeConfig.iconSize,
      ));
    } else if (widget.isLoading && widget.leadingWidget == null && widget.leadingIcon == null) {
      // Si está loading y no hay leading icon, mostrar loading indicator al final
      children.add(AppSpacing.horizontalXs);
      children.add(_buildLoadingIndicator(sizeConfig, isDark));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  /// Construye el indicador de carga
  Widget _buildLoadingIndicator(_ButtonSizeConfig sizeConfig, bool isDark) {
    final color = widget.loadingIndicatorColor ??
        AppButtonStyles.getTextColor(widget.variant, isDark, false);

    return SizedBox(
      width: sizeConfig.iconSize,
      height: sizeConfig.iconSize,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }

  /// Maneja el evento de presionado
  void _handlePressed() {
    if (widget.enableFeedback) {
      HapticFeedback.lightImpact();
    }

    // Animación de escala
    _animationController.forward().then((_) {
      _animationController.reverse();
    });

    // Ejecutar callback
    widget.onPressed?.call();
  }

  /// Maneja el evento de presionado largo
  void _handleLongPressed() {
    if (widget.enableFeedback) {
      HapticFeedback.mediumImpact();
    }

    widget.onLongPress?.call();
  }
}

// ==========================================================================
// EXTENSIONES ÚTILES
// ==========================================================================

/// Extensión para facilitar el uso de AppButton
extension AppButtonExtension on AppButton {
  /// Crea una copia del botón con propiedades modificadas
  AppButton copyWith({
    String? text,
    ButtonVariant? variant,
    ButtonSize? size,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    bool? isLoading,
    IconData? leadingIcon,
    IconData? trailingIcon,
    Widget? leadingWidget,
    Widget? trailingWidget,
    bool? isFullWidth,
    ButtonStyle? style,
    String? tooltip,
    String? semanticsLabel,
    bool? enableFeedback,
    Duration? loadingAnimationDuration,
    Color? loadingIndicatorColor,
  }) {
    return AppButton(
      key: key,
      text: text ?? this.text,
      variant: variant ?? this.variant,
      size: size ?? this.size,
      onPressed: onPressed ?? this.onPressed,
      onLongPress: onLongPress ?? this.onLongPress,
      isLoading: isLoading ?? this.isLoading,
      leadingIcon: leadingIcon ?? this.leadingIcon,
      trailingIcon: trailingIcon ?? this.trailingIcon,
      leadingWidget: leadingWidget ?? this.leadingWidget,
      trailingWidget: trailingWidget ?? this.trailingWidget,
      isFullWidth: isFullWidth ?? this.isFullWidth,
      style: style ?? this.style,
      tooltip: tooltip ?? this.tooltip,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      enableFeedback: enableFeedback ?? this.enableFeedback,
      loadingAnimationDuration: loadingAnimationDuration ?? this.loadingAnimationDuration,
      loadingIndicatorColor: loadingIndicatorColor ?? this.loadingIndicatorColor,
    );
  }
}

// ==========================================================================
// WIDGETS DE CONVENIENCIA
// ==========================================================================

/// Grupo de botones con spacing automático
class AppButtonGroup extends StatelessWidget {
  /// Lista de botones a mostrar
  final List<AppButton> buttons;

  /// Dirección del layout (horizontal o vertical)
  final Axis direction;

  /// Espaciado entre botones
  final double spacing;

  /// Alineación principal de los botones
  final MainAxisAlignment mainAxisAlignment;

  /// Alineación cruzada de los botones
  final CrossAxisAlignment crossAxisAlignment;

  /// Crear un grupo de botones
  const AppButtonGroup({
    super.key,
    required this.buttons,
    this.direction = Axis.horizontal,
    this.spacing = AppSpacing.sm,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    if (direction == Axis.horizontal) {
      return AppSpacing.spacedRow(
        spacing: spacing,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: buttons,
      );
    } else {
      return AppSpacing.spacedColumn(
        spacing: spacing,
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: buttons,
      );
    }
  }
}