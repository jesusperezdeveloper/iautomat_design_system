// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ds_tabs_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSTabsConfig {
  DSTabsVariant get variant => throw _privateConstructorUsedError;
  DSTabsState get state => throw _privateConstructorUsedError;
  bool get isAdaptive => throw _privateConstructorUsedError;
  bool get isRtl => throw _privateConstructorUsedError;
  bool get enableA11y => throw _privateConstructorUsedError;
  bool get enableKeyboardSupport => throw _privateConstructorUsedError;
  List<DSTabItem> get tabs => throw _privateConstructorUsedError;
  int get initialIndex => throw _privateConstructorUsedError;
  ValueChanged<int>? get onChanged => throw _privateConstructorUsedError;
  List<DSTabBadge> get badges => throw _privateConstructorUsedError;
  DSTabsColors? get colors => throw _privateConstructorUsedError;
  DSTabsTypography? get typography => throw _privateConstructorUsedError;
  DSTabsSpacing? get spacing => throw _privateConstructorUsedError;
  DSTabsElevation? get elevation => throw _privateConstructorUsedError;
  DSTabsBehavior? get behavior => throw _privateConstructorUsedError;
  DSTabsAnimation? get animation => throw _privateConstructorUsedError;

  /// Create a copy of DSTabsConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSTabsConfigCopyWith<DSTabsConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSTabsConfigCopyWith<$Res> {
  factory $DSTabsConfigCopyWith(
    DSTabsConfig value,
    $Res Function(DSTabsConfig) then,
  ) = _$DSTabsConfigCopyWithImpl<$Res, DSTabsConfig>;
  @useResult
  $Res call({
    DSTabsVariant variant,
    DSTabsState state,
    bool isAdaptive,
    bool isRtl,
    bool enableA11y,
    bool enableKeyboardSupport,
    List<DSTabItem> tabs,
    int initialIndex,
    ValueChanged<int>? onChanged,
    List<DSTabBadge> badges,
    DSTabsColors? colors,
    DSTabsTypography? typography,
    DSTabsSpacing? spacing,
    DSTabsElevation? elevation,
    DSTabsBehavior? behavior,
    DSTabsAnimation? animation,
  });

  $DSTabsColorsCopyWith<$Res>? get colors;
  $DSTabsTypographyCopyWith<$Res>? get typography;
  $DSTabsSpacingCopyWith<$Res>? get spacing;
  $DSTabsElevationCopyWith<$Res>? get elevation;
  $DSTabsBehaviorCopyWith<$Res>? get behavior;
  $DSTabsAnimationCopyWith<$Res>? get animation;
}

/// @nodoc
class _$DSTabsConfigCopyWithImpl<$Res, $Val extends DSTabsConfig>
    implements $DSTabsConfigCopyWith<$Res> {
  _$DSTabsConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSTabsConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? isAdaptive = null,
    Object? isRtl = null,
    Object? enableA11y = null,
    Object? enableKeyboardSupport = null,
    Object? tabs = null,
    Object? initialIndex = null,
    Object? onChanged = freezed,
    Object? badges = null,
    Object? colors = freezed,
    Object? typography = freezed,
    Object? spacing = freezed,
    Object? elevation = freezed,
    Object? behavior = freezed,
    Object? animation = freezed,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSTabsVariant,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSTabsState,
            isAdaptive: null == isAdaptive
                ? _value.isAdaptive
                : isAdaptive // ignore: cast_nullable_to_non_nullable
                      as bool,
            isRtl: null == isRtl
                ? _value.isRtl
                : isRtl // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableA11y: null == enableA11y
                ? _value.enableA11y
                : enableA11y // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableKeyboardSupport: null == enableKeyboardSupport
                ? _value.enableKeyboardSupport
                : enableKeyboardSupport // ignore: cast_nullable_to_non_nullable
                      as bool,
            tabs: null == tabs
                ? _value.tabs
                : tabs // ignore: cast_nullable_to_non_nullable
                      as List<DSTabItem>,
            initialIndex: null == initialIndex
                ? _value.initialIndex
                : initialIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            onChanged: freezed == onChanged
                ? _value.onChanged
                : onChanged // ignore: cast_nullable_to_non_nullable
                      as ValueChanged<int>?,
            badges: null == badges
                ? _value.badges
                : badges // ignore: cast_nullable_to_non_nullable
                      as List<DSTabBadge>,
            colors: freezed == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as DSTabsColors?,
            typography: freezed == typography
                ? _value.typography
                : typography // ignore: cast_nullable_to_non_nullable
                      as DSTabsTypography?,
            spacing: freezed == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as DSTabsSpacing?,
            elevation: freezed == elevation
                ? _value.elevation
                : elevation // ignore: cast_nullable_to_non_nullable
                      as DSTabsElevation?,
            behavior: freezed == behavior
                ? _value.behavior
                : behavior // ignore: cast_nullable_to_non_nullable
                      as DSTabsBehavior?,
            animation: freezed == animation
                ? _value.animation
                : animation // ignore: cast_nullable_to_non_nullable
                      as DSTabsAnimation?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSTabsConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSTabsColorsCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $DSTabsColorsCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of DSTabsConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSTabsTypographyCopyWith<$Res>? get typography {
    if (_value.typography == null) {
      return null;
    }

    return $DSTabsTypographyCopyWith<$Res>(_value.typography!, (value) {
      return _then(_value.copyWith(typography: value) as $Val);
    });
  }

  /// Create a copy of DSTabsConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSTabsSpacingCopyWith<$Res>? get spacing {
    if (_value.spacing == null) {
      return null;
    }

    return $DSTabsSpacingCopyWith<$Res>(_value.spacing!, (value) {
      return _then(_value.copyWith(spacing: value) as $Val);
    });
  }

  /// Create a copy of DSTabsConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSTabsElevationCopyWith<$Res>? get elevation {
    if (_value.elevation == null) {
      return null;
    }

    return $DSTabsElevationCopyWith<$Res>(_value.elevation!, (value) {
      return _then(_value.copyWith(elevation: value) as $Val);
    });
  }

  /// Create a copy of DSTabsConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSTabsBehaviorCopyWith<$Res>? get behavior {
    if (_value.behavior == null) {
      return null;
    }

    return $DSTabsBehaviorCopyWith<$Res>(_value.behavior!, (value) {
      return _then(_value.copyWith(behavior: value) as $Val);
    });
  }

  /// Create a copy of DSTabsConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSTabsAnimationCopyWith<$Res>? get animation {
    if (_value.animation == null) {
      return null;
    }

    return $DSTabsAnimationCopyWith<$Res>(_value.animation!, (value) {
      return _then(_value.copyWith(animation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSTabsConfigImplCopyWith<$Res>
    implements $DSTabsConfigCopyWith<$Res> {
  factory _$$DSTabsConfigImplCopyWith(
    _$DSTabsConfigImpl value,
    $Res Function(_$DSTabsConfigImpl) then,
  ) = __$$DSTabsConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSTabsVariant variant,
    DSTabsState state,
    bool isAdaptive,
    bool isRtl,
    bool enableA11y,
    bool enableKeyboardSupport,
    List<DSTabItem> tabs,
    int initialIndex,
    ValueChanged<int>? onChanged,
    List<DSTabBadge> badges,
    DSTabsColors? colors,
    DSTabsTypography? typography,
    DSTabsSpacing? spacing,
    DSTabsElevation? elevation,
    DSTabsBehavior? behavior,
    DSTabsAnimation? animation,
  });

  @override
  $DSTabsColorsCopyWith<$Res>? get colors;
  @override
  $DSTabsTypographyCopyWith<$Res>? get typography;
  @override
  $DSTabsSpacingCopyWith<$Res>? get spacing;
  @override
  $DSTabsElevationCopyWith<$Res>? get elevation;
  @override
  $DSTabsBehaviorCopyWith<$Res>? get behavior;
  @override
  $DSTabsAnimationCopyWith<$Res>? get animation;
}

/// @nodoc
class __$$DSTabsConfigImplCopyWithImpl<$Res>
    extends _$DSTabsConfigCopyWithImpl<$Res, _$DSTabsConfigImpl>
    implements _$$DSTabsConfigImplCopyWith<$Res> {
  __$$DSTabsConfigImplCopyWithImpl(
    _$DSTabsConfigImpl _value,
    $Res Function(_$DSTabsConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSTabsConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? isAdaptive = null,
    Object? isRtl = null,
    Object? enableA11y = null,
    Object? enableKeyboardSupport = null,
    Object? tabs = null,
    Object? initialIndex = null,
    Object? onChanged = freezed,
    Object? badges = null,
    Object? colors = freezed,
    Object? typography = freezed,
    Object? spacing = freezed,
    Object? elevation = freezed,
    Object? behavior = freezed,
    Object? animation = freezed,
  }) {
    return _then(
      _$DSTabsConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSTabsVariant,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSTabsState,
        isAdaptive: null == isAdaptive
            ? _value.isAdaptive
            : isAdaptive // ignore: cast_nullable_to_non_nullable
                  as bool,
        isRtl: null == isRtl
            ? _value.isRtl
            : isRtl // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableA11y: null == enableA11y
            ? _value.enableA11y
            : enableA11y // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableKeyboardSupport: null == enableKeyboardSupport
            ? _value.enableKeyboardSupport
            : enableKeyboardSupport // ignore: cast_nullable_to_non_nullable
                  as bool,
        tabs: null == tabs
            ? _value._tabs
            : tabs // ignore: cast_nullable_to_non_nullable
                  as List<DSTabItem>,
        initialIndex: null == initialIndex
            ? _value.initialIndex
            : initialIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        onChanged: freezed == onChanged
            ? _value.onChanged
            : onChanged // ignore: cast_nullable_to_non_nullable
                  as ValueChanged<int>?,
        badges: null == badges
            ? _value._badges
            : badges // ignore: cast_nullable_to_non_nullable
                  as List<DSTabBadge>,
        colors: freezed == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as DSTabsColors?,
        typography: freezed == typography
            ? _value.typography
            : typography // ignore: cast_nullable_to_non_nullable
                  as DSTabsTypography?,
        spacing: freezed == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as DSTabsSpacing?,
        elevation: freezed == elevation
            ? _value.elevation
            : elevation // ignore: cast_nullable_to_non_nullable
                  as DSTabsElevation?,
        behavior: freezed == behavior
            ? _value.behavior
            : behavior // ignore: cast_nullable_to_non_nullable
                  as DSTabsBehavior?,
        animation: freezed == animation
            ? _value.animation
            : animation // ignore: cast_nullable_to_non_nullable
                  as DSTabsAnimation?,
      ),
    );
  }
}

/// @nodoc

class _$DSTabsConfigImpl implements _DSTabsConfig {
  const _$DSTabsConfigImpl({
    this.variant = DSTabsVariant.fixed,
    this.state = DSTabsState.defaultState,
    this.isAdaptive = true,
    this.isRtl = false,
    this.enableA11y = true,
    this.enableKeyboardSupport = true,
    final List<DSTabItem> tabs = const [],
    this.initialIndex = 0,
    this.onChanged,
    final List<DSTabBadge> badges = const [],
    this.colors,
    this.typography,
    this.spacing,
    this.elevation,
    this.behavior,
    this.animation,
  }) : _tabs = tabs,
       _badges = badges;

  @override
  @JsonKey()
  final DSTabsVariant variant;
  @override
  @JsonKey()
  final DSTabsState state;
  @override
  @JsonKey()
  final bool isAdaptive;
  @override
  @JsonKey()
  final bool isRtl;
  @override
  @JsonKey()
  final bool enableA11y;
  @override
  @JsonKey()
  final bool enableKeyboardSupport;
  final List<DSTabItem> _tabs;
  @override
  @JsonKey()
  List<DSTabItem> get tabs {
    if (_tabs is EqualUnmodifiableListView) return _tabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tabs);
  }

  @override
  @JsonKey()
  final int initialIndex;
  @override
  final ValueChanged<int>? onChanged;
  final List<DSTabBadge> _badges;
  @override
  @JsonKey()
  List<DSTabBadge> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  @override
  final DSTabsColors? colors;
  @override
  final DSTabsTypography? typography;
  @override
  final DSTabsSpacing? spacing;
  @override
  final DSTabsElevation? elevation;
  @override
  final DSTabsBehavior? behavior;
  @override
  final DSTabsAnimation? animation;

  @override
  String toString() {
    return 'DSTabsConfig(variant: $variant, state: $state, isAdaptive: $isAdaptive, isRtl: $isRtl, enableA11y: $enableA11y, enableKeyboardSupport: $enableKeyboardSupport, tabs: $tabs, initialIndex: $initialIndex, onChanged: $onChanged, badges: $badges, colors: $colors, typography: $typography, spacing: $spacing, elevation: $elevation, behavior: $behavior, animation: $animation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSTabsConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.isAdaptive, isAdaptive) ||
                other.isAdaptive == isAdaptive) &&
            (identical(other.isRtl, isRtl) || other.isRtl == isRtl) &&
            (identical(other.enableA11y, enableA11y) ||
                other.enableA11y == enableA11y) &&
            (identical(other.enableKeyboardSupport, enableKeyboardSupport) ||
                other.enableKeyboardSupport == enableKeyboardSupport) &&
            const DeepCollectionEquality().equals(other._tabs, _tabs) &&
            (identical(other.initialIndex, initialIndex) ||
                other.initialIndex == initialIndex) &&
            (identical(other.onChanged, onChanged) ||
                other.onChanged == onChanged) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.typography, typography) ||
                other.typography == typography) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.behavior, behavior) ||
                other.behavior == behavior) &&
            (identical(other.animation, animation) ||
                other.animation == animation));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    variant,
    state,
    isAdaptive,
    isRtl,
    enableA11y,
    enableKeyboardSupport,
    const DeepCollectionEquality().hash(_tabs),
    initialIndex,
    onChanged,
    const DeepCollectionEquality().hash(_badges),
    colors,
    typography,
    spacing,
    elevation,
    behavior,
    animation,
  );

  /// Create a copy of DSTabsConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSTabsConfigImplCopyWith<_$DSTabsConfigImpl> get copyWith =>
      __$$DSTabsConfigImplCopyWithImpl<_$DSTabsConfigImpl>(this, _$identity);
}

