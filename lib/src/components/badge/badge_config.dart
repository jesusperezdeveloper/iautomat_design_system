import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'badge_config.freezed.dart';

@freezed
class AppBadgeConfig with _$AppBadgeConfig {
  const AppBadgeConfig._();

  const factory AppBadgeConfig({
    @Default(AppBadgeVariant.dot) AppBadgeVariant variant,
    @Default(AppBadgeState.defaultState) AppBadgeState state,
    @Default(AppBadgeSize.medium) AppBadgeSize size,
    @Default(AppBadgePosition.topRight) AppBadgePosition position,
    @Default(AppBadgeShape.circle) AppBadgeShape shape,
    String? label,
    int? value,
    AppBadgeStatus? status,
    Color? color,
    Color? backgroundColor,
    Color? textColor,
    Widget? child,
    IconData? icon,
    AppBadgeStyle? style,
    AppBadgeInteraction? interaction,
    AppBadgeAccessibility? accessibility,
    AppBadgeAnimation? animation,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    String? semanticLabel,
    String? tooltip,
    @Default(true) bool enabled,
    @Default(false) bool loading,
    @Default(false) bool skeleton,
    @Default(true) bool visible,
    @Default(false) bool showZero,
    @Default(99) int maxValue,
  }) = _AppBadgeConfig;

  bool get isInteractive => onTap != null || onLongPress != null;
  bool get isHoverable => onHover != null;
  bool get isDisabled => !enabled || state == AppBadgeState.disabled;
  bool get isLoading => loading || state == AppBadgeState.loading;
  bool get isSkeleton => skeleton || state == AppBadgeState.skeleton;
  bool get shouldShowSkeleton => isSkeleton || isLoading;
  bool get canInteract => isInteractive && !isDisabled && !isLoading && !isSkeleton;
  bool get hasLabel => label != null && label!.isNotEmpty;
  bool get hasValue => value != null;
  bool get hasStatus => status != null;
  bool get hasChild => child != null;
  bool get hasIcon => icon != null;
  bool get shouldShowValue => hasValue && (showZero || value! > 0);
  bool get isValueOverMax => hasValue && value! > maxValue;

  String get displayValue {
    if (!hasValue) return '';
    if (!showZero && value! <= 0) return '';
    if (isValueOverMax) return '$maxValue+';
    return value!.toString();
  }

  Color getEffectiveColor(ColorScheme colorScheme) {
    if (color != null) return color!;

    switch (variant) {
      case AppBadgeVariant.dot:
        return colorScheme.error;
      case AppBadgeVariant.counter:
        return colorScheme.error;
      case AppBadgeVariant.status:
        return status?.getColor(colorScheme) ?? colorScheme.primary;
    }
  }

  Color getEffectiveBackgroundColor(ColorScheme colorScheme) {
    if (backgroundColor != null) return backgroundColor!;
    return getEffectiveColor(colorScheme);
  }

  Color getEffectiveTextColor(ColorScheme colorScheme) {
    if (textColor != null) return textColor!;
    final bgColor = getEffectiveBackgroundColor(colorScheme);
    return bgColor.computeLuminance() > 0.5
        ? colorScheme.onSurface
        : colorScheme.surface;
  }
}

enum AppBadgeVariant {
  dot,
  counter,
  status,
}

enum AppBadgeState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppBadgeSize {
  small,
  medium,
  large,
}

enum AppBadgePosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  center,
}

enum AppBadgeShape {
  circle,
  square,
  rounded,
}

enum AppBadgeStatus {
  success,
  warning,
  error,
  info,
  neutral,
}

extension AppBadgeStatusExtension on AppBadgeStatus {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case AppBadgeStatus.success:
        return Colors.green;
      case AppBadgeStatus.warning:
        return Colors.orange;
      case AppBadgeStatus.error:
        return colorScheme.error;
      case AppBadgeStatus.info:
        return Colors.blue;
      case AppBadgeStatus.neutral:
        return colorScheme.outline;
    }
  }

  IconData get icon {
    switch (this) {
      case AppBadgeStatus.success:
        return Icons.check_circle;
      case AppBadgeStatus.warning:
        return Icons.warning;
      case AppBadgeStatus.error:
        return Icons.error;
      case AppBadgeStatus.info:
        return Icons.info;
      case AppBadgeStatus.neutral:
        return Icons.circle;
    }
  }

  String get label {
    switch (this) {
      case AppBadgeStatus.success:
        return 'Éxito';
      case AppBadgeStatus.warning:
        return 'Advertencia';
      case AppBadgeStatus.error:
        return 'Error';
      case AppBadgeStatus.info:
        return 'Información';
      case AppBadgeStatus.neutral:
        return 'Neutral';
    }
  }
}

@freezed
class AppBadgeStyle with _$AppBadgeStyle {
  const AppBadgeStyle._();

  const factory AppBadgeStyle({
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
    double? dotSize,
    double? minWidth,
    double? minHeight,
    Offset? offset,
  }) = _AppBadgeStyle;

  AppBadgeStyle copyWithState(AppBadgeState state) {
    switch (state) {
      case AppBadgeState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          elevation: (elevation ?? 0) + 1,
        );
      case AppBadgeState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          elevation: (elevation ?? 0) + 0.5,
        );
      case AppBadgeState.focus:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case AppBadgeState.selected:
        return copyWith(
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case AppBadgeState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case AppBadgeState.loading:
      case AppBadgeState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class AppBadgeInteraction with _$AppBadgeInteraction {
  const factory AppBadgeInteraction({
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
  }) = _AppBadgeInteraction;
}

@freezed
class AppBadgeAccessibility with _$AppBadgeAccessibility {
  const factory AppBadgeAccessibility({
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
    @Default(false) bool link,
    @Default(false) bool header,
    @Default(false) bool readOnly,
  }) = _AppBadgeAccessibility;
}

@freezed
class AppBadgeAnimation with _$AppBadgeAnimation {
  const factory AppBadgeAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(AppBadgeAnimationType.fade) AppBadgeAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
    @Default(false) bool pulse,
    @Default(Duration(seconds: 2)) Duration pulseDuration,
  }) = _AppBadgeAnimation;
}

