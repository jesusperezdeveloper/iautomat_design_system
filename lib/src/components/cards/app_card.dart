import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/colors.dart';
import '../../theme/spacing.dart';

/// Enumeraci�n para las variantes de cards disponibles
enum CardVariant {
  /// Card plano sin elevaci�n
  flat,

  /// Card elevado con sombra
  elevated,

  /// Card con borde outline
  outlined,

  /// Card con gradiente de fondo
  gradient,
}

/// Componente de card personalizado para el Design System de IAutomat
///
/// AppCard es el componente base para contenedores de contenido en la aplicaci�n.
/// Proporciona una superficie flexible y consistente con m�ltiples variantes,
/// efectos interactivos y personalizaci�n completa.
///
/// Caracter�sticas:
/// - 4 variantes: flat, elevated, outlined, gradient
/// - Elevaci�n personalizable (0-5)
/// - Border opcional con color configurable
/// - Border radius configurable
/// - Padding interno flexible
/// - Efectos onTap y onLongPress
/// - Estados hover para web
/// - Gradient backgrounds
/// - Totalmente accesible
/// - Adaptable a light/dark theme
///
/// Ejemplo de uso:
/// ```dart
/// AppCard(
///   variant: CardVariant.elevated,
///   elevation: 2,
///   onTap: () => navigate(),
///   child: Column(children: [...]),
/// )
/// ```
class AppCard extends StatefulWidget {
  /// El contenido del card
  final Widget child;

  /// Variante del card
  final CardVariant variant;

  /// Elevaci�n del card (0-5)
  final int elevation;

  /// Color de fondo personalizado
  final Color? backgroundColor;

  /// Gradiente de fondo (solo para variant gradient)
  final Gradient? gradient;

  /// Color del borde
  final Color? borderColor;

  /// Ancho del borde
  final double borderWidth;

  /// Radio del borde
  final BorderRadius? borderRadius;

  /// Padding interno del card
  final EdgeInsets? padding;

  /// Margin externo del card
  final EdgeInsets? margin;

  /// Ancho del card
  final double? width;

  /// Alto del card
  final double? height;

  /// Callback cuando se toca el card
  final VoidCallback? onTap;

  /// Callback cuando se mantiene presionado
  final VoidCallback? onLongPress;

  /// Si se debe mostrar efecto splash al tocar
  final bool enableSplash;

  /// Color del efecto splash
  final Color? splashColor;

  /// Color del highlight al presionar
  final Color? highlightColor;

  /// Si el card debe recortar su contenido
  final Clip clipBehavior;

  /// Clave sem�ntica para testing y accesibilidad
  final String? semanticsLabel;

  /// Tooltip del card
  final String? tooltip;

  /// Duraci�n de las animaciones
  final Duration animationDuration;

  /// Curva de las animaciones
  final Curve animationCurve;

  /// Crear un AppCard
  const AppCard({
    super.key,
    required this.child,
    this.variant = CardVariant.flat,
    this.elevation = 0,
    this.backgroundColor,
    this.gradient,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.onLongPress,
    this.enableSplash = true,
    this.splashColor,
    this.highlightColor,
    this.clipBehavior = Clip.antiAlias,
    this.semanticsLabel,
    this.tooltip,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
  }) : assert(
          elevation >= 0 && elevation <= 5,
          'Elevation must be between 0 and 5',
        );

  /// Constructor para card flat (sin elevaci�n)
  const AppCard.flat({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.onLongPress,
    this.enableSplash = true,
    this.splashColor,
    this.highlightColor,
    this.clipBehavior = Clip.antiAlias,
    this.semanticsLabel,
    this.tooltip,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
  })  : variant = CardVariant.flat,
        elevation = 0,
        gradient = null;

  /// Constructor para card elevated (con sombra)
  const AppCard.elevated({
    super.key,
    required this.child,
    this.elevation = 2,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.onLongPress,
    this.enableSplash = true,
    this.splashColor,
    this.highlightColor,
    this.clipBehavior = Clip.antiAlias,
    this.semanticsLabel,
    this.tooltip,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
  })  : variant = CardVariant.elevated,
        gradient = null,
        borderColor = null,
        borderWidth = 0;

  /// Constructor para card outlined (con borde)
  const AppCard.outlined({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.borderRadius,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.onLongPress,
    this.enableSplash = true,
    this.splashColor,
    this.highlightColor,
    this.clipBehavior = Clip.antiAlias,
    this.semanticsLabel,
    this.tooltip,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
  })  : variant = CardVariant.outlined,
        elevation = 0,
        gradient = null;

