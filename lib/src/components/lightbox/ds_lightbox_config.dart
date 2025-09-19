import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ds_lightbox_config.freezed.dart';

enum DSLightboxVariant { zoom, gallery }

enum DSLightboxState {
  defaultState,
  hover,
  pressed,
  focus,
  selected,
  disabled,
  loading,
  skeleton
}

enum DSLightboxGesture {
  tap,
  doubleTap,
  pinchZoom,
  pan,
  swipe,
  keyboard
}

@freezed
class DSLightboxConfig with _$DSLightboxConfig {
  const factory DSLightboxConfig({
    @Default(DSLightboxVariant.zoom) DSLightboxVariant variant,
    @Default(DSLightboxState.defaultState) DSLightboxState state,
    @Default(0) int initialIndex,
    @Default({
      DSLightboxGesture.tap,
      DSLightboxGesture.doubleTap,
      DSLightboxGesture.pinchZoom,
      DSLightboxGesture.pan,
      DSLightboxGesture.swipe,
      DSLightboxGesture.keyboard,
    }) Set<DSLightboxGesture> enabledGestures,
    @Default(true) bool enableCloseButton,
    @Default(true) bool enableCounter,
    @Default(true) bool enableThumbnails,
    @Default(true) bool enableZoom,
    @Default(0.5) double minZoom,
    @Default(5.0) double maxZoom,
    @Default(Duration(milliseconds: 300)) Duration animationDuration,
    @Default(Curves.easeInOut) Curve animationCurve,
    @Default(true) bool enableA11y,
    @Default(true) bool enableKeyboardSupport,
    @Default(true) bool isRtl,
    @Default(true) bool enableHapticFeedback,
    DSLightboxColors? colors,
    DSLightboxSpacing? spacing,
    DSLightboxControls? controls,
    DSLightboxAccessibility? accessibility,
    DSLightboxAnimation? animation,
  }) = _DSLightboxConfig;
}

@freezed
class DSLightboxColors with _$DSLightboxColors {
  const factory DSLightboxColors({
    Color? backgroundColor,
    Color? overlayColor,
    Color? controlsColor,
    Color? iconColor,
    Color? textColor,
    Color? thumbnailBorderColor,
    Color? selectedThumbnailBorderColor,
    Color? loadingColor,
    Color? errorColor,
    Color? shadowColor,
    Color? closeButtonColor,
    Color? counterColor,
  }) = _DSLightboxColors;
}

@freezed
class DSLightboxSpacing with _$DSLightboxSpacing {
  const factory DSLightboxSpacing({
    @Default(EdgeInsets.all(16.0)) EdgeInsets padding,
    @Default(EdgeInsets.all(8.0)) EdgeInsets controlsPadding,
    @Default(EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)) EdgeInsets counterPadding,
    @Default(16.0) double controlsSpacing,
    @Default(8.0) double thumbnailSpacing,
    @Default(60.0) double thumbnailSize,
    @Default(100.0) double thumbnailHeight,
    @Default(48.0) double closeButtonSize,
    @Default(BorderRadius.all(Radius.circular(8.0))) BorderRadius thumbnailBorderRadius,
    @Default(BorderRadius.all(Radius.circular(24.0))) BorderRadius closeButtonBorderRadius,
  }) = _DSLightboxSpacing;
}

@freezed
class DSLightboxControls with _$DSLightboxControls {
  const factory DSLightboxControls({
    @Default(true) bool showCloseButton,
    @Default(true) bool showCounter,
    @Default(true) bool showThumbnails,
    @Default(true) bool showZoomControls,
    @Default(true) bool showNavigationArrows,
    @Default(true) bool autoHideControls,
    @Default(Duration(seconds: 3)) Duration autoHideDelay,
    Widget? customCloseButton,
    Widget? customPreviousButton,
    Widget? customNextButton,
    Widget? customZoomInButton,
    Widget? customZoomOutButton,
  }) = _DSLightboxControls;
}

@freezed
class DSLightboxAccessibility with _$DSLightboxAccessibility {
  const factory DSLightboxAccessibility({
    @Default('Lightbox') String semanticLabel,
    @Default('Close lightbox') String closeButtonLabel,
    @Default('Previous image') String previousButtonLabel,
    @Default('Next image') String nextButtonLabel,
    @Default('Zoom in') String zoomInButtonLabel,
    @Default('Zoom out') String zoomOutButtonLabel,
    @Default('Image {} of {}') String counterLabel,
    @Default('Thumbnail {}') String thumbnailLabel,
    @Default(true) bool announceImageChanges,
    @Default(true) bool enableTraversalOrder,
    int? sortKey,
    FocusNode? focusNode,
  }) = _DSLightboxAccessibility;
}

@freezed
class DSLightboxAnimation with _$DSLightboxAnimation {
  const factory DSLightboxAnimation({
    @Default(Duration(milliseconds: 300)) Duration fadeInDuration,
    @Default(Duration(milliseconds: 200)) Duration fadeOutDuration,
    @Default(Duration(milliseconds: 250)) Duration slideTransitionDuration,
    @Default(Duration(milliseconds: 150)) Duration zoomTransitionDuration,
    @Default(Curves.easeInOut) Curve fadeInCurve,
    @Default(Curves.easeInOut) Curve fadeOutCurve,
    @Default(Curves.easeInOut) Curve slideTransitionCurve,
    @Default(Curves.easeInOut) Curve zoomTransitionCurve,
    @Default(true) bool enableSlideTransition,
    @Default(true) bool enableZoomTransition,
    @Default(true) bool enableFadeTransition,
  }) = _DSLightboxAnimation;
}

@freezed
class DSLightboxImage with _$DSLightboxImage {
  const factory DSLightboxImage({
    required String id,
    required ImageProvider imageProvider,
    String? title,
    String? description,
    String? alt,
    Widget? placeholder,
    Widget? errorWidget,
    @Default(BoxFit.contain) BoxFit fit,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    Map<String, dynamic>? metadata,
  }) = _DSLightboxImage;
}

@freezed
class DSLightboxGalleryConfig with _$DSLightboxGalleryConfig {
  const factory DSLightboxGalleryConfig({
    @Default(true) bool enableInfiniteScroll,
    @Default(true) bool enablePreloading,
    @Default(3) int preloadDistance,
    @Default(Axis.horizontal) Axis scrollDirection,
    @Default(PageScrollPhysics()) ScrollPhysics scrollPhysics,
    @Default(true) bool enablePageSnapping,
    @Default(0.8) double viewportFraction,
    @Default(true) bool centerCurrentImage,
  }) = _DSLightboxGalleryConfig;
}