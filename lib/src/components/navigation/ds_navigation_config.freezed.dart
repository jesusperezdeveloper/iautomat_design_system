// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ds_navigation_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSNavigationComponentConfig {
  DSNavigationVariant get variant => throw _privateConstructorUsedError;
  DSNavigationState get state => throw _privateConstructorUsedError;
  bool get isAdaptive => throw _privateConstructorUsedError;
  bool get isRtl => throw _privateConstructorUsedError;
  bool get enableA11y => throw _privateConstructorUsedError;
  bool get enableKeyboardSupport => throw _privateConstructorUsedError;
  List<DSNavigationDestination> get destinations =>
      throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  ValueChanged<int>? get onTap => throw _privateConstructorUsedError;
  List<DSNavigationBadge> get badges => throw _privateConstructorUsedError;
  DSNavigationColors? get colors => throw _privateConstructorUsedError;
  DSNavigationTypography? get typography => throw _privateConstructorUsedError;
  DSNavigationSpacing? get spacing => throw _privateConstructorUsedError;
  DSNavigationElevation? get elevation => throw _privateConstructorUsedError;
  DSNavigationBehavior? get behavior => throw _privateConstructorUsedError;

  /// Create a copy of DSNavigationComponentConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSNavigationComponentConfigCopyWith<DSNavigationComponentConfig>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSNavigationComponentConfigCopyWith<$Res> {
  factory $DSNavigationComponentConfigCopyWith(
    DSNavigationComponentConfig value,
    $Res Function(DSNavigationComponentConfig) then,
  ) =
      _$DSNavigationComponentConfigCopyWithImpl<
        $Res,
        DSNavigationComponentConfig
      >;
  @useResult
  $Res call({
    DSNavigationVariant variant,
    DSNavigationState state,
    bool isAdaptive,
    bool isRtl,
    bool enableA11y,
    bool enableKeyboardSupport,
    List<DSNavigationDestination> destinations,
    int currentIndex,
    ValueChanged<int>? onTap,
    List<DSNavigationBadge> badges,
    DSNavigationColors? colors,
    DSNavigationTypography? typography,
    DSNavigationSpacing? spacing,
    DSNavigationElevation? elevation,
    DSNavigationBehavior? behavior,
  });

  $DSNavigationColorsCopyWith<$Res>? get colors;
  $DSNavigationTypographyCopyWith<$Res>? get typography;
  $DSNavigationSpacingCopyWith<$Res>? get spacing;
  $DSNavigationElevationCopyWith<$Res>? get elevation;
  $DSNavigationBehaviorCopyWith<$Res>? get behavior;
}

/// @nodoc
class _$DSNavigationComponentConfigCopyWithImpl<
  $Res,
  $Val extends DSNavigationComponentConfig