enum AppBadgeAnimationType {
  none,
  fade,
  slide,
  scale,
  bounce,
  pulse,
}

extension AppBadgeVariantExtension on AppBadgeVariant {
  bool get isDot => this == AppBadgeVariant.dot;
  bool get isCounter => this == AppBadgeVariant.counter;
  bool get isStatus => this == AppBadgeVariant.status;
}

extension AppBadgeStateExtension on AppBadgeState {
  bool get isInteractiveState => this == AppBadgeState.hover ||
                                this == AppBadgeState.pressed ||
                                this == AppBadgeState.focus;

  bool get isDisabledState => this == AppBadgeState.disabled;
  bool get isLoadingState => this == AppBadgeState.loading;
  bool get isSkeletonState => this == AppBadgeState.skeleton;
  bool get isSelectedState => this == AppBadgeState.selected;
}

extension AppBadgeSizeExtension on AppBadgeSize {
  double get dotSize {
    switch (this) {
      case AppBadgeSize.small:
        return 8.0;
      case AppBadgeSize.medium:
        return 12.0;
      case AppBadgeSize.large:
        return 16.0;
    }
  }

  double get counterSize {
    switch (this) {
      case AppBadgeSize.small:
        return 16.0;
      case AppBadgeSize.medium:
        return 20.0;
      case AppBadgeSize.large:
        return 24.0;
    }
  }

  double get statusSize {
    switch (this) {
      case AppBadgeSize.small:
        return 20.0;
      case AppBadgeSize.medium:
        return 24.0;
      case AppBadgeSize.large:
        return 28.0;
    }
  }

  double get fontSize {
    switch (this) {
      case AppBadgeSize.small:
        return 10.0;
      case AppBadgeSize.medium:
        return 12.0;
      case AppBadgeSize.large:
        return 14.0;
    }
  }

  double get iconSize {
    switch (this) {
      case AppBadgeSize.small:
        return 12.0;
      case AppBadgeSize.medium:
        return 16.0;
      case AppBadgeSize.large:
        return 20.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case AppBadgeSize.small:
        return const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0);
      case AppBadgeSize.medium:
        return const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0);
      case AppBadgeSize.large:
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
    }
  }
}

extension AppBadgePositionExtension on AppBadgePosition {
  AlignmentGeometry get alignment {
    switch (this) {
      case AppBadgePosition.topLeft:
        return Alignment.topLeft;
      case AppBadgePosition.topRight:
        return Alignment.topRight;
      case AppBadgePosition.bottomLeft:
        return Alignment.bottomLeft;
      case AppBadgePosition.bottomRight:
        return Alignment.bottomRight;
      case AppBadgePosition.center:
        return Alignment.center;
    }
  }

  Offset getOffset(AppBadgeSize size) {
    final offsetValue = size == AppBadgeSize.small ? 4.0 :
                      size == AppBadgeSize.medium ? 6.0 : 8.0;

    switch (this) {
      case AppBadgePosition.topLeft:
        return Offset(-offsetValue, -offsetValue);
      case AppBadgePosition.topRight:
        return Offset(offsetValue, -offsetValue);
      case AppBadgePosition.bottomLeft:
        return Offset(-offsetValue, offsetValue);
      case AppBadgePosition.bottomRight:
        return Offset(offsetValue, offsetValue);
      case AppBadgePosition.center:
        return Offset.zero;
    }
  }
}

extension AppBadgeShapeExtension on AppBadgeShape {
  BorderRadius? getBorderRadius(double size) {
    switch (this) {
      case AppBadgeShape.circle:
        return BorderRadius.circular(size / 2);
      case AppBadgeShape.square:
        return BorderRadius.zero;
      case AppBadgeShape.rounded:
        return BorderRadius.circular(4.0);
    }
  }
}

class AppBadgeConstants {
  static const double defaultBorderWidth = 1.0;
  static const double defaultElevation = 2.0;
  static const double defaultDotSize = 12.0;
  static const double defaultCounterSize = 20.0;
  static const double defaultStatusSize = 24.0;
  static const double defaultIconSize = 16.0;
  static const double defaultFontSize = 12.0;
  static const Duration defaultAnimationDuration = Duration(milliseconds: 200);
  static const Curve defaultAnimationCurve = Curves.easeInOut;
  static const Duration defaultPulseDuration = Duration(seconds: 2);

  static const EdgeInsetsGeometry defaultPadding = EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0);
  static const EdgeInsetsGeometry defaultMargin = EdgeInsets.zero;

  static const BoxConstraints defaultConstraints = BoxConstraints(
    minWidth: 16.0,
    minHeight: 16.0,
  );

  static const BoxConstraints dotConstraints = BoxConstraints(
    minWidth: 8.0,
    minHeight: 8.0,
    maxWidth: 16.0,
    maxHeight: 16.0,
  );

  static const BoxConstraints counterConstraints = BoxConstraints(
    minWidth: 16.0,
    minHeight: 16.0,
  );

  static const BoxConstraints statusConstraints = BoxConstraints(
    minWidth: 20.0,
    minHeight: 20.0,
  );
}