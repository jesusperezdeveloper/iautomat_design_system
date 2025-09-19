import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum ToastVariant { stackable }

enum ToastState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton
}

enum ToastPosition {
  top,
  topStart,
  topEnd,
  center,
  centerStart,
  centerEnd,
  bottom,
  bottomStart,
  bottomEnd
}

enum ToastType { info, success, warning, error, custom }

class ToastAction {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  const ToastAction({
    required this.label,
    required this.onPressed,
    this.icon,
  });
}

class DSToast extends StatefulWidget {
  final ToastVariant variant;
  final String message;
  final ToastAction? action;
  final Duration duration;
  final ToastPosition position;
  final ToastState state;
  final ToastType type;
  final Widget? leading;
  final bool showCloseButton;
  final VoidCallback? onDismiss;
  final bool rtlSupport;
  final bool accessibilitySupport;
  final String? accessibilityLabel;
  final bool enableHapticFeedback;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  const DSToast({
    super.key,
    this.variant = ToastVariant.stackable,
    required this.message,
    this.action,
    this.duration = const Duration(seconds: 4),
    this.position = ToastPosition.bottom,
    this.state = ToastState.defaultState,
    this.type = ToastType.info,
    this.leading,
    this.showCloseButton = true,
    this.onDismiss,
    this.rtlSupport = true,
    this.accessibilitySupport = true,
    this.accessibilityLabel,
    this.enableHapticFeedback = true,
    this.backgroundColor,
    this.textColor,
    this.elevation,
    this.borderRadius,
    this.padding,
    this.textStyle,
  });

  @override
  State<DSToast> createState() => _DSToastState();

  /// Show a toast with the given parameters
  static void show(
    BuildContext context, {
    required String message,
    ToastVariant variant = ToastVariant.stackable,
    ToastAction? action,
    Duration duration = const Duration(seconds: 4),
    ToastPosition position = ToastPosition.bottom,
    ToastType type = ToastType.info,
    Widget? leading,
    bool showCloseButton = true,
    VoidCallback? onDismiss,
    Color? backgroundColor,
    Color? textColor,
  }) {
    DSToastManager.show(
      context,
      DSToast(
        message: message,
        variant: variant,
        action: action,
        duration: duration,
        position: position,
        type: type,
        leading: leading,
        showCloseButton: showCloseButton,
        onDismiss: onDismiss,
        backgroundColor: backgroundColor,
        textColor: textColor,
      ),
    );
  }

  /// Show an info toast
  static void info(
    BuildContext context, {
    required String message,
    ToastAction? action,
    Duration duration = const Duration(seconds: 4),
    ToastPosition position = ToastPosition.bottom,
  }) {
    show(
      context,
      message: message,
      type: ToastType.info,
      action: action,
      duration: duration,
      position: position,
    );
  }

  /// Show a success toast
  static void success(
    BuildContext context, {
    required String message,
    ToastAction? action,
    Duration duration = const Duration(seconds: 4),
    ToastPosition position = ToastPosition.bottom,
  }) {
    show(
      context,
      message: message,
      type: ToastType.success,
      action: action,
      duration: duration,
      position: position,
    );
  }

  /// Show a warning toast
  static void warning(
    BuildContext context, {
    required String message,
    ToastAction? action,
    Duration duration = const Duration(seconds: 4),
    ToastPosition position = ToastPosition.bottom,
  }) {
    show(
      context,
      message: message,
      type: ToastType.warning,
      action: action,
      duration: duration,
      position: position,
    );
  }

  /// Show an error toast
  static void error(
    BuildContext context, {
    required String message,
    ToastAction? action,
    Duration duration = const Duration(seconds: 6),
    ToastPosition position = ToastPosition.bottom,
  }) {
    show(
      context,
      message: message,
      type: ToastType.error,
      action: action,
      duration: duration,
      position: position,
    );
  }
}