abstract class _DSTabsConfig implements DSTabsConfig {
  const factory _DSTabsConfig({
    final DSTabsVariant variant,
    final DSTabsState state,
    final bool isAdaptive,
    final bool isRtl,
    final bool enableA11y,
    final bool enableKeyboardSupport,
    final List<DSTabItem> tabs,
    final int initialIndex,
    final ValueChanged<int>? onChanged,
    final List<DSTabBadge> badges,
    final DSTabsColors? colors,
    final DSTabsTypography? typography,
    final DSTabsSpacing? spacing,
    final DSTabsElevation? elevation,
    final DSTabsBehavior? behavior,
    final DSTabsAnimation? animation,
  }) = _$DSTabsConfigImpl;

  @override
  DSTabsVariant get variant;
  @override
  DSTabsState get state;
  @override
  bool get isAdaptive;
  @override
  bool get isRtl;
  @override
  bool get enableA11y;
  @override
  bool get enableKeyboardSupport;
  @override
  List<DSTabItem> get tabs;
  @override
  int get initialIndex;
  @override
  ValueChanged<int>? get onChanged;
  @override
  List<DSTabBadge> get badges;
  @override
  DSTabsColors? get colors;
  @override
  DSTabsTypography? get typography;
  @override
  DSTabsSpacing? get spacing;
  @override
  DSTabsElevation? get elevation;
  @override
  DSTabsBehavior? get behavior;
  @override
  DSTabsAnimation? get animation;

  /// Create a copy of DSTabsConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSTabsConfigImplCopyWith<_$DSTabsConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSTabItem {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  Widget? get icon => throw _privateConstructorUsedError;
  Widget? get child => throw _privateConstructorUsedError;
  String? get tooltip => throw _privateConstructorUsedError;
  bool get disabled => throw _privateConstructorUsedError;
  DSTabType get type => throw _privateConstructorUsedError;
  Widget? get leading => throw _privateConstructorUsedError;
  Widget? get trailing => throw _privateConstructorUsedError;
  VoidCallback? get onTap => throw _privateConstructorUsedError;
  String? get semanticLabel => throw _privateConstructorUsedError;

  /// Create a copy of DSTabItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSTabItemCopyWith<DSTabItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSTabItemCopyWith<$Res> {
  factory $DSTabItemCopyWith(DSTabItem value, $Res Function(DSTabItem) then) =
      _$DSTabItemCopyWithImpl<$Res, DSTabItem>;
  @useResult
  $Res call({
    String id,
    String text,
    Widget? icon,
    Widget? child,
    String? tooltip,
    bool disabled,
    DSTabType type,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    String? semanticLabel,
  });
}

/// @nodoc
class _$DSTabItemCopyWithImpl<$Res, $Val extends DSTabItem>
    implements $DSTabItemCopyWith<$Res> {
  _$DSTabItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSTabItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? icon = freezed,
    Object? child = freezed,
    Object? tooltip = freezed,
    Object? disabled = null,
    Object? type = null,
    Object? leading = freezed,
    Object? trailing = freezed,
    Object? onTap = freezed,
    Object? semanticLabel = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            child: freezed == child
                ? _value.child
                : child // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            tooltip: freezed == tooltip
                ? _value.tooltip
                : tooltip // ignore: cast_nullable_to_non_nullable
                      as String?,
            disabled: null == disabled
                ? _value.disabled
                : disabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DSTabType,
            leading: freezed == leading
                ? _value.leading
                : leading // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            trailing: freezed == trailing
                ? _value.trailing
                : trailing // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            onTap: freezed == onTap
                ? _value.onTap
                : onTap // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
            semanticLabel: freezed == semanticLabel
                ? _value.semanticLabel
                : semanticLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSTabItemImplCopyWith<$Res>
    implements $DSTabItemCopyWith<$Res> {
  factory _$$DSTabItemImplCopyWith(
    _$DSTabItemImpl value,
    $Res Function(_$DSTabItemImpl) then,
  ) = __$$DSTabItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String text,
    Widget? icon,
    Widget? child,
    String? tooltip,
    bool disabled,
    DSTabType type,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    String? semanticLabel,
  });
}

