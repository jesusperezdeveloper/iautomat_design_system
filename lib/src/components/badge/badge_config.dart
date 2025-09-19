import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'badge_config.freezed.dart';

@freezed
class DSBadgeConfig with _$DSBadgeConfig {
  const DSBadgeConfig._();

  const factory DSBadgeConfig({
    @Default(DSBadgeVariant.dot) DSBadgeVariant variant,
    @Default(DSBadgeState.defaultState) DSBadgeState state,
    @Default(DSBadgeSize.medium) DSBadgeSize size,
    @Default(DSBadgePosition.topRight) DSBadgePosition position,
    @Default(DSBadgeShape.circle) DSBadgeShape shape,
    String? label,
    int? value,
    DSBadgeStatus? status,
    Color? color,
    Color? backgroundColor,
    Color? textColor,
    Widget? child,
    IconData? icon,
    DSBadgeStyle? style,
    DSBadgeInteraction? interaction,
    DSBadgeAccessibility? accessibility,
    DSBadgeAnimation? animation,
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
  }) = _DSBadgeConfig;

  bool get isInteractive => onTap != null || onLongPress != null;
  bool get isHoverable => onHover != null;
  bool get isDisabled => !enabled || state == DSBadgeState.disabled;
  bool get isLoading => loading || state == DSBadgeState.loading;
  bool get isSkeleton => skeleton || state == DSBadgeState.skeleton;
  bool get shouldShowSkeleton => isSkeleton || isLoading;
  bool get canInteract =>
      isInteractive && !isDisabled && !isLoading && !isSkeleton;
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
      case DSBadgeVariant.dot:
        return colorScheme.error;
      case DSBadgeVariant.counter:
        return colorScheme.error;
      case DSBadgeVariant.status:
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

enum DSBadgeVariant {
  dot,
  counter,
  status,
}

enum DSBadgeState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSBadgeSize {
  small,
  medium,
  large,
}

enum DSBadgePosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  center,
}

enum DSBadgeShape {
  circle,
  square,
  rounded,
}

enum DSBadgeStatus {
  success,
  warning,
  error,
  info,
  neutral,
}

extension DSBadgeStatusExtension on DSBadgeStatus {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case DSBadgeStatus.success:
        return Colors.green;
      case DSBadgeStatus.warning:
        return Colors.orange;
      case DSBadgeStatus.error:
        return colorScheme.error;
      case DSBadgeStatus.info:
        return Colors.blue;
      case DSBadgeStatus.neutral:
        return colorScheme.outline;
    }
  }

  IconData get icon {
    switch (this) {
      case DSBadgeStatus.success:
        return Icons.check_circle;
      case DSBadgeStatus.warning:
        return Icons.warning;
      case DSBadgeStatus.error:
        return Icons.error;
      case DSBadgeStatus.info:
        return Icons.info;
      case DSBadgeStatus.neutral:
        return Icons.circle;
    }
  }

  String get label {
    switch (this) {
      case DSBadgeStatus.success:
        return 'Éxito';
      case DSBadgeStatus.warning:
        return 'Advertencia';
      case DSBadgeStatus.error:
        return 'Error';
      case DSBadgeStatus.info:
        return 'Información';
      case DSBadgeStatus.neutral:
        return 'Neutral';
    }
  }
}

@freezed
class DSBadgeStyle with _$DSBadgeStyle {
  const DSBadgeStyle._();

  const factory DSBadgeStyle({
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
  }) = _DSBadgeStyle;

  DSBadgeStyle copyWithState(DSBadgeState state) {
    switch (state) {
      case DSBadgeState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          elevation: (elevation ?? 0) + 1,
        );
      case DSBadgeState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          elevation: (elevation ?? 0) + 0.5,
        );
      case DSBadgeState.focus:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case DSBadgeState.selected:
        return copyWith(
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case DSBadgeState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case DSBadgeState.loading:
      case DSBadgeState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class DSBadgeInteraction with _$DSBadgeInteraction {
  const factory DSBadgeInteraction({
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
  }) = _DSBadgeInteraction;
}

@freezed
class DSBadgeAccessibility with _$DSBadgeAccessibility {
  const factory DSBadgeAccessibility({
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
  }) = _DSBadgeAccessibility;
}

@freezed
class DSBadgeAnimation with _$DSBadgeAnimation {
  const factory DSBadgeAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(DSBadgeAnimationType.fade) DSBadgeAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
    @Default(false) bool pulse,
    @Default(Duration(seconds: 2)) Duration pulseDuration,
  }) = _DSBadgeAnimation;
}