class _DSToastState extends State<DSToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startShowAnimation();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: _getSlideBeginValue(),
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
      reverseCurve: Curves.easeInBack,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
      reverseCurve: Curves.easeIn,
    ));
  }

  double _getSlideBeginValue() {
    switch (widget.position) {
      case ToastPosition.top:
      case ToastPosition.topStart:
      case ToastPosition.topEnd:
        return -100.0;
      case ToastPosition.bottom:
      case ToastPosition.bottomStart:
      case ToastPosition.bottomEnd:
        return 100.0;
      case ToastPosition.center:
      case ToastPosition.centerStart:
      case ToastPosition.centerEnd:
        return 50.0;
    }
  }

  void _startShowAnimation() {
    _animationController.forward();
  }

  Future<void> _dismiss() async {
    if (widget.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }

    await _animationController.reverse();
    widget.onDismiss?.call();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state == ToastState.skeleton) {
      return _buildSkeletonState(context);
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isRtl = widget.rtlSupport &&
        Directionality.maybeOf(context) == TextDirection.rtl;

    final toastContent = AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _slideAnimation.value),
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: _buildToastContent(theme, colorScheme, isRtl),
          ),
        );
      },
    );

    if (widget.accessibilitySupport) {
      return Semantics(
        label: widget.accessibilityLabel ??
            'Toast: ${widget.message}${widget.action != null ? ', with action ${widget.action!.label}' : ''}',
        liveRegion: true,
        child: toastContent,
      );
    }

    return toastContent;
  }

  Widget _buildToastContent(
      ThemeData theme, ColorScheme colorScheme, bool isRtl) {
    final isDisabled = widget.state == ToastState.disabled;
    final backgroundColor = _getBackgroundColor(theme, colorScheme);
    final textColor = _getTextColor(theme, colorScheme);
    final borderRadius = widget.borderRadius ??
        (_isDesktop() ? BorderRadius.circular(8) : BorderRadius.circular(12));

    return Material(
      type: MaterialType.card,
      color: backgroundColor,
      elevation: widget.elevation ?? (_getElevation()),
      borderRadius: borderRadius,
      child: InkWell(
        onTap: isDisabled ? null : () => _handleTap(),
        onHover: (hover) => _handleHover(hover),
        onFocusChange: (focus) => _handleFocus(focus),
        onTapDown: (_) => _handleTapDown(),
        onTapUp: (_) => _handleTapUp(),
        onTapCancel: () => _handleTapCancel(),
        borderRadius: borderRadius,
        child: Container(
          padding: widget.padding ?? _getDefaultPadding(),
          constraints: BoxConstraints(
            minHeight: _isDesktop() ? 48 : 56,
            maxWidth: _isDesktop() ? 400 : double.infinity,
          ),
          child: Directionality(
            textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.leading != null || _hasTypeIcon()) ...[
                  _buildLeading(colorScheme),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: _buildMessage(theme, textColor),
                ),
                if (widget.action != null) ...[
                  const SizedBox(width: 12),
                  _buildAction(theme, colorScheme, isDisabled),
                ],
                if (widget.showCloseButton) ...[
                  const SizedBox(width: 8),
                  _buildCloseButton(colorScheme, isDisabled),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeading(ColorScheme colorScheme) {
    if (widget.leading != null) {
      return widget.leading!;
    }

    if (_hasTypeIcon()) {
      return Icon(
        _getTypeIcon(),
        color: _getTypeIconColor(colorScheme),
        size: 20,
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildMessage(ThemeData theme, Color textColor) {
    return Text(
      widget.message,
      style: widget.textStyle ??
          theme.textTheme.bodyMedium?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAction(
      ThemeData theme, ColorScheme colorScheme, bool isDisabled) {
    if (widget.action == null) return const SizedBox.shrink();

    return TextButton(
      onPressed: isDisabled ? null : widget.action!.onPressed,
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        minimumSize: const Size(0, 32),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.action!.icon != null) ...[
            Icon(widget.action!.icon, size: 16),
            const SizedBox(width: 4),
          ],
          Text(
            widget.action!.label,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCloseButton(ColorScheme colorScheme, bool isDisabled) {
    return IconButton(
      onPressed: isDisabled ? null : _dismiss,
      icon: const Icon(Icons.close),
      iconSize: 18,
      color: colorScheme.onSurface.withValues(alpha: 0.6),
      style: IconButton.styleFrom(
        minimumSize: const Size(32, 32),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      tooltip: 'Cerrar',
    );
  }

  Widget _buildSkeletonState(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: _getDefaultPadding(),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: colorScheme.outline.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 16,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 16,
                  width: 120,
                  decoration: BoxDecoration(
                    color: colorScheme.outline.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: colorScheme.outline.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor(ThemeData theme, ColorScheme colorScheme) {
    if (widget.backgroundColor != null) {
      return widget.backgroundColor!;
    }

    final baseColor = switch (widget.type) {
      ToastType.success => colorScheme.primaryContainer,
      ToastType.warning => colorScheme.tertiaryContainer,
      ToastType.error => colorScheme.errorContainer,
      ToastType.info => colorScheme.surfaceContainerHighest,
      ToastType.custom => colorScheme.surfaceContainerHighest,
    };

    if (widget.state == ToastState.disabled) {
      return baseColor.withValues(alpha: 0.5);
    }

    if (_isHovered && widget.state != ToastState.disabled) {
      return Color.alphaBlend(
        colorScheme.onSurface.withValues(alpha: 0.04),
        baseColor,
      );
    }

    if (_isPressed && widget.state != ToastState.disabled) {
      return Color.alphaBlend(
        colorScheme.onSurface.withValues(alpha: 0.08),
        baseColor,
      );
    }

    return baseColor;
  }

  Color _getTextColor(ThemeData theme, ColorScheme colorScheme) {
    if (widget.textColor != null) {
      return widget.textColor!;
    }

    final baseColor = switch (widget.type) {
      ToastType.success => colorScheme.onPrimaryContainer,
      ToastType.warning => colorScheme.onTertiaryContainer,
      ToastType.error => colorScheme.onErrorContainer,
      ToastType.info => colorScheme.onSurface,
      ToastType.custom => colorScheme.onSurface,
    };

    if (widget.state == ToastState.disabled) {
      return baseColor.withValues(alpha: 0.38);
    }

    return baseColor;
  }

  double _getElevation() {
    if (_isPressed) return 1;
    if (_isHovered) return 4;
    if (_isFocused) return 3;
    return 2;
  }

  bool _hasTypeIcon() {
    return widget.type != ToastType.custom && widget.type != ToastType.info;
  }

  IconData _getTypeIcon() {
    return switch (widget.type) {
      ToastType.success => Icons.check_circle,
      ToastType.warning => Icons.warning,
      ToastType.error => Icons.error,
      ToastType.info => Icons.info,
      ToastType.custom => Icons.info,
    };
  }

  Color _getTypeIconColor(ColorScheme colorScheme) {
    return switch (widget.type) {
      ToastType.success => colorScheme.primary,
      ToastType.warning => colorScheme.tertiary,
      ToastType.error => colorScheme.error,
      ToastType.info => colorScheme.onSurface.withValues(alpha: 0.6),
      ToastType.custom => colorScheme.onSurface.withValues(alpha: 0.6),
    };
  }

  EdgeInsetsGeometry _getDefaultPadding() {
    if (_isDesktop()) {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
    }
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 14);
  }

  bool _isDesktop() {
    if (kIsWeb) return true;
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  void _handleTap() {
    if (widget.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }
  }

  void _handleHover(bool isHovered) {
    if (mounted && widget.state != ToastState.disabled) {
      setState(() {
        _isHovered = isHovered;
      });
    }
  }

  void _handleFocus(bool isFocused) {
    if (mounted) {
      setState(() {
        _isFocused = isFocused;
      });
    }
  }

  void _handleTapDown() {
    if (mounted && widget.state != ToastState.disabled) {
      setState(() {
        _isPressed = true;
      });
    }
  }

  void _handleTapUp() {
    if (mounted) {
      setState(() {
        _isPressed = false;
      });
    }
  }

  void _handleTapCancel() {
    if (mounted) {
      setState(() {
        _isPressed = false;
      });
    }
  }
}

/// Toast manager to handle stackable toasts
class DSToastManager {
  static final List<OverlayEntry> _entries = [];
  static final Map<ToastPosition, List<OverlayEntry>> _positionedEntries = {};

  static void show(BuildContext context, DSToast toast) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => _ToastWrapper(
        toast: toast.copyWith(onDismiss: () => remove(entry)),
        position: toast.position,
      ),
    );

    // Add to position-specific list for stacking
    _positionedEntries[toast.position] ??= [];
    _positionedEntries[toast.position]!.add(entry);

    // Add to global list
    _entries.add(entry);

    // Insert the overlay
    overlay.insert(entry);

    // Auto-dismiss after duration (unless duration is zero)
    if (toast.duration.inMilliseconds > 0) {
      Timer(toast.duration, () {
        remove(entry);
      });
    }

    // Limit stack size (max 5 toasts per position)
    final positionEntries = _positionedEntries[toast.position]!;
    if (positionEntries.length > 5) {
      final oldest = positionEntries.removeAt(0);
      remove(oldest);
    }
  }

  static void remove(OverlayEntry entry) {
    if (_entries.contains(entry)) {
      entry.remove();
      _entries.remove(entry);

      // Remove from position-specific lists
      for (final positionList in _positionedEntries.values) {
        positionList.remove(entry);
      }
    }
  }

  static void removeAll() {
    for (final entry in List.from(_entries)) {
      remove(entry);
    }
  }

  static void removeAllAtPosition(ToastPosition position) {
    final positionEntries = _positionedEntries[position];
    if (positionEntries != null) {
      for (final entry in List.from(positionEntries)) {
        remove(entry);
      }
    }
  }
}

class _ToastWrapper extends StatelessWidget {
  final DSToast toast;
  final ToastPosition position;

  const _ToastWrapper({
    required this.toast,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final safeAreaPadding = mediaQuery.padding;

    // Calculate position-specific entries count for stacking
    final entriesAtPosition =
        DSToastManager._positionedEntries[position] ?? [];
    final stackIndex = entriesAtPosition.length - 1;

    return Positioned(
      top: _getTopPosition(safeAreaPadding, stackIndex),
      bottom: _getBottomPosition(safeAreaPadding, stackIndex),
      left: _getLeftPosition(safeAreaPadding, stackIndex),
      right: _getRightPosition(safeAreaPadding, stackIndex),
      child: SafeArea(
        child: Container(
          margin: _getMargin(stackIndex),
          child: toast,
        ),
      ),
    );
  }

  double? _getTopPosition(EdgeInsets padding, int stackIndex) {
    switch (position) {
      case ToastPosition.top:
      case ToastPosition.topStart:
      case ToastPosition.topEnd:
        return padding.top + 16 + (stackIndex * 70.0);
      case ToastPosition.center:
      case ToastPosition.centerStart:
      case ToastPosition.centerEnd:
        return null;
      case ToastPosition.bottom:
      case ToastPosition.bottomStart:
      case ToastPosition.bottomEnd:
        return null;
    }
  }

  double? _getBottomPosition(EdgeInsets padding, int stackIndex) {
    switch (position) {
      case ToastPosition.top:
      case ToastPosition.topStart:
      case ToastPosition.topEnd:
        return null;
      case ToastPosition.center:
      case ToastPosition.centerStart:
      case ToastPosition.centerEnd:
        return null;
      case ToastPosition.bottom:
      case ToastPosition.bottomStart:
      case ToastPosition.bottomEnd:
        return padding.bottom + 16 + (stackIndex * 70.0);
    }
  }

  double? _getLeftPosition(EdgeInsets padding, int stackIndex) {
    switch (position) {
      case ToastPosition.topStart:
      case ToastPosition.centerStart:
      case ToastPosition.bottomStart:
        return padding.left + 16;
      case ToastPosition.top:
      case ToastPosition.center:
      case ToastPosition.bottom:
        return 16;
      case ToastPosition.topEnd:
      case ToastPosition.centerEnd:
      case ToastPosition.bottomEnd:
        return null;
    }
  }

  double? _getRightPosition(EdgeInsets padding, int stackIndex) {
    switch (position) {
      case ToastPosition.topStart:
      case ToastPosition.centerStart:
      case ToastPosition.bottomStart:
        return null;
      case ToastPosition.top:
      case ToastPosition.center:
      case ToastPosition.bottom:
        return 16;
      case ToastPosition.topEnd:
      case ToastPosition.centerEnd:
      case ToastPosition.bottomEnd:
        return padding.right + 16;
    }
  }

  EdgeInsetsGeometry _getMargin(int stackIndex) {
    // Add slight offset for stacking effect
    return EdgeInsets.only(
      top: stackIndex * 2.0,
      left: stackIndex * 1.0,
    );
  }
}

extension DSToastCopyWith on DSToast {
  DSToast copyWith({
    ToastVariant? variant,
    String? message,
    ToastAction? action,
    Duration? duration,
    ToastPosition? position,
    ToastState? state,
    ToastType? type,
    Widget? leading,
    bool? showCloseButton,
    VoidCallback? onDismiss,
    bool? rtlSupport,
    bool? accessibilitySupport,
    String? accessibilityLabel,
    bool? enableHapticFeedback,
    Color? backgroundColor,
    Color? textColor,
    double? elevation,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
  }) {
    return DSToast(
      variant: variant ?? this.variant,
      message: message ?? this.message,
      action: action ?? this.action,
      duration: duration ?? this.duration,
      position: position ?? this.position,
      state: state ?? this.state,
      type: type ?? this.type,
      leading: leading ?? this.leading,
      showCloseButton: showCloseButton ?? this.showCloseButton,
      onDismiss: onDismiss ?? this.onDismiss,
      rtlSupport: rtlSupport ?? this.rtlSupport,
      accessibilitySupport: accessibilitySupport ?? this.accessibilitySupport,
      accessibilityLabel: accessibilityLabel ?? this.accessibilityLabel,
      enableHapticFeedback: enableHapticFeedback ?? this.enableHapticFeedback,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      elevation: elevation ?? this.elevation,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
    );
  }
}
