import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'avatar_config.dart';

class AppAvatar extends StatefulWidget {
  final AppAvatarConfig config;

  const AppAvatar({
    super.key,
    required this.config,
  });

  AppAvatar.image({
    super.key,
    required String imageUrl,
    AppAvatarSize size = AppAvatarSize.medium,
    AppAvatarShape shape = AppAvatarShape.circle,
    AppAvatarPresence? presence,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Widget? placeholder,
    Widget? errorWidget,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    String? semanticLabel,
    String? tooltip,
    bool enabled = true,
    bool loading = false,
    bool skeleton = false,
    bool visible = true,
    bool showPresence = false,
    bool showBorder = false,
    double? borderWidth,
    BoxFit? imageFit,
    Duration? cacheDuration,
    Map<String, String>? imageHeaders,
    AppAvatarStyle? style,
    AppAvatarInteraction? interaction,
    AppAvatarAccessibility? accessibility,
    AppAvatarAnimation? animation,
  }) : config = AppAvatarConfig(
          variant: AppAvatarVariant.image,
          size: size,
          shape: shape,
          imageUrl: imageUrl,
          presence: presence,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          borderColor: borderColor,
          placeholder: placeholder,
          errorWidget: errorWidget,
          onTap: onTap,
          onLongPress: onLongPress,
          onHover: onHover,
          semanticLabel: semanticLabel,
          tooltip: tooltip,
          enabled: enabled,
          loading: loading,
          skeleton: skeleton,
          visible: visible,
          showPresence: showPresence,
          showBorder: showBorder,
          borderWidth: borderWidth,
          imageFit: imageFit,
          cacheDuration: cacheDuration,
          imageHeaders: imageHeaders,
          style: style,
          interaction: interaction,
          accessibility: accessibility,
          animation: animation,
        );

  AppAvatar.initials({
    super.key,
    required String initials,
    AppAvatarSize size = AppAvatarSize.medium,
    AppAvatarShape shape = AppAvatarShape.circle,
    AppAvatarPresence? presence,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    String? semanticLabel,
    String? tooltip,
    bool enabled = true,
    bool loading = false,
    bool skeleton = false,
    bool visible = true,
    bool showPresence = false,
    bool showBorder = false,
    double? borderWidth,
    AppAvatarStyle? style,
    AppAvatarInteraction? interaction,
    AppAvatarAccessibility? accessibility,
    AppAvatarAnimation? animation,
  }) : config = AppAvatarConfig(
          variant: AppAvatarVariant.initials,
          size: size,
          shape: shape,
          initials: initials,
          presence: presence,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          borderColor: borderColor,
          onTap: onTap,
          onLongPress: onLongPress,
          onHover: onHover,
          semanticLabel: semanticLabel,
          tooltip: tooltip,
          enabled: enabled,
          loading: loading,
          skeleton: skeleton,
          visible: visible,
          showPresence: showPresence,
          showBorder: showBorder,
          borderWidth: borderWidth,
          style: style,
          interaction: interaction,
          accessibility: accessibility,
          animation: animation,
        );

  AppAvatar.group({
    super.key,
    List<String>? groupImageUrls,
    List<String>? groupInitials,
    AppAvatarSize size = AppAvatarSize.medium,
    AppAvatarShape shape = AppAvatarShape.circle,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    String? semanticLabel,
    String? tooltip,
    bool enabled = true,
    bool loading = false,
    bool skeleton = false,
    bool visible = true,
    bool showBorder = false,
    double? borderWidth,
    int maxGroupCount = 2,
    BoxFit? imageFit,
    Duration? cacheDuration,
    Map<String, String>? imageHeaders,
    AppAvatarStyle? style,
    AppAvatarInteraction? interaction,
    AppAvatarAccessibility? accessibility,
    AppAvatarAnimation? animation,
  }) : config = AppAvatarConfig(
          variant: AppAvatarVariant.group,
          size: size,
          shape: shape,
          groupImageUrls: groupImageUrls,
          groupInitials: groupInitials,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          borderColor: borderColor,
          onTap: onTap,
          onLongPress: onLongPress,
          onHover: onHover,
          semanticLabel: semanticLabel,
          tooltip: tooltip,
          enabled: enabled,
          loading: loading,
          skeleton: skeleton,
          visible: visible,
          showBorder: showBorder,
          borderWidth: borderWidth,
          maxGroupCount: maxGroupCount,
          imageFit: imageFit,
          cacheDuration: cacheDuration,
          imageHeaders: imageHeaders,
          style: style,
          interaction: interaction,
          accessibility: accessibility,
          animation: animation,
        );

