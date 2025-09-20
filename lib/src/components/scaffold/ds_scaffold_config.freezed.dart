// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ds_scaffold_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSScaffoldConfig {
  DSScaffoldVariant get variant => throw _privateConstructorUsedError;
  DSScaffoldState get state => throw _privateConstructorUsedError;
  bool get isResponsive => throw _privateConstructorUsedError;
  bool get hasGutters => throw _privateConstructorUsedError;
  bool get isRtl => throw _privateConstructorUsedError;
  bool get enableKeyboardPadding => throw _privateConstructorUsedError;
  bool get enableA11y => throw _privateConstructorUsedError;
  DSNavigationConfig? get navigation => throw _privateConstructorUsedError;
  DSBarConfig? get appBar => throw _privateConstructorUsedError;
  BodyConfig? get body => throw _privateConstructorUsedError;
  BottomBarConfig? get bottomBar => throw _privateConstructorUsedError;
  SidePanelConfig? get sidePanel => throw _privateConstructorUsedError;
  FloatingActionConfig? get floatingAction =>
      throw _privateConstructorUsedError;

  /// Create a copy of DSScaffoldConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSScaffoldConfigCopyWith<DSScaffoldConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSScaffoldConfigCopyWith<$Res> {
  factory $DSScaffoldConfigCopyWith(
    DSScaffoldConfig value,
    $Res Function(DSScaffoldConfig) then,
  ) = _$DSScaffoldConfigCopyWithImpl<$Res, DSScaffoldConfig>;
  @useResult
  $Res call({
    DSScaffoldVariant variant,
    DSScaffoldState state,
    bool isResponsive,
    bool hasGutters,
    bool isRtl,
    bool enableKeyboardPadding,
    bool enableA11y,
    DSNavigationConfig? navigation,
    DSBarConfig? appBar,
    BodyConfig? body,
    BottomBarConfig? bottomBar,
    SidePanelConfig? sidePanel,
    FloatingActionConfig? floatingAction,
  });

  $DSNavigationConfigCopyWith<$Res>? get navigation;
  $DSBarConfigCopyWith<$Res>? get appBar;
  $BodyConfigCopyWith<$Res>? get body;
  $BottomBarConfigCopyWith<$Res>? get bottomBar;
  $SidePanelConfigCopyWith<$Res>? get sidePanel;
  $FloatingActionConfigCopyWith<$Res>? get floatingAction;
}

