import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_config.freezed.dart';

@freezed
class AppTagConfig with _$AppTagConfig {
  const AppTagConfig._();

  const factory AppTagConfig({
    @Default(AppTagVariant.semantic) AppTagVariant variant,
    @Default(AppTagState.defaultState) AppTagState state,
    @Default(AppTagSize.medium) AppTagSize size,
    @Default(AppTagShape.rounded) AppTagShape shape,
    @Default(AppTagSemanticColor.primary) AppTagSemanticColor semanticColor,
    required String label,
    Color? color,
    Color? backgroundColor,
    Color? foregroundColor,
    Color? borderColor,
    IconData? leadingIcon,
    IconData? trailingIcon,
    Widget? leadingWidget,
    Widget? trailingWidget,
    AppTagStyle? style,
    AppTagInteraction? interaction,
    AppTagAccessibility? accessibility,
    AppTagAnimation? animation,
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
  }) = _AppTagConfig;

  bool get isInteractive => onTap != null || onLongPress != null || removable;
  bool get isHoverable => onHover != null;
  bool get isDisabled => !enabled || state == AppTagState.disabled;
  bool get isLoading => loading || state == AppTagState.loading;
  bool get isSkeleton => skeleton || state == AppTagState.skeleton;
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
  bool get isSelected => selected || state == AppTagState.selected;
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
    return outlined ? AppTagConstants.defaultBorderWidth : 0.0;
  }

  double getEffectiveElevation() {
    if (elevation != null) return elevation!;
    return isSelected
        ? AppTagConstants.selectedElevation
        : AppTagConstants.defaultElevation;
  }

  Color _getContrastColor(Color backgroundColor, ColorScheme colorScheme) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? colorScheme.onSurface : colorScheme.surface;
  }
}

enum AppTagVariant {
  semantic,
}

enum AppTagState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton,
}

enum AppTagSize {
  small,
  medium,
  large,
}

enum AppTagShape {
  rounded,
  pill,
  square,
}

enum AppTagSemanticColor {
  primary,
  secondary,
  success,
  warning,
  error,
  info,
  neutral,
}

extension AppTagSemanticColorExtension on AppTagSemanticColor {
  Color getColor(ColorScheme colorScheme) {
    switch (this) {
      case AppTagSemanticColor.primary:
        return colorScheme.primary;
      case AppTagSemanticColor.secondary:
        return colorScheme.secondary;
      case AppTagSemanticColor.success:
        return Colors.green;
      case AppTagSemanticColor.warning:
        return Colors.orange;
      case AppTagSemanticColor.error:
        return colorScheme.error;
      case AppTagSemanticColor.info:
        return Colors.blue;
      case AppTagSemanticColor.neutral:
        return colorScheme.outline;
    }
  }

  String get label {
    switch (this) {
      case AppTagSemanticColor.primary:
        return 'Primario';
      case AppTagSemanticColor.secondary:
        return 'Secundario';
      case AppTagSemanticColor.success:
        return 'Éxito';
      case AppTagSemanticColor.warning:
        return 'Advertencia';
      case AppTagSemanticColor.error:
        return 'Error';
      case AppTagSemanticColor.info:
        return 'Información';
      case AppTagSemanticColor.neutral:
        return 'Neutral';
    }
  }

  IconData get icon {
    switch (this) {
      case AppTagSemanticColor.primary:
        return Icons.star;
      case AppTagSemanticColor.secondary:
        return Icons.label;
      case AppTagSemanticColor.success:
        return Icons.check_circle;
      case AppTagSemanticColor.warning:
        return Icons.warning;
      case AppTagSemanticColor.error:
        return Icons.error;
      case AppTagSemanticColor.info:
        return Icons.info;
      case AppTagSemanticColor.neutral:
        return Icons.circle;
    }
  }
}

@freezed
class AppTagStyle with _$AppTagStyle {
  const AppTagStyle._();

  const factory AppTagStyle({
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
  }) = _AppTagStyle;