  /// Constructor para card gradient (con degradado)
  const AppCard.gradient({
    super.key,
    required this.child,
    required this.gradient,
    this.elevation = 0,
    this.borderRadius,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.onTap,
    this.onLongPress,
    this.enableSplash = true,
    this.splashColor,
    this.highlightColor,
    this.clipBehavior = Clip.antiAlias,
    this.semanticsLabel,
    this.tooltip,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
  })  : variant = CardVariant.gradient,
        backgroundColor = null,
        borderColor = null,
        borderWidth = 0;

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.animationCurve,
      ),
    );

    _elevationAnimation = Tween<double>(
      begin: widget.elevation.toDouble(),
      end: (widget.elevation + 2).clamp(0, 5).toDouble(),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.animationCurve,
      ),
    );
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

    // Configuraci�n del card seg�n el contexto
    final cardConfig = _getCardConfiguration(theme, isDark);

    Widget cardContent = _buildCardContent(cardConfig);

    // Wrapper con animaciones de escala
    if (widget.onTap != null || widget.onLongPress != null) {
      cardContent = AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(scale: _scaleAnimation.value, child: child);
        },
        child: cardContent,
      );
    }

    // Wrapper con efectos interactivos
    if (widget.onTap != null || widget.onLongPress != null) {
      cardContent = _buildInteractiveWrapper(cardContent, cardConfig);
    }

    // Wrapper con hover effects (solo web)
    if (kIsWeb) {
      cardContent = MouseRegion(
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
        child: cardContent,
      );
    }

    // Wrapper con dimensiones
    if (widget.width != null || widget.height != null) {
      cardContent = SizedBox(
        width: widget.width,
        height: widget.height,
        child: cardContent,
      );
    }

    // Wrapper con margin
    if (widget.margin != null) {
      cardContent = Padding(padding: widget.margin!, child: cardContent);
    }

    // Wrapper con tooltip
    if (widget.tooltip != null) {
      cardContent = Tooltip(message: widget.tooltip!, child: cardContent);
    }

    // Wrapper con sem�ntica
    if (widget.semanticsLabel != null) {
      cardContent = Semantics(
        label: widget.semanticsLabel,
        button: widget.onTap != null,
        child: cardContent,
      );
    }

    return cardContent;
  }

  /// Construye el contenido principal del card
  Widget _buildCardContent(_CardConfig config) {
    return AnimatedBuilder(
      animation: _elevationAnimation,
      builder: (context, child) {
        final currentElevation = _isHovered
            ? _elevationAnimation.value
            : widget.elevation.toDouble();

        return AnimatedContainer(
          duration: widget.animationDuration,
          curve: widget.animationCurve,
          decoration: _buildDecoration(config, currentElevation),
          clipBehavior: widget.clipBehavior,
          child: _buildInternalContent(config),
        );
      },
    );
  }

  /// Construye el wrapper interactivo con InkWell
  Widget _buildInteractiveWrapper(Widget child, _CardConfig config) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _handleTap,
        onLongPress: _handleLongPress,
        onTapDown: (_) => _handlePressedState(true),
        onTapUp: (_) => _handlePressedState(false),
        onTapCancel: () => _handlePressedState(false),
        splashColor: widget.enableSplash
            ? (widget.splashColor ?? config.defaultSplashColor)
            : Colors.transparent,
        highlightColor: widget.highlightColor ?? config.defaultHighlightColor,
        borderRadius: _getEffectiveBorderRadius(),
        child: child,
      ),
    );
  }

  /// Construye el contenido interno con padding
  Widget _buildInternalContent(_CardConfig config) {
    final effectivePadding = widget.padding ?? config.defaultPadding;

    if (effectivePadding == EdgeInsets.zero) {
      return widget.child;
    }

    return Padding(padding: effectivePadding, child: widget.child);
  }

  /// Construye la decoraci�n del card
  BoxDecoration _buildDecoration(_CardConfig config, double elevation) {
    return BoxDecoration(
      color: _getBackgroundColor(config),
      gradient: _getGradient(config),
      border: _getBorder(config),
      borderRadius: _getEffectiveBorderRadius(),
      boxShadow: _getBoxShadow(config, elevation),
    );
  }

  /// Obtiene la configuraci�n del card seg�n el tema
  _CardConfig _getCardConfiguration(ThemeData theme, bool isDark) {
    return _CardConfig(
      defaultBackgroundColor:
          isDark ? AppColors.backgroundSecondaryDarkMode : AppColors.surface,
      defaultBorderColor: isDark ? AppColors.gray600 : AppColors.gray300,
      defaultShadowColor: isDark ? Colors.black : AppColors.shadow,
      defaultSplashColor:
          (isDark ? AppColors.primaryDarkMode : AppColors.primary).withValues(
        alpha: 0.1,
      ),
      defaultHighlightColor:
          (isDark ? AppColors.primaryDarkMode : AppColors.primary).withValues(
        alpha: 0.05,
      ),
      defaultPadding: AppSpacing.cardPadding,
    );
  }

  /// Obtiene el color de fondo efectivo
  Color? _getBackgroundColor(_CardConfig config) {
    if (widget.variant == CardVariant.gradient) return null;
    return widget.backgroundColor ?? config.defaultBackgroundColor;
  }

  /// Obtiene el gradiente efectivo
  Gradient? _getGradient(_CardConfig config) {
    if (widget.variant == CardVariant.gradient) {
      return widget.gradient;
    }
    return null;
  }

  /// Obtiene el borde efectivo
  Border? _getBorder(_CardConfig config) {
    if (widget.variant == CardVariant.outlined || widget.borderColor != null) {
      final borderColor = widget.borderColor ?? config.defaultBorderColor;
      return Border.all(color: borderColor, width: widget.borderWidth);
    }
    return null;
  }

  /// Obtiene el BorderRadius efectivo
  BorderRadius _getEffectiveBorderRadius() {
    return widget.borderRadius ?? const BorderRadius.all(Radius.circular(16));
  }

  /// Obtiene las sombras del box
  List<BoxShadow>? _getBoxShadow(_CardConfig config, double elevation) {
    if (widget.variant == CardVariant.flat && elevation == 0) return null;

    final elevationInt = elevation.round().clamp(0, 5);

    switch (elevationInt) {
      case 0:
        return [];
      case 1:
        return [
          const BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ];
      case 2:
        return [
          const BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 1),
            blurRadius: 5,
            spreadRadius: 0,
          ),
          const BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 3,
          ),
        ];
      case 3:
        return [
          const BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 0,
          ),
          const BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 6),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ];
      case 4:
        return [
          const BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 8),
            blurRadius: 12,
            spreadRadius: 0,
          ),
          const BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 12),
            blurRadius: 40,
            spreadRadius: 8,
          ),
        ];
      case 5:
        return [
          const BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 12),
            blurRadius: 16,
            spreadRadius: 0,
          ),
          const BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 24),
            blurRadius: 80,
            spreadRadius: 12,
          ),
        ];
      default:
        return [
          const BoxShadow(
            color: Color(0x0D000000),
            offset: Offset(0, 1),
            blurRadius: 5,
            spreadRadius: 0,
          ),
          const BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 3,
          ),
        ];
    }
  }

  /// Maneja el cambio de estado hover
  void _handleHover(bool hovered) {
    if (hovered == _isHovered) return;

    setState(() {
      _isHovered = hovered;
    });

    if (hovered) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  /// Maneja el estado de presi�n
  void _handlePressedState(bool pressed) {
    if (pressed == _isPressed) return;

    setState(() {
      _isPressed = pressed;
    });

    if (pressed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  /// Maneja el tap del card
  void _handleTap() {
    if (!mounted) return;

    // Feedback h�ptico
    HapticFeedback.lightImpact();

    // Ejecutar callback
    widget.onTap?.call();
  }

  /// Maneja el long press del card
  void _handleLongPress() {
    if (!mounted) return;

    // Feedback h�ptico m�s fuerte
    HapticFeedback.mediumImpact();

    // Ejecutar callback
    widget.onLongPress?.call();
  }
}

/// Configuraci�n interna del card
class _CardConfig {
  final Color defaultBackgroundColor;
  final Color defaultBorderColor;
  final Color defaultShadowColor;
  final Color defaultSplashColor;
  final Color defaultHighlightColor;
  final EdgeInsets defaultPadding;

  const _CardConfig({
    required this.defaultBackgroundColor,
    required this.defaultBorderColor,
    required this.defaultShadowColor,
    required this.defaultSplashColor,
    required this.defaultHighlightColor,
    required this.defaultPadding,
  });
}

// ==========================================================================
// EXTENSIONES �TILES
// ==========================================================================

/// Extensi�n para facilitar el uso de AppCard
extension AppCardExtension on AppCard {
  /// Crea una copia del card con propiedades modificadas
  AppCard copyWith({
    Key? key,
    Widget? child,
    CardVariant? variant,
    int? elevation,
    Color? backgroundColor,
    Gradient? gradient,
    Color? borderColor,
    double? borderWidth,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? width,
    double? height,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    bool? enableSplash,
    Color? splashColor,
    Color? highlightColor,
    Clip? clipBehavior,
    String? semanticsLabel,
    String? tooltip,
    Duration? animationDuration,
    Curve? animationCurve,
  }) {
    return AppCard(
      key: key ?? this.key,
      variant: variant ?? this.variant,
      elevation: elevation ?? this.elevation,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      gradient: gradient ?? this.gradient,
      borderColor: borderColor ?? this.borderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      width: width ?? this.width,
      height: height ?? this.height,
      onTap: onTap ?? this.onTap,
      onLongPress: onLongPress ?? this.onLongPress,
      enableSplash: enableSplash ?? this.enableSplash,
      splashColor: splashColor ?? this.splashColor,
      highlightColor: highlightColor ?? this.highlightColor,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      tooltip: tooltip ?? this.tooltip,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
      child: child ?? this.child,
    );
  }
}

// ==========================================================================
// WIDGETS DE CONVENIENCIA
// ==========================================================================

/// Card para contenido de imagen con overlay
class AppImageCard extends StatelessWidget {
  /// Widget de imagen
  final Widget image;

  /// Contenido del overlay
  final Widget? overlay;

  /// Altura del card
  final double height;

  /// Callback al tocar el card
  final VoidCallback? onTap;

  /// Border radius personalizado
  final BorderRadius? borderRadius;

  /// Crear un AppImageCard
  const AppImageCard({
    super.key,
    required this.image,
    this.overlay,
    this.height = 200,
    this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      onTap: onTap,
      borderRadius: borderRadius,
      child: SizedBox(
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius:
                  borderRadius ?? const BorderRadius.all(Radius.circular(16)),
              child: image,
            ),
            if (overlay != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.vertical(
                      bottom: (borderRadius ??
                              const BorderRadius.all(Radius.circular(16)))
                          .bottomLeft,
                    ),
                  ),
                  padding: AppSpacing.cardPadding,
                  child: overlay,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Card para acciones con icono y texto
class AppActionCard extends StatelessWidget {
  /// Icono de la acci�n
  final IconData icon;

  /// T�tulo de la acci�n
  final String title;

  /// Descripci�n opcional
  final String? description;

  /// Callback al tocar el card
  final VoidCallback? onTap;

  /// Color del icono
  final Color? iconColor;

  /// Variante del card
  final CardVariant variant;

  /// Crear un AppActionCard
  const AppActionCard({
    super.key,
    required this.icon,
    required this.title,
    this.description,
    this.onTap,
    this.iconColor,
    this.variant = CardVariant.flat,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AppCard(
      variant: variant,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 48,
            color: iconColor ??
                (isDark ? AppColors.primaryDarkMode : AppColors.primary),
          ),
          AppSpacing.verticalSm,
          Text(
            title,
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          if (description != null) ...[
            AppSpacing.verticalXs,
            Text(
              description!,
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

/// Grid de cards con spacing autom�tico
class AppCardGrid extends StatelessWidget {
  /// Lista de cards
  final List<Widget> children;

  /// N�mero de columnas
  final int crossAxisCount;

  /// Espaciado entre cards
  final double spacing;

  /// Aspect ratio de los cards
  final double childAspectRatio;

  /// Crear un AppCardGrid
  const AppCardGrid({
    super.key,
    required this.children,
    this.crossAxisCount = 2,
    this.spacing = AppSpacing.md,
    this.childAspectRatio = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
      childAspectRatio: childAspectRatio,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: children,
    );
  }
}

/// Lista de cards con spacing autom�tico
class AppCardList extends StatelessWidget {
  /// Lista de cards
  final List<Widget> children;

  /// Espaciado entre cards
  final double spacing;

  /// Scroll physics
  final ScrollPhysics? physics;

  /// Si debe ser shrinkWrap
  final bool shrinkWrap;

  /// Crear un AppCardList
  const AppCardList({
    super.key,
    required this.children,
    this.spacing = AppSpacing.md,
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: children.length,
      physics: physics,
      shrinkWrap: shrinkWrap,
      separatorBuilder: (context, index) => SizedBox(height: spacing),
      itemBuilder: (context, index) => children[index],
    );
  }
}
