import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar_config.freezed.dart';

@freezed
class AppAvatarConfig with _$AppAvatarConfig {
  const AppAvatarConfig._();

  const factory AppAvatarConfig({
    @Default(AppAvatarVariant.image) AppAvatarVariant variant,
    @Default(AppAvatarState.defaultState) AppAvatarState state,
    @Default(AppAvatarSize.medium) AppAvatarSize size,
    @Default(AppAvatarShape.circle) AppAvatarShape shape,
    String? imageUrl,
    String? initials,
    List<String>? groupImageUrls,
    List<String>? groupInitials,
    AppAvatarPresence? presence,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    Widget? placeholder,
    Widget? errorWidget,
    AppAvatarStyle? style,
    AppAvatarInteraction? interaction,
    AppAvatarAccessibility? accessibility,
    AppAvatarAnimation? animation,
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
  }) = _AppAvatarConfig;

  bool get isInteractive => onTap != null || onLongPress != null;
  bool get isHoverable => onHover != null;
  bool get isDisabled => !enabled || state == AppAvatarState.disabled;
  bool get isLoading => loading || state == AppAvatarState.loading;
  bool get isSkeleton => skeleton || state == AppAvatarState.skeleton;
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
    if (variant == AppAvatarVariant.group) {
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
      case AppAvatarVariant.image:
        return colorScheme.surfaceContainerHighest;
      case AppAvatarVariant.initials:
        return colorScheme.primaryContainer;
      case AppAvatarVariant.group:
        return colorScheme.surfaceContainerHighest;
    }
  }

  Color getEffectiveForegroundColor(ColorScheme colorScheme) {
    if (foregroundColor != null) return foregroundColor!;

    switch (variant) {
      case AppAvatarVariant.image:
        return colorScheme.onSurface;
      case AppAvatarVariant.initials:
        return colorScheme.onPrimaryContainer;
      case AppAvatarVariant.group:
        return colorScheme.onSurface;
    }
  }

  Color getEffectiveBorderColor(ColorScheme colorScheme) {
    if (borderColor != null) return borderColor!;
    return colorScheme.outline;
  }

  double getEffectiveBorderWidth() {
    if (borderWidth != null) return borderWidth!;
    return showBorder ? AppAvatarConstants.defaultBorderWidth : 0.0;
  }
}

enum AppAvatarVariant {
  image,
  initials,
  group,
}

enum AppAvatarState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppAvatarSize {
  xxsmall,
  xsmall,
  small,
  medium,
  large,
  xlarge,
  xxlarge,
}

enum AppAvatarShape {
  circle,
  square,
  rounded,
}

enum AppAvatarPresence {
  online,
  offline,
  away,
  busy,
  doNotDisturb,
}

extension AppAvatarPresenceExtension on AppAvatarPresence {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case AppAvatarPresence.online:
        return Colors.green;
      case AppAvatarPresence.offline:
        return colorScheme.outline;
      case AppAvatarPresence.away:
        return Colors.orange;
      case AppAvatarPresence.busy:
        return Colors.red;
      case AppAvatarPresence.doNotDisturb:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case AppAvatarPresence.online:
        return Icons.circle;
      case AppAvatarPresence.offline:
        return Icons.circle_outlined;
      case AppAvatarPresence.away:
        return Icons.schedule;
      case AppAvatarPresence.busy:
        return Icons.circle;
      case AppAvatarPresence.doNotDisturb:
        return Icons.do_not_disturb_on;
    }
  }

  String get label {
    switch (this) {
      case AppAvatarPresence.online:
        return 'En línea';
      case AppAvatarPresence.offline:
        return 'Desconectado';
      case AppAvatarPresence.away:
        return 'Ausente';
      case AppAvatarPresence.busy:
        return 'Ocupado';
      case AppAvatarPresence.doNotDisturb:
        return 'No molestar';
    }
  }
}

@freezed
class AppAvatarStyle with _$AppAvatarStyle {
  const AppAvatarStyle._();

  const factory AppAvatarStyle({
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
  }) = _AppAvatarStyle;

  AppAvatarStyle copyWithState(AppAvatarState state) {
    switch (state) {
      case AppAvatarState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          elevation: (elevation ?? 0) + 1,
        );
      case AppAvatarState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          elevation: (elevation ?? 0) + 0.5,
        );
      case AppAvatarState.focus:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case AppAvatarState.selected:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 3.0,
          elevation: (elevation ?? 0) + 2,
        );
      case AppAvatarState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case AppAvatarState.loading:
      case AppAvatarState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class AppAvatarInteraction with _$AppAvatarInteraction {
  const factory AppAvatarInteraction({
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
  }) = _AppAvatarInteraction;
}