/// @nodoc
class _$DSScaffoldConfigCopyWithImpl<$Res, $Val extends DSScaffoldConfig>
    implements $DSScaffoldConfigCopyWith<$Res> {
  _$DSScaffoldConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSScaffoldConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? isResponsive = null,
    Object? hasGutters = null,
    Object? isRtl = null,
    Object? enableKeyboardPadding = null,
    Object? enableA11y = null,
    Object? navigation = freezed,
    Object? appBar = freezed,
    Object? body = freezed,
    Object? bottomBar = freezed,
    Object? sidePanel = freezed,
    Object? floatingAction = freezed,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSScaffoldVariant,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSScaffoldState,
            isResponsive: null == isResponsive
                ? _value.isResponsive
                : isResponsive // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasGutters: null == hasGutters
                ? _value.hasGutters
                : hasGutters // ignore: cast_nullable_to_non_nullable
                      as bool,
            isRtl: null == isRtl
                ? _value.isRtl
                : isRtl // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableKeyboardPadding: null == enableKeyboardPadding
                ? _value.enableKeyboardPadding
                : enableKeyboardPadding // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableA11y: null == enableA11y
                ? _value.enableA11y
                : enableA11y // ignore: cast_nullable_to_non_nullable
                      as bool,
            navigation: freezed == navigation
                ? _value.navigation
                : navigation // ignore: cast_nullable_to_non_nullable
                      as DSNavigationConfig?,
            appBar: freezed == appBar
                ? _value.appBar
                : appBar // ignore: cast_nullable_to_non_nullable
                      as DSBarConfig?,
            body: freezed == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as BodyConfig?,
            bottomBar: freezed == bottomBar
                ? _value.bottomBar
                : bottomBar // ignore: cast_nullable_to_non_nullable
                      as BottomBarConfig?,
            sidePanel: freezed == sidePanel
                ? _value.sidePanel
                : sidePanel // ignore: cast_nullable_to_non_nullable
                      as SidePanelConfig?,
            floatingAction: freezed == floatingAction
                ? _value.floatingAction
                : floatingAction // ignore: cast_nullable_to_non_nullable
                      as FloatingActionConfig?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSScaffoldConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSNavigationConfigCopyWith<$Res>? get navigation {
    if (_value.navigation == null) {
      return null;
    }

    return $DSNavigationConfigCopyWith<$Res>(_value.navigation!, (value) {
      return _then(_value.copyWith(navigation: value) as $Val);
    });
  }

  /// Create a copy of DSScaffoldConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSBarConfigCopyWith<$Res>? get appBar {
    if (_value.appBar == null) {
      return null;
    }

    return $DSBarConfigCopyWith<$Res>(_value.appBar!, (value) {
      return _then(_value.copyWith(appBar: value) as $Val);
    });
  }

  /// Create a copy of DSScaffoldConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BodyConfigCopyWith<$Res>? get body {
    if (_value.body == null) {
      return null;
    }

    return $BodyConfigCopyWith<$Res>(_value.body!, (value) {
      return _then(_value.copyWith(body: value) as $Val);
    });
  }

  /// Create a copy of DSScaffoldConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BottomBarConfigCopyWith<$Res>? get bottomBar {
    if (_value.bottomBar == null) {
      return null;
    }

    return $BottomBarConfigCopyWith<$Res>(_value.bottomBar!, (value) {
      return _then(_value.copyWith(bottomBar: value) as $Val);
    });
  }

  /// Create a copy of DSScaffoldConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SidePanelConfigCopyWith<$Res>? get sidePanel {
    if (_value.sidePanel == null) {
      return null;
    }

    return $SidePanelConfigCopyWith<$Res>(_value.sidePanel!, (value) {
      return _then(_value.copyWith(sidePanel: value) as $Val);
    });
  }

  /// Create a copy of DSScaffoldConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FloatingActionConfigCopyWith<$Res>? get floatingAction {
    if (_value.floatingAction == null) {
      return null;
    }

    return $FloatingActionConfigCopyWith<$Res>(_value.floatingAction!, (value) {
      return _then(_value.copyWith(floatingAction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSScaffoldConfigImplCopyWith<$Res>
    implements $DSScaffoldConfigCopyWith<$Res> {
  factory _$$DSScaffoldConfigImplCopyWith(
    _$DSScaffoldConfigImpl value,
    $Res Function(_$DSScaffoldConfigImpl) then,
  ) = __$$DSScaffoldConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSScaffoldVariant variant,
    DSScaffoldState state,
    bool isResponsive,
    bool hasGutters,
    bool isRtl,
    bool enableKeyboardPadding,
    bool enableA11y,
    DSNavigationConfig? navigation,
    DSBarConfig? appBar,
    BodyConfig? body,
    BottomBarConfig? bottomBar,
    SidePanelConfig? sidePanel,
    FloatingActionConfig? floatingAction,
  });

  @override
  $DSNavigationConfigCopyWith<$Res>? get navigation;
  @override
  $DSBarConfigCopyWith<$Res>? get appBar;
  @override
  $BodyConfigCopyWith<$Res>? get body;
  @override
  $BottomBarConfigCopyWith<$Res>? get bottomBar;
  @override
  $SidePanelConfigCopyWith<$Res>? get sidePanel;
  @override
  $FloatingActionConfigCopyWith<$Res>? get floatingAction;
}

/// @nodoc
class __$$DSScaffoldConfigImplCopyWithImpl<$Res>
    extends _$DSScaffoldConfigCopyWithImpl<$Res, _$DSScaffoldConfigImpl>
    implements _$$DSScaffoldConfigImplCopyWith<$Res> {
  __$$DSScaffoldConfigImplCopyWithImpl(
    _$DSScaffoldConfigImpl _value,
    $Res Function(_$DSScaffoldConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSScaffoldConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? state = null,
    Object? isResponsive = null,
    Object? hasGutters = null,
    Object? isRtl = null,
    Object? enableKeyboardPadding = null,
    Object? enableA11y = null,
    Object? navigation = freezed,
    Object? appBar = freezed,
    Object? body = freezed,
    Object? bottomBar = freezed,
    Object? sidePanel = freezed,
    Object? floatingAction = freezed,
  }) {
    return _then(
      _$DSScaffoldConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSScaffoldVariant,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSScaffoldState,
        isResponsive: null == isResponsive
            ? _value.isResponsive
            : isResponsive // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasGutters: null == hasGutters
            ? _value.hasGutters
            : hasGutters // ignore: cast_nullable_to_non_nullable
                  as bool,
        isRtl: null == isRtl
            ? _value.isRtl
            : isRtl // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableKeyboardPadding: null == enableKeyboardPadding
            ? _value.enableKeyboardPadding
            : enableKeyboardPadding // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableA11y: null == enableA11y
            ? _value.enableA11y
            : enableA11y // ignore: cast_nullable_to_non_nullable
                  as bool,
        navigation: freezed == navigation
            ? _value.navigation
            : navigation // ignore: cast_nullable_to_non_nullable
                  as DSNavigationConfig?,
        appBar: freezed == appBar
            ? _value.appBar
            : appBar // ignore: cast_nullable_to_non_nullable
                  as DSBarConfig?,
        body: freezed == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as BodyConfig?,
        bottomBar: freezed == bottomBar
            ? _value.bottomBar
            : bottomBar // ignore: cast_nullable_to_non_nullable
                  as BottomBarConfig?,
        sidePanel: freezed == sidePanel
            ? _value.sidePanel
            : sidePanel // ignore: cast_nullable_to_non_nullable
                  as SidePanelConfig?,
        floatingAction: freezed == floatingAction
            ? _value.floatingAction
            : floatingAction // ignore: cast_nullable_to_non_nullable
                  as FloatingActionConfig?,
      ),
    );
  }
}

/// @nodoc

class _$DSScaffoldConfigImpl implements _DSScaffoldConfig {
  const _$DSScaffoldConfigImpl({
    this.variant = DSScaffoldVariant.appShell,
    this.state = DSScaffoldState.defaultState,
    this.isResponsive = true,
    this.hasGutters = false,
    this.isRtl = false,
    this.enableKeyboardPadding = true,
    this.enableA11y = true,
    this.navigation,
    this.appBar,
    this.body,
    this.bottomBar,
    this.sidePanel,
    this.floatingAction,
  });

  @override
  @JsonKey()
  final DSScaffoldVariant variant;
  @override
  @JsonKey()
  final DSScaffoldState state;
  @override
  @JsonKey()
  final bool isResponsive;
  @override
  @JsonKey()
  final bool hasGutters;
  @override
  @JsonKey()
  final bool isRtl;
  @override
  @JsonKey()
  final bool enableKeyboardPadding;
  @override
  @JsonKey()
  final bool enableA11y;
  @override
  final DSNavigationConfig? navigation;
  @override
  final DSBarConfig? appBar;
  @override
  final BodyConfig? body;
  @override
  final BottomBarConfig? bottomBar;
  @override
  final SidePanelConfig? sidePanel;
  @override
  final FloatingActionConfig? floatingAction;

  @override
  String toString() {
    return 'DSScaffoldConfig(variant: $variant, state: $state, isResponsive: $isResponsive, hasGutters: $hasGutters, isRtl: $isRtl, enableKeyboardPadding: $enableKeyboardPadding, enableA11y: $enableA11y, navigation: $navigation, appBar: $appBar, body: $body, bottomBar: $bottomBar, sidePanel: $sidePanel, floatingAction: $floatingAction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSScaffoldConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.isResponsive, isResponsive) ||
                other.isResponsive == isResponsive) &&
            (identical(other.hasGutters, hasGutters) ||
                other.hasGutters == hasGutters) &&
            (identical(other.isRtl, isRtl) || other.isRtl == isRtl) &&
            (identical(other.enableKeyboardPadding, enableKeyboardPadding) ||
                other.enableKeyboardPadding == enableKeyboardPadding) &&
            (identical(other.enableA11y, enableA11y) ||
                other.enableA11y == enableA11y) &&
            (identical(other.navigation, navigation) ||
                other.navigation == navigation) &&
            (identical(other.appBar, appBar) || other.appBar == appBar) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.bottomBar, bottomBar) ||
                other.bottomBar == bottomBar) &&
            (identical(other.sidePanel, sidePanel) ||
                other.sidePanel == sidePanel) &&
            (identical(other.floatingAction, floatingAction) ||
                other.floatingAction == floatingAction));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    variant,
    state,
    isResponsive,
    hasGutters,
    isRtl,
    enableKeyboardPadding,
    enableA11y,
    navigation,
    appBar,
    body,
    bottomBar,
    sidePanel,
    floatingAction,
  );

  /// Create a copy of DSScaffoldConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSScaffoldConfigImplCopyWith<_$DSScaffoldConfigImpl> get copyWith =>
      __$$DSScaffoldConfigImplCopyWithImpl<_$DSScaffoldConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSScaffoldConfig implements DSScaffoldConfig {
  const factory _DSScaffoldConfig({
    final DSScaffoldVariant variant,
    final DSScaffoldState state,
    final bool isResponsive,
    final bool hasGutters,
    final bool isRtl,
    final bool enableKeyboardPadding,
    final bool enableA11y,
    final DSNavigationConfig? navigation,
    final DSBarConfig? appBar,
    final BodyConfig? body,
    final BottomBarConfig? bottomBar,
    final SidePanelConfig? sidePanel,
    final FloatingActionConfig? floatingAction,
  }) = _$DSScaffoldConfigImpl;

  @override
  DSScaffoldVariant get variant;
  @override
  DSScaffoldState get state;
  @override
  bool get isResponsive;
  @override
  bool get hasGutters;
  @override
  bool get isRtl;
  @override
  bool get enableKeyboardPadding;
  @override
  bool get enableA11y;
  @override
  DSNavigationConfig? get navigation;
  @override
  DSBarConfig? get appBar;
  @override
  BodyConfig? get body;
  @override
  BottomBarConfig? get bottomBar;
  @override
  SidePanelConfig? get sidePanel;
  @override
  FloatingActionConfig? get floatingAction;

  /// Create a copy of DSScaffoldConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSScaffoldConfigImplCopyWith<_$DSScaffoldConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSNavigationConfig {
  NavigationType get type => throw _privateConstructorUsedError;
  bool get persistent => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  Widget? get header => throw _privateConstructorUsedError;
  List<NavigationItem> get items => throw _privateConstructorUsedError;

  /// Create a copy of DSNavigationConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSNavigationConfigCopyWith<DSNavigationConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSNavigationConfigCopyWith<$Res> {
  factory $DSNavigationConfigCopyWith(
    DSNavigationConfig value,
    $Res Function(DSNavigationConfig) then,
  ) = _$DSNavigationConfigCopyWithImpl<$Res, DSNavigationConfig>;
  @useResult
  $Res call({
    NavigationType type,
    bool persistent,
    double width,
    Widget? header,
    List<NavigationItem> items,
  });
}