  @override
  State<AppAvatar> createState() => _AppAvatarState();
}

class _AppAvatarState extends State<AppAvatar>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late AnimationController _animationController;
  late AnimationController _pulseController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _pulseAnimation;

  AppAvatarState _currentState = AppAvatarState.defaultState;
  bool _isHovered = false;
  bool _isPressed = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeAnimations();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pulseController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _initializeAnimations() {
    final animation = widget.config.animation ?? const AppAvatarAnimation();

    _animationController = AnimationController(
      duration: animation.duration,
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: animation.pulseDuration,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: animation.curve,
    ));

    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: animation.curve,
    ));

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    if (animation.pulse && animation.enabled) {
      _pulseController.repeat(reverse: true);
    }
  }

  void _updateState(AppAvatarState newState) {
    if (_currentState != newState) {
      setState(() {
        _currentState = newState;
      });

      final animation = widget.config.animation;
      if (animation?.enabled == true) {
        switch (animation!.type) {
          case AppAvatarAnimationType.scale:
            if (newState.isInteractiveState) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            break;
          case AppAvatarAnimationType.fade:
            if (newState.isInteractiveState) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            break;
          default:
            break;
        }
      }
    }
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.config.canInteract) {
      _updateState(AppAvatarState.pressed);
      setState(() => _isPressed = true);
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.config.canInteract) {
      _updateState(_isFocused ? AppAvatarState.focus : AppAvatarState.defaultState);
      setState(() => _isPressed = false);
    }
  }

  void _handleTapCancel() {
    if (widget.config.canInteract) {
      _updateState(_isFocused ? AppAvatarState.focus : AppAvatarState.defaultState);
      setState(() => _isPressed = false);
    }
  }

  void _handleTap() {
    if (widget.config.canInteract) {
      HapticFeedback.lightImpact();
      widget.config.onTap?.call();
    }
  }

  void _handleLongPress() {
    if (widget.config.canInteract) {
      HapticFeedback.mediumImpact();
      widget.config.onLongPress?.call();
    }
  }

  void _handleHover(bool hovering) {
    if (widget.config.canInteract) {
      setState(() => _isHovered = hovering);
      if (hovering) {
        _updateState(AppAvatarState.hover);
        widget.config.onHover?.call();
      } else if (!_isPressed && !_isFocused) {
        _updateState(AppAvatarState.defaultState);
      }
    }
  }

  void _handleFocusChange(bool focused) {
    if (widget.config.canInteract) {
      setState(() => _isFocused = focused);
      if (focused) {
        _updateState(AppAvatarState.focus);
      } else if (!_isHovered && !_isPressed) {
        _updateState(AppAvatarState.defaultState);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.config.visible) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final effectiveState = widget.config.isDisabled
        ? AppAvatarState.disabled
        : widget.config.isLoading
            ? AppAvatarState.loading
            : widget.config.isSkeleton
                ? AppAvatarState.skeleton
                : _currentState;

    final style = _getEffectiveStyle(theme, widget.config, effectiveState);

    Widget avatar = _buildAvatarContent(theme, widget.config, style);

    if (widget.config.shouldShowSkeleton) {
      avatar = _buildSkeletonContent(theme, widget.config);
    }

    if (widget.config.hasPresence) {
      avatar = _buildAvatarWithPresence(theme, widget.config, avatar);
    }

    if (widget.config.tooltip != null) {
      avatar = Tooltip(
        message: widget.config.tooltip!,
        child: avatar,
      );
    }

    Widget result = avatar;

    final animation = widget.config.animation;
    if (animation?.enabled == true) {
      switch (animation!.type) {
        case AppAvatarAnimationType.scale:
          result = AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              );
            },
            child: result,
          );
          break;
        case AppAvatarAnimationType.fade:
          result = AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: child,
              );
            },
            child: result,
          );
          break;
        case AppAvatarAnimationType.pulse:
          result = AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseAnimation.value,
                child: child,
              );
            },
            child: result,
          );
          break;
        default:
          break;
      }
    }

    if (widget.config.isInteractive) {
      result = _buildInteractiveWrapper(result);
    }

    final semanticLabel = widget.config.semanticLabel ?? _generateSemanticLabel();
    if (semanticLabel.isNotEmpty) {
      result = Semantics(
        label: semanticLabel,
        button: widget.config.isInteractive,
        image: widget.config.variant.isImage,
        child: result,
      );
    }

    return result;
  }

  Widget _buildInteractiveWrapper(Widget child) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      onLongPress: _handleLongPress,
      child: MouseRegion(
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
        cursor: widget.config.canInteract ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: Focus(
          onFocusChange: _handleFocusChange,
          child: child,
        ),
      ),
    );
  }

  Widget _buildAvatarContent(ThemeData theme, AppAvatarConfig config, AppAvatarStyle style) {
    switch (config.variant) {
      case AppAvatarVariant.image:
        return _buildImageAvatar(theme, config, style);
      case AppAvatarVariant.initials:
        return _buildInitialsAvatar(theme, config, style);
      case AppAvatarVariant.group:
        return _buildGroupAvatar(theme, config, style);
    }
  }

  Widget _buildImageAvatar(ThemeData theme, AppAvatarConfig config, AppAvatarStyle style) {
    final size = config.size.size;
    final borderRadius = config.shape.getBorderRadius(size);

    Widget imageWidget;

    if (config.hasImageUrl) {
      imageWidget = _buildNetworkImage(config, style);
    } else if (config.hasPlaceholder) {
      imageWidget = config.placeholder!;
    } else {
      imageWidget = Icon(
        Icons.person,
        size: config.size.iconSize,
        color: style.foregroundColor,
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: borderRadius,
        border: config.hasBorder
            ? Border.all(
                color: style.borderColor!,
                width: config.getEffectiveBorderWidth(),
              )
            : null,
        boxShadow: style.elevation != null && style.elevation! > 0
            ? [
                BoxShadow(
                  color: style.shadowColor?.withValues(alpha: 0.2) ?? Colors.black.withValues(alpha: 0.1),
                  blurRadius: style.elevation!,
                  offset: Offset(0, style.elevation! / 2),
                ),
              ]
            : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: imageWidget,
    );
  }

  Widget _buildNetworkImage(AppAvatarConfig config, AppAvatarStyle style) {
    return Image.network(
      config.imageUrl!,
      fit: config.imageFit ?? AppAvatarConstants.defaultImageFit,
      filterQuality: style.filterQuality ?? AppAvatarConstants.defaultFilterQuality,
      headers: config.imageHeaders ?? AppAvatarConstants.defaultImageHeaders,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        if (config.hasErrorWidget) {
          return config.errorWidget!;
        }
        return Icon(
          Icons.person,
          size: config.size.iconSize,
          color: style.foregroundColor,
        );
      },
    );
  }

  Widget _buildInitialsAvatar(ThemeData theme, AppAvatarConfig config, AppAvatarStyle style) {
    final size = config.size.size;
    final borderRadius = config.shape.getBorderRadius(size);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: borderRadius,
        border: config.hasBorder
            ? Border.all(
                color: style.borderColor!,
                width: config.getEffectiveBorderWidth(),
              )
            : null,
        boxShadow: style.elevation != null && style.elevation! > 0
            ? [
                BoxShadow(
                  color: style.shadowColor?.withValues(alpha: 0.2) ?? Colors.black.withValues(alpha: 0.1),
                  blurRadius: style.elevation!,
                  offset: Offset(0, style.elevation! / 2),
                ),
              ]
            : null,
      ),
      child: Center(
        child: Text(
          config.displayInitials,
          style: style.textStyle?.copyWith(
                fontSize: config.size.fontSize,
                color: style.foregroundColor,
                fontWeight: FontWeight.w500,
              ) ??
              TextStyle(
                fontSize: config.size.fontSize,
                color: style.foregroundColor,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }

  Widget _buildGroupAvatar(ThemeData theme, AppAvatarConfig config, AppAvatarStyle style) {
    final size = config.size.size;
    final groupImages = config.displayGroupImages;
    final groupInitials = config.displayGroupInitials;
    final remainingCount = config.remainingGroupCount;

    if (groupImages.isEmpty && groupInitials.isEmpty) {
      return _buildInitialsAvatar(theme, config.copyWith(initials: '??'), style);
    }

    final children = <Widget>[];

    // Agregar avatares de imágenes
    for (int i = 0; i < groupImages.length; i++) {
      children.add(
        Positioned(
          left: i * (size - config.size.groupOverlap),
          child: _buildGroupAvatarItem(
            theme,
            config,
            style,
            imageUrl: groupImages[i],
          ),
        ),
      );
    }

    // Agregar avatares de iniciales
    for (int i = 0; i < groupInitials.length; i++) {
      final leftOffset = (groupImages.length + i) * (size - config.size.groupOverlap);
      children.add(
        Positioned(
          left: leftOffset,
          child: _buildGroupAvatarItem(
            theme,
            config,
            style,
            initials: groupInitials[i],
          ),
        ),
      );
    }

    // Agregar contador de elementos restantes si hay más
    if (remainingCount > 0) {
      final totalDisplayed = groupImages.length + groupInitials.length;
      final leftOffset = totalDisplayed * (size - config.size.groupOverlap);
      children.add(
        Positioned(
          left: leftOffset,
          child: _buildGroupAvatarItem(
            theme,
            config,
            style,
            initials: '+$remainingCount',
          ),
        ),
      );
    }

    final totalDisplayed = math.min(config.maxGroupCount, groupImages.length + groupInitials.length);
    final totalWidth = size + (totalDisplayed * (size - config.size.groupOverlap));

    return SizedBox(
      width: totalWidth,
      height: size,
      child: Stack(
        children: children,
      ),
    );
  }

  Widget _buildGroupAvatarItem(
    ThemeData theme,
    AppAvatarConfig config,
    AppAvatarStyle style, {
    String? imageUrl,
    String? initials,
  }) {
    final size = config.size.size;
    final borderRadius = config.shape.getBorderRadius(size);

    Widget content;
    if (imageUrl != null) {
      content = Image.network(
        imageUrl,
        fit: config.imageFit ?? AppAvatarConstants.defaultImageFit,
        filterQuality: style.filterQuality ?? AppAvatarConstants.defaultFilterQuality,
        headers: config.imageHeaders ?? AppAvatarConstants.defaultImageHeaders,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.person,
            size: config.size.iconSize * 0.7,
            color: style.foregroundColor,
          );
        },
      );
    } else {
      content = Center(
        child: Text(
          initials ?? '?',
          style: TextStyle(
            fontSize: config.size.fontSize * 0.8,
            color: style.foregroundColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: borderRadius,
        border: Border.all(
          color: theme.colorScheme.surface,
          width: 2.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: content,
    );
  }

  Widget _buildAvatarWithPresence(ThemeData theme, AppAvatarConfig config, Widget avatar) {
    final presence = config.presence!;
    final presenceSize = config.size.presenceSize;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        avatar,
        Positioned(
          right: -2,
          bottom: -2,
          child: Container(
            width: presenceSize,
            height: presenceSize,
            decoration: BoxDecoration(
              color: presence.getColor(theme.colorScheme),
              shape: BoxShape.circle,
              border: Border.all(
                color: theme.colorScheme.surface,
                width: 2.0,
              ),
            ),
            child: presence == AppAvatarPresence.doNotDisturb
                ? Icon(
                    Icons.remove,
                    size: presenceSize * 0.6,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildSkeletonContent(ThemeData theme, AppAvatarConfig config) {
    final size = config.size.size;
    final borderRadius = config.shape.getBorderRadius(size);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
        borderRadius: borderRadius,
      ),
      child: _SkeletonShimmer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.8),
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }

  AppAvatarStyle _getEffectiveStyle(ThemeData theme, AppAvatarConfig config, AppAvatarState state) {
    final colorScheme = theme.colorScheme;
    final effectiveBackgroundColor = config.getEffectiveBackgroundColor(colorScheme);
    final effectiveForegroundColor = config.getEffectiveForegroundColor(colorScheme);
    final effectiveBorderColor = config.getEffectiveBorderColor(colorScheme);

    final baseStyle = AppAvatarStyle(
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveForegroundColor,
      borderColor: effectiveBorderColor,
      shadowColor: colorScheme.shadow,
      overlayColor: colorScheme.onSurface,
      borderWidth: config.getEffectiveBorderWidth(),
      elevation: AppAvatarConstants.defaultElevation,
      textStyle: theme.textTheme.titleMedium,
      imageFit: config.imageFit ?? AppAvatarConstants.defaultImageFit,
      filterQuality: AppAvatarConstants.defaultFilterQuality,
    );

    final customStyle = config.style ?? const AppAvatarStyle();
    final mergedStyle = baseStyle.copyWith(
      backgroundColor: customStyle.backgroundColor ?? baseStyle.backgroundColor,
      foregroundColor: customStyle.foregroundColor ?? baseStyle.foregroundColor,
      borderColor: customStyle.borderColor ?? baseStyle.borderColor,
      shadowColor: customStyle.shadowColor ?? baseStyle.shadowColor,
      overlayColor: customStyle.overlayColor ?? baseStyle.overlayColor,
      borderWidth: customStyle.borderWidth ?? baseStyle.borderWidth,
      borderRadius: customStyle.borderRadius ?? baseStyle.borderRadius,
      elevation: customStyle.elevation ?? baseStyle.elevation,
      padding: customStyle.padding ?? baseStyle.padding,
      margin: customStyle.margin ?? baseStyle.margin,
      constraints: customStyle.constraints ?? baseStyle.constraints,
      decoration: customStyle.decoration ?? baseStyle.decoration,
      textStyle: customStyle.textStyle ?? baseStyle.textStyle,
      iconSize: customStyle.iconSize ?? baseStyle.iconSize,
      offset: customStyle.offset ?? baseStyle.offset,
      imageFit: customStyle.imageFit ?? baseStyle.imageFit,
      filterQuality: customStyle.filterQuality ?? baseStyle.filterQuality,
    );

    return mergedStyle.copyWithState(state);
  }

  String _generateSemanticLabel() {
    final config = widget.config;

    switch (config.variant) {
      case AppAvatarVariant.image:
        if (config.hasImageUrl) {
          return 'Avatar con imagen${config.hasPresence ? ', ${config.presence!.label}' : ''}';
        }
        return 'Avatar${config.hasPresence ? ', ${config.presence!.label}' : ''}';
      case AppAvatarVariant.initials:
        return 'Avatar de ${config.displayInitials}${config.hasPresence ? ', ${config.presence!.label}' : ''}';
      case AppAvatarVariant.group:
        final total = (config.groupImageUrls?.length ?? 0) + (config.groupInitials?.length ?? 0);
        return 'Avatar de grupo con $total miembros';
    }
  }
}

class _SkeletonShimmer extends StatefulWidget {
  final Widget child;

  const _SkeletonShimmer({required this.child});

  @override
  State<_SkeletonShimmer> createState() => __SkeletonShimmerState();
}

class __SkeletonShimmerState extends State<_SkeletonShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                math.max(0.0, _animation.value - 0.3),
                _animation.value,
                math.min(1.0, _animation.value + 0.3),
              ],
              colors: const [
                Colors.transparent,
                Colors.white54,
                Colors.transparent,
              ],
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}