>
    implements $DSNavigationComponentConfigCopyWith<$Res> {
  _$DSNavigationComponentConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSNavigationComponentConfig
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
    Object? destinations = null,
    Object? currentIndex = null,
    Object? onTap = freezed,
    Object? badges = null,
    Object? colors = freezed,
    Object? typography = freezed,
    Object? spacing = freezed,
    Object? elevation = freezed,
    Object? behavior = freezed,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSNavigationVariant,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSNavigationState,
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
            destinations: null == destinations
                ? _value.destinations
                : destinations // ignore: cast_nullable_to_non_nullable
                      as List<DSNavigationDestination>,
            currentIndex: null == currentIndex
                ? _value.currentIndex
                : currentIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            onTap: freezed == onTap
                ? _value.onTap
                : onTap // ignore: cast_nullable_to_non_nullable
                      as ValueChanged<int>?,
            badges: null == badges
                ? _value.badges
                : badges // ignore: cast_nullable_to_non_nullable
                      as List<DSNavigationBadge>,
            colors: freezed == colors
                ? _value.colors
                : colors // ignore: cast_nullable_to_non_nullable
                      as DSNavigationColors?,
            typography: freezed == typography
                ? _value.typography
                : typography // ignore: cast_nullable_to_non_nullable
                      as DSNavigationTypography?,
            spacing: freezed == spacing
                ? _value.spacing
                : spacing // ignore: cast_nullable_to_non_nullable
                      as DSNavigationSpacing?,
            elevation: freezed == elevation
                ? _value.elevation
                : elevation // ignore: cast_nullable_to_non_nullable
                      as DSNavigationElevation?,
            behavior: freezed == behavior
                ? _value.behavior
                : behavior // ignore: cast_nullable_to_non_nullable
                      as DSNavigationBehavior?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSNavigationComponentConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSNavigationColorsCopyWith<$Res>? get colors {
    if (_value.colors == null) {
      return null;
    }

    return $DSNavigationColorsCopyWith<$Res>(_value.colors!, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }

  /// Create a copy of DSNavigationComponentConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSNavigationTypographyCopyWith<$Res>? get typography {
    if (_value.typography == null) {
      return null;
    }

    return $DSNavigationTypographyCopyWith<$Res>(_value.typography!, (value) {
      return _then(_value.copyWith(typography: value) as $Val);
    });
  }

  /// Create a copy of DSNavigationComponentConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSNavigationSpacingCopyWith<$Res>? get spacing {
    if (_value.spacing == null) {
      return null;
    }

    return $DSNavigationSpacingCopyWith<$Res>(_value.spacing!, (value) {
      return _then(_value.copyWith(spacing: value) as $Val);
    });
  }

  /// Create a copy of DSNavigationComponentConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSNavigationElevationCopyWith<$Res>? get elevation {
    if (_value.elevation == null) {
      return null;
    }

    return $DSNavigationElevationCopyWith<$Res>(_value.elevation!, (value) {
      return _then(_value.copyWith(elevation: value) as $Val);
    });
  }

  /// Create a copy of DSNavigationComponentConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSNavigationBehaviorCopyWith<$Res>? get behavior {
    if (_value.behavior == null) {
      return null;
    }

    return $DSNavigationBehaviorCopyWith<$Res>(_value.behavior!, (value) {
      return _then(_value.copyWith(behavior: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSNavigationComponentConfigImplCopyWith<$Res>
    implements $DSNavigationComponentConfigCopyWith<$Res> {
  factory _$$DSNavigationComponentConfigImplCopyWith(
    _$DSNavigationComponentConfigImpl value,
    $Res Function(_$DSNavigationComponentConfigImpl) then,
  ) = __$$DSNavigationComponentConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSNavigationVariant variant,
    DSNavigationState state,
    bool isAdaptive,
    bool isRtl,
    bool enableA11y,
    bool enableKeyboardSupport,
    List<DSNavigationDestination> destinations,
    int currentIndex,
    ValueChanged<int>? onTap,
    List<DSNavigationBadge> badges,
    DSNavigationColors? colors,
    DSNavigationTypography? typography,
    DSNavigationSpacing? spacing,
    DSNavigationElevation? elevation,
    DSNavigationBehavior? behavior,
  });

  @override
  $DSNavigationColorsCopyWith<$Res>? get colors;
  @override
  $DSNavigationTypographyCopyWith<$Res>? get typography;
  @override
  $DSNavigationSpacingCopyWith<$Res>? get spacing;
  @override
  $DSNavigationElevationCopyWith<$Res>? get elevation;
  @override
  $DSNavigationBehaviorCopyWith<$Res>? get behavior;
}

/// @nodoc
class __$$DSNavigationComponentConfigImplCopyWithImpl<$Res>
    extends
        _$DSNavigationComponentConfigCopyWithImpl<
          $Res,
          _$DSNavigationComponentConfigImpl
        >
    implements _$$DSNavigationComponentConfigImplCopyWith<$Res> {
  __$$DSNavigationComponentConfigImplCopyWithImpl(
    _$DSNavigationComponentConfigImpl _value,
    $Res Function(_$DSNavigationComponentConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSNavigationComponentConfig
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
    Object? destinations = null,
    Object? currentIndex = null,
    Object? onTap = freezed,
    Object? badges = null,
    Object? colors = freezed,
    Object? typography = freezed,
    Object? spacing = freezed,
    Object? elevation = freezed,
    Object? behavior = freezed,
  }) {
    return _then(
      _$DSNavigationComponentConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSNavigationVariant,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSNavigationState,
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
        destinations: null == destinations
            ? _value._destinations
            : destinations // ignore: cast_nullable_to_non_nullable
                  as List<DSNavigationDestination>,
        currentIndex: null == currentIndex
            ? _value.currentIndex
            : currentIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        onTap: freezed == onTap
            ? _value.onTap
            : onTap // ignore: cast_nullable_to_non_nullable
                  as ValueChanged<int>?,
        badges: null == badges
            ? _value._badges
            : badges // ignore: cast_nullable_to_non_nullable
                  as List<DSNavigationBadge>,
        colors: freezed == colors
            ? _value.colors
            : colors // ignore: cast_nullable_to_non_nullable
                  as DSNavigationColors?,
        typography: freezed == typography
            ? _value.typography
            : typography // ignore: cast_nullable_to_non_nullable
                  as DSNavigationTypography?,
        spacing: freezed == spacing
            ? _value.spacing
            : spacing // ignore: cast_nullable_to_non_nullable
                  as DSNavigationSpacing?,
        elevation: freezed == elevation
            ? _value.elevation
            : elevation // ignore: cast_nullable_to_non_nullable
                  as DSNavigationElevation?,
        behavior: freezed == behavior
            ? _value.behavior
            : behavior // ignore: cast_nullable_to_non_nullable
                  as DSNavigationBehavior?,
      ),
    );
  }
}

/// @nodoc

class _$DSNavigationComponentConfigImpl
    implements _DSNavigationComponentConfig {
  const _$DSNavigationComponentConfigImpl({
    this.variant = DSNavigationVariant.bottomBar,
    this.state = DSNavigationState.defaultState,
    this.isAdaptive = true,
    this.isRtl = false,
    this.enableA11y = true,
    this.enableKeyboardSupport = true,
    final List<DSNavigationDestination> destinations = const [],
    this.currentIndex = 0,
    this.onTap,
    final List<DSNavigationBadge> badges = const [],
    this.colors,
    this.typography,
    this.spacing,
    this.elevation,
    this.behavior,
  }) : _destinations = destinations,
       _badges = badges;

  @override
  @JsonKey()
  final DSNavigationVariant variant;
  @override
  @JsonKey()
  final DSNavigationState state;
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
  final List<DSNavigationDestination> _destinations;
  @override
  @JsonKey()
  List<DSNavigationDestination> get destinations {
    if (_destinations is EqualUnmodifiableListView) return _destinations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destinations);
  }

  @override
  @JsonKey()
  final int currentIndex;
  @override
  final ValueChanged<int>? onTap;
  final List<DSNavigationBadge> _badges;
  @override
  @JsonKey()
  List<DSNavigationBadge> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  @override
  final DSNavigationColors? colors;
  @override
  final DSNavigationTypography? typography;
  @override
  final DSNavigationSpacing? spacing;
  @override
  final DSNavigationElevation? elevation;
  @override
  final DSNavigationBehavior? behavior;

  @override
  String toString() {
    return 'DSNavigationComponentConfig(variant: $variant, state: $state, isAdaptive: $isAdaptive, isRtl: $isRtl, enableA11y: $enableA11y, enableKeyboardSupport: $enableKeyboardSupport, destinations: $destinations, currentIndex: $currentIndex, onTap: $onTap, badges: $badges, colors: $colors, typography: $typography, spacing: $spacing, elevation: $elevation, behavior: $behavior)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSNavigationComponentConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.isAdaptive, isAdaptive) ||
                other.isAdaptive == isAdaptive) &&
            (identical(other.isRtl, isRtl) || other.isRtl == isRtl) &&
            (identical(other.enableA11y, enableA11y) ||
                other.enableA11y == enableA11y) &&
            (identical(other.enableKeyboardSupport, enableKeyboardSupport) ||
                other.enableKeyboardSupport == enableKeyboardSupport) &&
            const DeepCollectionEquality().equals(
              other._destinations,
              _destinations,
            ) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.onTap, onTap) || other.onTap == onTap) &&
            const DeepCollectionEquality().equals(other._badges, _badges) &&
            (identical(other.colors, colors) || other.colors == colors) &&
            (identical(other.typography, typography) ||
                other.typography == typography) &&
            (identical(other.spacing, spacing) || other.spacing == spacing) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.behavior, behavior) ||
                other.behavior == behavior));
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
    const DeepCollectionEquality().hash(_destinations),
    currentIndex,
    onTap,
    const DeepCollectionEquality().hash(_badges),
    colors,
    typography,
    spacing,
    elevation,
    behavior,
  );

  /// Create a copy of DSNavigationComponentConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSNavigationComponentConfigImplCopyWith<_$DSNavigationComponentConfigImpl>
  get copyWith =>
      __$$DSNavigationComponentConfigImplCopyWithImpl<
        _$DSNavigationComponentConfigImpl
      >(this, _$identity);
}

abstract class _DSNavigationComponentConfig
    implements DSNavigationComponentConfig {
  const factory _DSNavigationComponentConfig({
    final DSNavigationVariant variant,
    final DSNavigationState state,
    final bool isAdaptive,
    final bool isRtl,
    final bool enableA11y,
    final bool enableKeyboardSupport,
    final List<DSNavigationDestination> destinations,
    final int currentIndex,
    final ValueChanged<int>? onTap,
    final List<DSNavigationBadge> badges,
    final DSNavigationColors? colors,
    final DSNavigationTypography? typography,
    final DSNavigationSpacing? spacing,
    final DSNavigationElevation? elevation,
    final DSNavigationBehavior? behavior,
  }) = _$DSNavigationComponentConfigImpl;

  @override
  DSNavigationVariant get variant;
  @override
  DSNavigationState get state;
  @override
  bool get isAdaptive;
  @override
  bool get isRtl;
  @override
  bool get enableA11y;
  @override
  bool get enableKeyboardSupport;
  @override
  List<DSNavigationDestination> get destinations;
  @override
  int get currentIndex;
  @override
  ValueChanged<int>? get onTap;
  @override
  List<DSNavigationBadge> get badges;
  @override
  DSNavigationColors? get colors;
  @override
  DSNavigationTypography? get typography;
  @override
  DSNavigationSpacing? get spacing;
  @override
  DSNavigationElevation? get elevation;
  @override
  DSNavigationBehavior? get behavior;

  /// Create a copy of DSNavigationComponentConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSNavigationComponentConfigImplCopyWith<_$DSNavigationComponentConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSNavigationDestination {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  Widget get icon => throw _privateConstructorUsedError;
  Widget? get selectedIcon => throw _privateConstructorUsedError;
  String? get tooltip => throw _privateConstructorUsedError;
  bool get disabled => throw _privateConstructorUsedError;
  DSNavigationDestinationType get type => throw _privateConstructorUsedError;
  Widget? get leading => throw _privateConstructorUsedError;
  Widget? get trailing => throw _privateConstructorUsedError;
  VoidCallback? get onTap => throw _privateConstructorUsedError;

  /// Create a copy of DSNavigationDestination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSNavigationDestinationCopyWith<DSNavigationDestination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSNavigationDestinationCopyWith<$Res> {
  factory $DSNavigationDestinationCopyWith(
    DSNavigationDestination value,
    $Res Function(DSNavigationDestination) then,
  ) = _$DSNavigationDestinationCopyWithImpl<$Res, DSNavigationDestination>;
  @useResult
  $Res call({
    String id,
    String label,
    Widget icon,
    Widget? selectedIcon,
    String? tooltip,
    bool disabled,
    DSNavigationDestinationType type,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
  });
}