/// @nodoc
class __$$DSTabItemImplCopyWithImpl<$Res>
    extends _$DSTabItemCopyWithImpl<$Res, _$DSTabItemImpl>
    implements _$$DSTabItemImplCopyWith<$Res> {
  __$$DSTabItemImplCopyWithImpl(
    _$DSTabItemImpl _value,
    $Res Function(_$DSTabItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSTabItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? icon = freezed,
    Object? child = freezed,
    Object? tooltip = freezed,
    Object? disabled = null,
    Object? type = null,
    Object? leading = freezed,
    Object? trailing = freezed,
    Object? onTap = freezed,
    Object? semanticLabel = freezed,
  }) {
    return _then(
      _$DSTabItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        child: freezed == child
            ? _value.child
            : child // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        tooltip: freezed == tooltip
            ? _value.tooltip
            : tooltip // ignore: cast_nullable_to_non_nullable
                  as String?,
        disabled: null == disabled
            ? _value.disabled
            : disabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSTabType,
        leading: freezed == leading
            ? _value.leading
            : leading // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        trailing: freezed == trailing
            ? _value.trailing
            : trailing // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        onTap: freezed == onTap
            ? _value.onTap
            : onTap // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
        semanticLabel: freezed == semanticLabel
            ? _value.semanticLabel
            : semanticLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DSTabItemImpl implements _DSTabItem {
  const _$DSTabItemImpl({
    required this.id,
    required this.text,
    this.icon,
    this.child,
    this.tooltip,
    this.disabled = false,
    this.type = DSTabType.text,
    this.leading,
    this.trailing,
    this.onTap,
    this.semanticLabel,
  });

  @override
  final String id;
  @override
  final String text;
  @override
  final Widget? icon;
  @override
  final Widget? child;
  @override
  final String? tooltip;
  @override
  @JsonKey()
  final bool disabled;
  @override
  @JsonKey()
  final DSTabType type;
  @override
  final Widget? leading;
  @override
  final Widget? trailing;
  @override
  final VoidCallback? onTap;
  @override
  final String? semanticLabel;

  @override
  String toString() {
    return 'DSTabItem(id: $id, text: $text, icon: $icon, child: $child, tooltip: $tooltip, disabled: $disabled, type: $type, leading: $leading, trailing: $trailing, onTap: $onTap, semanticLabel: $semanticLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSTabItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.child, child) || other.child == child) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.leading, leading) || other.leading == leading) &&
            (identical(other.trailing, trailing) ||
                other.trailing == trailing) &&
            (identical(other.onTap, onTap) || other.onTap == onTap) &&
            (identical(other.semanticLabel, semanticLabel) ||
                other.semanticLabel == semanticLabel));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    text,
    icon,
    child,
    tooltip,
    disabled,
    type,
    leading,
    trailing,
    onTap,
    semanticLabel,
  );

  /// Create a copy of DSTabItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSTabItemImplCopyWith<_$DSTabItemImpl> get copyWith =>
      __$$DSTabItemImplCopyWithImpl<_$DSTabItemImpl>(this, _$identity);
}

abstract class _DSTabItem implements DSTabItem {
  const factory _DSTabItem({
    required final String id,
    required final String text,
    final Widget? icon,
    final Widget? child,
    final String? tooltip,
    final bool disabled,
    final DSTabType type,
    final Widget? leading,
    final Widget? trailing,
    final VoidCallback? onTap,
    final String? semanticLabel,
  }) = _$DSTabItemImpl;

  @override
  String get id;
  @override
  String get text;
  @override
  Widget? get icon;
  @override
  Widget? get child;
  @override
  String? get tooltip;
  @override
  bool get disabled;
  @override
  DSTabType get type;
  @override
  Widget? get leading;
  @override
  Widget? get trailing;
  @override
  VoidCallback? get onTap;
  @override
  String? get semanticLabel;

  /// Create a copy of DSTabItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSTabItemImplCopyWith<_$DSTabItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSTabBadge {
  String get tabId => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  DSTabBadgeType get type => throw _privateConstructorUsedError;
  Color? get backgroundColor => throw _privateConstructorUsedError;
  Color? get textColor => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  int get maxCount => throw _privateConstructorUsedError;
  DSTabBadgePosition get position => throw _privateConstructorUsedError;

  /// Create a copy of DSTabBadge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSTabBadgeCopyWith<DSTabBadge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSTabBadgeCopyWith<$Res> {
  factory $DSTabBadgeCopyWith(
    DSTabBadge value,
    $Res Function(DSTabBadge) then,
  ) = _$DSTabBadgeCopyWithImpl<$Res, DSTabBadge>;
  @useResult
  $Res call({
    String tabId,
    String? text,
    int count,
    DSTabBadgeType type,
    Color? backgroundColor,
    Color? textColor,
    bool isVisible,
    int maxCount,
    DSTabBadgePosition position,
  });
}

/// @nodoc
class _$DSTabBadgeCopyWithImpl<$Res, $Val extends DSTabBadge>
    implements $DSTabBadgeCopyWith<$Res> {
  _$DSTabBadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSTabBadge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabId = null,
    Object? text = freezed,
    Object? count = null,
    Object? type = null,
    Object? backgroundColor = freezed,
    Object? textColor = freezed,
    Object? isVisible = null,
    Object? maxCount = null,
    Object? position = null,
  }) {
    return _then(
      _value.copyWith(
            tabId: null == tabId
                ? _value.tabId
                : tabId // ignore: cast_nullable_to_non_nullable
                      as String,
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String?,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DSTabBadgeType,
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            textColor: freezed == textColor
                ? _value.textColor
                : textColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            isVisible: null == isVisible
                ? _value.isVisible
                : isVisible // ignore: cast_nullable_to_non_nullable
                      as bool,
            maxCount: null == maxCount
                ? _value.maxCount
                : maxCount // ignore: cast_nullable_to_non_nullable
                      as int,
            position: null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as DSTabBadgePosition,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSTabBadgeImplCopyWith<$Res>
    implements $DSTabBadgeCopyWith<$Res> {
  factory _$$DSTabBadgeImplCopyWith(
    _$DSTabBadgeImpl value,
    $Res Function(_$DSTabBadgeImpl) then,
  ) = __$$DSTabBadgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String tabId,
    String? text,
    int count,
    DSTabBadgeType type,
    Color? backgroundColor,
    Color? textColor,
    bool isVisible,
    int maxCount,
    DSTabBadgePosition position,
  });
}

/// @nodoc
class __$$DSTabBadgeImplCopyWithImpl<$Res>
    extends _$DSTabBadgeCopyWithImpl<$Res, _$DSTabBadgeImpl>
    implements _$$DSTabBadgeImplCopyWith<$Res> {
  __$$DSTabBadgeImplCopyWithImpl(
    _$DSTabBadgeImpl _value,
    $Res Function(_$DSTabBadgeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSTabBadge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabId = null,
    Object? text = freezed,
    Object? count = null,
    Object? type = null,
    Object? backgroundColor = freezed,
    Object? textColor = freezed,
    Object? isVisible = null,
    Object? maxCount = null,
    Object? position = null,
  }) {
    return _then(
      _$DSTabBadgeImpl(
        tabId: null == tabId
            ? _value.tabId
            : tabId // ignore: cast_nullable_to_non_nullable
                  as String,
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSTabBadgeType,
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        textColor: freezed == textColor
            ? _value.textColor
            : textColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        isVisible: null == isVisible
            ? _value.isVisible
            : isVisible // ignore: cast_nullable_to_non_nullable
                  as bool,
        maxCount: null == maxCount
            ? _value.maxCount
            : maxCount // ignore: cast_nullable_to_non_nullable
                  as int,
        position: null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as DSTabBadgePosition,
      ),
    );
  }
}

/// @nodoc

class _$DSTabBadgeImpl implements _DSTabBadge {
  const _$DSTabBadgeImpl({
    required this.tabId,
    this.text,
    this.count = 0,
    this.type = DSTabBadgeType.count,
    this.backgroundColor,
    this.textColor,
    this.isVisible = true,
    this.maxCount = 99,
    this.position = DSTabBadgePosition.topRight,
  });

  @override
  final String tabId;
  @override
  final String? text;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final DSTabBadgeType type;
  @override
  final Color? backgroundColor;
  @override
  final Color? textColor;
  @override
  @JsonKey()
  final bool isVisible;
  @override
  @JsonKey()
  final int maxCount;
  @override
  @JsonKey()
  final DSTabBadgePosition position;

  @override
  String toString() {
    return 'DSTabBadge(tabId: $tabId, text: $text, count: $count, type: $type, backgroundColor: $backgroundColor, textColor: $textColor, isVisible: $isVisible, maxCount: $maxCount, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSTabBadgeImpl &&
            (identical(other.tabId, tabId) || other.tabId == tabId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.isVisible, isVisible) ||
                other.isVisible == isVisible) &&
            (identical(other.maxCount, maxCount) ||
                other.maxCount == maxCount) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    tabId,
    text,
    count,
    type,
    backgroundColor,
    textColor,
    isVisible,
    maxCount,
    position,
  );

  /// Create a copy of DSTabBadge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSTabBadgeImplCopyWith<_$DSTabBadgeImpl> get copyWith =>
      __$$DSTabBadgeImplCopyWithImpl<_$DSTabBadgeImpl>(this, _$identity);
}

abstract class _DSTabBadge implements DSTabBadge {
  const factory _DSTabBadge({
    required final String tabId,
    final String? text,
    final int count,
    final DSTabBadgeType type,
    final Color? backgroundColor,
    final Color? textColor,
    final bool isVisible,
    final int maxCount,
    final DSTabBadgePosition position,
  }) = _$DSTabBadgeImpl;

  @override
  String get tabId;
  @override
  String? get text;
  @override
  int get count;
  @override
  DSTabBadgeType get type;
  @override
  Color? get backgroundColor;
  @override
  Color? get textColor;
  @override
  bool get isVisible;
  @override
  int get maxCount;
  @override
  DSTabBadgePosition get position;

  /// Create a copy of DSTabBadge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSTabBadgeImplCopyWith<_$DSTabBadgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSTabsColors {
  Color? get backgroundColor => throw _privateConstructorUsedError;
  Color? get indicatorColor => throw _privateConstructorUsedError;
  Color? get selectedLabelColor => throw _privateConstructorUsedError;
  Color? get unselectedLabelColor => throw _privateConstructorUsedError;
  Color? get selectedIconColor => throw _privateConstructorUsedError;
  Color? get unselectedIconColor => throw _privateConstructorUsedError;
  Color? get dividerColor => throw _privateConstructorUsedError;
  Color? get shadowColor => throw _privateConstructorUsedError;
  Color? get overlayColor => throw _privateConstructorUsedError;
  Color? get surfaceTintColor => throw _privateConstructorUsedError;
  Color? get borderColor => throw _privateConstructorUsedError;

  /// Create a copy of DSTabsColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSTabsColorsCopyWith<DSTabsColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSTabsColorsCopyWith<$Res> {
  factory $DSTabsColorsCopyWith(
    DSTabsColors value,
    $Res Function(DSTabsColors) then,
  ) = _$DSTabsColorsCopyWithImpl<$Res, DSTabsColors>;
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? indicatorColor,
    Color? selectedLabelColor,
    Color? unselectedLabelColor,
    Color? selectedIconColor,
    Color? unselectedIconColor,
    Color? dividerColor,
    Color? shadowColor,
    Color? overlayColor,
    Color? surfaceTintColor,
    Color? borderColor,
  });
}

