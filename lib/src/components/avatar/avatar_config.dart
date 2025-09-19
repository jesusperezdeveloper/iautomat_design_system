import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar_config.freezed.dart';

@freezed
class DSAvatarConfig with _$DSAvatarConfig {
  const DSAvatarConfig._();

  const factory DSAvatarConfig({
    @Default(DSAvatarVariant.image) DSAvatarVariant variant,
    @Default(DSAvatarState.defaultState) DSAvatarState state,
    @Default(DSAvatarSize.medium) DSAvatarSize size,
    @Default(DSAvatarShape.circle) DSAvatarShape shape,
    String? imageUrl,
    String? initials,
    List<String>? groupImageUrls,
    List<String>? groupInitials,
    DSAvatarPresence? presence,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Widget? placeholder,
    Widget? errorWidget,
    DSAvatarStyle? style,
    DSAvatarInteraction? interaction,
    DSAvatarAccessibility? accessibility,
    DSAvatarAnimation? animation,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    String? semanticLabel,
    String? tooltip,
    @Default(true) bool enabled,
    @Default(false) bool loading,
    @Default(false) bool skeleton,
    @Default(true) bool visible,
    @Default(2) int maxGroupCount,
    @Default(false) bool showPresence,
    @Default(false) bool showBorder,
    double? borderWidth,
    BoxFit? imageFit,
    Duration? cacheDuration,
    Map<String, String>? imageHeaders,
  }) = _DSAvatarConfig;

  bool get isInteractive => onTap != null || onLongPress != null;
  bool get isHoverable => onHover != null;
  bool get isDisabled => !enabled || state == DSAvatarState.disabled;
  bool get isLoading => loading || state == DSAvatarState.loading;
  bool get isSkeleton => skeleton || state == DSAvatarState.skeleton;
  bool get shouldShowSkeleton => isSkeleton || isLoading;
  bool get canInteract =>
      isInteractive && !isDisabled && !isLoading && !isSkeleton;
  bool get hasImageUrl => imageUrl != null && imageUrl!.isNotEmpty;
  bool get hasInitials => initials != null && initials!.isNotEmpty;
  bool get hasGroupImages =>
      groupImageUrls != null && groupImageUrls!.isNotEmpty;
  bool get hasGroupInitials =>
      groupInitials != null && groupInitials!.isNotEmpty;
  bool get hasPlaceholder => placeholder != null;
  bool get hasErrorWidget => errorWidget != null;
  bool get hasPresence => presence != null && showPresence;
  bool get hasBorder => showBorder || borderWidth != null;

  String get displayInitials {
    if (!hasInitials) return '';
    final clean = initials!.trim().toUpperCase();
    if (clean.isEmpty) return '';

    final words = clean.split(RegExp(r'\s+'));
    if (words.length == 1) {
      return words[0].length >= 2 ? words[0].substring(0, 2) : words[0];
    } else {
      return words
          .take(2)
          .map((word) => word.isNotEmpty ? word[0] : '')
          .join('');
    }
  }

  List<String> get displayGroupImages {
    if (!hasGroupImages) return [];
    return groupImageUrls!.take(maxGroupCount).toList();
  }

  List<String> get displayGroupInitials {
    if (!hasGroupInitials) return [];
    return groupInitials!.take(maxGroupCount).toList();
  }

  int get remainingGroupCount {
    if (variant == DSAvatarVariant.group) {
      final totalImages = groupImageUrls?.length ?? 0;
      final totalInitials = groupInitials?.length ?? 0;
      final total = totalImages > 0 ? totalImages : totalInitials;
      return total > maxGroupCount ? total - maxGroupCount : 0;
    }
    return 0;
  }

  Color getEffectiveBackgroundColor(ColorScheme colorScheme) {
    if (backgroundColor != null) return backgroundColor!;

    switch (variant) {
      case DSAvatarVariant.image:
        return colorScheme.surfaceContainerHighest;
      case DSAvatarVariant.initials:
        return colorScheme.primaryContainer;
      case DSAvatarVariant.group:
        return colorScheme.surfaceContainerHighest;
    }
  }

  Color getEffectiveForegroundColor(ColorScheme colorScheme) {
    if (foregroundColor != null) return foregroundColor!;

    switch (variant) {
      case DSAvatarVariant.image:
        return colorScheme.onSurface;
      case DSAvatarVariant.initials:
        return colorScheme.onPrimaryContainer;
      case DSAvatarVariant.group:
        return colorScheme.onSurface;
    }
  }

  Color getEffectiveBorderColor(ColorScheme colorScheme) {
    if (borderColor != null) return borderColor!;
    return colorScheme.outline;
  }

  double getEffectiveBorderWidth() {
    if (borderWidth != null) return borderWidth!;
    return showBorder ? DSAvatarConstants.defaultBorderWidth : 0.0;
  }
}