/// @nodoc
class _$DSNavigationDestinationCopyWithImpl<
  $Res,
  $Val extends DSNavigationDestination
>
    implements $DSNavigationDestinationCopyWith<$Res> {
  _$DSNavigationDestinationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSNavigationDestination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? icon = null,
    Object? selectedIcon = freezed,
    Object? tooltip = freezed,
    Object? disabled = null,
    Object? type = null,
    Object? leading = freezed,
    Object? trailing = freezed,
    Object? onTap = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as Widget,
            selectedIcon: freezed == selectedIcon
                ? _value.selectedIcon
                : selectedIcon // ignore: cast_nullable_to_non_nullable
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
                      as DSNavigationDestinationType,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSNavigationDestinationImplCopyWith<$Res>
    implements $DSNavigationDestinationCopyWith<$Res> {
  factory _$$DSNavigationDestinationImplCopyWith(
    _$DSNavigationDestinationImpl value,
    $Res Function(_$DSNavigationDestinationImpl) then,
  ) = __$$DSNavigationDestinationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String label,
    Widget icon,
    Widget? selectedIcon,
    String? tooltip,
    bool disabled,
    DSNavigationDestinationType type,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
  });
}

/// @nodoc
class __$$DSNavigationDestinationImplCopyWithImpl<$Res>
    extends
        _$DSNavigationDestinationCopyWithImpl<
          $Res,
          _$DSNavigationDestinationImpl
        >
    implements _$$DSNavigationDestinationImplCopyWith<$Res> {
  __$$DSNavigationDestinationImplCopyWithImpl(
    _$DSNavigationDestinationImpl _value,
    $Res Function(_$DSNavigationDestinationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSNavigationDestination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? icon = null,
    Object? selectedIcon = freezed,
    Object? tooltip = freezed,
    Object? disabled = null,
    Object? type = null,
    Object? leading = freezed,
    Object? trailing = freezed,
    Object? onTap = freezed,
  }) {
    return _then(
      _$DSNavigationDestinationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as Widget,
        selectedIcon: freezed == selectedIcon
            ? _value.selectedIcon
            : selectedIcon // ignore: cast_nullable_to_non_nullable
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
                  as DSNavigationDestinationType,
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
      ),
    );
  }
}

/// @nodoc

class _$DSNavigationDestinationImpl implements _DSNavigationDestination {
  const _$DSNavigationDestinationImpl({
    required this.id,
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.tooltip,
    this.disabled = false,
    this.type = DSNavigationDestinationType.standard,
    this.leading,
    this.trailing,
    this.onTap,
  });

  @override
  final String id;
  @override
  final String label;
  @override
  final Widget icon;
  @override
  final Widget? selectedIcon;
  @override
  final String? tooltip;
  @override
  @JsonKey()
  final bool disabled;
  @override
  @JsonKey()
  final DSNavigationDestinationType type;
  @override
  final Widget? leading;
  @override
  final Widget? trailing;
  @override
  final VoidCallback? onTap;

  @override
  String toString() {
    return 'DSNavigationDestination(id: $id, label: $label, icon: $icon, selectedIcon: $selectedIcon, tooltip: $tooltip, disabled: $disabled, type: $type, leading: $leading, trailing: $trailing, onTap: $onTap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSNavigationDestinationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.selectedIcon, selectedIcon) ||
                other.selectedIcon == selectedIcon) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.leading, leading) || other.leading == leading) &&
            (identical(other.trailing, trailing) ||
                other.trailing == trailing) &&
            (identical(other.onTap, onTap) || other.onTap == onTap));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    label,
    icon,
    selectedIcon,
    tooltip,
    disabled,
    type,
    leading,
    trailing,
    onTap,
  );

  /// Create a copy of DSNavigationDestination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSNavigationDestinationImplCopyWith<_$DSNavigationDestinationImpl>
  get copyWith =>
      __$$DSNavigationDestinationImplCopyWithImpl<
        _$DSNavigationDestinationImpl
      >(this, _$identity);
}

abstract class _DSNavigationDestination implements DSNavigationDestination {
  const factory _DSNavigationDestination({
    required final String id,
    required final String label,
    required final Widget icon,
    final Widget? selectedIcon,
    final String? tooltip,
    final bool disabled,
    final DSNavigationDestinationType type,
    final Widget? leading,
    final Widget? trailing,
    final VoidCallback? onTap,
  }) = _$DSNavigationDestinationImpl;

  @override
  String get id;
  @override
  String get label;
  @override
  Widget get icon;
  @override
  Widget? get selectedIcon;
  @override
  String? get tooltip;
  @override
  bool get disabled;
  @override
  DSNavigationDestinationType get type;
  @override
  Widget? get leading;
  @override
  Widget? get trailing;
  @override
  VoidCallback? get onTap;

  /// Create a copy of DSNavigationDestination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSNavigationDestinationImplCopyWith<_$DSNavigationDestinationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSNavigationBadge {
  String get destinationId => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  DSNavigationBadgeType get type => throw _privateConstructorUsedError;
  Color? get backgroundColor => throw _privateConstructorUsedError;
  Color? get textColor => throw _privateConstructorUsedError;
  bool get isVisible => throw _privateConstructorUsedError;
  int get maxCount => throw _privateConstructorUsedError;

  /// Create a copy of DSNavigationBadge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSNavigationBadgeCopyWith<DSNavigationBadge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSNavigationBadgeCopyWith<$Res> {
  factory $DSNavigationBadgeCopyWith(
    DSNavigationBadge value,
    $Res Function(DSNavigationBadge) then,
  ) = _$DSNavigationBadgeCopyWithImpl<$Res, DSNavigationBadge>;
  @useResult
  $Res call({
    String destinationId,
    String? text,
    int count,
    DSNavigationBadgeType type,
    Color? backgroundColor,
    Color? textColor,
    bool isVisible,
    int maxCount,
  });
}

/// @nodoc
class _$DSNavigationBadgeCopyWithImpl<$Res, $Val extends DSNavigationBadge>
    implements $DSNavigationBadgeCopyWith<$Res> {
  _$DSNavigationBadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSNavigationBadge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationId = null,
    Object? text = freezed,
    Object? count = null,
    Object? type = null,
    Object? backgroundColor = freezed,
    Object? textColor = freezed,
    Object? isVisible = null,
    Object? maxCount = null,
  }) {
    return _then(
      _value.copyWith(
            destinationId: null == destinationId
                ? _value.destinationId
                : destinationId // ignore: cast_nullable_to_non_nullable
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
                      as DSNavigationBadgeType,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSNavigationBadgeImplCopyWith<$Res>
    implements $DSNavigationBadgeCopyWith<$Res> {
  factory _$$DSNavigationBadgeImplCopyWith(
    _$DSNavigationBadgeImpl value,
    $Res Function(_$DSNavigationBadgeImpl) then,
  ) = __$$DSNavigationBadgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String destinationId,
    String? text,
    int count,
    DSNavigationBadgeType type,
    Color? backgroundColor,
    Color? textColor,
    bool isVisible,
    int maxCount,
  });
}

/// @nodoc
class __$$DSNavigationBadgeImplCopyWithImpl<$Res>
    extends _$DSNavigationBadgeCopyWithImpl<$Res, _$DSNavigationBadgeImpl>
    implements _$$DSNavigationBadgeImplCopyWith<$Res> {
  __$$DSNavigationBadgeImplCopyWithImpl(
    _$DSNavigationBadgeImpl _value,
    $Res Function(_$DSNavigationBadgeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSNavigationBadge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinationId = null,
    Object? text = freezed,
    Object? count = null,
    Object? type = null,
    Object? backgroundColor = freezed,
    Object? textColor = freezed,
    Object? isVisible = null,
    Object? maxCount = null,
  }) {
    return _then(
      _$DSNavigationBadgeImpl(
        destinationId: null == destinationId
            ? _value.destinationId
            : destinationId // ignore: cast_nullable_to_non_nullable
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
                  as DSNavigationBadgeType,
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
      ),
    );
  }
}

/// @nodoc

class _$DSNavigationBadgeImpl implements _DSNavigationBadge {
  const _$DSNavigationBadgeImpl({
    required this.destinationId,
    this.text,
    this.count = 0,
    this.type = DSNavigationBadgeType.count,
    this.backgroundColor,
    this.textColor,
    this.isVisible = true,
    this.maxCount = 99,
  });

  @override
  final String destinationId;
  @override
  final String? text;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final DSNavigationBadgeType type;
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
  String toString() {
    return 'DSNavigationBadge(destinationId: $destinationId, text: $text, count: $count, type: $type, backgroundColor: $backgroundColor, textColor: $textColor, isVisible: $isVisible, maxCount: $maxCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSNavigationBadgeImpl &&
            (identical(other.destinationId, destinationId) ||
                other.destinationId == destinationId) &&
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
                other.maxCount == maxCount));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    destinationId,
    text,
    count,
    type,
    backgroundColor,
    textColor,
    isVisible,
    maxCount,
  );

  /// Create a copy of DSNavigationBadge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSNavigationBadgeImplCopyWith<_$DSNavigationBadgeImpl> get copyWith =>
      __$$DSNavigationBadgeImplCopyWithImpl<_$DSNavigationBadgeImpl>(
        this,
        _$identity,
      );
}