/// @nodoc
class _$DSTabsColorsCopyWithImpl<$Res, $Val extends DSTabsColors>
    implements $DSTabsColorsCopyWith<$Res> {
  _$DSTabsColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSTabsColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? indicatorColor = freezed,
    Object? selectedLabelColor = freezed,
    Object? unselectedLabelColor = freezed,
    Object? selectedIconColor = freezed,
    Object? unselectedIconColor = freezed,
    Object? dividerColor = freezed,
    Object? shadowColor = freezed,
    Object? overlayColor = freezed,
    Object? surfaceTintColor = freezed,
    Object? borderColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            indicatorColor: freezed == indicatorColor
                ? _value.indicatorColor
                : indicatorColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            selectedLabelColor: freezed == selectedLabelColor
                ? _value.selectedLabelColor
                : selectedLabelColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            unselectedLabelColor: freezed == unselectedLabelColor
                ? _value.unselectedLabelColor
                : unselectedLabelColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            selectedIconColor: freezed == selectedIconColor
                ? _value.selectedIconColor
                : selectedIconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            unselectedIconColor: freezed == unselectedIconColor
                ? _value.unselectedIconColor
                : unselectedIconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            dividerColor: freezed == dividerColor
                ? _value.dividerColor
                : dividerColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            shadowColor: freezed == shadowColor
                ? _value.shadowColor
                : shadowColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            overlayColor: freezed == overlayColor
                ? _value.overlayColor
                : overlayColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            surfaceTintColor: freezed == surfaceTintColor
                ? _value.surfaceTintColor
                : surfaceTintColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSTabsColorsImplCopyWith<$Res>
    implements $DSTabsColorsCopyWith<$Res> {
  factory _$$DSTabsColorsImplCopyWith(
    _$DSTabsColorsImpl value,
    $Res Function(_$DSTabsColorsImpl) then,
  ) = __$$DSTabsColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? indicatorColor,
    Color? selectedLabelColor,
    Color? unselectedLabelColor,
    Color? selectedIconColor,
    Color? unselectedIconColor,
    Color? dividerColor,
    Color? shadowColor,
    Color? overlayColor,
    Color? surfaceTintColor,
    Color? borderColor,
  });
}