/// @nodoc
class _$DSNavigationConfigCopyWithImpl<$Res, $Val extends DSNavigationConfig>
    implements $DSNavigationConfigCopyWith<$Res> {
  _$DSNavigationConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSNavigationConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? persistent = null,
    Object? width = null,
    Object? header = freezed,
    Object? items = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as NavigationType,
            persistent: null == persistent
                ? _value.persistent
                : persistent // ignore: cast_nullable_to_non_nullable
                      as bool,
            width: null == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as double,
            header: freezed == header
                ? _value.header
                : header // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<NavigationItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSNavigationConfigImplCopyWith<$Res>
    implements $DSNavigationConfigCopyWith<$Res> {
  factory _$$DSNavigationConfigImplCopyWith(
    _$DSNavigationConfigImpl value,
    $Res Function(_$DSNavigationConfigImpl) then,
  ) = __$$DSNavigationConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    NavigationType type,
    bool persistent,
    double width,
    Widget? header,
    List<NavigationItem> items,
  });
}

/// @nodoc
class __$$DSNavigationConfigImplCopyWithImpl<$Res>
    extends _$DSNavigationConfigCopyWithImpl<$Res, _$DSNavigationConfigImpl>
    implements _$$DSNavigationConfigImplCopyWith<$Res> {
  __$$DSNavigationConfigImplCopyWithImpl(
    _$DSNavigationConfigImpl _value,
    $Res Function(_$DSNavigationConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSNavigationConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? persistent = null,
    Object? width = null,
    Object? header = freezed,
    Object? items = null,
  }) {
    return _then(
      _$DSNavigationConfigImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as NavigationType,
        persistent: null == persistent
            ? _value.persistent
            : persistent // ignore: cast_nullable_to_non_nullable
                  as bool,
        width: null == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as double,
        header: freezed == header
            ? _value.header
            : header // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<NavigationItem>,
      ),
    );
  }
}

/// @nodoc

class _$DSNavigationConfigImpl implements _DSNavigationConfig {
  const _$DSNavigationConfigImpl({
    this.type = NavigationType.drawer,
    this.persistent = true,
    this.width = 320.0,
    this.header,
    required final List<NavigationItem> items,
  }) : _items = items;

  @override
  @JsonKey()
  final NavigationType type;
  @override
  @JsonKey()
  final bool persistent;
  @override
  @JsonKey()
  final double width;
  @override
  final Widget? header;
  final List<NavigationItem> _items;
  @override
  List<NavigationItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'DSNavigationConfig(type: $type, persistent: $persistent, width: $width, header: $header, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSNavigationConfigImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.persistent, persistent) ||
                other.persistent == persistent) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.header, header) || other.header == header) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    persistent,
    width,
    header,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of DSNavigationConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSNavigationConfigImplCopyWith<_$DSNavigationConfigImpl> get copyWith =>
      __$$DSNavigationConfigImplCopyWithImpl<_$DSNavigationConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSNavigationConfig implements DSNavigationConfig {
  const factory _DSNavigationConfig({
    final NavigationType type,
    final bool persistent,
    final double width,
    final Widget? header,
    required final List<NavigationItem> items,
  }) = _$DSNavigationConfigImpl;

  @override
  NavigationType get type;
  @override
  bool get persistent;
  @override
  double get width;
  @override
  Widget? get header;
  @override
  List<NavigationItem> get items;

  /// Create a copy of DSNavigationConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSNavigationConfigImplCopyWith<_$DSNavigationConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSBarConfig {
  bool get pinned => throw _privateConstructorUsedError;
  bool get floating => throw _privateConstructorUsedError;
  bool get snap => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  Widget? get title => throw _privateConstructorUsedError;
  List<Widget>? get actions => throw _privateConstructorUsedError;
  Widget? get leading => throw _privateConstructorUsedError;
  PreferredSizeWidget? get bottom => throw _privateConstructorUsedError;

  /// Create a copy of DSBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSBarConfigCopyWith<DSBarConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSBarConfigCopyWith<$Res> {
  factory $DSBarConfigCopyWith(
    DSBarConfig value,
    $Res Function(DSBarConfig) then,
  ) = _$DSBarConfigCopyWithImpl<$Res, DSBarConfig>;
  @useResult
  $Res call({
    bool pinned,
    bool floating,
    bool snap,
    double height,
    Widget? title,
    List<Widget>? actions,
    Widget? leading,
    PreferredSizeWidget? bottom,
  });
}

