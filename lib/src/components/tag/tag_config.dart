import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_config.freezed.dart';

@freezed
class DSTagConfig with _$DSTagConfig {
  const DSTagConfig._();

  const factory DSTagConfig({
    @Default(DSTagVariant.semantic) DSTagVariant variant,
    @Default(DSTagState.defaultState) DSTagState state,
    @Default(DSTagSize.medium) DSTagSize size,
    @Default(DSTagShape.rounded) DSTagShape shape,
    @Default(DSTagSemanticColor.primary) DSTagSemanticColor semanticColor,
    required String label,
    Color? color,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    IconData? leadingIcon,
    IconData? trailingIcon,
    Widget? leadingWidget,
    Widget? trailingWidget,
    DSTagStyle? style,
    DSTagInteraction? interaction,
    DSTagAccessibility? accessibility,
    DSTagAnimation? animation,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    VoidCallback? onHover,
    VoidCallback? onRemove,
    String? semanticLabel,
    String? tooltip,
    @Default(true) bool enabled,
    @Default(false) bool loading,
    @Default(false) bool skeleton,
    @Default(true) bool visible,
    @Default(false) bool selected,
    @Default(false) bool removable,
    @Default(false) bool outlined,
    double? borderWidth,
    double? elevation,
  }) = _DSTagConfig;

  bool get isInteractive => onTap != null || onLongPress != null || removable;
  bool get isHoverable => onHover != null;
  bool get isDisabled => !enabled || state == DSTagState.disabled;
  bool get isLoading => loading || state == DSTagState.loading;
  bool get isSkeleton => skeleton || state == DSTagState.skeleton;
  bool get shouldShowSkeleton => isSkeleton || isLoading;
  bool get canInteract =>
      isInteractive && !isDisabled && !isLoading && !isSkeleton;
  bool get hasLabel => label.isNotEmpty;
  bool get hasLeadingIcon => leadingIcon != null;
  bool get hasTrailingIcon => trailingIcon != null;
  bool get hasLeadingWidget => leadingWidget != null;
  bool get hasTrailingWidget => trailingWidget != null;
  bool get hasLeading => hasLeadingIcon || hasLeadingWidget;
  bool get hasTrailing => hasTrailingIcon || hasTrailingWidget || removable;
  bool get isSelected => selected || state == DSTagState.selected;
  bool get hasBorder => outlined || borderWidth != null;

  Color getEffectiveColor(ColorScheme colorScheme) {
    if (color != null) return color!;
    return semanticColor.getColor(colorScheme);
  }

  Color getEffectiveBackgroundColor(ColorScheme colorScheme) {
    if (backgroundColor != null) return backgroundColor!;

    final baseColor = getEffectiveColor(colorScheme);

    if (outlined) {
      return Colors.transparent;
    }

    if (isSelected) {
      return baseColor;
    }

    return baseColor.withValues(alpha: 0.12);
  }

  Color getEffectiveForegroundColor(ColorScheme colorScheme) {
    if (foregroundColor != null) return foregroundColor!;

    final baseColor = getEffectiveColor(colorScheme);

    if (outlined) {
      return baseColor;
    }

    if (isSelected) {
      return _getContrastColor(baseColor, colorScheme);
    }

    return baseColor;
  }

  Color getEffectiveBorderColor(ColorScheme colorScheme) {
    if (borderColor != null) return borderColor!;

    if (outlined) {
      return getEffectiveColor(colorScheme);
    }

    return Colors.transparent;
  }

  double getEffectiveBorderWidth() {
    if (borderWidth != null) return borderWidth!;
    return outlined ? DSTagConstants.defaultBorderWidth : 0.0;
  }

  double getEffectiveElevation() {
    if (elevation != null) return elevation!;
    return isSelected
        ? DSTagConstants.selectedElevation
        : DSTagConstants.defaultElevation;
  }

  Color _getContrastColor(Color backgroundColor, ColorScheme colorScheme) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? colorScheme.onSurface : colorScheme.surface;
  }
}

enum DSTagVariant {
  semantic,
}

enum DSTagState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum DSTagSize {
  small,
  medium,
  large,
}

enum DSTagShape {
  rounded,
  pill,
  square,
}

enum DSTagSemanticColor {
  primary,
  secondary,
  success,
  warning,
  error,
  info,
  neutral,
}

extension DSTagSemanticColorExtension on DSTagSemanticColor {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case DSTagSemanticColor.primary:
        return colorScheme.primary;
      case DSTagSemanticColor.secondary:
        return colorScheme.secondary;
      case DSTagSemanticColor.success:
        return Colors.green;
      case DSTagSemanticColor.warning:
        return Colors.orange;
      case DSTagSemanticColor.error:
        return colorScheme.error;
      case DSTagSemanticColor.info:
        return Colors.blue;
      case DSTagSemanticColor.neutral:
        return colorScheme.outline;
    }
  }

  String get label {
    switch (this) {
      case DSTagSemanticColor.primary:
        return 'Primario';
      case DSTagSemanticColor.secondary:
        return 'Secundario';
      case DSTagSemanticColor.success:
        return 'Éxito';
      case DSTagSemanticColor.warning:
        return 'Advertencia';
      case DSTagSemanticColor.error:
        return 'Error';
      case DSTagSemanticColor.info:
        return 'Información';
      case DSTagSemanticColor.neutral:
        return 'Neutral';
    }
  }

  IconData get icon {
    switch (this) {
      case DSTagSemanticColor.primary:
        return Icons.star;
      case DSTagSemanticColor.secondary:
        return Icons.label;
      case DSTagSemanticColor.success:
        return Icons.check_circle;
      case DSTagSemanticColor.warning:
        return Icons.warning;
      case DSTagSemanticColor.error:
        return Icons.error;
      case DSTagSemanticColor.info:
        return Icons.info;
      case DSTagSemanticColor.neutral:
        return Icons.circle;
    }
  }
}