enum DSAvatarVariant {
  image,
  initials,
  group,
}

enum DSAvatarState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSAvatarSize {
  xxsmall,
  xsmall,
  small,
  medium,
  large,
  xlarge,
  xxlarge,
}

enum DSAvatarShape {
  circle,
  square,
  rounded,
}

enum DSAvatarPresence {
  online,
  offline,
  away,
  busy,
  doNotDisturb,
}

extension DSAvatarPresenceExtension on DSAvatarPresence {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case DSAvatarPresence.online:
        return Colors.green;
      case DSAvatarPresence.offline:
        return colorScheme.outline;
      case DSAvatarPresence.away:
        return Colors.orange;
      case DSAvatarPresence.busy:
        return Colors.red;
      case DSAvatarPresence.doNotDisturb:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case DSAvatarPresence.online:
        return Icons.circle;
      case DSAvatarPresence.offline:
        return Icons.circle_outlined;
      case DSAvatarPresence.away:
        return Icons.schedule;
      case DSAvatarPresence.busy:
        return Icons.circle;
      case DSAvatarPresence.doNotDisturb:
        return Icons.do_not_disturb_on;
    }
  }

  String get label {
    switch (this) {
      case DSAvatarPresence.online:
        return 'En línea';
      case DSAvatarPresence.offline:
        return 'Desconectado';
      case DSAvatarPresence.away:
        return 'Ausente';
      case DSAvatarPresence.busy:
        return 'Ocupado';
      case DSAvatarPresence.doNotDisturb:
        return 'No molestar';
    }
  }
}

@freezed
class DSAvatarStyle with _$DSAvatarStyle {
  const DSAvatarStyle._();

  const factory DSAvatarStyle({
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Color? shadowColor,
    Color? overlayColor,
    double? borderWidth,
    double? borderRadius,
    double? elevation,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxConstraints? constraints,
    Decoration? decoration,
    TextStyle? textStyle,
    double? iconSize,
    Offset? offset,
    BoxFit? imageFit,
    FilterQuality? filterQuality,
  }) = _DSAvatarStyle;

  DSAvatarStyle copyWithState(DSAvatarState state) {
    switch (state) {
      case DSAvatarState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          elevation: (elevation ?? 0) + 1,
        );
      case DSAvatarState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          elevation: (elevation ?? 0) + 0.5,
        );
      case DSAvatarState.focus:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case DSAvatarState.selected:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 3.0,
          elevation: (elevation ?? 0) + 2,
        );
      case DSAvatarState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case DSAvatarState.loading:
      case DSAvatarState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class DSAvatarInteraction with _$DSAvatarInteraction {
  const factory DSAvatarInteraction({
    @Default(true) bool enabled,
    @Default(true) bool focusable,
    @Default(true) bool hoverable,
    @Default(false) bool autofocus,
    @Default(false) bool excludeFromSemantics,
    FocusNode? focusNode,
    ValueChanged<bool>? onFocusChange,
    ValueChanged<bool>? onHover,
    GestureTapCallback? onTap,
    GestureLongPressCallback? onLongPress,
    GestureTapCallback? onSecondaryTap,
    Map<ShortcutActivator, VoidCallback>? shortcuts,
  }) = _DSAvatarInteraction;
}

@freezed
class DSAvatarAccessibility with _$DSAvatarAccessibility {
  const factory DSAvatarAccessibility({
    String? semanticLabel,
    String? tooltip,
    bool? excludeSemantics,
    bool? obscureText,
    String? onTapHint,
    String? onLongPressHint,
    @Default(false) bool sortKey,
    @Default(false) bool liveRegion,
    @Default(false) bool focusable,
    @Default(false) bool button,
    @Default(false) bool image,
    @Default(false) bool header,
    @Default(false) bool readOnly,
  }) = _DSAvatarAccessibility;
}

@freezed
class DSAvatarAnimation with _$DSAvatarAnimation {
  const factory DSAvatarAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(DSAvatarAnimationType.fade) DSAvatarAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
    @Default(false) bool pulse,
    @Default(Duration(seconds: 2)) Duration pulseDuration,
  }) = _DSAvatarAnimation;
}

enum DSAvatarAnimationType {
  none,
  fade,
  slide,
  scale,
  bounce,
  pulse,
}

extension DSAvatarVariantExtension on DSAvatarVariant {
  bool get isImage => this == DSAvatarVariant.image;
  bool get isInitials => this == DSAvatarVariant.initials;
  bool get isGroup => this == DSAvatarVariant.group;
}

extension DSAvatarStateExtension on DSAvatarState {
  bool get isInteractiveState =>
      this == DSAvatarState.hover ||
      this == DSAvatarState.pressed ||
      this == DSAvatarState.focus;