abstract class _DSNavigationBadge implements DSNavigationBadge {
  const factory _DSNavigationBadge({
    required final String destinationId,
    final String? text,
    final int count,
    final DSNavigationBadgeType type,
    final Color? backgroundColor,
    final Color? textColor,
    final bool isVisible,
    final int maxCount,
  }) = _$DSNavigationBadgeImpl;

  @override
  String get destinationId;
  @override
  String? get text;
  @override
  int get count;
  @override
  DSNavigationBadgeType get type;
  @override
  Color? get backgroundColor;
  @override
  Color? get textColor;
  @override
  bool get isVisible;
  @override
  int get maxCount;

  /// Create a copy of DSNavigationBadge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSNavigationBadgeImplCopyWith<_$DSNavigationBadgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSNavigationColors {
  Color? get backgroundColor => throw _privateConstructorUsedError;
  Color? get selectedItemColor => throw _privateConstructorUsedError;
  Color? get unselectedItemColor => throw _privateConstructorUsedError;
  Color? get selectedIconColor => throw _privateConstructorUsedError;
  Color? get unselectedIconColor => throw _privateConstructorUsedError;
  Color? get selectedLabelColor => throw _privateConstructorUsedError;
  Color? get unselectedLabelColor => throw _privateConstructorUsedError;
  Color? get indicatorColor => throw _privateConstructorUsedError;
  Color? get dividerColor => throw _privateConstructorUsedError;
  Color? get shadowColor => throw _privateConstructorUsedError;
  Color? get surfaceTintColor => throw _privateConstructorUsedError;

  /// Create a copy of DSNavigationColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSNavigationColorsCopyWith<DSNavigationColors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSNavigationColorsCopyWith<$Res> {
  factory $DSNavigationColorsCopyWith(
    DSNavigationColors value,
    $Res Function(DSNavigationColors) then,
  ) = _$DSNavigationColorsCopyWithImpl<$Res, DSNavigationColors>;
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? selectedItemColor,
    Color? unselectedItemColor,
    Color? selectedIconColor,
    Color? unselectedIconColor,
    Color? selectedLabelColor,
    Color? unselectedLabelColor,
    Color? indicatorColor,
    Color? dividerColor,
    Color? shadowColor,
    Color? surfaceTintColor,
  });
}

/// @nodoc
class _$DSNavigationColorsCopyWithImpl<$Res, $Val extends DSNavigationColors>
    implements $DSNavigationColorsCopyWith<$Res> {
  _$DSNavigationColorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSNavigationColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? selectedItemColor = freezed,
    Object? unselectedItemColor = freezed,
    Object? selectedIconColor = freezed,
    Object? unselectedIconColor = freezed,
    Object? selectedLabelColor = freezed,
    Object? unselectedLabelColor = freezed,
    Object? indicatorColor = freezed,
    Object? dividerColor = freezed,
    Object? shadowColor = freezed,
    Object? surfaceTintColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            backgroundColor: freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            selectedItemColor: freezed == selectedItemColor
                ? _value.selectedItemColor
                : selectedItemColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            unselectedItemColor: freezed == unselectedItemColor
                ? _value.unselectedItemColor
                : unselectedItemColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            selectedIconColor: freezed == selectedIconColor
                ? _value.selectedIconColor
                : selectedIconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            unselectedIconColor: freezed == unselectedIconColor
                ? _value.unselectedIconColor
                : unselectedIconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            selectedLabelColor: freezed == selectedLabelColor
                ? _value.selectedLabelColor
                : selectedLabelColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            unselectedLabelColor: freezed == unselectedLabelColor
                ? _value.unselectedLabelColor
                : unselectedLabelColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            indicatorColor: freezed == indicatorColor
                ? _value.indicatorColor
                : indicatorColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            dividerColor: freezed == dividerColor
                ? _value.dividerColor
                : dividerColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
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
abstract class _$$DSNavigationColorsImplCopyWith<$Res>
    implements $DSNavigationColorsCopyWith<$Res> {
  factory _$$DSNavigationColorsImplCopyWith(
    _$DSNavigationColorsImpl value,
    $Res Function(_$DSNavigationColorsImpl) then,
  ) = __$$DSNavigationColorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? backgroundColor,
    Color? selectedItemColor,
    Color? unselectedItemColor,
    Color? selectedIconColor,
    Color? unselectedIconColor,
    Color? selectedLabelColor,
    Color? unselectedLabelColor,
    Color? indicatorColor,
    Color? dividerColor,
    Color? shadowColor,
    Color? surfaceTintColor,
  });
}