@freezed
class DSTagStyle with _$DSTagStyle {
  const DSTagStyle._();

  const factory DSTagStyle({
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
    double? spacing,
    Offset? offset,
  }) = _DSTagStyle;

  DSTagStyle copyWithState(DSTagState state) {
    switch (state) {
      case DSTagState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          elevation: (elevation ?? 0) + 1,
        );
      case DSTagState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          elevation: (elevation ?? 0) + 0.5,
        );
      case DSTagState.focus:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case DSTagState.selected:
        return copyWith(
          elevation: (elevation ?? 0) + 2,
        );
      case DSTagState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case DSTagState.loading:
      case DSTagState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class DSTagInteraction with _$DSTagInteraction {
  const factory DSTagInteraction({
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
    VoidCallback? onRemove,
    Map<ShortcutActivator, VoidCallback>? shortcuts,
  }) = _DSTagInteraction;
}

@freezed
class DSTagAccessibility with _$DSTagAccessibility {
  const factory DSTagAccessibility({
    String? semanticLabel,
    String? tooltip,
    bool? excludeSemantics,
    bool? obscureText,
    String? onTapHint,
    String? onLongPressHint,
    String? onRemoveHint,
    @Default(false) bool sortKey,
    @Default(false) bool liveRegion,
    @Default(false) bool focusable,
    @Default(false) bool button,
    @Default(false) bool link,
    @Default(false) bool chip,
    @Default(false) bool readOnly,
  }) = _DSTagAccessibility;
}

@freezed
class DSTagAnimation with _$DSTagAnimation {
  const factory DSTagAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(DSTagAnimationType.fade) DSTagAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
    @Default(false) bool pulse,
    @Default(Duration(seconds: 2)) Duration pulseDuration,
  }) = _DSTagAnimation;
}

enum DSTagAnimationType {
  none,
  fade,
  slide,
  scale,
  bounce,
  pulse,
}

extension DSTagVariantExtension on DSTagVariant {
  bool get isSemantic => this == DSTagVariant.semantic;
}

extension DSTagStateExtension on DSTagState {
  bool get isInteractiveState =>
      this == DSTagState.hover ||
      this == DSTagState.pressed ||
      this == DSTagState.focus;

  bool get isDisabledState => this == DSTagState.disabled;
  bool get isLoadingState => this == DSTagState.loading;
  bool get isSkeletonState => this == DSTagState.skeleton;
  bool get isSelectedState => this == DSTagState.selected;
}

extension DSTagSizeExtension on DSTagSize {
  double get height {
    switch (this) {
      case DSTagSize.small:
        return 24.0;
      case DSTagSize.medium:
        return 32.0;
      case DSTagSize.large:
        return 40.0;
    }
  }

  double get fontSize {
    switch (this) {
      case DSTagSize.small:
        return 12.0;
      case DSTagSize.medium:
        return 14.0;
      case DSTagSize.large:
        return 16.0;
    }
  }

  double get iconSize {
    switch (this) {
      case DSTagSize.small:
        return 14.0;
      case DSTagSize.medium:
        return 16.0;
      case DSTagSize.large:
        return 18.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case DSTagSize.small:
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
      case DSTagSize.medium:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);
      case DSTagSize.large:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
    }
  }

  double get spacing {
    switch (this) {
      case DSTagSize.small:
        return 4.0;
      case DSTagSize.medium:
        return 6.0;
      case DSTagSize.large:
        return 8.0;
    }
  }

  double get borderRadius {
    switch (this) {
      case DSTagSize.small:
        return 12.0;
      case DSTagSize.medium:
        return 16.0;
      case DSTagSize.large:
        return 20.0;
    }
  }
}

extension DSTagShapeExtension on DSTagShape {
  BorderRadius getBorderRadius(DSTagSize size) {
    switch (this) {
      case DSTagShape.rounded:
        return BorderRadius.circular(size.borderRadius);
      case DSTagShape.pill:
        return BorderRadius.circular(size.height / 2);
      case DSTagShape.square:
        return BorderRadius.circular(4.0);
    }
  }
}

class DSTagConstants {
  static const double defaultBorderWidth = 1.0;
  static const double defaultElevation = 0.0;
  static const double selectedElevation = 2.0;
  static const double defaultIconSize = 16.0;
  static const double defaultFontSize = 14.0;
  static const double defaultSpacing = 6.0;
  static const Duration defaultAnimationDuration = Duration(milliseconds: 200);
  static const Curve defaultAnimationCurve = Curves.easeInOut;
  static const Duration defaultPulseDuration = Duration(seconds: 2);

  static const EdgeInsetsGeometry defaultPadding =
      EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);
  static const EdgeInsetsGeometry defaultMargin = EdgeInsets.zero;

  static const BoxConstraints defaultConstraints = BoxConstraints(
    minHeight: 32.0,
  );

  static const double defaultBorderRadius = 16.0;
}
