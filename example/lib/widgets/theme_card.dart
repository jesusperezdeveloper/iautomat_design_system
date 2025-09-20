import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iautomat_design_system/iautomat_design_system.dart';

/// Widget card para mostrar preview visual de un tema del Design System
///
/// Muestra información esencial del tema con acciones interactivas
/// como aplicar, favoritos y vista previa detallada
class ThemeCard extends StatefulWidget {
  /// Tema a mostrar
  final DSThemePreset theme;

  /// Si este tema está actualmente aplicado
  final bool isCurrentTheme;

  /// Si el tema está en favoritos
  final bool isFavorite;

  /// Callback para aplicar el tema
  final VoidCallback onApply;

  /// Callback para toggle de favoritos
  final VoidCallback onFavorite;

  /// Callback para vista previa detallada
  final VoidCallback onPreview;

  const ThemeCard({
    super.key,
    required this.theme,
    required this.isCurrentTheme,
    required this.isFavorite,
    required this.onApply,
    required this.onFavorite,
    required this.onPreview,
  });

  @override
  State<ThemeCard> createState() => _ThemeCardState();
}

class _ThemeCardState extends State<ThemeCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _elevationAnimation;

  bool _isHovered = false;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _elevationAnimation = Tween<double>(
      begin: 2.0,
      end: 8.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHoverChanged(bool isHovered) {
    setState(() => _isHovered = isHovered);
    if (isHovered) {
      _animationController.forward();
    } else if (!_isPressed) {
      _animationController.reverse();
    }
  }

  void _onTapDown() {
    setState(() => _isPressed = true);
    _animationController.forward();
  }

  void _onTapUp() {
    setState(() => _isPressed = false);
    if (!_isHovered) {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Card(
            elevation: widget.isCurrentTheme ? 12 : _elevationAnimation.value,
            margin: EdgeInsets.zero,
            child: InkWell(
              onTap: widget.onPreview,
              onTapDown: (_) => _onTapDown(),
              onTapUp: (_) => _onTapUp(),
              onTapCancel: _onTapUp,
              onHover: _onHoverChanged,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: widget.isCurrentTheme
                      ? Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        )
                      : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildColorPreview(context),
                    Flexible(
                      child: _buildContent(context),
                    ),
                    _buildActions(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildColorPreview(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            widget.theme.lightColorScheme.primary,
            widget.theme.lightColorScheme.secondary,
            widget.theme.lightColorScheme.tertiary,
          ],
          stops: const [0.0, 0.6, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Pattern overlay sutil
          Positioned.fill(
            child: CustomPaint(
              painter: _PatternPainter(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          // Badges
          Positioned(
            top: 8,
            left: 8,
            child: Row(
              children: [
                if (widget.isCurrentTheme)
                  _buildBadge(
                    context,
                    'ACTIVO',
                    Colors.white,
                    widget.theme.lightColorScheme.primary,
                  ),
                if (widget.theme.isPremium)
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: _buildBadge(
                      context,
                      'PRO',
                      Colors.amber.shade100,
                      Colors.amber.shade800,
                    ),
                  ),
              ],
            ),
          ),
          // Indicador de accesibilidad
          if (widget.theme.isAccessible)
            const Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.accessibility,
                color: Colors.white,
                size: 16,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBadge(
    BuildContext context,
    String text,
    Color backgroundColor,
    Color textColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: DSTypography.caption.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Nombre del tema
          Text(
            widget.theme.displayName,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 3),
          // Categoría
          Row(
            children: [
              Icon(
                widget.theme.category.icon,
                size: 11,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(width: 3),
              Expanded(
                child: Text(
                  widget.theme.category.displayName,
                  style: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Paleta de colores mini
          _buildMiniColorPalette(context),
        ],
      ),
    );
  }

  Widget _buildMiniColorPalette(BuildContext context) {
    final colors = [
      widget.theme.lightColorScheme.primary,
      widget.theme.lightColorScheme.secondary,
      widget.theme.lightColorScheme.tertiary,
    ];

    return Row(
      children: colors.map((color) {
        return Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.only(right: 2),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              width: 0.5,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botón de favoritos
          SizedBox(
            height: 28,
            width: 28,
            child: IconButton(
              padding: EdgeInsets.zero,
              iconSize: 16,
              onPressed: () {
                HapticFeedback.lightImpact();
                widget.onFavorite();
              },
              icon: Icon(
                widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: widget.isFavorite
                    ? Colors.red.shade400
                    : Theme.of(context).colorScheme.outline,
              ),
              tooltip: widget.isFavorite
                  ? 'Quitar de favoritos'
                  : 'Agregar a favoritos',
            ),
          ),
          // Botón de aplicar
          if (!widget.isCurrentTheme)
            SizedBox(
              height: 24,
              child: FilledButton.tonal(
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  widget.onApply();
                },
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  minimumSize: Size.zero,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.palette, size: 12),
                    const SizedBox(width: 3),
                    const Text('Aplicar', style: TextStyle(fontSize: 11)),
                  ],
                ),
              ),
            )
          else
            SizedBox(
              height: 24,
              child: Chip(
                label: const Text('APLICADO', style: TextStyle(fontSize: 10)),
                avatar: const Icon(Icons.check, size: 12),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                side: BorderSide.none,
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.only(right: 2),
              ),
            ),
        ],
      ),
    );
  }
}

/// Painter para crear un patrón decorativo sutil en el preview de colores
class _PatternPainter extends CustomPainter {
  final Color color;

  _PatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    // Crear un patrón de líneas diagonales sutiles
    for (double i = -size.height; i < size.width + size.height; i += 20) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}