  bool get isDisabledState => this == DSAvatarState.disabled;
  bool get isLoadingState => this == DSAvatarState.loading;
  bool get isSkeletonState => this == DSAvatarState.skeleton;
  bool get isSelectedState => this == DSAvatarState.selected;
}

extension DSAvatarSizeExtension on DSAvatarSize {
  double get size {
    switch (this) {
      case DSAvatarSize.xxsmall:
        return 20.0;
      case DSAvatarSize.xsmall:
        return 24.0;
      case DSAvatarSize.small:
        return 32.0;
      case DSAvatarSize.medium:
        return 40.0;
      case DSAvatarSize.large:
        return 48.0;
      case DSAvatarSize.xlarge:
        return 56.0;
      case DSAvatarSize.xxlarge:
        return 64.0;
    }
  }

  double get fontSize {
    switch (this) {
      case DSAvatarSize.xxsmall:
        return 8.0;
      case DSAvatarSize.xsmall:
        return 10.0;
      case DSAvatarSize.small:
        return 12.0;
      case DSAvatarSize.medium:
        return 16.0;
      case DSAvatarSize.large:
        return 18.0;
      case DSAvatarSize.xlarge:
        return 20.0;
      case DSAvatarSize.xxlarge:
        return 24.0;
    }
  }

  double get iconSize {
    switch (this) {
      case DSAvatarSize.xxsmall:
        return 10.0;
      case DSAvatarSize.xsmall:
        return 12.0;
      case DSAvatarSize.small:
        return 16.0;
      case DSAvatarSize.medium:
        return 20.0;
      case DSAvatarSize.large:
        return 24.0;
      case DSAvatarSize.xlarge:
        return 28.0;
      case DSAvatarSize.xxlarge:
        return 32.0;
    }
  }

  double get presenceSize {
    switch (this) {
      case DSAvatarSize.xxsmall:
        return 6.0;
      case DSAvatarSize.xsmall:
        return 8.0;
      case DSAvatarSize.small:
        return 10.0;
      case DSAvatarSize.medium:
        return 12.0;
      case DSAvatarSize.large:
        return 14.0;
      case DSAvatarSize.xlarge:
        return 16.0;
      case DSAvatarSize.xxlarge:
        return 18.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case DSAvatarSize.xxsmall:
        return const EdgeInsets.all(2.0);
      case DSAvatarSize.xsmall:
        return const EdgeInsets.all(2.0);
      case DSAvatarSize.small:
        return const EdgeInsets.all(4.0);
      case DSAvatarSize.medium:
        return const EdgeInsets.all(6.0);
      case DSAvatarSize.large:
        return const EdgeInsets.all(8.0);
      case DSAvatarSize.xlarge:
        return const EdgeInsets.all(10.0);
      case DSAvatarSize.xxlarge:
        return const EdgeInsets.all(12.0);
    }
  }

  double get groupOverlap {
    return size * 0.25;
  }
}

extension DSAvatarShapeExtension on DSAvatarShape {
  BorderRadius? getBorderRadius(double size) {
    switch (this) {
      case DSAvatarShape.circle:
        return BorderRadius.circular(size / 2);
      case DSAvatarShape.square:
        return BorderRadius.zero;
      case DSAvatarShape.rounded:
        return BorderRadius.circular(size * 0.125);
    }
  }

  BoxShape get boxShape {
    switch (this) {
      case DSAvatarShape.circle:
        return BoxShape.circle;
      case DSAvatarShape.square:
      case DSAvatarShape.rounded:
        return BoxShape.rectangle;
    }
  }
}

class DSAvatarConstants {
  static const double defaultBorderWidth = 2.0;
  static const double defaultElevation = 0.0;
  static const double defaultPresenceSize = 12.0;
  static const double defaultIconSize = 20.0;
  static const double defaultFontSize = 16.0;
  static const Duration defaultAnimationDuration = Duration(milliseconds: 200);
  static const Curve defaultAnimationCurve = Curves.easeInOut;
  static const Duration defaultPulseDuration = Duration(seconds: 2);
  static const Duration defaultCacheDuration = Duration(hours: 24);

  static const EdgeInsetsGeometry defaultPadding = EdgeInsets.all(6.0);
  static const EdgeInsetsGeometry defaultMargin = EdgeInsets.zero;

  static const BoxConstraints defaultConstraints = BoxConstraints(
    minWidth: 40.0,
    minHeight: 40.0,
  );

  static const BoxFit defaultImageFit = BoxFit.cover;
  static const FilterQuality defaultFilterQuality = FilterQuality.medium;

  static const int defaultMaxGroupCount = 4;
  static const double defaultGroupOverlap = 0.25;

  static const Map<String, String> defaultImageHeaders = {};
}
