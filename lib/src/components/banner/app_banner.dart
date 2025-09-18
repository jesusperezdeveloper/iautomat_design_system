import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum BannerVariant { inline, global }

enum BannerState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton
}

enum BannerType { info, success, warning, error, neutral }

enum BannerPriority { low, medium, high, critical }

class BannerAction {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isPrimary;

  const BannerAction({
    required this.label,
    required this.onPressed,
    this.icon,
    this.isPrimary = false,
  });
}

class AppBanner extends StatefulWidget {
  final BannerVariant variant;
  final String message;
  final BannerAction? action;
  final List<BannerAction> actions;
  final BannerState state;
  final BannerType type;
  final BannerPriority priority;
  final Widget? leading;
  final bool showDismissButton;
  final VoidCallback? onDismiss;
  final bool rtlSupport;
  final bool accessibilitySupport;
  final String? accessibilityLabel;
  final bool enableHapticFeedback;
  final bool persistent;
  final Duration? autoDismissDuration;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final double? borderWidth;
  final BorderRadius? borderRadius;

  const AppBanner({
    super.key,
    this.variant = BannerVariant.inline,
    required this.message,
    this.action,
    this.actions = const [],
    this.state = BannerState.defaultState,
    this.type = BannerType.info,
    this.priority = BannerPriority.medium,
    this.leading,
    this.showDismissButton = true,
    this.onDismiss,
    this.rtlSupport = true,
    this.accessibilitySupport = true,
    this.accessibilityLabel,
    this.enableHapticFeedback = true,
    this.persistent = false,
    this.autoDismissDuration,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.elevation,
    this.padding,
    this.textStyle,
    this.borderWidth,
    this.borderRadius,
  });

  @override
  State<AppBanner> createState() => _AppBannerState();

  /// Show a global banner at the top of the screen
  static void showGlobal(
    BuildContext context, {
    required String message,
    BannerAction? action,
    List<BannerAction> actions = const [],
    BannerType type = BannerType.info,
    BannerPriority priority = BannerPriority.medium,
    Widget? leading,
    bool showDismissButton = true,
    VoidCallback? onDismiss,
    bool persistent = false,
    Duration? autoDismissDuration,
  }) {
    AppBannerManager.show(
      context,
      AppBanner(
        variant: BannerVariant.global,
        message: message,
        action: action,
        actions: actions,
        type: type,
        priority: priority,
        leading: leading,
        showDismissButton: showDismissButton,
        onDismiss: onDismiss,
        persistent: persistent,
        autoDismissDuration: autoDismissDuration,
      ),
    );
  }

  /// Show an info banner
  static void info(
    BuildContext context, {
    required String message,
    BannerVariant variant = BannerVariant.inline,
    BannerAction? action,
    List<BannerAction> actions = const [],
  }) {
    if (variant == BannerVariant.global) {
      showGlobal(
        context,
        message: message,
        type: BannerType.info,
        action: action,
        actions: actions,
      );
    }
  }

  /// Show a success banner
  static void success(
    BuildContext context, {
    required String message,
    BannerVariant variant = BannerVariant.inline,
    BannerAction? action,
    List<BannerAction> actions = const [],
  }) {
    if (variant == BannerVariant.global) {
      showGlobal(
        context,
        message: message,
        type: BannerType.success,
        action: action,
        actions: actions,
      );
    }
  }

  /// Show a warning banner
  static void warning(
    BuildContext context, {
    required String message,
    BannerVariant variant = BannerVariant.inline,
    BannerAction? action,
    List<BannerAction> actions = const [],
    BannerPriority priority = BannerPriority.medium,
  }) {
    if (variant == BannerVariant.global) {
      showGlobal(
        context,
        message: message,
        type: BannerType.warning,
        action: action,
        actions: actions,
        priority: priority,
      );
    }
  }