enum DSBadgeAnimationType {
  none,
  fade,
  slide,
  scale,
  bounce,
  pulse,
}

extension DSBadgeVariantExtension on DSBadgeVariant {
  bool get isDot => this == DSBadgeVariant.dot;
  bool get isCounter => this == DSBadgeVariant.counter;
  bool get isStatus => this == DSBadgeVariant.status;
}

extension DSBadgeStateExtension on DSBadgeState {
  bool get isInteractiveState =>
      this == DSBadgeState.hover ||
      this == DSBadgeState.pressed ||
      this == DSBadgeState.focus;

  bool get isDisabledState => this == DSBadgeState.disabled;
  bool get isLoadingState => this == DSBadgeState.loading;
  bool get isSkeletonState => this == DSBadgeState.skeleton;
  bool get isSelectedState => this == DSBadgeState.selected;
}

extension DSBadgeSizeExtension on DSBadgeSize {
  double get dotSize {
    switch (this) {
      case DSBadgeSize.small:
        return 8.0;
      case DSBadgeSize.medium:
        return 12.0;
      case DSBadgeSize.large:
        return 16.0;
    }
  }

  double get counterSize {
    switch (this) {
      case DSBadgeSize.small:
        return 16.0;
      case DSBadgeSize.medium:
        return 20.0;
      case DSBadgeSize.large:
        return 24.0;
    }
  }

  double get statusSize {
    switch (this) {
      case DSBadgeSize.small:
        return 20.0;
      case DSBadgeSize.medium:
        return 24.0;
      case DSBadgeSize.large:
        return 28.0;
    }
  }

  double get fontSize {
    switch (this) {
      case DSBadgeSize.small:
        return 10.0;
      case DSBadgeSize.medium:
        return 12.0;
      case DSBadgeSize.large:
        return 14.0;
    }
  }

  double get iconSize {
    switch (this) {
      case DSBadgeSize.small:
        return 12.0;
      case DSBadgeSize.medium:
        return 16.0;
      case DSBadgeSize.large:
        return 20.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case DSBadgeSize.small:
        return const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0);
      case DSBadgeSize.medium:
        return const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0);
      case DSBadgeSize.large:
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
    }
  }
}

extension DSBadgePositionExtension on DSBadgePosition {
  AlignmentGeometry get alignment {
    switch (this) {
      case DSBadgePosition.topLeft:
        return Alignment.topLeft;
      case DSBadgePosition.topRight:
        return Alignment.topRight;
      case DSBadgePosition.bottomLeft:
        return Alignment.bottomLeft;
      case DSBadgePosition.bottomRight:
        return Alignment.bottomRight;
      case DSBadgePosition.center:
        return Alignment.center;
    }
  }

  Offset getOffset(DSBadgeSize size) {
    final offsetValue = size == DSBadgeSize.small
        ? 4.0
        : size == DSBadgeSize.medium
            ? 6.0
            : 8.0;

    switch (this) {
      case DSBadgePosition.topLeft:
        return Offset(-offsetValue, -offsetValue);
      case DSBadgePosition.topRight:
        return Offset(offsetValue, -offsetValue);
      case DSBadgePosition.bottomLeft:
        return Offset(-offsetValue, offsetValue);
      case DSBadgePosition.bottomRight:
        return Offset(offsetValue, offsetValue);
      case DSBadgePosition.center:
        return Offset.zero;
    }
  }
}

extension DSBadgeShapeExtension on DSBadgeShape {
  BorderRadius? getBorderRadius(double size) {
    switch (this) {
      case DSBadgeShape.circle:
        return BorderRadius.circular(size / 2);
      case DSBadgeShape.square:
        return BorderRadius.zero;
      case DSBadgeShape.rounded:
        return BorderRadius.circular(4.0);
    }
  }
}

class DSBadgeConstants {
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

  static const EdgeInsetsGeometry defaultPadding =
      EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0);
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