/// @nodoc
class _$DSBarConfigCopyWithImpl<$Res, $Val extends DSBarConfig>
    implements $DSBarConfigCopyWith<$Res> {
  _$DSBarConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinned = null,
    Object? floating = null,
    Object? snap = null,
    Object? height = null,
    Object? title = freezed,
    Object? actions = freezed,
    Object? leading = freezed,
    Object? bottom = freezed,
  }) {
    return _then(
      _value.copyWith(
            pinned: null == pinned
                ? _value.pinned
                : pinned // ignore: cast_nullable_to_non_nullable
                      as bool,
            floating: null == floating
                ? _value.floating
                : floating // ignore: cast_nullable_to_non_nullable
                      as bool,
            snap: null == snap
                ? _value.snap
                : snap // ignore: cast_nullable_to_non_nullable
                      as bool,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            actions: freezed == actions
                ? _value.actions
                : actions // ignore: cast_nullable_to_non_nullable
                      as List<Widget>?,
            leading: freezed == leading
                ? _value.leading
                : leading // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            bottom: freezed == bottom
                ? _value.bottom
                : bottom // ignore: cast_nullable_to_non_nullable
                      as PreferredSizeWidget?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSBarConfigImplCopyWith<$Res>
    implements $DSBarConfigCopyWith<$Res> {
  factory _$$DSBarConfigImplCopyWith(
    _$DSBarConfigImpl value,
    $Res Function(_$DSBarConfigImpl) then,
  ) = __$$DSBarConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool pinned,
    bool floating,
    bool snap,
    double height,
    Widget? title,
    List<Widget>? actions,
    Widget? leading,
    PreferredSizeWidget? bottom,
  });
}

/// @nodoc
class __$$DSBarConfigImplCopyWithImpl<$Res>
    extends _$DSBarConfigCopyWithImpl<$Res, _$DSBarConfigImpl>
    implements _$$DSBarConfigImplCopyWith<$Res> {
  __$$DSBarConfigImplCopyWithImpl(
    _$DSBarConfigImpl _value,
    $Res Function(_$DSBarConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pinned = null,
    Object? floating = null,
    Object? snap = null,
    Object? height = null,
    Object? title = freezed,
    Object? actions = freezed,
    Object? leading = freezed,
    Object? bottom = freezed,
  }) {
    return _then(
      _$DSBarConfigImpl(
        pinned: null == pinned
            ? _value.pinned
            : pinned // ignore: cast_nullable_to_non_nullable
                  as bool,
        floating: null == floating
            ? _value.floating
            : floating // ignore: cast_nullable_to_non_nullable
                  as bool,
        snap: null == snap
            ? _value.snap
            : snap // ignore: cast_nullable_to_non_nullable
                  as bool,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        actions: freezed == actions
            ? _value._actions
            : actions // ignore: cast_nullable_to_non_nullable
                  as List<Widget>?,
        leading: freezed == leading
            ? _value.leading
            : leading // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        bottom: freezed == bottom
            ? _value.bottom
            : bottom // ignore: cast_nullable_to_non_nullable
                  as PreferredSizeWidget?,
      ),
    );
  }
}

/// @nodoc

class _$DSBarConfigImpl implements _DSBarConfig {
  const _$DSBarConfigImpl({
    this.pinned = true,
    this.floating = true,
    this.snap = true,
    this.height = 56.0,
    this.title,
    final List<Widget>? actions,
    this.leading,
    this.bottom,
  }) : _actions = actions;

  @override
  @JsonKey()
  final bool pinned;
  @override
  @JsonKey()
  final bool floating;
  @override
  @JsonKey()
  final bool snap;
  @override
  @JsonKey()
  final double height;
  @override
  final Widget? title;
  final List<Widget>? _actions;
  @override
  List<Widget>? get actions {
    final value = _actions;
    if (value == null) return null;
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Widget? leading;
  @override
  final PreferredSizeWidget? bottom;

  @override
  String toString() {
    return 'DSBarConfig(pinned: $pinned, floating: $floating, snap: $snap, height: $height, title: $title, actions: $actions, leading: $leading, bottom: $bottom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSBarConfigImpl &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            (identical(other.floating, floating) ||
                other.floating == floating) &&
            (identical(other.snap, snap) || other.snap == snap) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            (identical(other.leading, leading) || other.leading == leading) &&
            (identical(other.bottom, bottom) || other.bottom == bottom));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    pinned,
    floating,
    snap,
    height,
    title,
    const DeepCollectionEquality().hash(_actions),
    leading,
    bottom,
  );

  /// Create a copy of DSBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSBarConfigImplCopyWith<_$DSBarConfigImpl> get copyWith =>
      __$$DSBarConfigImplCopyWithImpl<_$DSBarConfigImpl>(this, _$identity);
}

abstract class _DSBarConfig implements DSBarConfig {
  const factory _DSBarConfig({
    final bool pinned,
    final bool floating,
    final bool snap,
    final double height,
    final Widget? title,
    final List<Widget>? actions,
    final Widget? leading,
    final PreferredSizeWidget? bottom,
  }) = _$DSBarConfigImpl;

  @override
  bool get pinned;
  @override
  bool get floating;
  @override
  bool get snap;
  @override
  double get height;
  @override
  Widget? get title;
  @override
  List<Widget>? get actions;
  @override
  Widget? get leading;
  @override
  PreferredSizeWidget? get bottom;

  /// Create a copy of DSBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSBarConfigImplCopyWith<_$DSBarConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BodyConfig {
  bool get safeArea => throw _privateConstructorUsedError;
  bool get resizeToAvoidBottomInset => throw _privateConstructorUsedError;
  EdgeInsetsGeometry? get padding => throw _privateConstructorUsedError;
  Widget? get child => throw _privateConstructorUsedError;

  /// Create a copy of BodyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BodyConfigCopyWith<BodyConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BodyConfigCopyWith<$Res> {
  factory $BodyConfigCopyWith(
    BodyConfig value,
    $Res Function(BodyConfig) then,
  ) = _$BodyConfigCopyWithImpl<$Res, BodyConfig>;
  @useResult
  $Res call({
    bool safeArea,
    bool resizeToAvoidBottomInset,
    EdgeInsetsGeometry? padding,
    Widget? child,
  });
}

/// @nodoc
class _$BodyConfigCopyWithImpl<$Res, $Val extends BodyConfig>
    implements $BodyConfigCopyWith<$Res> {
  _$BodyConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BodyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? safeArea = null,
    Object? resizeToAvoidBottomInset = null,
    Object? padding = freezed,
    Object? child = freezed,
  }) {
    return _then(
      _value.copyWith(
            safeArea: null == safeArea
                ? _value.safeArea
                : safeArea // ignore: cast_nullable_to_non_nullable
                      as bool,
            resizeToAvoidBottomInset: null == resizeToAvoidBottomInset
                ? _value.resizeToAvoidBottomInset
                : resizeToAvoidBottomInset // ignore: cast_nullable_to_non_nullable
                      as bool,
            padding: freezed == padding
                ? _value.padding
                : padding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsetsGeometry?,
            child: freezed == child
                ? _value.child
                : child // ignore: cast_nullable_to_non_nullable
                      as Widget?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BodyConfigImplCopyWith<$Res>
    implements $BodyConfigCopyWith<$Res> {
  factory _$$BodyConfigImplCopyWith(
    _$BodyConfigImpl value,
    $Res Function(_$BodyConfigImpl) then,
  ) = __$$BodyConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool safeArea,
    bool resizeToAvoidBottomInset,
    EdgeInsetsGeometry? padding,
    Widget? child,
  });
}

/// @nodoc
class __$$BodyConfigImplCopyWithImpl<$Res>
    extends _$BodyConfigCopyWithImpl<$Res, _$BodyConfigImpl>
    implements _$$BodyConfigImplCopyWith<$Res> {
  __$$BodyConfigImplCopyWithImpl(
    _$BodyConfigImpl _value,
    $Res Function(_$BodyConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BodyConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? safeArea = null,
    Object? resizeToAvoidBottomInset = null,
    Object? padding = freezed,
    Object? child = freezed,
  }) {
    return _then(
      _$BodyConfigImpl(
        safeArea: null == safeArea
            ? _value.safeArea
            : safeArea // ignore: cast_nullable_to_non_nullable
                  as bool,
        resizeToAvoidBottomInset: null == resizeToAvoidBottomInset
            ? _value.resizeToAvoidBottomInset
            : resizeToAvoidBottomInset // ignore: cast_nullable_to_non_nullable
                  as bool,
        padding: freezed == padding
            ? _value.padding
            : padding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsetsGeometry?,
        child: freezed == child
            ? _value.child
            : child // ignore: cast_nullable_to_non_nullable
                  as Widget?,
      ),
    );
  }
}

/// @nodoc

class _$BodyConfigImpl implements _BodyConfig {
  const _$BodyConfigImpl({
    this.safeArea = true,
    this.resizeToAvoidBottomInset = true,
    this.padding,
    this.child,
  });

  @override
  @JsonKey()
  final bool safeArea;
  @override
  @JsonKey()
  final bool resizeToAvoidBottomInset;
  @override
  final EdgeInsetsGeometry? padding;
  @override
  final Widget? child;

  @override
  String toString() {
    return 'BodyConfig(safeArea: $safeArea, resizeToAvoidBottomInset: $resizeToAvoidBottomInset, padding: $padding, child: $child)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BodyConfigImpl &&
            (identical(other.safeArea, safeArea) ||
                other.safeArea == safeArea) &&
            (identical(
                  other.resizeToAvoidBottomInset,
                  resizeToAvoidBottomInset,
                ) ||
                other.resizeToAvoidBottomInset == resizeToAvoidBottomInset) &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.child, child) || other.child == child));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    safeArea,
    resizeToAvoidBottomInset,
    padding,
    child,
  );

  /// Create a copy of BodyConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BodyConfigImplCopyWith<_$BodyConfigImpl> get copyWith =>
      __$$BodyConfigImplCopyWithImpl<_$BodyConfigImpl>(this, _$identity);
}