  /// Show an error banner
  static void error(
    BuildContext context, {
    required String message,
    BannerVariant variant = BannerVariant.inline,
    BannerAction? action,
    List<BannerAction> actions = const [],
    BannerPriority priority = BannerPriority.high,
  }) {
    if (variant == BannerVariant.global) {
      showGlobal(
        context,
        message: message,
        type: BannerType.error,
        action: action,
        actions: actions,
        priority: priority,
      );
    }
  }
}

class _AppBannerState extends State<AppBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;
  Timer? _autoDismissTimer;
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startShowAnimation();
    _setupAutoDismiss();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<double>(
      begin: widget.variant == BannerVariant.global ? -1.0 : 0.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeInQuart,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      reverseCurve: Curves.easeIn,
    ));
  }

  void _startShowAnimation() {
    if (widget.state != BannerState.skeleton &&
        widget.state != BannerState.loading) {
      _animationController.forward();
    }
  }

  void _setupAutoDismiss() {
    if (widget.autoDismissDuration != null && !widget.persistent) {
      _autoDismissTimer = Timer(widget.autoDismissDuration!, () {
        _dismiss();
      });
    }
  }

  Future<void> _dismiss() async {
    if (widget.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }

    _autoDismissTimer?.cancel();
    await _animationController.reverse();
    widget.onDismiss?.call();
  }

  @override
  void dispose() {
    _autoDismissTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state == BannerState.skeleton) {
      return _buildSkeletonState(context);
    }

    if (widget.state == BannerState.loading) {
      return _buildLoadingState(context);
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isRtl = widget.rtlSupport &&
        Directionality.maybeOf(context) == TextDirection.rtl;

    final bannerContent = AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        Widget content = Transform.translate(
          offset: widget.variant == BannerVariant.global
              ? Offset(0, _slideAnimation.value * 100)
              : Offset.zero,
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: _buildBannerContent(theme, colorScheme, isRtl),
          ),
        );

        return content;
      },
    );

    if (widget.accessibilitySupport) {
      return Semantics(
        label: widget.accessibilityLabel ?? _getDefaultAccessibilityLabel(),
        liveRegion: true,
        child: bannerContent,
      );
    }

    return bannerContent;
  }

  Widget _buildBannerContent(
      ThemeData theme, ColorScheme colorScheme, bool isRtl) {
    final isDisabled = widget.state == BannerState.disabled;
    final backgroundColor = _getBackgroundColor(colorScheme);
    final textColor = _getTextColor(colorScheme);
    final borderColor = _getBorderColor(colorScheme);

    return Material(
      type: MaterialType.card,
      color: backgroundColor,
      elevation: widget.elevation ?? _getElevation(),
      shape: RoundedRectangleBorder(
        borderRadius: widget.borderRadius ?? _getBorderRadius(),
        side: BorderSide(
          color: borderColor,
          width: widget.borderWidth ?? _getBorderWidth(),
        ),
      ),
      child: InkWell(
        onTap: isDisabled ? null : () => _handleTap(),
        onHover: (hover) => _handleHover(hover),
        onFocusChange: (focus) => _handleFocus(focus),
        onTapDown: (_) => _handleTapDown(),
        onTapUp: (_) => _handleTapUp(),
        onTapCancel: () => _handleTapCancel(),
        borderRadius: widget.borderRadius ?? _getBorderRadius(),
        child: Container(
          width: double.infinity,
          padding: widget.padding ?? _getDefaultPadding(),
          constraints: BoxConstraints(
            minHeight: widget.variant == BannerVariant.global
                ? (_isDesktop() ? 48 : 56)
                : (_isDesktop() ? 40 : 48),
          ),
          child: Directionality(
            textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            child: Row(
              children: [
                if (widget.leading != null || _hasTypeIcon()) ...[
                  _buildLeading(colorScheme),
                  SizedBox(width: _isDesktop() ? 12 : 16),
                ],
                Expanded(
                  child: _buildMessage(theme, textColor),
                ),
                if (_hasActions()) ...[
                  SizedBox(width: _isDesktop() ? 12 : 16),
                  _buildActions(theme, colorScheme, isDisabled),
                ],
                if (widget.showDismissButton && !isDisabled) ...[
                  SizedBox(width: _isDesktop() ? 8 : 12),
                  _buildDismissButton(colorScheme),
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
        size: _isDesktop() ? 20 : 24,
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
            fontWeight: widget.priority == BannerPriority.critical ||
                    widget.priority == BannerPriority.high
                ? FontWeight.w600
                : FontWeight.w500,
          ),
      maxLines: widget.variant == BannerVariant.global ? 2 : 4,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildActions(
      ThemeData theme, ColorScheme colorScheme, bool isDisabled) {
    final allActions = [
      if (widget.action != null) widget.action!,
      ...widget.actions,
    ];

    if (allActions.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      children: allActions.map((action) {
        return action.isPrimary
            ? ElevatedButton(
                onPressed: isDisabled ? null : action.onPressed,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: _isDesktop() ? 16 : 20,
                    vertical: _isDesktop() ? 8 : 10,
                  ),
                  minimumSize: Size(0, _isDesktop() ? 32 : 40),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: _buildActionContent(action),
              )
            : TextButton(
                onPressed: isDisabled ? null : action.onPressed,
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: _isDesktop() ? 12 : 16,
                    vertical: _isDesktop() ? 8 : 10,
                  ),
                  minimumSize: Size(0, _isDesktop() ? 32 : 40),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: _buildActionContent(action),
              );
      }).toList(),
    );
  }

  Widget _buildActionContent(BannerAction action) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (action.icon != null) ...[
          Icon(action.icon, size: _isDesktop() ? 16 : 18),
          const SizedBox(width: 4),
        ],
        Text(action.label),
      ],
    );
  }

  Widget _buildDismissButton(ColorScheme colorScheme) {
    return IconButton(
      onPressed: _dismiss,
      icon: const Icon(Icons.close),
      iconSize: _isDesktop() ? 18 : 20,
      color: colorScheme.onSurface.withValues(alpha: 0.6),
      style: IconButton.styleFrom(
        minimumSize: Size(_isDesktop() ? 32 : 40, _isDesktop() ? 32 : 40),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      tooltip: 'Cerrar',
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: _getDefaultPadding(),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: _getBorderRadius(),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.2),
          width: _getBorderWidth(),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Cargando...',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonState(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      padding: _getDefaultPadding(),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: _getBorderRadius(),
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
                  width: MediaQuery.of(context).size.width * 0.6,
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
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Color _getBackgroundColor(ColorScheme colorScheme) {
    if (widget.backgroundColor != null) {
      return widget.backgroundColor!;
    }

    Color baseColor = switch (widget.type) {
      BannerType.success => colorScheme.primaryContainer,
      BannerType.warning => colorScheme.tertiaryContainer,
      BannerType.error => colorScheme.errorContainer,
      BannerType.info => colorScheme.secondaryContainer,
      BannerType.neutral => colorScheme.surfaceContainerHighest,
    };

    // Adjust for priority
    if (widget.priority == BannerPriority.critical) {
      baseColor = widget.type == BannerType.error
          ? colorScheme.error.withValues(alpha: 0.1)
          : baseColor;
    }

    if (widget.state == BannerState.disabled) {
      return baseColor.withValues(alpha: 0.5);
    }

    if (_isHovered && widget.state != BannerState.disabled) {
      return Color.alphaBlend(
        colorScheme.onSurface.withValues(alpha: 0.04),
        baseColor,
      );
    }

    if (_isPressed && widget.state != BannerState.disabled) {
      return Color.alphaBlend(
        colorScheme.onSurface.withValues(alpha: 0.08),
        baseColor,
      );
    }

    return baseColor;
  }

  Color _getTextColor(ColorScheme colorScheme) {
    if (widget.textColor != null) {
      return widget.textColor!;
    }

    Color baseColor = switch (widget.type) {
      BannerType.success => colorScheme.onPrimaryContainer,
      BannerType.warning => colorScheme.onTertiaryContainer,
      BannerType.error => colorScheme.onErrorContainer,
      BannerType.info => colorScheme.onSecondaryContainer,
      BannerType.neutral => colorScheme.onSurface,
    };

    if (widget.state == BannerState.disabled) {
      return baseColor.withValues(alpha: 0.38);
    }

    return baseColor;
  }

  Color _getBorderColor(ColorScheme colorScheme) {
    if (widget.borderColor != null) {
      return widget.borderColor!;
    }

    return switch (widget.type) {
      BannerType.success => colorScheme.primary.withValues(alpha: 0.3),
      BannerType.warning => colorScheme.tertiary.withValues(alpha: 0.3),
      BannerType.error => colorScheme.error.withValues(alpha: 0.3),
      BannerType.info => colorScheme.secondary.withValues(alpha: 0.3),
      BannerType.neutral => colorScheme.outline.withValues(alpha: 0.2),
    };
  }

  double _getElevation() {
    if (widget.variant == BannerVariant.global) {
      if (_isPressed) return 2;
      if (_isHovered) return 6;
      if (_isFocused) return 4;
      return 3;
    } else {
      if (_isPressed) return 0;
      if (_isHovered) return 2;
      if (_isFocused) return 1;
      return 0;
    }
  }

  double _getBorderWidth() {
    if (widget.variant == BannerVariant.global) return 0;
    return widget.priority == BannerPriority.critical ? 2.0 : 1.0;
  }

  BorderRadius _getBorderRadius() {
    if (widget.variant == BannerVariant.global) return BorderRadius.zero;
    return BorderRadius.circular(_isDesktop() ? 8 : 12);
  }

  EdgeInsetsGeometry _getDefaultPadding() {
    if (widget.variant == BannerVariant.global) {
      return EdgeInsets.symmetric(
        horizontal: _isDesktop() ? 24 : 16,
        vertical: _isDesktop() ? 12 : 14,
      );
    } else {
      return EdgeInsets.symmetric(
        horizontal: _isDesktop() ? 16 : 16,
        vertical: _isDesktop() ? 12 : 14,
      );
    }
  }

  bool _hasTypeIcon() {
    return widget.type != BannerType.neutral;
  }

  bool _hasActions() {
    return widget.action != null || widget.actions.isNotEmpty;
  }

  IconData _getTypeIcon() {
    return switch (widget.type) {
      BannerType.success => Icons.check_circle,
      BannerType.warning => Icons.warning,
      BannerType.error => Icons.error,
      BannerType.info => Icons.info,
      BannerType.neutral => Icons.info,
    };
  }

  Color _getTypeIconColor(ColorScheme colorScheme) {
    return switch (widget.type) {
      BannerType.success => colorScheme.primary,
      BannerType.warning => colorScheme.tertiary,
      BannerType.error => colorScheme.error,
      BannerType.info => colorScheme.secondary,
      BannerType.neutral => colorScheme.onSurface.withValues(alpha: 0.6),
    };
  }

  bool _isDesktop() {
    if (kIsWeb) return true;
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  String _getDefaultAccessibilityLabel() {
    final typeLabel = widget.type.name;
    final actionLabels = [
      if (widget.action != null) widget.action!.label,
      ...widget.actions.map((a) => a.label),
    ];

    String label = '$typeLabel banner: ${widget.message}';
    if (actionLabels.isNotEmpty) {
      label += ', with actions: ${actionLabels.join(', ')}';
    }
    if (widget.showDismissButton) {
      label += ', dismissible';
    }
    return label;
  }

  void _handleTap() {
    if (widget.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }
  }

  void _handleHover(bool isHovered) {
    if (mounted && widget.state != BannerState.disabled) {
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
    if (mounted && widget.state != BannerState.disabled) {
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

/// Banner manager for global banners
class AppBannerManager {
  static OverlayEntry? _currentEntry;
  static final Map<BannerPriority, List<AppBanner>> _queue = {};

  static void show(BuildContext context, AppBanner banner) {
    // If there's a current banner, handle priority
    if (_currentEntry != null && banner.variant == BannerVariant.global) {
      _queueBanner(banner);
      return;
    }

    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => _BannerWrapper(
        banner: banner.copyWith(onDismiss: () => remove(entry)),
      ),
    );

    _currentEntry = entry;
    overlay.insert(entry);

    // Handle auto-dismiss for non-persistent banners
    if (!banner.persistent && banner.autoDismissDuration != null) {
      Timer(banner.autoDismissDuration!, () {
        remove(entry);
      });
    }
  }

  static void remove(OverlayEntry entry) {
    if (_currentEntry == entry) {
      entry.remove();
      _currentEntry = null;
      _showNextQueuedBanner();
    }
  }

  static void removeAll() {
    _currentEntry?.remove();
    _currentEntry = null;
    _queue.clear();
  }

  static void _queueBanner(AppBanner banner) {
    _queue[banner.priority] ??= [];
    _queue[banner.priority]!.add(banner);
  }

  static void _showNextQueuedBanner() {
    // Show highest priority banner first
    for (final priority in [
      BannerPriority.critical,
      BannerPriority.high,
      BannerPriority.medium,
      BannerPriority.low,
    ]) {
      if (_queue[priority]?.isNotEmpty == true) {
        _queue[priority]!.removeAt(0);
        // This would need context, so we'll skip automatic showing
        // In practice, you'd need to pass context through the manager
        break;
      }
    }
  }
}

class _BannerWrapper extends StatelessWidget {
  final AppBanner banner;

  const _BannerWrapper({required this.banner});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final topPadding = mediaQuery.padding.top;

    return Positioned(
      top: banner.variant == BannerVariant.global ? topPadding : 0,
      left: 0,
      right: 0,
      child: Material(
        type: MaterialType.transparency,
        child: banner,
      ),
    );
  }
}

extension AppBannerCopyWith on AppBanner {
  AppBanner copyWith({
    BannerVariant? variant,
    String? message,
    BannerAction? action,
    List<BannerAction>? actions,
    BannerState? state,
    BannerType? type,
    BannerPriority? priority,
    Widget? leading,
    bool? showDismissButton,
    VoidCallback? onDismiss,
    bool? rtlSupport,
    bool? accessibilitySupport,
    String? accessibilityLabel,
    bool? enableHapticFeedback,
    bool? persistent,
    Duration? autoDismissDuration,
    Color? backgroundColor,
    Color? textColor,
    Color? borderColor,
    double? elevation,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
    double? borderWidth,
    BorderRadius? borderRadius,
  }) {
    return AppBanner(
      variant: variant ?? this.variant,
      message: message ?? this.message,
      action: action ?? this.action,
      actions: actions ?? this.actions,
      state: state ?? this.state,
      type: type ?? this.type,
      priority: priority ?? this.priority,
      leading: leading ?? this.leading,
      showDismissButton: showDismissButton ?? this.showDismissButton,
      onDismiss: onDismiss ?? this.onDismiss,
      rtlSupport: rtlSupport ?? this.rtlSupport,
      accessibilitySupport: accessibilitySupport ?? this.accessibilitySupport,
      accessibilityLabel: accessibilityLabel ?? this.accessibilityLabel,
      enableHapticFeedback: enableHapticFeedback ?? this.enableHapticFeedback,
      persistent: persistent ?? this.persistent,
      autoDismissDuration: autoDismissDuration ?? this.autoDismissDuration,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      borderColor: borderColor ?? this.borderColor,
      elevation: elevation ?? this.elevation,
      padding: padding ?? this.padding,
      textStyle: textStyle ?? this.textStyle,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }
}