/// @nodoc
class __$$DSTabsColorsImplCopyWithImpl<$Res>
    extends _$DSTabsColorsCopyWithImpl<$Res, _$DSTabsColorsImpl>
    implements _$$DSTabsColorsImplCopyWith<$Res> {
  __$$DSTabsColorsImplCopyWithImpl(
    _$DSTabsColorsImpl _value,
    $Res Function(_$DSTabsColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSTabsColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? indicatorColor = freezed,
    Object? selectedLabelColor = freezed,
    Object? unselectedLabelColor = freezed,
    Object? selectedIconColor = freezed,
    Object? unselectedIconColor = freezed,
    Object? dividerColor = freezed,
    Object? shadowColor = freezed,
    Object? overlayColor = freezed,
    Object? surfaceTintColor = freezed,
    Object? borderColor = freezed,
  }) {
    return _then(
      _$DSTabsColorsImpl(
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        indicatorColor: freezed == indicatorColor
            ? _value.indicatorColor
            : indicatorColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        selectedLabelColor: freezed == selectedLabelColor
            ? _value.selectedLabelColor
            : selectedLabelColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        unselectedLabelColor: freezed == unselectedLabelColor
            ? _value.unselectedLabelColor
            : unselectedLabelColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        selectedIconColor: freezed == selectedIconColor
            ? _value.selectedIconColor
            : selectedIconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        unselectedIconColor: freezed == unselectedIconColor
            ? _value.unselectedIconColor
            : unselectedIconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        dividerColor: freezed == dividerColor
            ? _value.dividerColor
            : dividerColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        shadowColor: freezed == shadowColor
            ? _value.shadowColor
            : shadowColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        overlayColor: freezed == overlayColor
            ? _value.overlayColor
            : overlayColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceTintColor: freezed == surfaceTintColor
            ? _value.surfaceTintColor
            : surfaceTintColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSTabsColorsImpl implements _DSTabsColors {
  const _$DSTabsColorsImpl({
    this.backgroundColor,
    this.indicatorColor,
    this.selectedLabelColor,
    this.unselectedLabelColor,
    this.selectedIconColor,
    this.unselectedIconColor,
    this.dividerColor,
    this.shadowColor,
    this.overlayColor,
    this.surfaceTintColor,
    this.borderColor,
  });

  @override
  final Color? backgroundColor;
  @override
  final Color? indicatorColor;
  @override
  final Color? selectedLabelColor;
  @override
  final Color? unselectedLabelColor;
  @override
  final Color? selectedIconColor;
  @override
  final Color? unselectedIconColor;
  @override
  final Color? dividerColor;
  @override
  final Color? shadowColor;
  @override
  final Color? overlayColor;
  @override
  final Color? surfaceTintColor;
  @override
  final Color? borderColor;

  @override
  String toString() {
    return 'DSTabsColors(backgroundColor: $backgroundColor, indicatorColor: $indicatorColor, selectedLabelColor: $selectedLabelColor, unselectedLabelColor: $unselectedLabelColor, selectedIconColor: $selectedIconColor, unselectedIconColor: $unselectedIconColor, dividerColor: $dividerColor, shadowColor: $shadowColor, overlayColor: $overlayColor, surfaceTintColor: $surfaceTintColor, borderColor: $borderColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSTabsColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.indicatorColor, indicatorColor) ||
                other.indicatorColor == indicatorColor) &&
            (identical(other.selectedLabelColor, selectedLabelColor) ||
                other.selectedLabelColor == selectedLabelColor) &&
            (identical(other.unselectedLabelColor, unselectedLabelColor) ||
                other.unselectedLabelColor == unselectedLabelColor) &&
            (identical(other.selectedIconColor, selectedIconColor) ||
                other.selectedIconColor == selectedIconColor) &&
            (identical(other.unselectedIconColor, unselectedIconColor) ||
                other.unselectedIconColor == unselectedIconColor) &&
            (identical(other.dividerColor, dividerColor) ||
                other.dividerColor == dividerColor) &&
            (identical(other.shadowColor, shadowColor) ||
                other.shadowColor == shadowColor) &&
            (identical(other.overlayColor, overlayColor) ||
                other.overlayColor == overlayColor) &&
            (identical(other.surfaceTintColor, surfaceTintColor) ||
                other.surfaceTintColor == surfaceTintColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    backgroundColor,
    indicatorColor,
    selectedLabelColor,
    unselectedLabelColor,
    selectedIconColor,
    unselectedIconColor,
    dividerColor,
    shadowColor,
    overlayColor,
    surfaceTintColor,
    borderColor,
  );

  /// Create a copy of DSTabsColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSTabsColorsImplCopyWith<_$DSTabsColorsImpl> get copyWith =>
      __$$DSTabsColorsImplCopyWithImpl<_$DSTabsColorsImpl>(this, _$identity);
}

abstract class _DSTabsColors implements DSTabsColors {
  const factory _DSTabsColors({
    final Color? backgroundColor,
    final Color? indicatorColor,
    final Color? selectedLabelColor,
    final Color? unselectedLabelColor,
    final Color? selectedIconColor,
    final Color? unselectedIconColor,
    final Color? dividerColor,
    final Color? shadowColor,
    final Color? overlayColor,
    final Color? surfaceTintColor,
    final Color? borderColor,
  }) = _$DSTabsColorsImpl;

  @override
  Color? get backgroundColor;
  @override
  Color? get indicatorColor;
  @override
  Color? get selectedLabelColor;
  @override
  Color? get unselectedLabelColor;
  @override
  Color? get selectedIconColor;
  @override
  Color? get unselectedIconColor;
  @override
  Color? get dividerColor;
  @override
  Color? get shadowColor;
  @override
  Color? get overlayColor;
  @override
  Color? get surfaceTintColor;
  @override
  Color? get borderColor;

  /// Create a copy of DSTabsColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSTabsColorsImplCopyWith<_$DSTabsColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSTabsTypography {
  TextStyle? get selectedLabelStyle => throw _privateConstructorUsedError;
  TextStyle? get unselectedLabelStyle => throw _privateConstructorUsedError;
  double get labelScale => throw _privateConstructorUsedError;
  bool get responsive => throw _privateConstructorUsedError;
  TextAlign get textAlign => throw _privateConstructorUsedError;

  /// Create a copy of DSTabsTypography
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSTabsTypographyCopyWith<DSTabsTypography> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSTabsTypographyCopyWith<$Res> {
  factory $DSTabsTypographyCopyWith(
    DSTabsTypography value,
    $Res Function(DSTabsTypography) then,
  ) = _$DSTabsTypographyCopyWithImpl<$Res, DSTabsTypography>;
  @useResult
  $Res call({
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
    double labelScale,
    bool responsive,
    TextAlign textAlign,
  });
}

/// @nodoc
class _$DSTabsTypographyCopyWithImpl<$Res, $Val extends DSTabsTypography>
    implements $DSTabsTypographyCopyWith<$Res> {
  _$DSTabsTypographyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSTabsTypography
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLabelStyle = freezed,
    Object? unselectedLabelStyle = freezed,
    Object? labelScale = null,
    Object? responsive = null,
    Object? textAlign = null,
  }) {
    return _then(
      _value.copyWith(
            selectedLabelStyle: freezed == selectedLabelStyle
                ? _value.selectedLabelStyle
                : selectedLabelStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            unselectedLabelStyle: freezed == unselectedLabelStyle
                ? _value.unselectedLabelStyle
                : unselectedLabelStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
            labelScale: null == labelScale
                ? _value.labelScale
                : labelScale // ignore: cast_nullable_to_non_nullable
                      as double,
            responsive: null == responsive
                ? _value.responsive
                : responsive // ignore: cast_nullable_to_non_nullable
                      as bool,
            textAlign: null == textAlign
                ? _value.textAlign
                : textAlign // ignore: cast_nullable_to_non_nullable
                      as TextAlign,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSTabsTypographyImplCopyWith<$Res>
    implements $DSTabsTypographyCopyWith<$Res> {
  factory _$$DSTabsTypographyImplCopyWith(
    _$DSTabsTypographyImpl value,
    $Res Function(_$DSTabsTypographyImpl) then,
  ) = __$$DSTabsTypographyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
    double labelScale,
    bool responsive,
    TextAlign textAlign,
  });
}

/// @nodoc
class __$$DSTabsTypographyImplCopyWithImpl<$Res>
    extends _$DSTabsTypographyCopyWithImpl<$Res, _$DSTabsTypographyImpl>
    implements _$$DSTabsTypographyImplCopyWith<$Res> {
  __$$DSTabsTypographyImplCopyWithImpl(
    _$DSTabsTypographyImpl _value,
    $Res Function(_$DSTabsTypographyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSTabsTypography
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLabelStyle = freezed,
    Object? unselectedLabelStyle = freezed,
    Object? labelScale = null,
    Object? responsive = null,
    Object? textAlign = null,
  }) {
    return _then(
      _$DSTabsTypographyImpl(
        selectedLabelStyle: freezed == selectedLabelStyle
            ? _value.selectedLabelStyle
            : selectedLabelStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        unselectedLabelStyle: freezed == unselectedLabelStyle
            ? _value.unselectedLabelStyle
            : unselectedLabelStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
        labelScale: null == labelScale
            ? _value.labelScale
            : labelScale // ignore: cast_nullable_to_non_nullable
                  as double,
        responsive: null == responsive
            ? _value.responsive
            : responsive // ignore: cast_nullable_to_non_nullable
                  as bool,
        textAlign: null == textAlign
            ? _value.textAlign
            : textAlign // ignore: cast_nullable_to_non_nullable
                  as TextAlign,
      ),
    );
  }
}

/// @nodoc

class _$DSTabsTypographyImpl implements _DSTabsTypography {
  const _$DSTabsTypographyImpl({
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.labelScale = 1.0,
    this.responsive = true,
    this.textAlign = TextAlign.center,
  });

  @override
  final TextStyle? selectedLabelStyle;
  @override
  final TextStyle? unselectedLabelStyle;
  @override
  @JsonKey()
  final double labelScale;
  @override
  @JsonKey()
  final bool responsive;
  @override
  @JsonKey()
  final TextAlign textAlign;

  @override
  String toString() {
    return 'DSTabsTypography(selectedLabelStyle: $selectedLabelStyle, unselectedLabelStyle: $unselectedLabelStyle, labelScale: $labelScale, responsive: $responsive, textAlign: $textAlign)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSTabsTypographyImpl &&
            (identical(other.selectedLabelStyle, selectedLabelStyle) ||
                other.selectedLabelStyle == selectedLabelStyle) &&
            (identical(other.unselectedLabelStyle, unselectedLabelStyle) ||
                other.unselectedLabelStyle == unselectedLabelStyle) &&
            (identical(other.labelScale, labelScale) ||
                other.labelScale == labelScale) &&
            (identical(other.responsive, responsive) ||
                other.responsive == responsive) &&
            (identical(other.textAlign, textAlign) ||
                other.textAlign == textAlign));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    selectedLabelStyle,
    unselectedLabelStyle,
    labelScale,
    responsive,
    textAlign,
  );

  /// Create a copy of DSTabsTypography
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSTabsTypographyImplCopyWith<_$DSTabsTypographyImpl> get copyWith =>
      __$$DSTabsTypographyImplCopyWithImpl<_$DSTabsTypographyImpl>(
        this,
        _$identity,
      );
}

abstract class _DSTabsTypography implements DSTabsTypography {
  const factory _DSTabsTypography({
    final TextStyle? selectedLabelStyle,
    final TextStyle? unselectedLabelStyle,
    final double labelScale,
    final bool responsive,
    final TextAlign textAlign,
  }) = _$DSTabsTypographyImpl;

  @override
  TextStyle? get selectedLabelStyle;
  @override
  TextStyle? get unselectedLabelStyle;
  @override
  double get labelScale;
  @override
  bool get responsive;
  @override
  TextAlign get textAlign;

  /// Create a copy of DSTabsTypography
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSTabsTypographyImplCopyWith<_$DSTabsTypographyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSTabsSpacing {
  double get iconSize => throw _privateConstructorUsedError;
  double get labelPadding => throw _privateConstructorUsedError;
  double get tabPadding => throw _privateConstructorUsedError;
  double get tabSpacing => throw _privateConstructorUsedError;
  double get indicatorWeight => throw _privateConstructorUsedError;
  double get indicatorPadding => throw _privateConstructorUsedError;
  double get minTabHeight => throw _privateConstructorUsedError;
  double get maxTabHeight => throw _privateConstructorUsedError;
  double get minTabWidth => throw _privateConstructorUsedError;
  bool get adaptive => throw _privateConstructorUsedError;

  /// Create a copy of DSTabsSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSTabsSpacingCopyWith<DSTabsSpacing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSTabsSpacingCopyWith<$Res> {
  factory $DSTabsSpacingCopyWith(
    DSTabsSpacing value,
    $Res Function(DSTabsSpacing) then,
  ) = _$DSTabsSpacingCopyWithImpl<$Res, DSTabsSpacing>;
  @useResult
  $Res call({
    double iconSize,
    double labelPadding,
    double tabPadding,
    double tabSpacing,
    double indicatorWeight,
    double indicatorPadding,
    double minTabHeight,
    double maxTabHeight,
    double minTabWidth,
    bool adaptive,
  });
}

/// @nodoc
class _$DSTabsSpacingCopyWithImpl<$Res, $Val extends DSTabsSpacing>
    implements $DSTabsSpacingCopyWith<$Res> {
  _$DSTabsSpacingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSTabsSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconSize = null,
    Object? labelPadding = null,
    Object? tabPadding = null,
    Object? tabSpacing = null,
    Object? indicatorWeight = null,
    Object? indicatorPadding = null,
    Object? minTabHeight = null,
    Object? maxTabHeight = null,
    Object? minTabWidth = null,
    Object? adaptive = null,
  }) {
    return _then(
      _value.copyWith(
            iconSize: null == iconSize
                ? _value.iconSize
                : iconSize // ignore: cast_nullable_to_non_nullable
                      as double,
            labelPadding: null == labelPadding
                ? _value.labelPadding
                : labelPadding // ignore: cast_nullable_to_non_nullable
                      as double,
            tabPadding: null == tabPadding
                ? _value.tabPadding
                : tabPadding // ignore: cast_nullable_to_non_nullable
                      as double,
            tabSpacing: null == tabSpacing
                ? _value.tabSpacing
                : tabSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            indicatorWeight: null == indicatorWeight
                ? _value.indicatorWeight
                : indicatorWeight // ignore: cast_nullable_to_non_nullable
                      as double,
            indicatorPadding: null == indicatorPadding
                ? _value.indicatorPadding
                : indicatorPadding // ignore: cast_nullable_to_non_nullable
                      as double,
            minTabHeight: null == minTabHeight
                ? _value.minTabHeight
                : minTabHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            maxTabHeight: null == maxTabHeight
                ? _value.maxTabHeight
                : maxTabHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            minTabWidth: null == minTabWidth
                ? _value.minTabWidth
                : minTabWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            adaptive: null == adaptive
                ? _value.adaptive
                : adaptive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSTabsSpacingImplCopyWith<$Res>
    implements $DSTabsSpacingCopyWith<$Res> {
  factory _$$DSTabsSpacingImplCopyWith(
    _$DSTabsSpacingImpl value,
    $Res Function(_$DSTabsSpacingImpl) then,
  ) = __$$DSTabsSpacingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double iconSize,
    double labelPadding,
    double tabPadding,
    double tabSpacing,
    double indicatorWeight,
    double indicatorPadding,
    double minTabHeight,
    double maxTabHeight,
    double minTabWidth,
    bool adaptive,
  });
}

/// @nodoc
class __$$DSTabsSpacingImplCopyWithImpl<$Res>
    extends _$DSTabsSpacingCopyWithImpl<$Res, _$DSTabsSpacingImpl>
    implements _$$DSTabsSpacingImplCopyWith<$Res> {
  __$$DSTabsSpacingImplCopyWithImpl(
    _$DSTabsSpacingImpl _value,
    $Res Function(_$DSTabsSpacingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSTabsSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconSize = null,
    Object? labelPadding = null,
    Object? tabPadding = null,
    Object? tabSpacing = null,
    Object? indicatorWeight = null,
    Object? indicatorPadding = null,
    Object? minTabHeight = null,
    Object? maxTabHeight = null,
    Object? minTabWidth = null,
    Object? adaptive = null,
  }) {
    return _then(
      _$DSTabsSpacingImpl(
        iconSize: null == iconSize
            ? _value.iconSize
            : iconSize // ignore: cast_nullable_to_non_nullable
                  as double,
        labelPadding: null == labelPadding
            ? _value.labelPadding
            : labelPadding // ignore: cast_nullable_to_non_nullable
                  as double,
        tabPadding: null == tabPadding
            ? _value.tabPadding
            : tabPadding // ignore: cast_nullable_to_non_nullable
                  as double,
        tabSpacing: null == tabSpacing
            ? _value.tabSpacing
            : tabSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        indicatorWeight: null == indicatorWeight
            ? _value.indicatorWeight
            : indicatorWeight // ignore: cast_nullable_to_non_nullable
                  as double,
        indicatorPadding: null == indicatorPadding
            ? _value.indicatorPadding
            : indicatorPadding // ignore: cast_nullable_to_non_nullable
                  as double,
        minTabHeight: null == minTabHeight
            ? _value.minTabHeight
            : minTabHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        maxTabHeight: null == maxTabHeight
            ? _value.maxTabHeight
            : maxTabHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        minTabWidth: null == minTabWidth
            ? _value.minTabWidth
            : minTabWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        adaptive: null == adaptive
            ? _value.adaptive
            : adaptive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSTabsSpacingImpl implements _DSTabsSpacing {
  const _$DSTabsSpacingImpl({
    this.iconSize = 16.0,
    this.labelPadding = 8.0,
    this.tabPadding = 12.0,
    this.tabSpacing = 4.0,
    this.indicatorWeight = 4.0,
    this.indicatorPadding = 8.0,
    this.minTabHeight = 48.0,
    this.maxTabHeight = 72.0,
    this.minTabWidth = 90.0,
    this.adaptive = true,
  });

  @override
  @JsonKey()
  final double iconSize;
  @override
  @JsonKey()
  final double labelPadding;
  @override
  @JsonKey()
  final double tabPadding;
  @override
  @JsonKey()
  final double tabSpacing;
  @override
  @JsonKey()
  final double indicatorWeight;
  @override
  @JsonKey()
  final double indicatorPadding;
  @override
  @JsonKey()
  final double minTabHeight;
  @override
  @JsonKey()
  final double maxTabHeight;
  @override
  @JsonKey()
  final double minTabWidth;
  @override
  @JsonKey()
  final bool adaptive;

  @override
  String toString() {
    return 'DSTabsSpacing(iconSize: $iconSize, labelPadding: $labelPadding, tabPadding: $tabPadding, tabSpacing: $tabSpacing, indicatorWeight: $indicatorWeight, indicatorPadding: $indicatorPadding, minTabHeight: $minTabHeight, maxTabHeight: $maxTabHeight, minTabWidth: $minTabWidth, adaptive: $adaptive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSTabsSpacingImpl &&
            (identical(other.iconSize, iconSize) ||
                other.iconSize == iconSize) &&
            (identical(other.labelPadding, labelPadding) ||
                other.labelPadding == labelPadding) &&
            (identical(other.tabPadding, tabPadding) ||
                other.tabPadding == tabPadding) &&
            (identical(other.tabSpacing, tabSpacing) ||
                other.tabSpacing == tabSpacing) &&
            (identical(other.indicatorWeight, indicatorWeight) ||
                other.indicatorWeight == indicatorWeight) &&
            (identical(other.indicatorPadding, indicatorPadding) ||
                other.indicatorPadding == indicatorPadding) &&
            (identical(other.minTabHeight, minTabHeight) ||
                other.minTabHeight == minTabHeight) &&
            (identical(other.maxTabHeight, maxTabHeight) ||
                other.maxTabHeight == maxTabHeight) &&
            (identical(other.minTabWidth, minTabWidth) ||
                other.minTabWidth == minTabWidth) &&
            (identical(other.adaptive, adaptive) ||
                other.adaptive == adaptive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    iconSize,
    labelPadding,
    tabPadding,
    tabSpacing,
    indicatorWeight,
    indicatorPadding,
    minTabHeight,
    maxTabHeight,
    minTabWidth,
    adaptive,
  );

  /// Create a copy of DSTabsSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSTabsSpacingImplCopyWith<_$DSTabsSpacingImpl> get copyWith =>
      __$$DSTabsSpacingImplCopyWithImpl<_$DSTabsSpacingImpl>(this, _$identity);
}

abstract class _DSTabsSpacing implements DSTabsSpacing {
  const factory _DSTabsSpacing({
    final double iconSize,
    final double labelPadding,
    final double tabPadding,
    final double tabSpacing,
    final double indicatorWeight,
    final double indicatorPadding,
    final double minTabHeight,
    final double maxTabHeight,
    final double minTabWidth,
    final bool adaptive,
  }) = _$DSTabsSpacingImpl;

  @override
  double get iconSize;
  @override
  double get labelPadding;
  @override
  double get tabPadding;
  @override
  double get tabSpacing;
  @override
  double get indicatorWeight;
  @override
  double get indicatorPadding;
  @override
  double get minTabHeight;
  @override
  double get maxTabHeight;
  @override
  double get minTabWidth;
  @override
  bool get adaptive;

  /// Create a copy of DSTabsSpacing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSTabsSpacingImplCopyWith<_$DSTabsSpacingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSTabsElevation {
  double get defaultElevation => throw _privateConstructorUsedError;
  double get hoveredElevation => throw _privateConstructorUsedError;
  double get pressedElevation => throw _privateConstructorUsedError;
  double get focusedElevation => throw _privateConstructorUsedError;
  Color? get shadowColor => throw _privateConstructorUsedError;
  Color? get surfaceTintColor => throw _privateConstructorUsedError;

  /// Create a copy of DSTabsElevation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSTabsElevationCopyWith<DSTabsElevation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSTabsElevationCopyWith<$Res> {
  factory $DSTabsElevationCopyWith(
    DSTabsElevation value,
    $Res Function(DSTabsElevation) then,
  ) = _$DSTabsElevationCopyWithImpl<$Res, DSTabsElevation>;
  @useResult
  $Res call({
    double defaultElevation,
    double hoveredElevation,
    double pressedElevation,
    double focusedElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  });
}

/// @nodoc
class _$DSTabsElevationCopyWithImpl<$Res, $Val extends DSTabsElevation>
    implements $DSTabsElevationCopyWith<$Res> {
  _$DSTabsElevationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSTabsElevation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultElevation = null,
    Object? hoveredElevation = null,
    Object? pressedElevation = null,
    Object? focusedElevation = null,
    Object? shadowColor = freezed,
    Object? surfaceTintColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            defaultElevation: null == defaultElevation
                ? _value.defaultElevation
                : defaultElevation // ignore: cast_nullable_to_non_nullable
                      as double,
            hoveredElevation: null == hoveredElevation
                ? _value.hoveredElevation
                : hoveredElevation // ignore: cast_nullable_to_non_nullable
                      as double,
            pressedElevation: null == pressedElevation
                ? _value.pressedElevation
                : pressedElevation // ignore: cast_nullable_to_non_nullable
                      as double,
            focusedElevation: null == focusedElevation
                ? _value.focusedElevation
                : focusedElevation // ignore: cast_nullable_to_non_nullable
                      as double,
            shadowColor: freezed == shadowColor
                ? _value.shadowColor
                : shadowColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            surfaceTintColor: freezed == surfaceTintColor
                ? _value.surfaceTintColor
                : surfaceTintColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSTabsElevationImplCopyWith<$Res>
    implements $DSTabsElevationCopyWith<$Res> {
  factory _$$DSTabsElevationImplCopyWith(
    _$DSTabsElevationImpl value,
    $Res Function(_$DSTabsElevationImpl) then,
  ) = __$$DSTabsElevationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double defaultElevation,
    double hoveredElevation,
    double pressedElevation,
    double focusedElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  });
}

/// @nodoc
class __$$DSTabsElevationImplCopyWithImpl<$Res>
    extends _$DSTabsElevationCopyWithImpl<$Res, _$DSTabsElevationImpl>
    implements _$$DSTabsElevationImplCopyWith<$Res> {
  __$$DSTabsElevationImplCopyWithImpl(
    _$DSTabsElevationImpl _value,
    $Res Function(_$DSTabsElevationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSTabsElevation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultElevation = null,
    Object? hoveredElevation = null,
    Object? pressedElevation = null,
    Object? focusedElevation = null,
    Object? shadowColor = freezed,
    Object? surfaceTintColor = freezed,
  }) {
    return _then(
      _$DSTabsElevationImpl(
        defaultElevation: null == defaultElevation
            ? _value.defaultElevation
            : defaultElevation // ignore: cast_nullable_to_non_nullable
                  as double,
        hoveredElevation: null == hoveredElevation
            ? _value.hoveredElevation
            : hoveredElevation // ignore: cast_nullable_to_non_nullable
                  as double,
        pressedElevation: null == pressedElevation
            ? _value.pressedElevation
            : pressedElevation // ignore: cast_nullable_to_non_nullable
                  as double,
        focusedElevation: null == focusedElevation
            ? _value.focusedElevation
            : focusedElevation // ignore: cast_nullable_to_non_nullable
                  as double,
        shadowColor: freezed == shadowColor
            ? _value.shadowColor
            : shadowColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        surfaceTintColor: freezed == surfaceTintColor
            ? _value.surfaceTintColor
            : surfaceTintColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSTabsElevationImpl implements _DSTabsElevation {
  const _$DSTabsElevationImpl({
    this.defaultElevation = 0.0,
    this.hoveredElevation = 2.0,
    this.pressedElevation = 4.0,
    this.focusedElevation = 6.0,
    this.shadowColor,
    this.surfaceTintColor,
  });

  @override
  @JsonKey()
  final double defaultElevation;
  @override
  @JsonKey()
  final double hoveredElevation;
  @override
  @JsonKey()
  final double pressedElevation;
  @override
  @JsonKey()
  final double focusedElevation;
  @override
  final Color? shadowColor;
  @override
  final Color? surfaceTintColor;

  @override
  String toString() {
    return 'DSTabsElevation(defaultElevation: $defaultElevation, hoveredElevation: $hoveredElevation, pressedElevation: $pressedElevation, focusedElevation: $focusedElevation, shadowColor: $shadowColor, surfaceTintColor: $surfaceTintColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSTabsElevationImpl &&
            (identical(other.defaultElevation, defaultElevation) ||
                other.defaultElevation == defaultElevation) &&
            (identical(other.hoveredElevation, hoveredElevation) ||
                other.hoveredElevation == hoveredElevation) &&
            (identical(other.pressedElevation, pressedElevation) ||
                other.pressedElevation == pressedElevation) &&
            (identical(other.focusedElevation, focusedElevation) ||
                other.focusedElevation == focusedElevation) &&
            (identical(other.shadowColor, shadowColor) ||
                other.shadowColor == shadowColor) &&
            (identical(other.surfaceTintColor, surfaceTintColor) ||
                other.surfaceTintColor == surfaceTintColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    defaultElevation,
    hoveredElevation,
    pressedElevation,
    focusedElevation,
    shadowColor,
    surfaceTintColor,
  );

  /// Create a copy of DSTabsElevation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSTabsElevationImplCopyWith<_$DSTabsElevationImpl> get copyWith =>
      __$$DSTabsElevationImplCopyWithImpl<_$DSTabsElevationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSTabsElevation implements DSTabsElevation {
  const factory _DSTabsElevation({
    final double defaultElevation,
    final double hoveredElevation,
    final double pressedElevation,
    final double focusedElevation,
    final Color? shadowColor,
    final Color? surfaceTintColor,
  }) = _$DSTabsElevationImpl;

  @override
  double get defaultElevation;
  @override
  double get hoveredElevation;
  @override
  double get pressedElevation;
  @override
  double get focusedElevation;
  @override
  Color? get shadowColor;
  @override
  Color? get surfaceTintColor;

  /// Create a copy of DSTabsElevation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSTabsElevationImplCopyWith<_$DSTabsElevationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSTabsBehavior {
  bool get isScrollable => throw _privateConstructorUsedError;
  bool get showTooltips => throw _privateConstructorUsedError;
  bool get enableHapticFeedback => throw _privateConstructorUsedError;
  bool get allowTabSwitching => throw _privateConstructorUsedError;
  bool get automaticIndicatorColorAdjustment =>
      throw _privateConstructorUsedError;
  DSTabsIndicatorSize get indicatorSize => throw _privateConstructorUsedError;
  DSTabsLabelBehavior get labelBehavior => throw _privateConstructorUsedError;
  TabAlignment get tabAlignment => throw _privateConstructorUsedError;
  int get animationDuration => throw _privateConstructorUsedError;

  /// Create a copy of DSTabsBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSTabsBehaviorCopyWith<DSTabsBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSTabsBehaviorCopyWith<$Res> {
  factory $DSTabsBehaviorCopyWith(
    DSTabsBehavior value,
    $Res Function(DSTabsBehavior) then,
  ) = _$DSTabsBehaviorCopyWithImpl<$Res, DSTabsBehavior>;
  @useResult
  $Res call({
    bool isScrollable,
    bool showTooltips,
    bool enableHapticFeedback,
    bool allowTabSwitching,
    bool automaticIndicatorColorAdjustment,
    DSTabsIndicatorSize indicatorSize,
    DSTabsLabelBehavior labelBehavior,
    TabAlignment tabAlignment,
    int animationDuration,
  });
}

/// @nodoc
class _$DSTabsBehaviorCopyWithImpl<$Res, $Val extends DSTabsBehavior>
    implements $DSTabsBehaviorCopyWith<$Res> {
  _$DSTabsBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSTabsBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isScrollable = null,
    Object? showTooltips = null,
    Object? enableHapticFeedback = null,
    Object? allowTabSwitching = null,
    Object? automaticIndicatorColorAdjustment = null,
    Object? indicatorSize = null,
    Object? labelBehavior = null,
    Object? tabAlignment = null,
    Object? animationDuration = null,
  }) {
    return _then(
      _value.copyWith(
            isScrollable: null == isScrollable
                ? _value.isScrollable
                : isScrollable // ignore: cast_nullable_to_non_nullable
                      as bool,
            showTooltips: null == showTooltips
                ? _value.showTooltips
                : showTooltips // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableHapticFeedback: null == enableHapticFeedback
                ? _value.enableHapticFeedback
                : enableHapticFeedback // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowTabSwitching: null == allowTabSwitching
                ? _value.allowTabSwitching
                : allowTabSwitching // ignore: cast_nullable_to_non_nullable
                      as bool,
            automaticIndicatorColorAdjustment:
                null == automaticIndicatorColorAdjustment
                ? _value.automaticIndicatorColorAdjustment
                : automaticIndicatorColorAdjustment // ignore: cast_nullable_to_non_nullable
                      as bool,
            indicatorSize: null == indicatorSize
                ? _value.indicatorSize
                : indicatorSize // ignore: cast_nullable_to_non_nullable
                      as DSTabsIndicatorSize,
            labelBehavior: null == labelBehavior
                ? _value.labelBehavior
                : labelBehavior // ignore: cast_nullable_to_non_nullable
                      as DSTabsLabelBehavior,
            tabAlignment: null == tabAlignment
                ? _value.tabAlignment
                : tabAlignment // ignore: cast_nullable_to_non_nullable
                      as TabAlignment,
            animationDuration: null == animationDuration
                ? _value.animationDuration
                : animationDuration // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSTabsBehaviorImplCopyWith<$Res>
    implements $DSTabsBehaviorCopyWith<$Res> {
  factory _$$DSTabsBehaviorImplCopyWith(
    _$DSTabsBehaviorImpl value,
    $Res Function(_$DSTabsBehaviorImpl) then,
  ) = __$$DSTabsBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isScrollable,
    bool showTooltips,
    bool enableHapticFeedback,
    bool allowTabSwitching,
    bool automaticIndicatorColorAdjustment,
    DSTabsIndicatorSize indicatorSize,
    DSTabsLabelBehavior labelBehavior,
    TabAlignment tabAlignment,
    int animationDuration,
  });
}

/// @nodoc
class __$$DSTabsBehaviorImplCopyWithImpl<$Res>
    extends _$DSTabsBehaviorCopyWithImpl<$Res, _$DSTabsBehaviorImpl>
    implements _$$DSTabsBehaviorImplCopyWith<$Res> {
  __$$DSTabsBehaviorImplCopyWithImpl(
    _$DSTabsBehaviorImpl _value,
    $Res Function(_$DSTabsBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSTabsBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isScrollable = null,
    Object? showTooltips = null,
    Object? enableHapticFeedback = null,
    Object? allowTabSwitching = null,
    Object? automaticIndicatorColorAdjustment = null,
    Object? indicatorSize = null,
    Object? labelBehavior = null,
    Object? tabAlignment = null,
    Object? animationDuration = null,
  }) {
    return _then(
      _$DSTabsBehaviorImpl(
        isScrollable: null == isScrollable
            ? _value.isScrollable
            : isScrollable // ignore: cast_nullable_to_non_nullable
                  as bool,
        showTooltips: null == showTooltips
            ? _value.showTooltips
            : showTooltips // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableHapticFeedback: null == enableHapticFeedback
            ? _value.enableHapticFeedback
            : enableHapticFeedback // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowTabSwitching: null == allowTabSwitching
            ? _value.allowTabSwitching
            : allowTabSwitching // ignore: cast_nullable_to_non_nullable
                  as bool,
        automaticIndicatorColorAdjustment:
            null == automaticIndicatorColorAdjustment
            ? _value.automaticIndicatorColorAdjustment
            : automaticIndicatorColorAdjustment // ignore: cast_nullable_to_non_nullable
                  as bool,
        indicatorSize: null == indicatorSize
            ? _value.indicatorSize
            : indicatorSize // ignore: cast_nullable_to_non_nullable
                  as DSTabsIndicatorSize,
        labelBehavior: null == labelBehavior
            ? _value.labelBehavior
            : labelBehavior // ignore: cast_nullable_to_non_nullable
                  as DSTabsLabelBehavior,
        tabAlignment: null == tabAlignment
            ? _value.tabAlignment
            : tabAlignment // ignore: cast_nullable_to_non_nullable
                  as TabAlignment,
        animationDuration: null == animationDuration
            ? _value.animationDuration
            : animationDuration // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$DSTabsBehaviorImpl implements _DSTabsBehavior {
  const _$DSTabsBehaviorImpl({
    this.isScrollable = true,
    this.showTooltips = true,
    this.enableHapticFeedback = true,
    this.allowTabSwitching = true,
    this.automaticIndicatorColorAdjustment = false,
    this.indicatorSize = DSTabsIndicatorSize.tab,
    this.labelBehavior = DSTabsLabelBehavior.alwaysShow,
    this.tabAlignment = TabAlignment.start,
    this.animationDuration = 300,
  });

  @override
  @JsonKey()
  final bool isScrollable;
  @override
  @JsonKey()
  final bool showTooltips;
  @override
  @JsonKey()
  final bool enableHapticFeedback;
  @override
  @JsonKey()
  final bool allowTabSwitching;
  @override
  @JsonKey()
  final bool automaticIndicatorColorAdjustment;
  @override
  @JsonKey()
  final DSTabsIndicatorSize indicatorSize;
  @override
  @JsonKey()
  final DSTabsLabelBehavior labelBehavior;
  @override
  @JsonKey()
  final TabAlignment tabAlignment;
  @override
  @JsonKey()
  final int animationDuration;

  @override
  String toString() {
    return 'DSTabsBehavior(isScrollable: $isScrollable, showTooltips: $showTooltips, enableHapticFeedback: $enableHapticFeedback, allowTabSwitching: $allowTabSwitching, automaticIndicatorColorAdjustment: $automaticIndicatorColorAdjustment, indicatorSize: $indicatorSize, labelBehavior: $labelBehavior, tabAlignment: $tabAlignment, animationDuration: $animationDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSTabsBehaviorImpl &&
            (identical(other.isScrollable, isScrollable) ||
                other.isScrollable == isScrollable) &&
            (identical(other.showTooltips, showTooltips) ||
                other.showTooltips == showTooltips) &&
            (identical(other.enableHapticFeedback, enableHapticFeedback) ||
                other.enableHapticFeedback == enableHapticFeedback) &&
            (identical(other.allowTabSwitching, allowTabSwitching) ||
                other.allowTabSwitching == allowTabSwitching) &&
            (identical(
                  other.automaticIndicatorColorAdjustment,
                  automaticIndicatorColorAdjustment,
                ) ||
                other.automaticIndicatorColorAdjustment ==
                    automaticIndicatorColorAdjustment) &&
            (identical(other.indicatorSize, indicatorSize) ||
                other.indicatorSize == indicatorSize) &&
            (identical(other.labelBehavior, labelBehavior) ||
                other.labelBehavior == labelBehavior) &&
            (identical(other.tabAlignment, tabAlignment) ||
                other.tabAlignment == tabAlignment) &&
            (identical(other.animationDuration, animationDuration) ||
                other.animationDuration == animationDuration));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isScrollable,
    showTooltips,
    enableHapticFeedback,
    allowTabSwitching,
    automaticIndicatorColorAdjustment,
    indicatorSize,
    labelBehavior,
    tabAlignment,
    animationDuration,
  );

  /// Create a copy of DSTabsBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSTabsBehaviorImplCopyWith<_$DSTabsBehaviorImpl> get copyWith =>
      __$$DSTabsBehaviorImplCopyWithImpl<_$DSTabsBehaviorImpl>(
        this,
        _$identity,
      );
}

abstract class _DSTabsBehavior implements DSTabsBehavior {
  const factory _DSTabsBehavior({
    final bool isScrollable,
    final bool showTooltips,
    final bool enableHapticFeedback,
    final bool allowTabSwitching,
    final bool automaticIndicatorColorAdjustment,
    final DSTabsIndicatorSize indicatorSize,
    final DSTabsLabelBehavior labelBehavior,
    final TabAlignment tabAlignment,
    final int animationDuration,
  }) = _$DSTabsBehaviorImpl;

  @override
  bool get isScrollable;
  @override
  bool get showTooltips;
  @override
  bool get enableHapticFeedback;
  @override
  bool get allowTabSwitching;
  @override
  bool get automaticIndicatorColorAdjustment;
  @override
  DSTabsIndicatorSize get indicatorSize;
  @override
  DSTabsLabelBehavior get labelBehavior;
  @override
  TabAlignment get tabAlignment;
  @override
  int get animationDuration;

  /// Create a copy of DSTabsBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSTabsBehaviorImplCopyWith<_$DSTabsBehaviorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSTabsAnimation {
  DSTabsAnimationType get type => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  Curve get curve => throw _privateConstructorUsedError;
  bool get enableStateTransitions => throw _privateConstructorUsedError;
  bool get enableIndicatorAnimation => throw _privateConstructorUsedError;

  /// Create a copy of DSTabsAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSTabsAnimationCopyWith<DSTabsAnimation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSTabsAnimationCopyWith<$Res> {
  factory $DSTabsAnimationCopyWith(
    DSTabsAnimation value,
    $Res Function(DSTabsAnimation) then,
  ) = _$DSTabsAnimationCopyWithImpl<$Res, DSTabsAnimation>;
  @useResult
  $Res call({
    DSTabsAnimationType type,
    int duration,
    Curve curve,
    bool enableStateTransitions,
    bool enableIndicatorAnimation,
  });
}

/// @nodoc
class _$DSTabsAnimationCopyWithImpl<$Res, $Val extends DSTabsAnimation>
    implements $DSTabsAnimationCopyWith<$Res> {
  _$DSTabsAnimationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSTabsAnimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? duration = null,
    Object? curve = null,
    Object? enableStateTransitions = null,
    Object? enableIndicatorAnimation = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DSTabsAnimationType,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int,
            curve: null == curve
                ? _value.curve
                : curve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            enableStateTransitions: null == enableStateTransitions
                ? _value.enableStateTransitions
                : enableStateTransitions // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableIndicatorAnimation: null == enableIndicatorAnimation
                ? _value.enableIndicatorAnimation
                : enableIndicatorAnimation // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSTabsAnimationImplCopyWith<$Res>
    implements $DSTabsAnimationCopyWith<$Res> {
  factory _$$DSTabsAnimationImplCopyWith(
    _$DSTabsAnimationImpl value,
    $Res Function(_$DSTabsAnimationImpl) then,
  ) = __$$DSTabsAnimationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSTabsAnimationType type,
    int duration,
    Curve curve,
    bool enableStateTransitions,
    bool enableIndicatorAnimation,
  });
}

/// @nodoc
class __$$DSTabsAnimationImplCopyWithImpl<$Res>
    extends _$DSTabsAnimationCopyWithImpl<$Res, _$DSTabsAnimationImpl>
    implements _$$DSTabsAnimationImplCopyWith<$Res> {
  __$$DSTabsAnimationImplCopyWithImpl(
    _$DSTabsAnimationImpl _value,
    $Res Function(_$DSTabsAnimationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSTabsAnimation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? duration = null,
    Object? curve = null,
    Object? enableStateTransitions = null,
    Object? enableIndicatorAnimation = null,
  }) {
    return _then(
      _$DSTabsAnimationImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DSTabsAnimationType,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        curve: null == curve
            ? _value.curve
            : curve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        enableStateTransitions: null == enableStateTransitions
            ? _value.enableStateTransitions
            : enableStateTransitions // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableIndicatorAnimation: null == enableIndicatorAnimation
            ? _value.enableIndicatorAnimation
            : enableIndicatorAnimation // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSTabsAnimationImpl implements _DSTabsAnimation {
  const _$DSTabsAnimationImpl({
    this.type = DSTabsAnimationType.slide,
    this.duration = 300,
    this.curve = Curves.easeInOut,
    this.enableStateTransitions = true,
    this.enableIndicatorAnimation = true,
  });

  @override
  @JsonKey()
  final DSTabsAnimationType type;
  @override
  @JsonKey()
  final int duration;
  @override
  @JsonKey()
  final Curve curve;
  @override
  @JsonKey()
  final bool enableStateTransitions;
  @override
  @JsonKey()
  final bool enableIndicatorAnimation;

  @override
  String toString() {
    return 'DSTabsAnimation(type: $type, duration: $duration, curve: $curve, enableStateTransitions: $enableStateTransitions, enableIndicatorAnimation: $enableIndicatorAnimation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSTabsAnimationImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.curve, curve) || other.curve == curve) &&
            (identical(other.enableStateTransitions, enableStateTransitions) ||
                other.enableStateTransitions == enableStateTransitions) &&
            (identical(
                  other.enableIndicatorAnimation,
                  enableIndicatorAnimation,
                ) ||
                other.enableIndicatorAnimation == enableIndicatorAnimation));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    duration,
    curve,
    enableStateTransitions,
    enableIndicatorAnimation,
  );

  /// Create a copy of DSTabsAnimation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSTabsAnimationImplCopyWith<_$DSTabsAnimationImpl> get copyWith =>
      __$$DSTabsAnimationImplCopyWithImpl<_$DSTabsAnimationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSTabsAnimation implements DSTabsAnimation {
  const factory _DSTabsAnimation({
    final DSTabsAnimationType type,
    final int duration,
    final Curve curve,
    final bool enableStateTransitions,
    final bool enableIndicatorAnimation,
  }) = _$DSTabsAnimationImpl;

  @override
  DSTabsAnimationType get type;
  @override
  int get duration;
  @override
  Curve get curve;
  @override
  bool get enableStateTransitions;
  @override
  bool get enableIndicatorAnimation;

  /// Create a copy of DSTabsAnimation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSTabsAnimationImplCopyWith<_$DSTabsAnimationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