  AppTagStyle copyWithState(AppTagState state) {
    switch (state) {
      case AppTagState.hover:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.08),
          elevation: (elevation ?? 0) + 1,
        );
      case AppTagState.pressed:
        return copyWith(
          overlayColor: overlayColor?.withValues(alpha: 0.12),
          elevation: (elevation ?? 0) + 0.5,
        );
      case AppTagState.focus:
        return copyWith(
          borderColor: borderColor,
          borderWidth: 2.0,
        );
      case AppTagState.selected:
        return copyWith(
          elevation: (elevation ?? 0) + 2,
        );
      case AppTagState.disabled:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.38),
          backgroundColor: backgroundColor?.withValues(alpha: 0.12),
        );
      case AppTagState.loading:
      case AppTagState.skeleton:
        return copyWith(
          foregroundColor: foregroundColor?.withValues(alpha: 0.6),
        );
      default:
        return this;
    }
  }
}

@freezed
class AppTagInteraction with _$AppTagInteraction {
  const factory AppTagInteraction({
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
  }) = _AppTagInteraction;
}

@freezed
class AppTagAccessibility with _$AppTagAccessibility {
  const factory AppTagAccessibility({
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
  }) = _AppTagAccessibility;
}

@freezed
class AppTagAnimation with _$AppTagAnimation {
  const factory AppTagAnimation({
    @Default(Duration(milliseconds: 200)) Duration duration,
    @Default(Curves.easeInOut) Curve curve,
    @Default(false) bool enabled,
    @Default(AppTagAnimationType.fade) AppTagAnimationType type,
    Duration? delay,
    VoidCallback? onAnimationComplete,
    @Default(false) bool pulse,
    @Default(Duration(seconds: 2)) Duration pulseDuration,
  }) = _AppTagAnimation;
}

enum AppTagAnimationType {
  none,
  fade,
  slide,
  scale,
  bounce,
  pulse,
}

extension AppTagVariantExtension on AppTagVariant {
  bool get isSemantic => this == AppTagVariant.semantic;
}

extension AppTagStateExtension on AppTagState {
  bool get isInteractiveState =>
      this == AppTagState.hover ||
      this == AppTagState.pressed ||
      this == AppTagState.focus;

  bool get isDisabledState => this == AppTagState.disabled;
  bool get isLoadingState => this == AppTagState.loading;
  bool get isSkeletonState => this == AppTagState.skeleton;
  bool get isSelectedState => this == AppTagState.selected;
}

extension AppTagSizeExtension on AppTagSize {
  double get height {
    switch (this) {
      case AppTagSize.small:
        return 24.0;
      case AppTagSize.medium:
        return 32.0;
      case AppTagSize.large:
        return 40.0;
    }
  }

  double get fontSize {
    switch (this) {
      case AppTagSize.small:
        return 12.0;
      case AppTagSize.medium:
        return 14.0;
      case AppTagSize.large:
        return 16.0;
    }
  }

  double get iconSize {
    switch (this) {
      case AppTagSize.small:
        return 14.0;
      case AppTagSize.medium:
        return 16.0;
      case AppTagSize.large:
        return 18.0;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (this) {
      case AppTagSize.small:
        return const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
      case AppTagSize.medium:
        return const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0);
      case AppTagSize.large:
        return const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
    }
  }

  double get spacing {
    switch (this) {
      case AppTagSize.small:
        return 4.0;
      case AppTagSize.medium:
        return 6.0;
      case AppTagSize.large:
        return 8.0;
    }
  }

  double get borderRadius {
    switch (this) {
      case AppTagSize.small:
        return 12.0;
      case AppTagSize.medium:
        return 16.0;
      case AppTagSize.large:
        return 20.0;
    }
  }
}

extension AppTagShapeExtension on AppTagShape {
  BorderRadius getBorderRadius(AppTagSize size) {
    switch (this) {
      case AppTagShape.rounded:
        return BorderRadius.circular(size.borderRadius);
      case AppTagShape.pill:
        return BorderRadius.circular(size.height / 2);
      case AppTagShape.square:
        return BorderRadius.circular(4.0);
    }
  }
}

class AppTagConstants {
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