abstract class _BodyConfig implements BodyConfig {
  const factory _BodyConfig({
    final bool safeArea,
    final bool resizeToAvoidBottomInset,
    final EdgeInsetsGeometry? padding,
    final Widget? child,
  }) = _$BodyConfigImpl;

  @override
  bool get safeArea;
  @override
  bool get resizeToAvoidBottomInset;
  @override
  EdgeInsetsGeometry? get padding;
  @override
  Widget? get child;

  /// Create a copy of BodyConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BodyConfigImplCopyWith<_$BodyConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BottomBarConfig {
  BottomBarType get type => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  List<BottomBarItem> get items => throw _privateConstructorUsedError;
  int? get selectedIndex => throw _privateConstructorUsedError;
  ValueChanged<int>? get onTap => throw _privateConstructorUsedError;

  /// Create a copy of BottomBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BottomBarConfigCopyWith<BottomBarConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomBarConfigCopyWith<$Res> {
  factory $BottomBarConfigCopyWith(
    BottomBarConfig value,
    $Res Function(BottomBarConfig) then,
  ) = _$BottomBarConfigCopyWithImpl<$Res, BottomBarConfig>;
  @useResult
  $Res call({
    BottomBarType type,
    double height,
    List<BottomBarItem> items,
    int? selectedIndex,
    ValueChanged<int>? onTap,
  });
}

/// @nodoc
class _$BottomBarConfigCopyWithImpl<$Res, $Val extends BottomBarConfig>
    implements $BottomBarConfigCopyWith<$Res> {
  _$BottomBarConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BottomBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? height = null,
    Object? items = null,
    Object? selectedIndex = freezed,
    Object? onTap = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as BottomBarType,
            height: null == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<BottomBarItem>,
            selectedIndex: freezed == selectedIndex
                ? _value.selectedIndex
                : selectedIndex // ignore: cast_nullable_to_non_nullable
                      as int?,
            onTap: freezed == onTap
                ? _value.onTap
                : onTap // ignore: cast_nullable_to_non_nullable
                      as ValueChanged<int>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BottomBarConfigImplCopyWith<$Res>
    implements $BottomBarConfigCopyWith<$Res> {
  factory _$$BottomBarConfigImplCopyWith(
    _$BottomBarConfigImpl value,
    $Res Function(_$BottomBarConfigImpl) then,
  ) = __$$BottomBarConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BottomBarType type,
    double height,
    List<BottomBarItem> items,
    int? selectedIndex,
    ValueChanged<int>? onTap,
  });
}

/// @nodoc
class __$$BottomBarConfigImplCopyWithImpl<$Res>
    extends _$BottomBarConfigCopyWithImpl<$Res, _$BottomBarConfigImpl>
    implements _$$BottomBarConfigImplCopyWith<$Res> {
  __$$BottomBarConfigImplCopyWithImpl(
    _$BottomBarConfigImpl _value,
    $Res Function(_$BottomBarConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BottomBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? height = null,
    Object? items = null,
    Object? selectedIndex = freezed,
    Object? onTap = freezed,
  }) {
    return _then(
      _$BottomBarConfigImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as BottomBarType,
        height: null == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<BottomBarItem>,
        selectedIndex: freezed == selectedIndex
            ? _value.selectedIndex
            : selectedIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
        onTap: freezed == onTap
            ? _value.onTap
            : onTap // ignore: cast_nullable_to_non_nullable
                  as ValueChanged<int>?,
      ),
    );
  }
}

/// @nodoc

class _$BottomBarConfigImpl implements _BottomBarConfig {
  const _$BottomBarConfigImpl({
    this.type = BottomBarType.navigation,
    this.height = 80.0,
    required final List<BottomBarItem> items,
    this.selectedIndex,
    this.onTap,
  }) : _items = items;

  @override
  @JsonKey()
  final BottomBarType type;
  @override
  @JsonKey()
  final double height;
  final List<BottomBarItem> _items;
  @override
  List<BottomBarItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int? selectedIndex;
  @override
  final ValueChanged<int>? onTap;

  @override
  String toString() {
    return 'BottomBarConfig(type: $type, height: $height, items: $items, selectedIndex: $selectedIndex, onTap: $onTap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomBarConfigImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.height, height) || other.height == height) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.onTap, onTap) || other.onTap == onTap));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    height,
    const DeepCollectionEquality().hash(_items),
    selectedIndex,
    onTap,
  );

  /// Create a copy of BottomBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomBarConfigImplCopyWith<_$BottomBarConfigImpl> get copyWith =>
      __$$BottomBarConfigImplCopyWithImpl<_$BottomBarConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _BottomBarConfig implements BottomBarConfig {
  const factory _BottomBarConfig({
    final BottomBarType type,
    final double height,
    required final List<BottomBarItem> items,
    final int? selectedIndex,
    final ValueChanged<int>? onTap,
  }) = _$BottomBarConfigImpl;

  @override
  BottomBarType get type;
  @override
  double get height;
  @override
  List<BottomBarItem> get items;
  @override
  int? get selectedIndex;
  @override
  ValueChanged<int>? get onTap;

  /// Create a copy of BottomBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BottomBarConfigImplCopyWith<_$BottomBarConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SidePanelConfig {
  SidePanelType get type => throw _privateConstructorUsedError;
  NavigationRailLabelType get labelType => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get expandedWidth => throw _privateConstructorUsedError;
  bool get extended => throw _privateConstructorUsedError;
  List<NavigationRailDestination> get destinations =>
      throw _privateConstructorUsedError;
  int? get selectedIndex => throw _privateConstructorUsedError;
  ValueChanged<int>? get onDestinationSelected =>
      throw _privateConstructorUsedError;

  /// Create a copy of SidePanelConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SidePanelConfigCopyWith<SidePanelConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SidePanelConfigCopyWith<$Res> {
  factory $SidePanelConfigCopyWith(
    SidePanelConfig value,
    $Res Function(SidePanelConfig) then,
  ) = _$SidePanelConfigCopyWithImpl<$Res, SidePanelConfig>;
  @useResult
  $Res call({
    SidePanelType type,
    NavigationRailLabelType labelType,
    double width,
    double expandedWidth,
    bool extended,
    List<NavigationRailDestination> destinations,
    int? selectedIndex,
    ValueChanged<int>? onDestinationSelected,
  });
}

/// @nodoc
class _$SidePanelConfigCopyWithImpl<$Res, $Val extends SidePanelConfig>
    implements $SidePanelConfigCopyWith<$Res> {
  _$SidePanelConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SidePanelConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? labelType = null,
    Object? width = null,
    Object? expandedWidth = null,
    Object? extended = null,
    Object? destinations = null,
    Object? selectedIndex = freezed,
    Object? onDestinationSelected = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as SidePanelType,
            labelType: null == labelType
                ? _value.labelType
                : labelType // ignore: cast_nullable_to_non_nullable
                      as NavigationRailLabelType,
            width: null == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as double,
            expandedWidth: null == expandedWidth
                ? _value.expandedWidth
                : expandedWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            extended: null == extended
                ? _value.extended
                : extended // ignore: cast_nullable_to_non_nullable
                      as bool,
            destinations: null == destinations
                ? _value.destinations
                : destinations // ignore: cast_nullable_to_non_nullable
                      as List<NavigationRailDestination>,
            selectedIndex: freezed == selectedIndex
                ? _value.selectedIndex
                : selectedIndex // ignore: cast_nullable_to_non_nullable
                      as int?,
            onDestinationSelected: freezed == onDestinationSelected
                ? _value.onDestinationSelected
                : onDestinationSelected // ignore: cast_nullable_to_non_nullable
                      as ValueChanged<int>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SidePanelConfigImplCopyWith<$Res>
    implements $SidePanelConfigCopyWith<$Res> {
  factory _$$SidePanelConfigImplCopyWith(
    _$SidePanelConfigImpl value,
    $Res Function(_$SidePanelConfigImpl) then,
  ) = __$$SidePanelConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    SidePanelType type,
    NavigationRailLabelType labelType,
    double width,
    double expandedWidth,
    bool extended,
    List<NavigationRailDestination> destinations,
    int? selectedIndex,
    ValueChanged<int>? onDestinationSelected,
  });
}