@freezed
class AppAvatarAccessibility with _$AppAvatarAccessibility {
  const factory AppAvatarAccessibility({
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
  }) = _AppAvatarAccessibility;
}

@freezed
class AppAvatarAnimation with _$AppAvatarAnimation {
  const factory AppAvatarAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(AppAvatarAnimationType.fade) AppAvatarAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
    @Default(false) bool pulse,
    @Default(Duration(seconds: 2)) Duration pulseDuration,
  }) = _AppAvatarAnimation;
}

enum AppAvatarAnimationType {
  none,
  fade,
  slide,
  scale,
  bounce,
  pulse,
}

extension AppAvatarVariantExtension on AppAvatarVariant {
  bool get isImage => this == AppAvatarVariant.image;
  bool get isInitials => this == AppAvatarVariant.initials;
  bool get isGroup => this == AppAvatarVariant.group;
}

extension AppAvatarStateExtension on AppAvatarState {
  bool get isInteractiveState =>
      this == AppAvatarState.hover ||
      this == AppAvatarState.pressed ||
      this == AppAvatarState.focus;

  bool get isDisabledState => this == AppAvatarState.disabled;
  bool get isLoadingState => this == AppAvatarState.loading;
  bool get isSkeletonState => this == AppAvatarState.skeleton;
  bool get isSelectedState => this == AppAvatarState.selected;
}

extension AppAvatarSizeExtension on AppAvatarSize {
  double get size {
    switch (this) {
      case AppAvatarSize.xxsmall:
        return 20.0;
      case AppAvatarSize.xsmall:
        return 24.0;
      case AppAvatarSize.small:
        return 32.0;
      case AppAvatarSize.medium:
        return 40.0;
      case AppAvatarSize.large:
        return 48.0;
      case AppAvatarSize.xlarge:
        return 56.0;
      case AppAvatarSize.xxlarge:
        return 64.0;
    }
  }

  double get fontSize {
    switch (this) {
      case AppAvatarSize.xxsmall:
        return 8.0;
      case AppAvatarSize.xsmall:
        return 10.0;
      case AppAvatarSize.small:
        return 12.0;
      case AppAvatarSize.medium:
        return 16.0;
      case AppAvatarSize.large:
        return 18.0;
      case AppAvatarSize.xlarge:
        return 20.0;
      case AppAvatarSize.xxlarge:
        return 24.0;
    }
  }

  double get iconSize {
    switch (this) {
      case AppAvatarSize.xxsmall:
        return 10.0;
      case AppAvatarSize.xsmall:
        return 12.0;
      case AppAvatarSize.small:
        return 16.0;
      case AppAvatarSize.medium:
        return 20.0;
      case AppAvatarSize.large:
        return 24.0;
      case AppAvatarSize.xlarge:
        return 28.0;
      case AppAvatarSize.xxlarge:
        return 32.0;
    }
  }

  double get presenceSize {
    switch (this) {
      case AppAvatarSize.xxsmall:
        return 6.0;
      case AppAvatarSize.xsmall:
        return 8.0;
      case AppAvatarSize.small:
        return 10.0;
      case AppAvatarSize.medium:
        return 12.0;
      case AppAvatarSize.large:
        return 14.0;
      case AppAvatarSize.xlarge:
        return 16.0;
      case AppAvatarSize.xxlarge:
        return 18.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case AppAvatarSize.xxsmall:
        return const EdgeInsets.all(2.0);
      case AppAvatarSize.xsmall:
        return const EdgeInsets.all(2.0);
      case AppAvatarSize.small:
        return const EdgeInsets.all(4.0);
      case AppAvatarSize.medium:
        return const EdgeInsets.all(6.0);
      case AppAvatarSize.large:
        return const EdgeInsets.all(8.0);
      case AppAvatarSize.xlarge:
        return const EdgeInsets.all(10.0);
      case AppAvatarSize.xxlarge:
        return const EdgeInsets.all(12.0);
    }
  }

  double get groupOverlap {
    return size * 0.25;
  }
}

extension AppAvatarShapeExtension on AppAvatarShape {
  BorderRadius? getBorderRadius(double size) {
    switch (this) {
      case AppAvatarShape.circle:
        return BorderRadius.circular(size / 2);
      case AppAvatarShape.square:
        return BorderRadius.zero;
      case AppAvatarShape.rounded:
        return BorderRadius.circular(size * 0.125);
    }
  }

  BoxShape get boxShape {
    switch (this) {
      case AppAvatarShape.circle:
        return BoxShape.circle;
      case AppAvatarShape.square:
      case AppAvatarShape.rounded:
        return BoxShape.rectangle;
    }
  }
}

class AppAvatarConstants {
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