/// @nodoc
class __$$DSNavigationColorsImplCopyWithImpl<$Res>
    extends _$DSNavigationColorsCopyWithImpl<$Res, _$DSNavigationColorsImpl>
    implements _$$DSNavigationColorsImplCopyWith<$Res> {
  __$$DSNavigationColorsImplCopyWithImpl(
    _$DSNavigationColorsImpl _value,
    $Res Function(_$DSNavigationColorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSNavigationColors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? selectedItemColor = freezed,
    Object? unselectedItemColor = freezed,
    Object? selectedIconColor = freezed,
    Object? unselectedIconColor = freezed,
    Object? selectedLabelColor = freezed,
    Object? unselectedLabelColor = freezed,
    Object? indicatorColor = freezed,
    Object? dividerColor = freezed,
    Object? shadowColor = freezed,
    Object? surfaceTintColor = freezed,
  }) {
    return _then(
      _$DSNavigationColorsImpl(
        backgroundColor: freezed == backgroundColor
            ? _value.backgroundColor
            : backgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        selectedItemColor: freezed == selectedItemColor
            ? _value.selectedItemColor
            : selectedItemColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        unselectedItemColor: freezed == unselectedItemColor
            ? _value.unselectedItemColor
            : unselectedItemColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        selectedIconColor: freezed == selectedIconColor
            ? _value.selectedIconColor
            : selectedIconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        unselectedIconColor: freezed == unselectedIconColor
            ? _value.unselectedIconColor
            : unselectedIconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        selectedLabelColor: freezed == selectedLabelColor
            ? _value.selectedLabelColor
            : selectedLabelColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        unselectedLabelColor: freezed == unselectedLabelColor
            ? _value.unselectedLabelColor
            : unselectedLabelColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        indicatorColor: freezed == indicatorColor
            ? _value.indicatorColor
            : indicatorColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        dividerColor: freezed == dividerColor
            ? _value.dividerColor
            : dividerColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
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

class _$DSNavigationColorsImpl implements _DSNavigationColors {
  const _$DSNavigationColorsImpl({
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedIconColor,
    this.unselectedIconColor,
    this.selectedLabelColor,
    this.unselectedLabelColor,
    this.indicatorColor,
    this.dividerColor,
    this.shadowColor,
    this.surfaceTintColor,
  });

  @override
  final Color? backgroundColor;
  @override
  final Color? selectedItemColor;
  @override
  final Color? unselectedItemColor;
  @override
  final Color? selectedIconColor;
  @override
  final Color? unselectedIconColor;
  @override
  final Color? selectedLabelColor;
  @override
  final Color? unselectedLabelColor;
  @override
  final Color? indicatorColor;
  @override
  final Color? dividerColor;
  @override
  final Color? shadowColor;
  @override
  final Color? surfaceTintColor;

  @override
  String toString() {
    return 'DSNavigationColors(backgroundColor: $backgroundColor, selectedItemColor: $selectedItemColor, unselectedItemColor: $unselectedItemColor, selectedIconColor: $selectedIconColor, unselectedIconColor: $unselectedIconColor, selectedLabelColor: $selectedLabelColor, unselectedLabelColor: $unselectedLabelColor, indicatorColor: $indicatorColor, dividerColor: $dividerColor, shadowColor: $shadowColor, surfaceTintColor: $surfaceTintColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSNavigationColorsImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.selectedItemColor, selectedItemColor) ||
                other.selectedItemColor == selectedItemColor) &&
            (identical(other.unselectedItemColor, unselectedItemColor) ||
                other.unselectedItemColor == unselectedItemColor) &&
            (identical(other.selectedIconColor, selectedIconColor) ||
                other.selectedIconColor == selectedIconColor) &&
            (identical(other.unselectedIconColor, unselectedIconColor) ||
                other.unselectedIconColor == unselectedIconColor) &&
            (identical(other.selectedLabelColor, selectedLabelColor) ||
                other.selectedLabelColor == selectedLabelColor) &&
            (identical(other.unselectedLabelColor, unselectedLabelColor) ||
                other.unselectedLabelColor == unselectedLabelColor) &&
            (identical(other.indicatorColor, indicatorColor) ||
                other.indicatorColor == indicatorColor) &&
            (identical(other.dividerColor, dividerColor) ||
                other.dividerColor == dividerColor) &&
            (identical(other.shadowColor, shadowColor) ||
                other.shadowColor == shadowColor) &&
            (identical(other.surfaceTintColor, surfaceTintColor) ||
                other.surfaceTintColor == surfaceTintColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    backgroundColor,
    selectedItemColor,
    unselectedItemColor,
    selectedIconColor,
    unselectedIconColor,
    selectedLabelColor,
    unselectedLabelColor,
    indicatorColor,
    dividerColor,
    shadowColor,
    surfaceTintColor,
  );

  /// Create a copy of DSNavigationColors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSNavigationColorsImplCopyWith<_$DSNavigationColorsImpl> get copyWith =>
      __$$DSNavigationColorsImplCopyWithImpl<_$DSNavigationColorsImpl>(
        this,
        _$identity,
      );
}

abstract class _DSNavigationColors implements DSNavigationColors {
  const factory _DSNavigationColors({
    final Color? backgroundColor,
    final Color? selectedItemColor,
    final Color? unselectedItemColor,
    final Color? selectedIconColor,
    final Color? unselectedIconColor,
    final Color? selectedLabelColor,
    final Color? unselectedLabelColor,
    final Color? indicatorColor,
    final Color? dividerColor,
    final Color? shadowColor,
    final Color? surfaceTintColor,
  }) = _$DSNavigationColorsImpl;

  @override
  Color? get backgroundColor;
  @override
  Color? get selectedItemColor;
  @override
  Color? get unselectedItemColor;
  @override
  Color? get selectedIconColor;
  @override
  Color? get unselectedIconColor;
  @override
  Color? get selectedLabelColor;
  @override
  Color? get unselectedLabelColor;
  @override
  Color? get indicatorColor;
  @override
  Color? get dividerColor;
  @override
  Color? get shadowColor;
  @override
  Color? get surfaceTintColor;

  /// Create a copy of DSNavigationColors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSNavigationColorsImplCopyWith<_$DSNavigationColorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSNavigationTypography {
  TextStyle? get selectedLabelStyle => throw _privateConstructorUsedError;
  TextStyle? get unselectedLabelStyle => throw _privateConstructorUsedError;
  double get labelScale => throw _privateConstructorUsedError;
  bool get responsive => throw _privateConstructorUsedError;

  /// Create a copy of DSNavigationTypography
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSNavigationTypographyCopyWith<DSNavigationTypography> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSNavigationTypographyCopyWith<$Res> {
  factory $DSNavigationTypographyCopyWith(
    DSNavigationTypography value,
    $Res Function(DSNavigationTypography) then,
  ) = _$DSNavigationTypographyCopyWithImpl<$Res, DSNavigationTypography>;
  @useResult
  $Res call({
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
    double labelScale,
    bool responsive,
  });
}

/// @nodoc
class _$DSNavigationTypographyCopyWithImpl<
  $Res,
  $Val extends DSNavigationTypography
>
    implements $DSNavigationTypographyCopyWith<$Res> {
  _$DSNavigationTypographyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSNavigationTypography
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLabelStyle = freezed,
    Object? unselectedLabelStyle = freezed,
    Object? labelScale = null,
    Object? responsive = null,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSNavigationTypographyImplCopyWith<$Res>
    implements $DSNavigationTypographyCopyWith<$Res> {
  factory _$$DSNavigationTypographyImplCopyWith(
    _$DSNavigationTypographyImpl value,
    $Res Function(_$DSNavigationTypographyImpl) then,
  ) = __$$DSNavigationTypographyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
    double labelScale,
    bool responsive,
  });
}

/// @nodoc
class __$$DSNavigationTypographyImplCopyWithImpl<$Res>
    extends
        _$DSNavigationTypographyCopyWithImpl<$Res, _$DSNavigationTypographyImpl>
    implements _$$DSNavigationTypographyImplCopyWith<$Res> {
  __$$DSNavigationTypographyImplCopyWithImpl(
    _$DSNavigationTypographyImpl _value,
    $Res Function(_$DSNavigationTypographyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSNavigationTypography
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLabelStyle = freezed,
    Object? unselectedLabelStyle = freezed,
    Object? labelScale = null,
    Object? responsive = null,
  }) {
    return _then(
      _$DSNavigationTypographyImpl(
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
      ),
    );
  }
}

/// @nodoc

class _$DSNavigationTypographyImpl implements _DSNavigationTypography {
  const _$DSNavigationTypographyImpl({
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.labelScale = 1.0,
    this.responsive = true,
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
  String toString() {
    return 'DSNavigationTypography(selectedLabelStyle: $selectedLabelStyle, unselectedLabelStyle: $unselectedLabelStyle, labelScale: $labelScale, responsive: $responsive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSNavigationTypographyImpl &&
            (identical(other.selectedLabelStyle, selectedLabelStyle) ||
                other.selectedLabelStyle == selectedLabelStyle) &&
            (identical(other.unselectedLabelStyle, unselectedLabelStyle) ||
                other.unselectedLabelStyle == unselectedLabelStyle) &&
            (identical(other.labelScale, labelScale) ||
                other.labelScale == labelScale) &&
            (identical(other.responsive, responsive) ||
                other.responsive == responsive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    selectedLabelStyle,
    unselectedLabelStyle,
    labelScale,
    responsive,
  );

  /// Create a copy of DSNavigationTypography
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSNavigationTypographyImplCopyWith<_$DSNavigationTypographyImpl>
  get copyWith =>
      __$$DSNavigationTypographyImplCopyWithImpl<_$DSNavigationTypographyImpl>(
        this,
        _$identity,
      );
}

abstract class _DSNavigationTypography implements DSNavigationTypography {
  const factory _DSNavigationTypography({
    final TextStyle? selectedLabelStyle,
    final TextStyle? unselectedLabelStyle,
    final double labelScale,
    final bool responsive,
  }) = _$DSNavigationTypographyImpl;

  @override
  TextStyle? get selectedLabelStyle;
  @override
  TextStyle? get unselectedLabelStyle;
  @override
  double get labelScale;
  @override
  bool get responsive;

  /// Create a copy of DSNavigationTypography
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSNavigationTypographyImplCopyWith<_$DSNavigationTypographyImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSNavigationSpacing {
  double get iconSize => throw _privateConstructorUsedError;
  double get labelSpacing => throw _privateConstructorUsedError;
  double get itemPadding => throw _privateConstructorUsedError;
  double get itemSpacing => throw _privateConstructorUsedError;
  double get railWidth => throw _privateConstructorUsedError;
  double get drawerWidth => throw _privateConstructorUsedError;
  double get bottomBarHeight => throw _privateConstructorUsedError;
  bool get adaptive => throw _privateConstructorUsedError;

  /// Create a copy of DSNavigationSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSNavigationSpacingCopyWith<DSNavigationSpacing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSNavigationSpacingCopyWith<$Res> {
  factory $DSNavigationSpacingCopyWith(
    DSNavigationSpacing value,
    $Res Function(DSNavigationSpacing) then,
  ) = _$DSNavigationSpacingCopyWithImpl<$Res, DSNavigationSpacing>;
  @useResult
  $Res call({
    double iconSize,
    double labelSpacing,
    double itemPadding,
    double itemSpacing,
    double railWidth,
    double drawerWidth,
    double bottomBarHeight,
    bool adaptive,
  });
}

/// @nodoc
class _$DSNavigationSpacingCopyWithImpl<$Res, $Val extends DSNavigationSpacing>
    implements $DSNavigationSpacingCopyWith<$Res> {
  _$DSNavigationSpacingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSNavigationSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconSize = null,
    Object? labelSpacing = null,
    Object? itemPadding = null,
    Object? itemSpacing = null,
    Object? railWidth = null,
    Object? drawerWidth = null,
    Object? bottomBarHeight = null,
    Object? adaptive = null,
  }) {
    return _then(
      _value.copyWith(
            iconSize: null == iconSize
                ? _value.iconSize
                : iconSize // ignore: cast_nullable_to_non_nullable
                      as double,
            labelSpacing: null == labelSpacing
                ? _value.labelSpacing
                : labelSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            itemPadding: null == itemPadding
                ? _value.itemPadding
                : itemPadding // ignore: cast_nullable_to_non_nullable
                      as double,
            itemSpacing: null == itemSpacing
                ? _value.itemSpacing
                : itemSpacing // ignore: cast_nullable_to_non_nullable
                      as double,
            railWidth: null == railWidth
                ? _value.railWidth
                : railWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            drawerWidth: null == drawerWidth
                ? _value.drawerWidth
                : drawerWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            bottomBarHeight: null == bottomBarHeight
                ? _value.bottomBarHeight
                : bottomBarHeight // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DSNavigationSpacingImplCopyWith<$Res>
    implements $DSNavigationSpacingCopyWith<$Res> {
  factory _$$DSNavigationSpacingImplCopyWith(
    _$DSNavigationSpacingImpl value,
    $Res Function(_$DSNavigationSpacingImpl) then,
  ) = __$$DSNavigationSpacingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double iconSize,
    double labelSpacing,
    double itemPadding,
    double itemSpacing,
    double railWidth,
    double drawerWidth,
    double bottomBarHeight,
    bool adaptive,
  });
}

/// @nodoc
class __$$DSNavigationSpacingImplCopyWithImpl<$Res>
    extends _$DSNavigationSpacingCopyWithImpl<$Res, _$DSNavigationSpacingImpl>
    implements _$$DSNavigationSpacingImplCopyWith<$Res> {
  __$$DSNavigationSpacingImplCopyWithImpl(
    _$DSNavigationSpacingImpl _value,
    $Res Function(_$DSNavigationSpacingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSNavigationSpacing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iconSize = null,
    Object? labelSpacing = null,
    Object? itemPadding = null,
    Object? itemSpacing = null,
    Object? railWidth = null,
    Object? drawerWidth = null,
    Object? bottomBarHeight = null,
    Object? adaptive = null,
  }) {
    return _then(
      _$DSNavigationSpacingImpl(
        iconSize: null == iconSize
            ? _value.iconSize
            : iconSize // ignore: cast_nullable_to_non_nullable
                  as double,
        labelSpacing: null == labelSpacing
            ? _value.labelSpacing
            : labelSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        itemPadding: null == itemPadding
            ? _value.itemPadding
            : itemPadding // ignore: cast_nullable_to_non_nullable
                  as double,
        itemSpacing: null == itemSpacing
            ? _value.itemSpacing
            : itemSpacing // ignore: cast_nullable_to_non_nullable
                  as double,
        railWidth: null == railWidth
            ? _value.railWidth
            : railWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        drawerWidth: null == drawerWidth
            ? _value.drawerWidth
            : drawerWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        bottomBarHeight: null == bottomBarHeight
            ? _value.bottomBarHeight
            : bottomBarHeight // ignore: cast_nullable_to_non_nullable
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

class _$DSNavigationSpacingImpl implements _DSNavigationSpacing {
  const _$DSNavigationSpacingImpl({
    this.iconSize = 8.0,
    this.labelSpacing = 12.0,
    this.itemPadding = 16.0,
    this.itemSpacing = 24.0,
    this.railWidth = 72.0,
    this.drawerWidth = 256.0,
    this.bottomBarHeight = 80.0,
    this.adaptive = true,
  });

  @override
  @JsonKey()
  final double iconSize;
  @override
  @JsonKey()
  final double labelSpacing;
  @override
  @JsonKey()
  final double itemPadding;
  @override
  @JsonKey()
  final double itemSpacing;
  @override
  @JsonKey()
  final double railWidth;
  @override
  @JsonKey()
  final double drawerWidth;
  @override
  @JsonKey()
  final double bottomBarHeight;
  @override
  @JsonKey()
  final bool adaptive;

  @override
  String toString() {
    return 'DSNavigationSpacing(iconSize: $iconSize, labelSpacing: $labelSpacing, itemPadding: $itemPadding, itemSpacing: $itemSpacing, railWidth: $railWidth, drawerWidth: $drawerWidth, bottomBarHeight: $bottomBarHeight, adaptive: $adaptive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSNavigationSpacingImpl &&
            (identical(other.iconSize, iconSize) ||
                other.iconSize == iconSize) &&
            (identical(other.labelSpacing, labelSpacing) ||
                other.labelSpacing == labelSpacing) &&
            (identical(other.itemPadding, itemPadding) ||
                other.itemPadding == itemPadding) &&
            (identical(other.itemSpacing, itemSpacing) ||
                other.itemSpacing == itemSpacing) &&
            (identical(other.railWidth, railWidth) ||
                other.railWidth == railWidth) &&
            (identical(other.drawerWidth, drawerWidth) ||
                other.drawerWidth == drawerWidth) &&
            (identical(other.bottomBarHeight, bottomBarHeight) ||
                other.bottomBarHeight == bottomBarHeight) &&
            (identical(other.adaptive, adaptive) ||
                other.adaptive == adaptive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    iconSize,
    labelSpacing,
    itemPadding,
    itemSpacing,
    railWidth,
    drawerWidth,
    bottomBarHeight,
    adaptive,
  );

  /// Create a copy of DSNavigationSpacing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSNavigationSpacingImplCopyWith<_$DSNavigationSpacingImpl> get copyWith =>
      __$$DSNavigationSpacingImplCopyWithImpl<_$DSNavigationSpacingImpl>(
        this,
        _$identity,
      );
}

abstract class _DSNavigationSpacing implements DSNavigationSpacing {
  const factory _DSNavigationSpacing({
    final double iconSize,
    final double labelSpacing,
    final double itemPadding,
    final double itemSpacing,
    final double railWidth,
    final double drawerWidth,
    final double bottomBarHeight,
    final bool adaptive,
  }) = _$DSNavigationSpacingImpl;

  @override
  double get iconSize;
  @override
  double get labelSpacing;
  @override
  double get itemPadding;
  @override
  double get itemSpacing;
  @override
  double get railWidth;
  @override
  double get drawerWidth;
  @override
  double get bottomBarHeight;
  @override
  bool get adaptive;

  /// Create a copy of DSNavigationSpacing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSNavigationSpacingImplCopyWith<_$DSNavigationSpacingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSNavigationElevation {
  double get defaultElevation => throw _privateConstructorUsedError;
  double get railElevation => throw _privateConstructorUsedError;
  double get drawerElevation => throw _privateConstructorUsedError;
  Color? get shadowColor => throw _privateConstructorUsedError;
  Color? get surfaceTintColor => throw _privateConstructorUsedError;

  /// Create a copy of DSNavigationElevation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSNavigationElevationCopyWith<DSNavigationElevation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSNavigationElevationCopyWith<$Res> {
  factory $DSNavigationElevationCopyWith(
    DSNavigationElevation value,
    $Res Function(DSNavigationElevation) then,
  ) = _$DSNavigationElevationCopyWithImpl<$Res, DSNavigationElevation>;
  @useResult
  $Res call({
    double defaultElevation,
    double railElevation,
    double drawerElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  });
}

/// @nodoc
class _$DSNavigationElevationCopyWithImpl<
  $Res,
  $Val extends DSNavigationElevation
>
    implements $DSNavigationElevationCopyWith<$Res> {
  _$DSNavigationElevationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSNavigationElevation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultElevation = null,
    Object? railElevation = null,
    Object? drawerElevation = null,
    Object? shadowColor = freezed,
    Object? surfaceTintColor = freezed,
  }) {
    return _then(
      _value.copyWith(
            defaultElevation: null == defaultElevation
                ? _value.defaultElevation
                : defaultElevation // ignore: cast_nullable_to_non_nullable
                      as double,
            railElevation: null == railElevation
                ? _value.railElevation
                : railElevation // ignore: cast_nullable_to_non_nullable
                      as double,
            drawerElevation: null == drawerElevation
                ? _value.drawerElevation
                : drawerElevation // ignore: cast_nullable_to_non_nullable
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
abstract class _$$DSNavigationElevationImplCopyWith<$Res>
    implements $DSNavigationElevationCopyWith<$Res> {
  factory _$$DSNavigationElevationImplCopyWith(
    _$DSNavigationElevationImpl value,
    $Res Function(_$DSNavigationElevationImpl) then,
  ) = __$$DSNavigationElevationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double defaultElevation,
    double railElevation,
    double drawerElevation,
    Color? shadowColor,
    Color? surfaceTintColor,
  });
}

/// @nodoc
class __$$DSNavigationElevationImplCopyWithImpl<$Res>
    extends
        _$DSNavigationElevationCopyWithImpl<$Res, _$DSNavigationElevationImpl>
    implements _$$DSNavigationElevationImplCopyWith<$Res> {
  __$$DSNavigationElevationImplCopyWithImpl(
    _$DSNavigationElevationImpl _value,
    $Res Function(_$DSNavigationElevationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSNavigationElevation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultElevation = null,
    Object? railElevation = null,
    Object? drawerElevation = null,
    Object? shadowColor = freezed,
    Object? surfaceTintColor = freezed,
  }) {
    return _then(
      _$DSNavigationElevationImpl(
        defaultElevation: null == defaultElevation
            ? _value.defaultElevation
            : defaultElevation // ignore: cast_nullable_to_non_nullable
                  as double,
        railElevation: null == railElevation
            ? _value.railElevation
            : railElevation // ignore: cast_nullable_to_non_nullable
                  as double,
        drawerElevation: null == drawerElevation
            ? _value.drawerElevation
            : drawerElevation // ignore: cast_nullable_to_non_nullable
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

class _$DSNavigationElevationImpl implements _DSNavigationElevation {
  const _$DSNavigationElevationImpl({
    this.defaultElevation = 8.0,
    this.railElevation = 0.0,
    this.drawerElevation = 16.0,
    this.shadowColor,
    this.surfaceTintColor,
  });

  @override
  @JsonKey()
  final double defaultElevation;
  @override
  @JsonKey()
  final double railElevation;
  @override
  @JsonKey()
  final double drawerElevation;
  @override
  final Color? shadowColor;
  @override
  final Color? surfaceTintColor;

  @override
  String toString() {
    return 'DSNavigationElevation(defaultElevation: $defaultElevation, railElevation: $railElevation, drawerElevation: $drawerElevation, shadowColor: $shadowColor, surfaceTintColor: $surfaceTintColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSNavigationElevationImpl &&
            (identical(other.defaultElevation, defaultElevation) ||
                other.defaultElevation == defaultElevation) &&
            (identical(other.railElevation, railElevation) ||
                other.railElevation == railElevation) &&
            (identical(other.drawerElevation, drawerElevation) ||
                other.drawerElevation == drawerElevation) &&
            (identical(other.shadowColor, shadowColor) ||
                other.shadowColor == shadowColor) &&
            (identical(other.surfaceTintColor, surfaceTintColor) ||
                other.surfaceTintColor == surfaceTintColor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    defaultElevation,
    railElevation,
    drawerElevation,
    shadowColor,
    surfaceTintColor,
  );

  /// Create a copy of DSNavigationElevation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSNavigationElevationImplCopyWith<_$DSNavigationElevationImpl>
  get copyWith =>
      __$$DSNavigationElevationImplCopyWithImpl<_$DSNavigationElevationImpl>(
        this,
        _$identity,
      );
}

abstract class _DSNavigationElevation implements DSNavigationElevation {
  const factory _DSNavigationElevation({
    final double defaultElevation,
    final double railElevation,
    final double drawerElevation,
    final Color? shadowColor,
    final Color? surfaceTintColor,
  }) = _$DSNavigationElevationImpl;

  @override
  double get defaultElevation;
  @override
  double get railElevation;
  @override
  double get drawerElevation;
  @override
  Color? get shadowColor;
  @override
  Color? get surfaceTintColor;

  /// Create a copy of DSNavigationElevation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSNavigationElevationImplCopyWith<_$DSNavigationElevationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSNavigationBehavior {
  DSNavigationLabelBehavior get labelBehavior =>
      throw _privateConstructorUsedError;
  bool get showTooltips => throw _privateConstructorUsedError;
  bool get enableHapticFeedback => throw _privateConstructorUsedError;
  bool get allowTabSwitching => throw _privateConstructorUsedError;
  bool get persistentDrawer => throw _privateConstructorUsedError;
  bool get enableSwipeGestures => throw _privateConstructorUsedError;
  DSNavigationAnimationType get animationType =>
      throw _privateConstructorUsedError;
  int get animationDuration => throw _privateConstructorUsedError;

  /// Create a copy of DSNavigationBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSNavigationBehaviorCopyWith<DSNavigationBehavior> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSNavigationBehaviorCopyWith<$Res> {
  factory $DSNavigationBehaviorCopyWith(
    DSNavigationBehavior value,
    $Res Function(DSNavigationBehavior) then,
  ) = _$DSNavigationBehaviorCopyWithImpl<$Res, DSNavigationBehavior>;
  @useResult
  $Res call({
    DSNavigationLabelBehavior labelBehavior,
    bool showTooltips,
    bool enableHapticFeedback,
    bool allowTabSwitching,
    bool persistentDrawer,
    bool enableSwipeGestures,
    DSNavigationAnimationType animationType,
    int animationDuration,
  });
}

/// @nodoc
class _$DSNavigationBehaviorCopyWithImpl<
  $Res,
  $Val extends DSNavigationBehavior
>
    implements $DSNavigationBehaviorCopyWith<$Res> {
  _$DSNavigationBehaviorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSNavigationBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? labelBehavior = null,
    Object? showTooltips = null,
    Object? enableHapticFeedback = null,
    Object? allowTabSwitching = null,
    Object? persistentDrawer = null,
    Object? enableSwipeGestures = null,
    Object? animationType = null,
    Object? animationDuration = null,
  }) {
    return _then(
      _value.copyWith(
            labelBehavior: null == labelBehavior
                ? _value.labelBehavior
                : labelBehavior // ignore: cast_nullable_to_non_nullable
                      as DSNavigationLabelBehavior,
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
            persistentDrawer: null == persistentDrawer
                ? _value.persistentDrawer
                : persistentDrawer // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableSwipeGestures: null == enableSwipeGestures
                ? _value.enableSwipeGestures
                : enableSwipeGestures // ignore: cast_nullable_to_non_nullable
                      as bool,
            animationType: null == animationType
                ? _value.animationType
                : animationType // ignore: cast_nullable_to_non_nullable
                      as DSNavigationAnimationType,
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
abstract class _$$DSNavigationBehaviorImplCopyWith<$Res>
    implements $DSNavigationBehaviorCopyWith<$Res> {
  factory _$$DSNavigationBehaviorImplCopyWith(
    _$DSNavigationBehaviorImpl value,
    $Res Function(_$DSNavigationBehaviorImpl) then,
  ) = __$$DSNavigationBehaviorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSNavigationLabelBehavior labelBehavior,
    bool showTooltips,
    bool enableHapticFeedback,
    bool allowTabSwitching,
    bool persistentDrawer,
    bool enableSwipeGestures,
    DSNavigationAnimationType animationType,
    int animationDuration,
  });
}

/// @nodoc
class __$$DSNavigationBehaviorImplCopyWithImpl<$Res>
    extends _$DSNavigationBehaviorCopyWithImpl<$Res, _$DSNavigationBehaviorImpl>
    implements _$$DSNavigationBehaviorImplCopyWith<$Res> {
  __$$DSNavigationBehaviorImplCopyWithImpl(
    _$DSNavigationBehaviorImpl _value,
    $Res Function(_$DSNavigationBehaviorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSNavigationBehavior
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? labelBehavior = null,
    Object? showTooltips = null,
    Object? enableHapticFeedback = null,
    Object? allowTabSwitching = null,
    Object? persistentDrawer = null,
    Object? enableSwipeGestures = null,
    Object? animationType = null,
    Object? animationDuration = null,
  }) {
    return _then(
      _$DSNavigationBehaviorImpl(
        labelBehavior: null == labelBehavior
            ? _value.labelBehavior
            : labelBehavior // ignore: cast_nullable_to_non_nullable
                  as DSNavigationLabelBehavior,
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
        persistentDrawer: null == persistentDrawer
            ? _value.persistentDrawer
            : persistentDrawer // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableSwipeGestures: null == enableSwipeGestures
            ? _value.enableSwipeGestures
            : enableSwipeGestures // ignore: cast_nullable_to_non_nullable
                  as bool,
        animationType: null == animationType
            ? _value.animationType
            : animationType // ignore: cast_nullable_to_non_nullable
                  as DSNavigationAnimationType,
        animationDuration: null == animationDuration
            ? _value.animationDuration
            : animationDuration // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$DSNavigationBehaviorImpl implements _DSNavigationBehavior {
  const _$DSNavigationBehaviorImpl({
    this.labelBehavior = DSNavigationLabelBehavior.alwaysShow,
    this.showTooltips = false,
    this.enableHapticFeedback = true,
    this.allowTabSwitching = true,
    this.persistentDrawer = false,
    this.enableSwipeGestures = true,
    this.animationType = DSNavigationAnimationType.slide,
    this.animationDuration = 300,
  });

  @override
  @JsonKey()
  final DSNavigationLabelBehavior labelBehavior;
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
  final bool persistentDrawer;
  @override
  @JsonKey()
  final bool enableSwipeGestures;
  @override
  @JsonKey()
  final DSNavigationAnimationType animationType;
  @override
  @JsonKey()
  final int animationDuration;

  @override
  String toString() {
    return 'DSNavigationBehavior(labelBehavior: $labelBehavior, showTooltips: $showTooltips, enableHapticFeedback: $enableHapticFeedback, allowTabSwitching: $allowTabSwitching, persistentDrawer: $persistentDrawer, enableSwipeGestures: $enableSwipeGestures, animationType: $animationType, animationDuration: $animationDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSNavigationBehaviorImpl &&
            (identical(other.labelBehavior, labelBehavior) ||
                other.labelBehavior == labelBehavior) &&
            (identical(other.showTooltips, showTooltips) ||
                other.showTooltips == showTooltips) &&
            (identical(other.enableHapticFeedback, enableHapticFeedback) ||
                other.enableHapticFeedback == enableHapticFeedback) &&
            (identical(other.allowTabSwitching, allowTabSwitching) ||
                other.allowTabSwitching == allowTabSwitching) &&
            (identical(other.persistentDrawer, persistentDrawer) ||
                other.persistentDrawer == persistentDrawer) &&
            (identical(other.enableSwipeGestures, enableSwipeGestures) ||
                other.enableSwipeGestures == enableSwipeGestures) &&
            (identical(other.animationType, animationType) ||
                other.animationType == animationType) &&
            (identical(other.animationDuration, animationDuration) ||
                other.animationDuration == animationDuration));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    labelBehavior,
    showTooltips,
    enableHapticFeedback,
    allowTabSwitching,
    persistentDrawer,
    enableSwipeGestures,
    animationType,
    animationDuration,
  );

  /// Create a copy of DSNavigationBehavior
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSNavigationBehaviorImplCopyWith<_$DSNavigationBehaviorImpl>
  get copyWith =>
      __$$DSNavigationBehaviorImplCopyWithImpl<_$DSNavigationBehaviorImpl>(
        this,
        _$identity,
      );
}

abstract class _DSNavigationBehavior implements DSNavigationBehavior {
  const factory _DSNavigationBehavior({
    final DSNavigationLabelBehavior labelBehavior,
    final bool showTooltips,
    final bool enableHapticFeedback,
    final bool allowTabSwitching,
    final bool persistentDrawer,
    final bool enableSwipeGestures,
    final DSNavigationAnimationType animationType,
    final int animationDuration,
  }) = _$DSNavigationBehaviorImpl;

  @override
  DSNavigationLabelBehavior get labelBehavior;
  @override
  bool get showTooltips;
  @override
  bool get enableHapticFeedback;
  @override
  bool get allowTabSwitching;
  @override
  bool get persistentDrawer;
  @override
  bool get enableSwipeGestures;
  @override
  DSNavigationAnimationType get animationType;
  @override
  int get animationDuration;

  /// Create a copy of DSNavigationBehavior
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSNavigationBehaviorImplCopyWith<_$DSNavigationBehaviorImpl>
  get copyWith => throw _privateConstructorUsedError;
}