/// @nodoc
class __$$SidePanelConfigImplCopyWithImpl<$Res>
    extends _$SidePanelConfigCopyWithImpl<$Res, _$SidePanelConfigImpl>
    implements _$$SidePanelConfigImplCopyWith<$Res> {
  __$$SidePanelConfigImplCopyWithImpl(
    _$SidePanelConfigImpl _value,
    $Res Function(_$SidePanelConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SidePanelConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? labelType = null,
    Object? width = null,
    Object? expandedWidth = null,
    Object? extended = null,
    Object? destinations = null,
    Object? selectedIndex = freezed,
    Object? onDestinationSelected = freezed,
  }) {
    return _then(
      _$SidePanelConfigImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as SidePanelType,
        labelType: null == labelType
            ? _value.labelType
            : labelType // ignore: cast_nullable_to_non_nullable
                  as NavigationRailLabelType,
        width: null == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as double,
        expandedWidth: null == expandedWidth
            ? _value.expandedWidth
            : expandedWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        extended: null == extended
            ? _value.extended
            : extended // ignore: cast_nullable_to_non_nullable
                  as bool,
        destinations: null == destinations
            ? _value._destinations
            : destinations // ignore: cast_nullable_to_non_nullable
                  as List<NavigationRailDestination>,
        selectedIndex: freezed == selectedIndex
            ? _value.selectedIndex
            : selectedIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
        onDestinationSelected: freezed == onDestinationSelected
            ? _value.onDestinationSelected
            : onDestinationSelected // ignore: cast_nullable_to_non_nullable
                  as ValueChanged<int>?,
      ),
    );
  }
}

/// @nodoc

class _$SidePanelConfigImpl implements _SidePanelConfig {
  const _$SidePanelConfigImpl({
    this.type = SidePanelType.rail,
    this.labelType = NavigationRailLabelType.none,
    this.width = 72.0,
    this.expandedWidth = 256.0,
    this.extended = false,
    required final List<NavigationRailDestination> destinations,
    this.selectedIndex,
    this.onDestinationSelected,
  }) : _destinations = destinations;

  @override
  @JsonKey()
  final SidePanelType type;
  @override
  @JsonKey()
  final NavigationRailLabelType labelType;
  @override
  @JsonKey()
  final double width;
  @override
  @JsonKey()
  final double expandedWidth;
  @override
  @JsonKey()
  final bool extended;
  final List<NavigationRailDestination> _destinations;
  @override
  List<NavigationRailDestination> get destinations {
    if (_destinations is EqualUnmodifiableListView) return _destinations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destinations);
  }

  @override
  final int? selectedIndex;
  @override
  final ValueChanged<int>? onDestinationSelected;

  @override
  String toString() {
    return 'SidePanelConfig(type: $type, labelType: $labelType, width: $width, expandedWidth: $expandedWidth, extended: $extended, destinations: $destinations, selectedIndex: $selectedIndex, onDestinationSelected: $onDestinationSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SidePanelConfigImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.labelType, labelType) ||
                other.labelType == labelType) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.expandedWidth, expandedWidth) ||
                other.expandedWidth == expandedWidth) &&
            (identical(other.extended, extended) ||
                other.extended == extended) &&
            const DeepCollectionEquality().equals(
              other._destinations,
              _destinations,
            ) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.onDestinationSelected, onDestinationSelected) ||
                other.onDestinationSelected == onDestinationSelected));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    labelType,
    width,
    expandedWidth,
    extended,
    const DeepCollectionEquality().hash(_destinations),
    selectedIndex,
    onDestinationSelected,
  );

  /// Create a copy of SidePanelConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SidePanelConfigImplCopyWith<_$SidePanelConfigImpl> get copyWith =>
      __$$SidePanelConfigImplCopyWithImpl<_$SidePanelConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _SidePanelConfig implements SidePanelConfig {
  const factory _SidePanelConfig({
    final SidePanelType type,
    final NavigationRailLabelType labelType,
    final double width,
    final double expandedWidth,
    final bool extended,
    required final List<NavigationRailDestination> destinations,
    final int? selectedIndex,
    final ValueChanged<int>? onDestinationSelected,
  }) = _$SidePanelConfigImpl;

  @override
  SidePanelType get type;
  @override
  NavigationRailLabelType get labelType;
  @override
  double get width;
  @override
  double get expandedWidth;
  @override
  bool get extended;
  @override
  List<NavigationRailDestination> get destinations;
  @override
  int? get selectedIndex;
  @override
  ValueChanged<int>? get onDestinationSelected;

  /// Create a copy of SidePanelConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SidePanelConfigImplCopyWith<_$SidePanelConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FloatingActionConfig {
  FloatingActionButtonLocation get location =>
      throw _privateConstructorUsedError;
  bool get mini => throw _privateConstructorUsedError;
  Widget? get child => throw _privateConstructorUsedError;
  VoidCallback? get onPressed => throw _privateConstructorUsedError;
  String? get tooltip => throw _privateConstructorUsedError;
  String? get heroTag => throw _privateConstructorUsedError;

  /// Create a copy of FloatingActionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FloatingActionConfigCopyWith<FloatingActionConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloatingActionConfigCopyWith<$Res> {
  factory $FloatingActionConfigCopyWith(
    FloatingActionConfig value,
    $Res Function(FloatingActionConfig) then,
  ) = _$FloatingActionConfigCopyWithImpl<$Res, FloatingActionConfig>;
  @useResult
  $Res call({
    FloatingActionButtonLocation location,
    bool mini,
    Widget? child,
    VoidCallback? onPressed,
    String? tooltip,
    String? heroTag,
  });
}

/// @nodoc
class _$FloatingActionConfigCopyWithImpl<
  $Res,
  $Val extends FloatingActionConfig
>
    implements $FloatingActionConfigCopyWith<$Res> {
  _$FloatingActionConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FloatingActionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? mini = null,
    Object? child = freezed,
    Object? onPressed = freezed,
    Object? tooltip = freezed,
    Object? heroTag = freezed,
  }) {
    return _then(
      _value.copyWith(
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as FloatingActionButtonLocation,
            mini: null == mini
                ? _value.mini
                : mini // ignore: cast_nullable_to_non_nullable
                      as bool,
            child: freezed == child
                ? _value.child
                : child // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            onPressed: freezed == onPressed
                ? _value.onPressed
                : onPressed // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
            tooltip: freezed == tooltip
                ? _value.tooltip
                : tooltip // ignore: cast_nullable_to_non_nullable
                      as String?,
            heroTag: freezed == heroTag
                ? _value.heroTag
                : heroTag // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FloatingActionConfigImplCopyWith<$Res>
    implements $FloatingActionConfigCopyWith<$Res> {
  factory _$$FloatingActionConfigImplCopyWith(
    _$FloatingActionConfigImpl value,
    $Res Function(_$FloatingActionConfigImpl) then,
  ) = __$$FloatingActionConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FloatingActionButtonLocation location,
    bool mini,
    Widget? child,
    VoidCallback? onPressed,
    String? tooltip,
    String? heroTag,
  });
}

/// @nodoc
class __$$FloatingActionConfigImplCopyWithImpl<$Res>
    extends _$FloatingActionConfigCopyWithImpl<$Res, _$FloatingActionConfigImpl>
    implements _$$FloatingActionConfigImplCopyWith<$Res> {
  __$$FloatingActionConfigImplCopyWithImpl(
    _$FloatingActionConfigImpl _value,
    $Res Function(_$FloatingActionConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FloatingActionConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? mini = null,
    Object? child = freezed,
    Object? onPressed = freezed,
    Object? tooltip = freezed,
    Object? heroTag = freezed,
  }) {
    return _then(
      _$FloatingActionConfigImpl(
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as FloatingActionButtonLocation,
        mini: null == mini
            ? _value.mini
            : mini // ignore: cast_nullable_to_non_nullable
                  as bool,
        child: freezed == child
            ? _value.child
            : child // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        onPressed: freezed == onPressed
            ? _value.onPressed
            : onPressed // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
        tooltip: freezed == tooltip
            ? _value.tooltip
            : tooltip // ignore: cast_nullable_to_non_nullable
                  as String?,
        heroTag: freezed == heroTag
            ? _value.heroTag
            : heroTag // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$FloatingActionConfigImpl implements _FloatingActionConfig {
  const _$FloatingActionConfigImpl({
    this.location = FloatingActionButtonLocation.endFloat,
    this.mini = true,
    this.child,
    this.onPressed,
    this.tooltip,
    this.heroTag,
  });

  @override
  @JsonKey()
  final FloatingActionButtonLocation location;
  @override
  @JsonKey()
  final bool mini;
  @override
  final Widget? child;
  @override
  final VoidCallback? onPressed;
  @override
  final String? tooltip;
  @override
  final String? heroTag;

  @override
  String toString() {
    return 'FloatingActionConfig(location: $location, mini: $mini, child: $child, onPressed: $onPressed, tooltip: $tooltip, heroTag: $heroTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FloatingActionConfigImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.mini, mini) || other.mini == mini) &&
            (identical(other.child, child) || other.child == child) &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.heroTag, heroTag) || other.heroTag == heroTag));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    location,
    mini,
    child,
    onPressed,
    tooltip,
    heroTag,
  );

  /// Create a copy of FloatingActionConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FloatingActionConfigImplCopyWith<_$FloatingActionConfigImpl>
  get copyWith =>
      __$$FloatingActionConfigImplCopyWithImpl<_$FloatingActionConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _FloatingActionConfig implements FloatingActionConfig {
  const factory _FloatingActionConfig({
    final FloatingActionButtonLocation location,
    final bool mini,
    final Widget? child,
    final VoidCallback? onPressed,
    final String? tooltip,
    final String? heroTag,
  }) = _$FloatingActionConfigImpl;

  @override
  FloatingActionButtonLocation get location;
  @override
  bool get mini;
  @override
  Widget? get child;
  @override
  VoidCallback? get onPressed;
  @override
  String? get tooltip;
  @override
  String? get heroTag;

  /// Create a copy of FloatingActionConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FloatingActionConfigImplCopyWith<_$FloatingActionConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NavigationItem {
  String get label => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  IconData? get selectedIcon => throw _privateConstructorUsedError;
  String? get route => throw _privateConstructorUsedError;
  VoidCallback? get onTap => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  bool get disabled => throw _privateConstructorUsedError;

  /// Create a copy of NavigationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NavigationItemCopyWith<NavigationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationItemCopyWith<$Res> {
  factory $NavigationItemCopyWith(
    NavigationItem value,
    $Res Function(NavigationItem) then,
  ) = _$NavigationItemCopyWithImpl<$Res, NavigationItem>;
  @useResult
  $Res call({
    String label,
    IconData icon,
    IconData? selectedIcon,
    String? route,
    VoidCallback? onTap,
    bool isSelected,
    bool disabled,
  });
}

/// @nodoc
class _$NavigationItemCopyWithImpl<$Res, $Val extends NavigationItem>
    implements $NavigationItemCopyWith<$Res> {
  _$NavigationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NavigationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? icon = null,
    Object? selectedIcon = freezed,
    Object? route = freezed,
    Object? onTap = freezed,
    Object? isSelected = null,
    Object? disabled = null,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as IconData,
            selectedIcon: freezed == selectedIcon
                ? _value.selectedIcon
                : selectedIcon // ignore: cast_nullable_to_non_nullable
                      as IconData?,
            route: freezed == route
                ? _value.route
                : route // ignore: cast_nullable_to_non_nullable
                      as String?,
            onTap: freezed == onTap
                ? _value.onTap
                : onTap // ignore: cast_nullable_to_non_nullable
                      as VoidCallback?,
            isSelected: null == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                      as bool,
            disabled: null == disabled
                ? _value.disabled
                : disabled // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NavigationItemImplCopyWith<$Res>
    implements $NavigationItemCopyWith<$Res> {
  factory _$$NavigationItemImplCopyWith(
    _$NavigationItemImpl value,
    $Res Function(_$NavigationItemImpl) then,
  ) = __$$NavigationItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String label,
    IconData icon,
    IconData? selectedIcon,
    String? route,
    VoidCallback? onTap,
    bool isSelected,
    bool disabled,
  });
}

/// @nodoc
class __$$NavigationItemImplCopyWithImpl<$Res>
    extends _$NavigationItemCopyWithImpl<$Res, _$NavigationItemImpl>
    implements _$$NavigationItemImplCopyWith<$Res> {
  __$$NavigationItemImplCopyWithImpl(
    _$NavigationItemImpl _value,
    $Res Function(_$NavigationItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NavigationItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? icon = null,
    Object? selectedIcon = freezed,
    Object? route = freezed,
    Object? onTap = freezed,
    Object? isSelected = null,
    Object? disabled = null,
  }) {
    return _then(
      _$NavigationItemImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as IconData,
        selectedIcon: freezed == selectedIcon
            ? _value.selectedIcon
            : selectedIcon // ignore: cast_nullable_to_non_nullable
                  as IconData?,
        route: freezed == route
            ? _value.route
            : route // ignore: cast_nullable_to_non_nullable
                  as String?,
        onTap: freezed == onTap
            ? _value.onTap
            : onTap // ignore: cast_nullable_to_non_nullable
                  as VoidCallback?,
        isSelected: null == isSelected
            ? _value.isSelected
            : isSelected // ignore: cast_nullable_to_non_nullable
                  as bool,
        disabled: null == disabled
            ? _value.disabled
            : disabled // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$NavigationItemImpl implements _NavigationItem {
  const _$NavigationItemImpl({
    required this.label,
    required this.icon,
    this.selectedIcon,
    this.route,
    this.onTap,
    this.isSelected = false,
    this.disabled = false,
  });

  @override
  final String label;
  @override
  final IconData icon;
  @override
  final IconData? selectedIcon;
  @override
  final String? route;
  @override
  final VoidCallback? onTap;
  @override
  @JsonKey()
  final bool isSelected;
  @override
  @JsonKey()
  final bool disabled;

  @override
  String toString() {
    return 'NavigationItem(label: $label, icon: $icon, selectedIcon: $selectedIcon, route: $route, onTap: $onTap, isSelected: $isSelected, disabled: $disabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationItemImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.selectedIcon, selectedIcon) ||
                other.selectedIcon == selectedIcon) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.onTap, onTap) || other.onTap == onTap) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    label,
    icon,
    selectedIcon,
    route,
    onTap,
    isSelected,
    disabled,
  );

  /// Create a copy of NavigationItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationItemImplCopyWith<_$NavigationItemImpl> get copyWith =>
      __$$NavigationItemImplCopyWithImpl<_$NavigationItemImpl>(
        this,
        _$identity,
      );
}

abstract class _NavigationItem implements NavigationItem {
  const factory _NavigationItem({
    required final String label,
    required final IconData icon,
    final IconData? selectedIcon,
    final String? route,
    final VoidCallback? onTap,
    final bool isSelected,
    final bool disabled,
  }) = _$NavigationItemImpl;

  @override
  String get label;
  @override
  IconData get icon;
  @override
  IconData? get selectedIcon;
  @override
  String? get route;
  @override
  VoidCallback? get onTap;
  @override
  bool get isSelected;
  @override
  bool get disabled;

  /// Create a copy of NavigationItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NavigationItemImplCopyWith<_$NavigationItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BottomBarItem {
  String get label => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  IconData? get activeIcon => throw _privateConstructorUsedError;
  String? get tooltip => throw _privateConstructorUsedError;
  bool get disabled => throw _privateConstructorUsedError;

  /// Create a copy of BottomBarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BottomBarItemCopyWith<BottomBarItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomBarItemCopyWith<$Res> {
  factory $BottomBarItemCopyWith(
    BottomBarItem value,
    $Res Function(BottomBarItem) then,
  ) = _$BottomBarItemCopyWithImpl<$Res, BottomBarItem>;
  @useResult
  $Res call({
    String label,
    IconData icon,
    IconData? activeIcon,
    String? tooltip,
    bool disabled,
  });
}

/// @nodoc
class _$BottomBarItemCopyWithImpl<$Res, $Val extends BottomBarItem>
    implements $BottomBarItemCopyWith<$Res> {
  _$BottomBarItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BottomBarItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? icon = null,
    Object? activeIcon = freezed,
    Object? tooltip = freezed,
    Object? disabled = null,
  }) {
    return _then(
      _value.copyWith(
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as IconData,
            activeIcon: freezed == activeIcon
                ? _value.activeIcon
                : activeIcon // ignore: cast_nullable_to_non_nullable
                      as IconData?,
            tooltip: freezed == tooltip
                ? _value.tooltip
                : tooltip // ignore: cast_nullable_to_non_nullable
                      as String?,
            disabled: null == disabled
                ? _value.disabled
                : disabled // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BottomBarItemImplCopyWith<$Res>
    implements $BottomBarItemCopyWith<$Res> {
  factory _$$BottomBarItemImplCopyWith(
    _$BottomBarItemImpl value,
    $Res Function(_$BottomBarItemImpl) then,
  ) = __$$BottomBarItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String label,
    IconData icon,
    IconData? activeIcon,
    String? tooltip,
    bool disabled,
  });
}

/// @nodoc
class __$$BottomBarItemImplCopyWithImpl<$Res>
    extends _$BottomBarItemCopyWithImpl<$Res, _$BottomBarItemImpl>
    implements _$$BottomBarItemImplCopyWith<$Res> {
  __$$BottomBarItemImplCopyWithImpl(
    _$BottomBarItemImpl _value,
    $Res Function(_$BottomBarItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BottomBarItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? icon = null,
    Object? activeIcon = freezed,
    Object? tooltip = freezed,
    Object? disabled = null,
  }) {
    return _then(
      _$BottomBarItemImpl(
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as IconData,
        activeIcon: freezed == activeIcon
            ? _value.activeIcon
            : activeIcon // ignore: cast_nullable_to_non_nullable
                  as IconData?,
        tooltip: freezed == tooltip
            ? _value.tooltip
            : tooltip // ignore: cast_nullable_to_non_nullable
                  as String?,
        disabled: null == disabled
            ? _value.disabled
            : disabled // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$BottomBarItemImpl implements _BottomBarItem {
  const _$BottomBarItemImpl({
    required this.label,
    required this.icon,
    this.activeIcon,
    this.tooltip,
    this.disabled = false,
  });

  @override
  final String label;
  @override
  final IconData icon;
  @override
  final IconData? activeIcon;
  @override
  final String? tooltip;
  @override
  @JsonKey()
  final bool disabled;

  @override
  String toString() {
    return 'BottomBarItem(label: $label, icon: $icon, activeIcon: $activeIcon, tooltip: $tooltip, disabled: $disabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomBarItemImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.activeIcon, activeIcon) ||
                other.activeIcon == activeIcon) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, label, icon, activeIcon, tooltip, disabled);

  /// Create a copy of BottomBarItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomBarItemImplCopyWith<_$BottomBarItemImpl> get copyWith =>
      __$$BottomBarItemImplCopyWithImpl<_$BottomBarItemImpl>(this, _$identity);
}

abstract class _BottomBarItem implements BottomBarItem {
  const factory _BottomBarItem({
    required final String label,
    required final IconData icon,
    final IconData? activeIcon,
    final String? tooltip,
    final bool disabled,
  }) = _$BottomBarItemImpl;

  @override
  String get label;
  @override
  IconData get icon;
  @override
  IconData? get activeIcon;
  @override
  String? get tooltip;
  @override
  bool get disabled;

  /// Create a copy of BottomBarItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BottomBarItemImplCopyWith<_$BottomBarItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
