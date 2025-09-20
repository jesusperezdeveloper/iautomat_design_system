// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_table_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSDataTableFreezeConfig {
  /// Number of columns to freeze from the left
  int get leftColumns => throw _privateConstructorUsedError;

  /// Number of columns to freeze from the right
  int get rightColumns => throw _privateConstructorUsedError;

  /// Whether to show freeze dividers
  bool get showDividers => throw _privateConstructorUsedError;

  /// Freeze divider color
  Color? get dividerColor => throw _privateConstructorUsedError;

  /// Freeze divider width
  double get dividerWidth => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableFreezeConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableFreezeConfigCopyWith<DSDataTableFreezeConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableFreezeConfigCopyWith<$Res> {
  factory $DSDataTableFreezeConfigCopyWith(
    DSDataTableFreezeConfig value,
    $Res Function(DSDataTableFreezeConfig) then,
  ) = _$DSDataTableFreezeConfigCopyWithImpl<$Res, DSDataTableFreezeConfig>;
  @useResult
  $Res call({
    int leftColumns,
    int rightColumns,
    bool showDividers,
    Color? dividerColor,
    double dividerWidth,
  });
}

/// @nodoc
class _$DSDataTableFreezeConfigCopyWithImpl<
  $Res,
  $Val extends DSDataTableFreezeConfig
>
    implements $DSDataTableFreezeConfigCopyWith<$Res> {
  _$DSDataTableFreezeConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableFreezeConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leftColumns = null,
    Object? rightColumns = null,
    Object? showDividers = null,
    Object? dividerColor = freezed,
    Object? dividerWidth = null,
  }) {
    return _then(
      _value.copyWith(
            leftColumns: null == leftColumns
                ? _value.leftColumns
                : leftColumns // ignore: cast_nullable_to_non_nullable
                      as int,
            rightColumns: null == rightColumns
                ? _value.rightColumns
                : rightColumns // ignore: cast_nullable_to_non_nullable
                      as int,
            showDividers: null == showDividers
                ? _value.showDividers
                : showDividers // ignore: cast_nullable_to_non_nullable
                      as bool,
            dividerColor: freezed == dividerColor
                ? _value.dividerColor
                : dividerColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            dividerWidth: null == dividerWidth
                ? _value.dividerWidth
                : dividerWidth // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableFreezeConfigImplCopyWith<$Res>
    implements $DSDataTableFreezeConfigCopyWith<$Res> {
  factory _$$DSDataTableFreezeConfigImplCopyWith(
    _$DSDataTableFreezeConfigImpl value,
    $Res Function(_$DSDataTableFreezeConfigImpl) then,
  ) = __$$DSDataTableFreezeConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int leftColumns,
    int rightColumns,
    bool showDividers,
    Color? dividerColor,
    double dividerWidth,
  });
}

/// @nodoc
class __$$DSDataTableFreezeConfigImplCopyWithImpl<$Res>
    extends
        _$DSDataTableFreezeConfigCopyWithImpl<
          $Res,
          _$DSDataTableFreezeConfigImpl
        >
    implements _$$DSDataTableFreezeConfigImplCopyWith<$Res> {
  __$$DSDataTableFreezeConfigImplCopyWithImpl(
    _$DSDataTableFreezeConfigImpl _value,
    $Res Function(_$DSDataTableFreezeConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableFreezeConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leftColumns = null,
    Object? rightColumns = null,
    Object? showDividers = null,
    Object? dividerColor = freezed,
    Object? dividerWidth = null,
  }) {
    return _then(
      _$DSDataTableFreezeConfigImpl(
        leftColumns: null == leftColumns
            ? _value.leftColumns
            : leftColumns // ignore: cast_nullable_to_non_nullable
                  as int,
        rightColumns: null == rightColumns
            ? _value.rightColumns
            : rightColumns // ignore: cast_nullable_to_non_nullable
                  as int,
        showDividers: null == showDividers
            ? _value.showDividers
            : showDividers // ignore: cast_nullable_to_non_nullable
                  as bool,
        dividerColor: freezed == dividerColor
            ? _value.dividerColor
            : dividerColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        dividerWidth: null == dividerWidth
            ? _value.dividerWidth
            : dividerWidth // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableFreezeConfigImpl implements _DSDataTableFreezeConfig {
  const _$DSDataTableFreezeConfigImpl({
    this.leftColumns = 0,
    this.rightColumns = 0,
    this.showDividers = true,
    this.dividerColor,
    this.dividerWidth = 2.0,
  });

  /// Number of columns to freeze from the left
  @override
  @JsonKey()
  final int leftColumns;

  /// Number of columns to freeze from the right
  @override
  @JsonKey()
  final int rightColumns;

  /// Whether to show freeze dividers
  @override
  @JsonKey()
  final bool showDividers;

  /// Freeze divider color
  @override
  final Color? dividerColor;

  /// Freeze divider width
  @override
  @JsonKey()
  final double dividerWidth;

  @override
  String toString() {
    return 'DSDataTableFreezeConfig(leftColumns: $leftColumns, rightColumns: $rightColumns, showDividers: $showDividers, dividerColor: $dividerColor, dividerWidth: $dividerWidth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableFreezeConfigImpl &&
            (identical(other.leftColumns, leftColumns) ||
                other.leftColumns == leftColumns) &&
            (identical(other.rightColumns, rightColumns) ||
                other.rightColumns == rightColumns) &&
            (identical(other.showDividers, showDividers) ||
                other.showDividers == showDividers) &&
            (identical(other.dividerColor, dividerColor) ||
                other.dividerColor == dividerColor) &&
            (identical(other.dividerWidth, dividerWidth) ||
                other.dividerWidth == dividerWidth));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    leftColumns,
    rightColumns,
    showDividers,
    dividerColor,
    dividerWidth,
  );

  /// Create a copy of DSDataTableFreezeConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableFreezeConfigImplCopyWith<_$DSDataTableFreezeConfigImpl>
  get copyWith =>
      __$$DSDataTableFreezeConfigImplCopyWithImpl<
        _$DSDataTableFreezeConfigImpl
      >(this, _$identity);
}

abstract class _DSDataTableFreezeConfig implements DSDataTableFreezeConfig {
  const factory _DSDataTableFreezeConfig({
    final int leftColumns,
    final int rightColumns,
    final bool showDividers,
    final Color? dividerColor,
    final double dividerWidth,
  }) = _$DSDataTableFreezeConfigImpl;

  /// Number of columns to freeze from the left
  @override
  int get leftColumns;

  /// Number of columns to freeze from the right
  @override
  int get rightColumns;

  /// Whether to show freeze dividers
  @override
  bool get showDividers;

  /// Freeze divider color
  @override
  Color? get dividerColor;

  /// Freeze divider width
  @override
  double get dividerWidth;

  /// Create a copy of DSDataTableFreezeConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableFreezeConfigImplCopyWith<_$DSDataTableFreezeConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableResizeConfig {
  /// Whether columns are resizable
  bool get enabled => throw _privateConstructorUsedError;

  /// Minimum column width
  double get minColumnWidth => throw _privateConstructorUsedError;

  /// Maximum column width
  double get maxColumnWidth => throw _privateConstructorUsedError;

  /// Resize handle width
  double get handleWidth => throw _privateConstructorUsedError;

  /// Resize handle color
  Color? get handleColor => throw _privateConstructorUsedError;

  /// Whether to show resize handles on hover
  bool get showOnHover => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableResizeConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableResizeConfigCopyWith<DSDataTableResizeConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableResizeConfigCopyWith<$Res> {
  factory $DSDataTableResizeConfigCopyWith(
    DSDataTableResizeConfig value,
    $Res Function(DSDataTableResizeConfig) then,
  ) = _$DSDataTableResizeConfigCopyWithImpl<$Res, DSDataTableResizeConfig>;
  @useResult
  $Res call({
    bool enabled,
    double minColumnWidth,
    double maxColumnWidth,
    double handleWidth,
    Color? handleColor,
    bool showOnHover,
  });
}

/// @nodoc
class _$DSDataTableResizeConfigCopyWithImpl<
  $Res,
  $Val extends DSDataTableResizeConfig
>
    implements $DSDataTableResizeConfigCopyWith<$Res> {
  _$DSDataTableResizeConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableResizeConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? minColumnWidth = null,
    Object? maxColumnWidth = null,
    Object? handleWidth = null,
    Object? handleColor = freezed,
    Object? showOnHover = null,
  }) {
    return _then(
      _value.copyWith(
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            minColumnWidth: null == minColumnWidth
                ? _value.minColumnWidth
                : minColumnWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            maxColumnWidth: null == maxColumnWidth
                ? _value.maxColumnWidth
                : maxColumnWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            handleWidth: null == handleWidth
                ? _value.handleWidth
                : handleWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            handleColor: freezed == handleColor
                ? _value.handleColor
                : handleColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            showOnHover: null == showOnHover
                ? _value.showOnHover
                : showOnHover // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableResizeConfigImplCopyWith<$Res>
    implements $DSDataTableResizeConfigCopyWith<$Res> {
  factory _$$DSDataTableResizeConfigImplCopyWith(
    _$DSDataTableResizeConfigImpl value,
    $Res Function(_$DSDataTableResizeConfigImpl) then,
  ) = __$$DSDataTableResizeConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool enabled,
    double minColumnWidth,
    double maxColumnWidth,
    double handleWidth,
    Color? handleColor,
    bool showOnHover,
  });
}

/// @nodoc
class __$$DSDataTableResizeConfigImplCopyWithImpl<$Res>
    extends
        _$DSDataTableResizeConfigCopyWithImpl<
          $Res,
          _$DSDataTableResizeConfigImpl
        >
    implements _$$DSDataTableResizeConfigImplCopyWith<$Res> {
  __$$DSDataTableResizeConfigImplCopyWithImpl(
    _$DSDataTableResizeConfigImpl _value,
    $Res Function(_$DSDataTableResizeConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableResizeConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? minColumnWidth = null,
    Object? maxColumnWidth = null,
    Object? handleWidth = null,
    Object? handleColor = freezed,
    Object? showOnHover = null,
  }) {
    return _then(
      _$DSDataTableResizeConfigImpl(
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        minColumnWidth: null == minColumnWidth
            ? _value.minColumnWidth
            : minColumnWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        maxColumnWidth: null == maxColumnWidth
            ? _value.maxColumnWidth
            : maxColumnWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        handleWidth: null == handleWidth
            ? _value.handleWidth
            : handleWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        handleColor: freezed == handleColor
            ? _value.handleColor
            : handleColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        showOnHover: null == showOnHover
            ? _value.showOnHover
            : showOnHover // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableResizeConfigImpl implements _DSDataTableResizeConfig {
  const _$DSDataTableResizeConfigImpl({
    this.enabled = true,
    this.minColumnWidth = 50.0,
    this.maxColumnWidth = 500.0,
    this.handleWidth = 8.0,
    this.handleColor,
    this.showOnHover = true,
  });

  /// Whether columns are resizable
  @override
  @JsonKey()
  final bool enabled;

  /// Minimum column width
  @override
  @JsonKey()
  final double minColumnWidth;

  /// Maximum column width
  @override
  @JsonKey()
  final double maxColumnWidth;

  /// Resize handle width
  @override
  @JsonKey()
  final double handleWidth;

  /// Resize handle color
  @override
  final Color? handleColor;

  /// Whether to show resize handles on hover
  @override
  @JsonKey()
  final bool showOnHover;

  @override
  String toString() {
    return 'DSDataTableResizeConfig(enabled: $enabled, minColumnWidth: $minColumnWidth, maxColumnWidth: $maxColumnWidth, handleWidth: $handleWidth, handleColor: $handleColor, showOnHover: $showOnHover)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableResizeConfigImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.minColumnWidth, minColumnWidth) ||
                other.minColumnWidth == minColumnWidth) &&
            (identical(other.maxColumnWidth, maxColumnWidth) ||
                other.maxColumnWidth == maxColumnWidth) &&
            (identical(other.handleWidth, handleWidth) ||
                other.handleWidth == handleWidth) &&
            (identical(other.handleColor, handleColor) ||
                other.handleColor == handleColor) &&
            (identical(other.showOnHover, showOnHover) ||
                other.showOnHover == showOnHover));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    enabled,
    minColumnWidth,
    maxColumnWidth,
    handleWidth,
    handleColor,
    showOnHover,
  );

  /// Create a copy of DSDataTableResizeConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableResizeConfigImplCopyWith<_$DSDataTableResizeConfigImpl>
  get copyWith =>
      __$$DSDataTableResizeConfigImplCopyWithImpl<
        _$DSDataTableResizeConfigImpl
      >(this, _$identity);
}

abstract class _DSDataTableResizeConfig implements DSDataTableResizeConfig {
  const factory _DSDataTableResizeConfig({
    final bool enabled,
    final double minColumnWidth,
    final double maxColumnWidth,
    final double handleWidth,
    final Color? handleColor,
    final bool showOnHover,
  }) = _$DSDataTableResizeConfigImpl;

  /// Whether columns are resizable
  @override
  bool get enabled;

  /// Minimum column width
  @override
  double get minColumnWidth;

  /// Maximum column width
  @override
  double get maxColumnWidth;

  /// Resize handle width
  @override
  double get handleWidth;

  /// Resize handle color
  @override
  Color? get handleColor;

  /// Whether to show resize handles on hover
  @override
  bool get showOnHover;

  /// Create a copy of DSDataTableResizeConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableResizeConfigImplCopyWith<_$DSDataTableResizeConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableColumn {
  /// Unique identifier for the column
  String get id => throw _privateConstructorUsedError;

  /// Display label for the column header
  String get label => throw _privateConstructorUsedError;

  /// Data field name for row data access
  String get field => throw _privateConstructorUsedError;

  /// Column width (null for auto-sizing)
  double? get width => throw _privateConstructorUsedError;

  /// Minimum column width
  double get minWidth => throw _privateConstructorUsedError;

  /// Maximum column width
  double get maxWidth => throw _privateConstructorUsedError;

  /// Whether the column is sortable
  bool get sortable => throw _privateConstructorUsedError;

  /// Whether the column is resizable
  bool get resizable => throw _privateConstructorUsedError;

  /// Whether the column is visible
  bool get visible => throw _privateConstructorUsedError;

  /// Whether the column is pinned (frozen)
  bool get pinned => throw _privateConstructorUsedError;

  /// Column alignment
  DSDataTableColumnAlignment get alignment =>
      throw _privateConstructorUsedError;

  /// Cell type for this column
  DSDataTableCellType get cellType => throw _privateConstructorUsedError;

  /// Whether cells in this column are editable
  bool get editable => throw _privateConstructorUsedError;

  /// Custom cell builder
  DSDataTableCellBuilder? get cellBuilder => throw _privateConstructorUsedError;

  /// Custom header builder
  DSDataTableHeaderBuilder? get headerBuilder =>
      throw _privateConstructorUsedError;

  /// Custom edit cell builder for inline editing
  DSDataTableEditCellBuilder? get editCellBuilder =>
      throw _privateConstructorUsedError;

  /// Validator for cell values during editing
  DSDataTableCellValidator? get validator => throw _privateConstructorUsedError;

  /// Formatter for displaying cell values
  DSDataTableCellFormatter? get formatter => throw _privateConstructorUsedError;

  /// Tooltip for the column header
  String? get tooltip => throw _privateConstructorUsedError;

  /// Icon for the column header
  IconData? get icon => throw _privateConstructorUsedError;

  /// Whether this column can be hidden
  bool get hideable => throw _privateConstructorUsedError;

  /// Custom data for the column
  Map<String, dynamic>? get customData => throw _privateConstructorUsedError;

  /// Accessibility label for the column
  String? get semanticLabel => throw _privateConstructorUsedError;

  /// Sort direction for this column
  DSDataTableSortDirection get sortDirection =>
      throw _privateConstructorUsedError;

  /// Sort priority (for multi-column sorting)
  int? get sortPriority => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableColumn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableColumnCopyWith<DSDataTableColumn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableColumnCopyWith<$Res> {
  factory $DSDataTableColumnCopyWith(
    DSDataTableColumn value,
    $Res Function(DSDataTableColumn) then,
  ) = _$DSDataTableColumnCopyWithImpl<$Res, DSDataTableColumn>;
  @useResult
  $Res call({
    String id,
    String label,
    String field,
    double? width,
    double minWidth,
    double maxWidth,
    bool sortable,
    bool resizable,
    bool visible,
    bool pinned,
    DSDataTableColumnAlignment alignment,
    DSDataTableCellType cellType,
    bool editable,
    DSDataTableCellBuilder? cellBuilder,
    DSDataTableHeaderBuilder? headerBuilder,
    DSDataTableEditCellBuilder? editCellBuilder,
    DSDataTableCellValidator? validator,
    DSDataTableCellFormatter? formatter,
    String? tooltip,
    IconData? icon,
    bool hideable,
    Map<String, dynamic>? customData,
    String? semanticLabel,
    DSDataTableSortDirection sortDirection,
    int? sortPriority,
  });
}

/// @nodoc
class _$DSDataTableColumnCopyWithImpl<$Res, $Val extends DSDataTableColumn>
    implements $DSDataTableColumnCopyWith<$Res> {
  _$DSDataTableColumnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableColumn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? field = null,
    Object? width = freezed,
    Object? minWidth = null,
    Object? maxWidth = null,
    Object? sortable = null,
    Object? resizable = null,
    Object? visible = null,
    Object? pinned = null,
    Object? alignment = null,
    Object? cellType = null,
    Object? editable = null,
    Object? cellBuilder = freezed,
    Object? headerBuilder = freezed,
    Object? editCellBuilder = freezed,
    Object? validator = freezed,
    Object? formatter = freezed,
    Object? tooltip = freezed,
    Object? icon = freezed,
    Object? hideable = null,
    Object? customData = freezed,
    Object? semanticLabel = freezed,
    Object? sortDirection = null,
    Object? sortPriority = freezed,
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
            field: null == field
                ? _value.field
                : field // ignore: cast_nullable_to_non_nullable
                      as String,
            width: freezed == width
                ? _value.width
                : width // ignore: cast_nullable_to_non_nullable
                      as double?,
            minWidth: null == minWidth
                ? _value.minWidth
                : minWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            maxWidth: null == maxWidth
                ? _value.maxWidth
                : maxWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            sortable: null == sortable
                ? _value.sortable
                : sortable // ignore: cast_nullable_to_non_nullable
                      as bool,
            resizable: null == resizable
                ? _value.resizable
                : resizable // ignore: cast_nullable_to_non_nullable
                      as bool,
            visible: null == visible
                ? _value.visible
                : visible // ignore: cast_nullable_to_non_nullable
                      as bool,
            pinned: null == pinned
                ? _value.pinned
                : pinned // ignore: cast_nullable_to_non_nullable
                      as bool,
            alignment: null == alignment
                ? _value.alignment
                : alignment // ignore: cast_nullable_to_non_nullable
                      as DSDataTableColumnAlignment,
            cellType: null == cellType
                ? _value.cellType
                : cellType // ignore: cast_nullable_to_non_nullable
                      as DSDataTableCellType,
            editable: null == editable
                ? _value.editable
                : editable // ignore: cast_nullable_to_non_nullable
                      as bool,
            cellBuilder: freezed == cellBuilder
                ? _value.cellBuilder
                : cellBuilder // ignore: cast_nullable_to_non_nullable
                      as DSDataTableCellBuilder?,
            headerBuilder: freezed == headerBuilder
                ? _value.headerBuilder
                : headerBuilder // ignore: cast_nullable_to_non_nullable
                      as DSDataTableHeaderBuilder?,
            editCellBuilder: freezed == editCellBuilder
                ? _value.editCellBuilder
                : editCellBuilder // ignore: cast_nullable_to_non_nullable
                      as DSDataTableEditCellBuilder?,
            validator: freezed == validator
                ? _value.validator
                : validator // ignore: cast_nullable_to_non_nullable
                      as DSDataTableCellValidator?,
            formatter: freezed == formatter
                ? _value.formatter
                : formatter // ignore: cast_nullable_to_non_nullable
                      as DSDataTableCellFormatter?,
            tooltip: freezed == tooltip
                ? _value.tooltip
                : tooltip // ignore: cast_nullable_to_non_nullable
                      as String?,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as IconData?,
            hideable: null == hideable
                ? _value.hideable
                : hideable // ignore: cast_nullable_to_non_nullable
                      as bool,
            customData: freezed == customData
                ? _value.customData
                : customData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            semanticLabel: freezed == semanticLabel
                ? _value.semanticLabel
                : semanticLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            sortDirection: null == sortDirection
                ? _value.sortDirection
                : sortDirection // ignore: cast_nullable_to_non_nullable
                      as DSDataTableSortDirection,
            sortPriority: freezed == sortPriority
                ? _value.sortPriority
                : sortPriority // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableColumnImplCopyWith<$Res>
    implements $DSDataTableColumnCopyWith<$Res> {
  factory _$$DSDataTableColumnImplCopyWith(
    _$DSDataTableColumnImpl value,
    $Res Function(_$DSDataTableColumnImpl) then,
  ) = __$$DSDataTableColumnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String label,
    String field,
    double? width,
    double minWidth,
    double maxWidth,
    bool sortable,
    bool resizable,
    bool visible,
    bool pinned,
    DSDataTableColumnAlignment alignment,
    DSDataTableCellType cellType,
    bool editable,
    DSDataTableCellBuilder? cellBuilder,
    DSDataTableHeaderBuilder? headerBuilder,
    DSDataTableEditCellBuilder? editCellBuilder,
    DSDataTableCellValidator? validator,
    DSDataTableCellFormatter? formatter,
    String? tooltip,
    IconData? icon,
    bool hideable,
    Map<String, dynamic>? customData,
    String? semanticLabel,
    DSDataTableSortDirection sortDirection,
    int? sortPriority,
  });
}

/// @nodoc
class __$$DSDataTableColumnImplCopyWithImpl<$Res>
    extends _$DSDataTableColumnCopyWithImpl<$Res, _$DSDataTableColumnImpl>
    implements _$$DSDataTableColumnImplCopyWith<$Res> {
  __$$DSDataTableColumnImplCopyWithImpl(
    _$DSDataTableColumnImpl _value,
    $Res Function(_$DSDataTableColumnImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableColumn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? field = null,
    Object? width = freezed,
    Object? minWidth = null,
    Object? maxWidth = null,
    Object? sortable = null,
    Object? resizable = null,
    Object? visible = null,
    Object? pinned = null,
    Object? alignment = null,
    Object? cellType = null,
    Object? editable = null,
    Object? cellBuilder = freezed,
    Object? headerBuilder = freezed,
    Object? editCellBuilder = freezed,
    Object? validator = freezed,
    Object? formatter = freezed,
    Object? tooltip = freezed,
    Object? icon = freezed,
    Object? hideable = null,
    Object? customData = freezed,
    Object? semanticLabel = freezed,
    Object? sortDirection = null,
    Object? sortPriority = freezed,
  }) {
    return _then(
      _$DSDataTableColumnImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        field: null == field
            ? _value.field
            : field // ignore: cast_nullable_to_non_nullable
                  as String,
        width: freezed == width
            ? _value.width
            : width // ignore: cast_nullable_to_non_nullable
                  as double?,
        minWidth: null == minWidth
            ? _value.minWidth
            : minWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        maxWidth: null == maxWidth
            ? _value.maxWidth
            : maxWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        sortable: null == sortable
            ? _value.sortable
            : sortable // ignore: cast_nullable_to_non_nullable
                  as bool,
        resizable: null == resizable
            ? _value.resizable
            : resizable // ignore: cast_nullable_to_non_nullable
                  as bool,
        visible: null == visible
            ? _value.visible
            : visible // ignore: cast_nullable_to_non_nullable
                  as bool,
        pinned: null == pinned
            ? _value.pinned
            : pinned // ignore: cast_nullable_to_non_nullable
                  as bool,
        alignment: null == alignment
            ? _value.alignment
            : alignment // ignore: cast_nullable_to_non_nullable
                  as DSDataTableColumnAlignment,
        cellType: null == cellType
            ? _value.cellType
            : cellType // ignore: cast_nullable_to_non_nullable
                  as DSDataTableCellType,
        editable: null == editable
            ? _value.editable
            : editable // ignore: cast_nullable_to_non_nullable
                  as bool,
        cellBuilder: freezed == cellBuilder
            ? _value.cellBuilder
            : cellBuilder // ignore: cast_nullable_to_non_nullable
                  as DSDataTableCellBuilder?,
        headerBuilder: freezed == headerBuilder
            ? _value.headerBuilder
            : headerBuilder // ignore: cast_nullable_to_non_nullable
                  as DSDataTableHeaderBuilder?,
        editCellBuilder: freezed == editCellBuilder
            ? _value.editCellBuilder
            : editCellBuilder // ignore: cast_nullable_to_non_nullable
                  as DSDataTableEditCellBuilder?,
        validator: freezed == validator
            ? _value.validator
            : validator // ignore: cast_nullable_to_non_nullable
                  as DSDataTableCellValidator?,
        formatter: freezed == formatter
            ? _value.formatter
            : formatter // ignore: cast_nullable_to_non_nullable
                  as DSDataTableCellFormatter?,
        tooltip: freezed == tooltip
            ? _value.tooltip
            : tooltip // ignore: cast_nullable_to_non_nullable
                  as String?,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as IconData?,
        hideable: null == hideable
            ? _value.hideable
            : hideable // ignore: cast_nullable_to_non_nullable
                  as bool,
        customData: freezed == customData
            ? _value._customData
            : customData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        semanticLabel: freezed == semanticLabel
            ? _value.semanticLabel
            : semanticLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        sortDirection: null == sortDirection
            ? _value.sortDirection
            : sortDirection // ignore: cast_nullable_to_non_nullable
                  as DSDataTableSortDirection,
        sortPriority: freezed == sortPriority
            ? _value.sortPriority
            : sortPriority // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableColumnImpl extends _DSDataTableColumn {
  const _$DSDataTableColumnImpl({
    required this.id,
    required this.label,
    required this.field,
    this.width,
    this.minWidth = 50.0,
    this.maxWidth = 500.0,
    this.sortable = false,
    this.resizable = true,
    this.visible = true,
    this.pinned = false,
    this.alignment = DSDataTableColumnAlignment.left,
    this.cellType = DSDataTableCellType.text,
    this.editable = false,
    this.cellBuilder,
    this.headerBuilder,
    this.editCellBuilder,
    this.validator,
    this.formatter,
    this.tooltip,
    this.icon,
    this.hideable = true,
    final Map<String, dynamic>? customData,
    this.semanticLabel,
    this.sortDirection = DSDataTableSortDirection.none,
    this.sortPriority,
  }) : _customData = customData,
       super._();

  /// Unique identifier for the column
  @override
  final String id;

  /// Display label for the column header
  @override
  final String label;

  /// Data field name for row data access
  @override
  final String field;

  /// Column width (null for auto-sizing)
  @override
  final double? width;

  /// Minimum column width
  @override
  @JsonKey()
  final double minWidth;

  /// Maximum column width
  @override
  @JsonKey()
  final double maxWidth;

  /// Whether the column is sortable
  @override
  @JsonKey()
  final bool sortable;

  /// Whether the column is resizable
  @override
  @JsonKey()
  final bool resizable;

  /// Whether the column is visible
  @override
  @JsonKey()
  final bool visible;

  /// Whether the column is pinned (frozen)
  @override
  @JsonKey()
  final bool pinned;

  /// Column alignment
  @override
  @JsonKey()
  final DSDataTableColumnAlignment alignment;

  /// Cell type for this column
  @override
  @JsonKey()
  final DSDataTableCellType cellType;

  /// Whether cells in this column are editable
  @override
  @JsonKey()
  final bool editable;

  /// Custom cell builder
  @override
  final DSDataTableCellBuilder? cellBuilder;

  /// Custom header builder
  @override
  final DSDataTableHeaderBuilder? headerBuilder;

  /// Custom edit cell builder for inline editing
  @override
  final DSDataTableEditCellBuilder? editCellBuilder;

  /// Validator for cell values during editing
  @override
  final DSDataTableCellValidator? validator;

  /// Formatter for displaying cell values
  @override
  final DSDataTableCellFormatter? formatter;

  /// Tooltip for the column header
  @override
  final String? tooltip;

  /// Icon for the column header
  @override
  final IconData? icon;

  /// Whether this column can be hidden
  @override
  @JsonKey()
  final bool hideable;

  /// Custom data for the column
  final Map<String, dynamic>? _customData;

  /// Custom data for the column
  @override
  Map<String, dynamic>? get customData {
    final value = _customData;
    if (value == null) return null;
    if (_customData is EqualUnmodifiableMapView) return _customData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Accessibility label for the column
  @override
  final String? semanticLabel;

  /// Sort direction for this column
  @override
  @JsonKey()
  final DSDataTableSortDirection sortDirection;

  /// Sort priority (for multi-column sorting)
  @override
  final int? sortPriority;

  @override
  String toString() {
    return 'DSDataTableColumn(id: $id, label: $label, field: $field, width: $width, minWidth: $minWidth, maxWidth: $maxWidth, sortable: $sortable, resizable: $resizable, visible: $visible, pinned: $pinned, alignment: $alignment, cellType: $cellType, editable: $editable, cellBuilder: $cellBuilder, headerBuilder: $headerBuilder, editCellBuilder: $editCellBuilder, validator: $validator, formatter: $formatter, tooltip: $tooltip, icon: $icon, hideable: $hideable, customData: $customData, semanticLabel: $semanticLabel, sortDirection: $sortDirection, sortPriority: $sortPriority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableColumnImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.minWidth, minWidth) ||
                other.minWidth == minWidth) &&
            (identical(other.maxWidth, maxWidth) ||
                other.maxWidth == maxWidth) &&
            (identical(other.sortable, sortable) ||
                other.sortable == sortable) &&
            (identical(other.resizable, resizable) ||
                other.resizable == resizable) &&
            (identical(other.visible, visible) || other.visible == visible) &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            (identical(other.alignment, alignment) ||
                other.alignment == alignment) &&
            (identical(other.cellType, cellType) ||
                other.cellType == cellType) &&
            (identical(other.editable, editable) ||
                other.editable == editable) &&
            (identical(other.cellBuilder, cellBuilder) ||
                other.cellBuilder == cellBuilder) &&
            (identical(other.headerBuilder, headerBuilder) ||
                other.headerBuilder == headerBuilder) &&
            (identical(other.editCellBuilder, editCellBuilder) ||
                other.editCellBuilder == editCellBuilder) &&
            (identical(other.validator, validator) ||
                other.validator == validator) &&
            (identical(other.formatter, formatter) ||
                other.formatter == formatter) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.hideable, hideable) ||
                other.hideable == hideable) &&
            const DeepCollectionEquality().equals(
              other._customData,
              _customData,
            ) &&
            (identical(other.semanticLabel, semanticLabel) ||
                other.semanticLabel == semanticLabel) &&
            (identical(other.sortDirection, sortDirection) ||
                other.sortDirection == sortDirection) &&
            (identical(other.sortPriority, sortPriority) ||
                other.sortPriority == sortPriority));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    label,
    field,
    width,
    minWidth,
    maxWidth,
    sortable,
    resizable,
    visible,
    pinned,
    alignment,
    cellType,
    editable,
    cellBuilder,
    headerBuilder,
    editCellBuilder,
    validator,
    formatter,
    tooltip,
    icon,
    hideable,
    const DeepCollectionEquality().hash(_customData),
    semanticLabel,
    sortDirection,
    sortPriority,
  ]);

  /// Create a copy of DSDataTableColumn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableColumnImplCopyWith<_$DSDataTableColumnImpl> get copyWith =>
      __$$DSDataTableColumnImplCopyWithImpl<_$DSDataTableColumnImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDataTableColumn extends DSDataTableColumn {
  const factory _DSDataTableColumn({
    required final String id,
    required final String label,
    required final String field,
    final double? width,
    final double minWidth,
    final double maxWidth,
    final bool sortable,
    final bool resizable,
    final bool visible,
    final bool pinned,
    final DSDataTableColumnAlignment alignment,
    final DSDataTableCellType cellType,
    final bool editable,
    final DSDataTableCellBuilder? cellBuilder,
    final DSDataTableHeaderBuilder? headerBuilder,
    final DSDataTableEditCellBuilder? editCellBuilder,
    final DSDataTableCellValidator? validator,
    final DSDataTableCellFormatter? formatter,
    final String? tooltip,
    final IconData? icon,
    final bool hideable,
    final Map<String, dynamic>? customData,
    final String? semanticLabel,
    final DSDataTableSortDirection sortDirection,
    final int? sortPriority,
  }) = _$DSDataTableColumnImpl;
  const _DSDataTableColumn._() : super._();

  /// Unique identifier for the column
  @override
  String get id;

  /// Display label for the column header
  @override
  String get label;

  /// Data field name for row data access
  @override
  String get field;

  /// Column width (null for auto-sizing)
  @override
  double? get width;

  /// Minimum column width
  @override
  double get minWidth;

  /// Maximum column width
  @override
  double get maxWidth;

  /// Whether the column is sortable
  @override
  bool get sortable;

  /// Whether the column is resizable
  @override
  bool get resizable;

  /// Whether the column is visible
  @override
  bool get visible;

  /// Whether the column is pinned (frozen)
  @override
  bool get pinned;

  /// Column alignment
  @override
  DSDataTableColumnAlignment get alignment;

  /// Cell type for this column
  @override
  DSDataTableCellType get cellType;

  /// Whether cells in this column are editable
  @override
  bool get editable;

  /// Custom cell builder
  @override
  DSDataTableCellBuilder? get cellBuilder;

  /// Custom header builder
  @override
  DSDataTableHeaderBuilder? get headerBuilder;

  /// Custom edit cell builder for inline editing
  @override
  DSDataTableEditCellBuilder? get editCellBuilder;

  /// Validator for cell values during editing
  @override
  DSDataTableCellValidator? get validator;

  /// Formatter for displaying cell values
  @override
  DSDataTableCellFormatter? get formatter;

  /// Tooltip for the column header
  @override
  String? get tooltip;

  /// Icon for the column header
  @override
  IconData? get icon;

  /// Whether this column can be hidden
  @override
  bool get hideable;

  /// Custom data for the column
  @override
  Map<String, dynamic>? get customData;

  /// Accessibility label for the column
  @override
  String? get semanticLabel;

  /// Sort direction for this column
  @override
  DSDataTableSortDirection get sortDirection;

  /// Sort priority (for multi-column sorting)
  @override
  int? get sortPriority;

  /// Create a copy of DSDataTableColumn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableColumnImplCopyWith<_$DSDataTableColumnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableRow {
  /// Unique identifier for the row
  String get id => throw _privateConstructorUsedError;

  /// Row data (field -> value mapping)
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  /// Whether the row is selected
  bool get selected => throw _privateConstructorUsedError;

  /// Whether the row is disabled
  bool get disabled => throw _privateConstructorUsedError;

  /// Whether the row is visible
  bool get visible => throw _privateConstructorUsedError;

  /// Row state
  DSDataTableRowState get state => throw _privateConstructorUsedError;

  /// Custom row builder
  DSDataTableRowBuilder? get rowBuilder => throw _privateConstructorUsedError;

  /// Row height override
  double? get height => throw _privateConstructorUsedError;

  /// Row color override
  Color? get color => throw _privateConstructorUsedError;

  /// Whether the row is expanded (for expandable rows)
  bool get expanded => throw _privateConstructorUsedError;

  /// Expanded content widget
  Widget? get expandedContent => throw _privateConstructorUsedError;

  /// Custom data for the row
  Map<String, dynamic>? get customData => throw _privateConstructorUsedError;

  /// Accessibility label for the row
  String? get semanticLabel => throw _privateConstructorUsedError;

  /// Whether the row is currently being edited
  bool get isEditing => throw _privateConstructorUsedError;

  /// Which cells are currently being edited (column IDs)
  List<String> get editingCells => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableRowCopyWith<DSDataTableRow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableRowCopyWith<$Res> {
  factory $DSDataTableRowCopyWith(
    DSDataTableRow value,
    $Res Function(DSDataTableRow) then,
  ) = _$DSDataTableRowCopyWithImpl<$Res, DSDataTableRow>;
  @useResult
  $Res call({
    String id,
    Map<String, dynamic> data,
    bool selected,
    bool disabled,
    bool visible,
    DSDataTableRowState state,
    DSDataTableRowBuilder? rowBuilder,
    double? height,
    Color? color,
    bool expanded,
    Widget? expandedContent,
    Map<String, dynamic>? customData,
    String? semanticLabel,
    bool isEditing,
    List<String> editingCells,
  });
}

/// @nodoc
class _$DSDataTableRowCopyWithImpl<$Res, $Val extends DSDataTableRow>
    implements $DSDataTableRowCopyWith<$Res> {
  _$DSDataTableRowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
    Object? selected = null,
    Object? disabled = null,
    Object? visible = null,
    Object? state = null,
    Object? rowBuilder = freezed,
    Object? height = freezed,
    Object? color = freezed,
    Object? expanded = null,
    Object? expandedContent = freezed,
    Object? customData = freezed,
    Object? semanticLabel = freezed,
    Object? isEditing = null,
    Object? editingCells = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            selected: null == selected
                ? _value.selected
                : selected // ignore: cast_nullable_to_non_nullable
                      as bool,
            disabled: null == disabled
                ? _value.disabled
                : disabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            visible: null == visible
                ? _value.visible
                : visible // ignore: cast_nullable_to_non_nullable
                      as bool,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as DSDataTableRowState,
            rowBuilder: freezed == rowBuilder
                ? _value.rowBuilder
                : rowBuilder // ignore: cast_nullable_to_non_nullable
                      as DSDataTableRowBuilder?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double?,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as Color?,
            expanded: null == expanded
                ? _value.expanded
                : expanded // ignore: cast_nullable_to_non_nullable
                      as bool,
            expandedContent: freezed == expandedContent
                ? _value.expandedContent
                : expandedContent // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            customData: freezed == customData
                ? _value.customData
                : customData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            semanticLabel: freezed == semanticLabel
                ? _value.semanticLabel
                : semanticLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            isEditing: null == isEditing
                ? _value.isEditing
                : isEditing // ignore: cast_nullable_to_non_nullable
                      as bool,
            editingCells: null == editingCells
                ? _value.editingCells
                : editingCells // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableRowImplCopyWith<$Res>
    implements $DSDataTableRowCopyWith<$Res> {
  factory _$$DSDataTableRowImplCopyWith(
    _$DSDataTableRowImpl value,
    $Res Function(_$DSDataTableRowImpl) then,
  ) = __$$DSDataTableRowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    Map<String, dynamic> data,
    bool selected,
    bool disabled,
    bool visible,
    DSDataTableRowState state,
    DSDataTableRowBuilder? rowBuilder,
    double? height,
    Color? color,
    bool expanded,
    Widget? expandedContent,
    Map<String, dynamic>? customData,
    String? semanticLabel,
    bool isEditing,
    List<String> editingCells,
  });
}

/// @nodoc
class __$$DSDataTableRowImplCopyWithImpl<$Res>
    extends _$DSDataTableRowCopyWithImpl<$Res, _$DSDataTableRowImpl>
    implements _$$DSDataTableRowImplCopyWith<$Res> {
  __$$DSDataTableRowImplCopyWithImpl(
    _$DSDataTableRowImpl _value,
    $Res Function(_$DSDataTableRowImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableRow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? data = null,
    Object? selected = null,
    Object? disabled = null,
    Object? visible = null,
    Object? state = null,
    Object? rowBuilder = freezed,
    Object? height = freezed,
    Object? color = freezed,
    Object? expanded = null,
    Object? expandedContent = freezed,
    Object? customData = freezed,
    Object? semanticLabel = freezed,
    Object? isEditing = null,
    Object? editingCells = null,
  }) {
    return _then(
      _$DSDataTableRowImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        selected: null == selected
            ? _value.selected
            : selected // ignore: cast_nullable_to_non_nullable
                  as bool,
        disabled: null == disabled
            ? _value.disabled
            : disabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        visible: null == visible
            ? _value.visible
            : visible // ignore: cast_nullable_to_non_nullable
                  as bool,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as DSDataTableRowState,
        rowBuilder: freezed == rowBuilder
            ? _value.rowBuilder
            : rowBuilder // ignore: cast_nullable_to_non_nullable
                  as DSDataTableRowBuilder?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double?,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as Color?,
        expanded: null == expanded
            ? _value.expanded
            : expanded // ignore: cast_nullable_to_non_nullable
                  as bool,
        expandedContent: freezed == expandedContent
            ? _value.expandedContent
            : expandedContent // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        customData: freezed == customData
            ? _value._customData
            : customData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        semanticLabel: freezed == semanticLabel
            ? _value.semanticLabel
            : semanticLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        isEditing: null == isEditing
            ? _value.isEditing
            : isEditing // ignore: cast_nullable_to_non_nullable
                  as bool,
        editingCells: null == editingCells
            ? _value._editingCells
            : editingCells // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableRowImpl extends _DSDataTableRow {
  const _$DSDataTableRowImpl({
    required this.id,
    required final Map<String, dynamic> data,
    this.selected = false,
    this.disabled = false,
    this.visible = true,
    this.state = DSDataTableRowState.normal,
    this.rowBuilder,
    this.height,
    this.color,
    this.expanded = false,
    this.expandedContent,
    final Map<String, dynamic>? customData,
    this.semanticLabel,
    this.isEditing = false,
    final List<String> editingCells = const [],
  }) : _data = data,
       _customData = customData,
       _editingCells = editingCells,
       super._();

  /// Unique identifier for the row
  @override
  final String id;

  /// Row data (field -> value mapping)
  final Map<String, dynamic> _data;

  /// Row data (field -> value mapping)
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  /// Whether the row is selected
  @override
  @JsonKey()
  final bool selected;

  /// Whether the row is disabled
  @override
  @JsonKey()
  final bool disabled;

  /// Whether the row is visible
  @override
  @JsonKey()
  final bool visible;

  /// Row state
  @override
  @JsonKey()
  final DSDataTableRowState state;

  /// Custom row builder
  @override
  final DSDataTableRowBuilder? rowBuilder;

  /// Row height override
  @override
  final double? height;

  /// Row color override
  @override
  final Color? color;

  /// Whether the row is expanded (for expandable rows)
  @override
  @JsonKey()
  final bool expanded;

  /// Expanded content widget
  @override
  final Widget? expandedContent;

  /// Custom data for the row
  final Map<String, dynamic>? _customData;

  /// Custom data for the row
  @override
  Map<String, dynamic>? get customData {
    final value = _customData;
    if (value == null) return null;
    if (_customData is EqualUnmodifiableMapView) return _customData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Accessibility label for the row
  @override
  final String? semanticLabel;

  /// Whether the row is currently being edited
  @override
  @JsonKey()
  final bool isEditing;

  /// Which cells are currently being edited (column IDs)
  final List<String> _editingCells;

  /// Which cells are currently being edited (column IDs)
  @override
  @JsonKey()
  List<String> get editingCells {
    if (_editingCells is EqualUnmodifiableListView) return _editingCells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editingCells);
  }

  @override
  String toString() {
    return 'DSDataTableRow(id: $id, data: $data, selected: $selected, disabled: $disabled, visible: $visible, state: $state, rowBuilder: $rowBuilder, height: $height, color: $color, expanded: $expanded, expandedContent: $expandedContent, customData: $customData, semanticLabel: $semanticLabel, isEditing: $isEditing, editingCells: $editingCells)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableRowImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            (identical(other.visible, visible) || other.visible == visible) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.rowBuilder, rowBuilder) ||
                other.rowBuilder == rowBuilder) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.expanded, expanded) ||
                other.expanded == expanded) &&
            (identical(other.expandedContent, expandedContent) ||
                other.expandedContent == expandedContent) &&
            const DeepCollectionEquality().equals(
              other._customData,
              _customData,
            ) &&
            (identical(other.semanticLabel, semanticLabel) ||
                other.semanticLabel == semanticLabel) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            const DeepCollectionEquality().equals(
              other._editingCells,
              _editingCells,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_data),
    selected,
    disabled,
    visible,
    state,
    rowBuilder,
    height,
    color,
    expanded,
    expandedContent,
    const DeepCollectionEquality().hash(_customData),
    semanticLabel,
    isEditing,
    const DeepCollectionEquality().hash(_editingCells),
  );

  /// Create a copy of DSDataTableRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableRowImplCopyWith<_$DSDataTableRowImpl> get copyWith =>
      __$$DSDataTableRowImplCopyWithImpl<_$DSDataTableRowImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDataTableRow extends DSDataTableRow {
  const factory _DSDataTableRow({
    required final String id,
    required final Map<String, dynamic> data,
    final bool selected,
    final bool disabled,
    final bool visible,
    final DSDataTableRowState state,
    final DSDataTableRowBuilder? rowBuilder,
    final double? height,
    final Color? color,
    final bool expanded,
    final Widget? expandedContent,
    final Map<String, dynamic>? customData,
    final String? semanticLabel,
    final bool isEditing,
    final List<String> editingCells,
  }) = _$DSDataTableRowImpl;
  const _DSDataTableRow._() : super._();

  /// Unique identifier for the row
  @override
  String get id;

  /// Row data (field -> value mapping)
  @override
  Map<String, dynamic> get data;

  /// Whether the row is selected
  @override
  bool get selected;

  /// Whether the row is disabled
  @override
  bool get disabled;

  /// Whether the row is visible
  @override
  bool get visible;

  /// Row state
  @override
  DSDataTableRowState get state;

  /// Custom row builder
  @override
  DSDataTableRowBuilder? get rowBuilder;

  /// Row height override
  @override
  double? get height;

  /// Row color override
  @override
  Color? get color;

  /// Whether the row is expanded (for expandable rows)
  @override
  bool get expanded;

  /// Expanded content widget
  @override
  Widget? get expandedContent;

  /// Custom data for the row
  @override
  Map<String, dynamic>? get customData;

  /// Accessibility label for the row
  @override
  String? get semanticLabel;

  /// Whether the row is currently being edited
  @override
  bool get isEditing;

  /// Which cells are currently being edited (column IDs)
  @override
  List<String> get editingCells;

  /// Create a copy of DSDataTableRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableRowImplCopyWith<_$DSDataTableRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableSelection {
  /// Selection mode
  DSDataTableSelectionMode get mode => throw _privateConstructorUsedError;

  /// Selected row IDs
  List<String> get selectedRows => throw _privateConstructorUsedError;

  /// Whether to show selection checkboxes
  bool get showCheckboxes => throw _privateConstructorUsedError;

  /// Whether to allow select all
  bool get allowSelectAll => throw _privateConstructorUsedError;

  /// Maximum number of selections (null for unlimited)
  int? get maxSelections => throw _privateConstructorUsedError;

  /// Callback when selection changes
  DSDataTableSelectionCallback? get onSelectionChanged =>
      throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableSelectionCopyWith<DSDataTableSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableSelectionCopyWith<$Res> {
  factory $DSDataTableSelectionCopyWith(
    DSDataTableSelection value,
    $Res Function(DSDataTableSelection) then,
  ) = _$DSDataTableSelectionCopyWithImpl<$Res, DSDataTableSelection>;
  @useResult
  $Res call({
    DSDataTableSelectionMode mode,
    List<String> selectedRows,
    bool showCheckboxes,
    bool allowSelectAll,
    int? maxSelections,
    DSDataTableSelectionCallback? onSelectionChanged,
  });
}

/// @nodoc
class _$DSDataTableSelectionCopyWithImpl<
  $Res,
  $Val extends DSDataTableSelection
>
    implements $DSDataTableSelectionCopyWith<$Res> {
  _$DSDataTableSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? selectedRows = null,
    Object? showCheckboxes = null,
    Object? allowSelectAll = null,
    Object? maxSelections = freezed,
    Object? onSelectionChanged = freezed,
  }) {
    return _then(
      _value.copyWith(
            mode: null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                      as DSDataTableSelectionMode,
            selectedRows: null == selectedRows
                ? _value.selectedRows
                : selectedRows // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            showCheckboxes: null == showCheckboxes
                ? _value.showCheckboxes
                : showCheckboxes // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowSelectAll: null == allowSelectAll
                ? _value.allowSelectAll
                : allowSelectAll // ignore: cast_nullable_to_non_nullable
                      as bool,
            maxSelections: freezed == maxSelections
                ? _value.maxSelections
                : maxSelections // ignore: cast_nullable_to_non_nullable
                      as int?,
            onSelectionChanged: freezed == onSelectionChanged
                ? _value.onSelectionChanged
                : onSelectionChanged // ignore: cast_nullable_to_non_nullable
                      as DSDataTableSelectionCallback?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableSelectionImplCopyWith<$Res>
    implements $DSDataTableSelectionCopyWith<$Res> {
  factory _$$DSDataTableSelectionImplCopyWith(
    _$DSDataTableSelectionImpl value,
    $Res Function(_$DSDataTableSelectionImpl) then,
  ) = __$$DSDataTableSelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSDataTableSelectionMode mode,
    List<String> selectedRows,
    bool showCheckboxes,
    bool allowSelectAll,
    int? maxSelections,
    DSDataTableSelectionCallback? onSelectionChanged,
  });
}

/// @nodoc
class __$$DSDataTableSelectionImplCopyWithImpl<$Res>
    extends _$DSDataTableSelectionCopyWithImpl<$Res, _$DSDataTableSelectionImpl>
    implements _$$DSDataTableSelectionImplCopyWith<$Res> {
  __$$DSDataTableSelectionImplCopyWithImpl(
    _$DSDataTableSelectionImpl _value,
    $Res Function(_$DSDataTableSelectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableSelection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? selectedRows = null,
    Object? showCheckboxes = null,
    Object? allowSelectAll = null,
    Object? maxSelections = freezed,
    Object? onSelectionChanged = freezed,
  }) {
    return _then(
      _$DSDataTableSelectionImpl(
        mode: null == mode
            ? _value.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as DSDataTableSelectionMode,
        selectedRows: null == selectedRows
            ? _value._selectedRows
            : selectedRows // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        showCheckboxes: null == showCheckboxes
            ? _value.showCheckboxes
            : showCheckboxes // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowSelectAll: null == allowSelectAll
            ? _value.allowSelectAll
            : allowSelectAll // ignore: cast_nullable_to_non_nullable
                  as bool,
        maxSelections: freezed == maxSelections
            ? _value.maxSelections
            : maxSelections // ignore: cast_nullable_to_non_nullable
                  as int?,
        onSelectionChanged: freezed == onSelectionChanged
            ? _value.onSelectionChanged
            : onSelectionChanged // ignore: cast_nullable_to_non_nullable
                  as DSDataTableSelectionCallback?,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableSelectionImpl implements _DSDataTableSelection {
  const _$DSDataTableSelectionImpl({
    this.mode = DSDataTableSelectionMode.none,
    final List<String> selectedRows = const [],
    this.showCheckboxes = true,
    this.allowSelectAll = true,
    this.maxSelections,
    this.onSelectionChanged,
  }) : _selectedRows = selectedRows;

  /// Selection mode
  @override
  @JsonKey()
  final DSDataTableSelectionMode mode;

  /// Selected row IDs
  final List<String> _selectedRows;

  /// Selected row IDs
  @override
  @JsonKey()
  List<String> get selectedRows {
    if (_selectedRows is EqualUnmodifiableListView) return _selectedRows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedRows);
  }

  /// Whether to show selection checkboxes
  @override
  @JsonKey()
  final bool showCheckboxes;

  /// Whether to allow select all
  @override
  @JsonKey()
  final bool allowSelectAll;

  /// Maximum number of selections (null for unlimited)
  @override
  final int? maxSelections;

  /// Callback when selection changes
  @override
  final DSDataTableSelectionCallback? onSelectionChanged;

  @override
  String toString() {
    return 'DSDataTableSelection(mode: $mode, selectedRows: $selectedRows, showCheckboxes: $showCheckboxes, allowSelectAll: $allowSelectAll, maxSelections: $maxSelections, onSelectionChanged: $onSelectionChanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableSelectionImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            const DeepCollectionEquality().equals(
              other._selectedRows,
              _selectedRows,
            ) &&
            (identical(other.showCheckboxes, showCheckboxes) ||
                other.showCheckboxes == showCheckboxes) &&
            (identical(other.allowSelectAll, allowSelectAll) ||
                other.allowSelectAll == allowSelectAll) &&
            (identical(other.maxSelections, maxSelections) ||
                other.maxSelections == maxSelections) &&
            (identical(other.onSelectionChanged, onSelectionChanged) ||
                other.onSelectionChanged == onSelectionChanged));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    mode,
    const DeepCollectionEquality().hash(_selectedRows),
    showCheckboxes,
    allowSelectAll,
    maxSelections,
    onSelectionChanged,
  );

  /// Create a copy of DSDataTableSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableSelectionImplCopyWith<_$DSDataTableSelectionImpl>
  get copyWith =>
      __$$DSDataTableSelectionImplCopyWithImpl<_$DSDataTableSelectionImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDataTableSelection implements DSDataTableSelection {
  const factory _DSDataTableSelection({
    final DSDataTableSelectionMode mode,
    final List<String> selectedRows,
    final bool showCheckboxes,
    final bool allowSelectAll,
    final int? maxSelections,
    final DSDataTableSelectionCallback? onSelectionChanged,
  }) = _$DSDataTableSelectionImpl;

  /// Selection mode
  @override
  DSDataTableSelectionMode get mode;

  /// Selected row IDs
  @override
  List<String> get selectedRows;

  /// Whether to show selection checkboxes
  @override
  bool get showCheckboxes;

  /// Whether to allow select all
  @override
  bool get allowSelectAll;

  /// Maximum number of selections (null for unlimited)
  @override
  int? get maxSelections;

  /// Callback when selection changes
  @override
  DSDataTableSelectionCallback? get onSelectionChanged;

  /// Create a copy of DSDataTableSelection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableSelectionImplCopyWith<_$DSDataTableSelectionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableSort {
  /// Column ID being sorted
  String? get columnId => throw _privateConstructorUsedError;

  /// Sort direction
  DSDataTableSortDirection get direction => throw _privateConstructorUsedError;

  /// Whether multi-column sorting is enabled
  bool get multiColumn => throw _privateConstructorUsedError;

  /// Sort configurations for multi-column sorting
  List<DSDataTableSortItem> get sortItems => throw _privateConstructorUsedError;

  /// Callback when sort changes
  DSDataTableSortCallback? get onSortChanged =>
      throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableSort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableSortCopyWith<DSDataTableSort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableSortCopyWith<$Res> {
  factory $DSDataTableSortCopyWith(
    DSDataTableSort value,
    $Res Function(DSDataTableSort) then,
  ) = _$DSDataTableSortCopyWithImpl<$Res, DSDataTableSort>;
  @useResult
  $Res call({
    String? columnId,
    DSDataTableSortDirection direction,
    bool multiColumn,
    List<DSDataTableSortItem> sortItems,
    DSDataTableSortCallback? onSortChanged,
  });
}

/// @nodoc
class _$DSDataTableSortCopyWithImpl<$Res, $Val extends DSDataTableSort>
    implements $DSDataTableSortCopyWith<$Res> {
  _$DSDataTableSortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableSort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columnId = freezed,
    Object? direction = null,
    Object? multiColumn = null,
    Object? sortItems = null,
    Object? onSortChanged = freezed,
  }) {
    return _then(
      _value.copyWith(
            columnId: freezed == columnId
                ? _value.columnId
                : columnId // ignore: cast_nullable_to_non_nullable
                      as String?,
            direction: null == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as DSDataTableSortDirection,
            multiColumn: null == multiColumn
                ? _value.multiColumn
                : multiColumn // ignore: cast_nullable_to_non_nullable
                      as bool,
            sortItems: null == sortItems
                ? _value.sortItems
                : sortItems // ignore: cast_nullable_to_non_nullable
                      as List<DSDataTableSortItem>,
            onSortChanged: freezed == onSortChanged
                ? _value.onSortChanged
                : onSortChanged // ignore: cast_nullable_to_non_nullable
                      as DSDataTableSortCallback?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableSortImplCopyWith<$Res>
    implements $DSDataTableSortCopyWith<$Res> {
  factory _$$DSDataTableSortImplCopyWith(
    _$DSDataTableSortImpl value,
    $Res Function(_$DSDataTableSortImpl) then,
  ) = __$$DSDataTableSortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? columnId,
    DSDataTableSortDirection direction,
    bool multiColumn,
    List<DSDataTableSortItem> sortItems,
    DSDataTableSortCallback? onSortChanged,
  });
}

/// @nodoc
class __$$DSDataTableSortImplCopyWithImpl<$Res>
    extends _$DSDataTableSortCopyWithImpl<$Res, _$DSDataTableSortImpl>
    implements _$$DSDataTableSortImplCopyWith<$Res> {
  __$$DSDataTableSortImplCopyWithImpl(
    _$DSDataTableSortImpl _value,
    $Res Function(_$DSDataTableSortImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableSort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columnId = freezed,
    Object? direction = null,
    Object? multiColumn = null,
    Object? sortItems = null,
    Object? onSortChanged = freezed,
  }) {
    return _then(
      _$DSDataTableSortImpl(
        columnId: freezed == columnId
            ? _value.columnId
            : columnId // ignore: cast_nullable_to_non_nullable
                  as String?,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as DSDataTableSortDirection,
        multiColumn: null == multiColumn
            ? _value.multiColumn
            : multiColumn // ignore: cast_nullable_to_non_nullable
                  as bool,
        sortItems: null == sortItems
            ? _value._sortItems
            : sortItems // ignore: cast_nullable_to_non_nullable
                  as List<DSDataTableSortItem>,
        onSortChanged: freezed == onSortChanged
            ? _value.onSortChanged
            : onSortChanged // ignore: cast_nullable_to_non_nullable
                  as DSDataTableSortCallback?,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableSortImpl implements _DSDataTableSort {
  const _$DSDataTableSortImpl({
    this.columnId,
    this.direction = DSDataTableSortDirection.none,
    this.multiColumn = false,
    final List<DSDataTableSortItem> sortItems = const [],
    this.onSortChanged,
  }) : _sortItems = sortItems;

  /// Column ID being sorted
  @override
  final String? columnId;

  /// Sort direction
  @override
  @JsonKey()
  final DSDataTableSortDirection direction;

  /// Whether multi-column sorting is enabled
  @override
  @JsonKey()
  final bool multiColumn;

  /// Sort configurations for multi-column sorting
  final List<DSDataTableSortItem> _sortItems;

  /// Sort configurations for multi-column sorting
  @override
  @JsonKey()
  List<DSDataTableSortItem> get sortItems {
    if (_sortItems is EqualUnmodifiableListView) return _sortItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sortItems);
  }

  /// Callback when sort changes
  @override
  final DSDataTableSortCallback? onSortChanged;

  @override
  String toString() {
    return 'DSDataTableSort(columnId: $columnId, direction: $direction, multiColumn: $multiColumn, sortItems: $sortItems, onSortChanged: $onSortChanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableSortImpl &&
            (identical(other.columnId, columnId) ||
                other.columnId == columnId) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.multiColumn, multiColumn) ||
                other.multiColumn == multiColumn) &&
            const DeepCollectionEquality().equals(
              other._sortItems,
              _sortItems,
            ) &&
            (identical(other.onSortChanged, onSortChanged) ||
                other.onSortChanged == onSortChanged));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    columnId,
    direction,
    multiColumn,
    const DeepCollectionEquality().hash(_sortItems),
    onSortChanged,
  );

  /// Create a copy of DSDataTableSort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableSortImplCopyWith<_$DSDataTableSortImpl> get copyWith =>
      __$$DSDataTableSortImplCopyWithImpl<_$DSDataTableSortImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDataTableSort implements DSDataTableSort {
  const factory _DSDataTableSort({
    final String? columnId,
    final DSDataTableSortDirection direction,
    final bool multiColumn,
    final List<DSDataTableSortItem> sortItems,
    final DSDataTableSortCallback? onSortChanged,
  }) = _$DSDataTableSortImpl;

  /// Column ID being sorted
  @override
  String? get columnId;

  /// Sort direction
  @override
  DSDataTableSortDirection get direction;

  /// Whether multi-column sorting is enabled
  @override
  bool get multiColumn;

  /// Sort configurations for multi-column sorting
  @override
  List<DSDataTableSortItem> get sortItems;

  /// Callback when sort changes
  @override
  DSDataTableSortCallback? get onSortChanged;

  /// Create a copy of DSDataTableSort
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableSortImplCopyWith<_$DSDataTableSortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableSortItem {
  String get columnId => throw _privateConstructorUsedError;
  DSDataTableSortDirection get direction => throw _privateConstructorUsedError;
  int get priority => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableSortItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableSortItemCopyWith<DSDataTableSortItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableSortItemCopyWith<$Res> {
  factory $DSDataTableSortItemCopyWith(
    DSDataTableSortItem value,
    $Res Function(DSDataTableSortItem) then,
  ) = _$DSDataTableSortItemCopyWithImpl<$Res, DSDataTableSortItem>;
  @useResult
  $Res call({
    String columnId,
    DSDataTableSortDirection direction,
    int priority,
  });
}

/// @nodoc
class _$DSDataTableSortItemCopyWithImpl<$Res, $Val extends DSDataTableSortItem>
    implements $DSDataTableSortItemCopyWith<$Res> {
  _$DSDataTableSortItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableSortItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columnId = null,
    Object? direction = null,
    Object? priority = null,
  }) {
    return _then(
      _value.copyWith(
            columnId: null == columnId
                ? _value.columnId
                : columnId // ignore: cast_nullable_to_non_nullable
                      as String,
            direction: null == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as DSDataTableSortDirection,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableSortItemImplCopyWith<$Res>
    implements $DSDataTableSortItemCopyWith<$Res> {
  factory _$$DSDataTableSortItemImplCopyWith(
    _$DSDataTableSortItemImpl value,
    $Res Function(_$DSDataTableSortItemImpl) then,
  ) = __$$DSDataTableSortItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String columnId,
    DSDataTableSortDirection direction,
    int priority,
  });
}

/// @nodoc
class __$$DSDataTableSortItemImplCopyWithImpl<$Res>
    extends _$DSDataTableSortItemCopyWithImpl<$Res, _$DSDataTableSortItemImpl>
    implements _$$DSDataTableSortItemImplCopyWith<$Res> {
  __$$DSDataTableSortItemImplCopyWithImpl(
    _$DSDataTableSortItemImpl _value,
    $Res Function(_$DSDataTableSortItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableSortItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columnId = null,
    Object? direction = null,
    Object? priority = null,
  }) {
    return _then(
      _$DSDataTableSortItemImpl(
        columnId: null == columnId
            ? _value.columnId
            : columnId // ignore: cast_nullable_to_non_nullable
                  as String,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as DSDataTableSortDirection,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableSortItemImpl implements _DSDataTableSortItem {
  const _$DSDataTableSortItemImpl({
    required this.columnId,
    required this.direction,
    required this.priority,
  });

  @override
  final String columnId;
  @override
  final DSDataTableSortDirection direction;
  @override
  final int priority;

  @override
  String toString() {
    return 'DSDataTableSortItem(columnId: $columnId, direction: $direction, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableSortItemImpl &&
            (identical(other.columnId, columnId) ||
                other.columnId == columnId) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.priority, priority) ||
                other.priority == priority));
  }

  @override
  int get hashCode => Object.hash(runtimeType, columnId, direction, priority);

  /// Create a copy of DSDataTableSortItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableSortItemImplCopyWith<_$DSDataTableSortItemImpl> get copyWith =>
      __$$DSDataTableSortItemImplCopyWithImpl<_$DSDataTableSortItemImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDataTableSortItem implements DSDataTableSortItem {
  const factory _DSDataTableSortItem({
    required final String columnId,
    required final DSDataTableSortDirection direction,
    required final int priority,
  }) = _$DSDataTableSortItemImpl;

  @override
  String get columnId;
  @override
  DSDataTableSortDirection get direction;
  @override
  int get priority;

  /// Create a copy of DSDataTableSortItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableSortItemImplCopyWith<_$DSDataTableSortItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableEmptyState {
  /// Empty state message
  String get message => throw _privateConstructorUsedError;

  /// Empty state icon
  IconData? get icon => throw _privateConstructorUsedError;

  /// Empty state illustration widget
  Widget? get illustration => throw _privateConstructorUsedError;

  /// Action button for empty state
  Widget? get action => throw _privateConstructorUsedError;

  /// Whether to show empty state
  bool get show => throw _privateConstructorUsedError;

  /// Custom empty state builder
  DSDataTableEmptyStateBuilder? get builder =>
      throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableEmptyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableEmptyStateCopyWith<DSDataTableEmptyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableEmptyStateCopyWith<$Res> {
  factory $DSDataTableEmptyStateCopyWith(
    DSDataTableEmptyState value,
    $Res Function(DSDataTableEmptyState) then,
  ) = _$DSDataTableEmptyStateCopyWithImpl<$Res, DSDataTableEmptyState>;
  @useResult
  $Res call({
    String message,
    IconData? icon,
    Widget? illustration,
    Widget? action,
    bool show,
    DSDataTableEmptyStateBuilder? builder,
  });
}

/// @nodoc
class _$DSDataTableEmptyStateCopyWithImpl<
  $Res,
  $Val extends DSDataTableEmptyState
>
    implements $DSDataTableEmptyStateCopyWith<$Res> {
  _$DSDataTableEmptyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableEmptyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? icon = freezed,
    Object? illustration = freezed,
    Object? action = freezed,
    Object? show = null,
    Object? builder = freezed,
  }) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as IconData?,
            illustration: freezed == illustration
                ? _value.illustration
                : illustration // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            action: freezed == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            show: null == show
                ? _value.show
                : show // ignore: cast_nullable_to_non_nullable
                      as bool,
            builder: freezed == builder
                ? _value.builder
                : builder // ignore: cast_nullable_to_non_nullable
                      as DSDataTableEmptyStateBuilder?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableEmptyStateImplCopyWith<$Res>
    implements $DSDataTableEmptyStateCopyWith<$Res> {
  factory _$$DSDataTableEmptyStateImplCopyWith(
    _$DSDataTableEmptyStateImpl value,
    $Res Function(_$DSDataTableEmptyStateImpl) then,
  ) = __$$DSDataTableEmptyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    IconData? icon,
    Widget? illustration,
    Widget? action,
    bool show,
    DSDataTableEmptyStateBuilder? builder,
  });
}

/// @nodoc
class __$$DSDataTableEmptyStateImplCopyWithImpl<$Res>
    extends
        _$DSDataTableEmptyStateCopyWithImpl<$Res, _$DSDataTableEmptyStateImpl>
    implements _$$DSDataTableEmptyStateImplCopyWith<$Res> {
  __$$DSDataTableEmptyStateImplCopyWithImpl(
    _$DSDataTableEmptyStateImpl _value,
    $Res Function(_$DSDataTableEmptyStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableEmptyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? icon = freezed,
    Object? illustration = freezed,
    Object? action = freezed,
    Object? show = null,
    Object? builder = freezed,
  }) {
    return _then(
      _$DSDataTableEmptyStateImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as IconData?,
        illustration: freezed == illustration
            ? _value.illustration
            : illustration // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        action: freezed == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        show: null == show
            ? _value.show
            : show // ignore: cast_nullable_to_non_nullable
                  as bool,
        builder: freezed == builder
            ? _value.builder
            : builder // ignore: cast_nullable_to_non_nullable
                  as DSDataTableEmptyStateBuilder?,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableEmptyStateImpl implements _DSDataTableEmptyState {
  const _$DSDataTableEmptyStateImpl({
    this.message = 'No data available',
    this.icon,
    this.illustration,
    this.action,
    this.show = true,
    this.builder,
  });

  /// Empty state message
  @override
  @JsonKey()
  final String message;

  /// Empty state icon
  @override
  final IconData? icon;

  /// Empty state illustration widget
  @override
  final Widget? illustration;

  /// Action button for empty state
  @override
  final Widget? action;

  /// Whether to show empty state
  @override
  @JsonKey()
  final bool show;

  /// Custom empty state builder
  @override
  final DSDataTableEmptyStateBuilder? builder;

  @override
  String toString() {
    return 'DSDataTableEmptyState(message: $message, icon: $icon, illustration: $illustration, action: $action, show: $show, builder: $builder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableEmptyStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.illustration, illustration) ||
                other.illustration == illustration) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.show, show) || other.show == show) &&
            (identical(other.builder, builder) || other.builder == builder));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    message,
    icon,
    illustration,
    action,
    show,
    builder,
  );

  /// Create a copy of DSDataTableEmptyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableEmptyStateImplCopyWith<_$DSDataTableEmptyStateImpl>
  get copyWith =>
      __$$DSDataTableEmptyStateImplCopyWithImpl<_$DSDataTableEmptyStateImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDataTableEmptyState implements DSDataTableEmptyState {
  const factory _DSDataTableEmptyState({
    final String message,
    final IconData? icon,
    final Widget? illustration,
    final Widget? action,
    final bool show,
    final DSDataTableEmptyStateBuilder? builder,
  }) = _$DSDataTableEmptyStateImpl;

  /// Empty state message
  @override
  String get message;

  /// Empty state icon
  @override
  IconData? get icon;

  /// Empty state illustration widget
  @override
  Widget? get illustration;

  /// Action button for empty state
  @override
  Widget? get action;

  /// Whether to show empty state
  @override
  bool get show;

  /// Custom empty state builder
  @override
  DSDataTableEmptyStateBuilder? get builder;

  /// Create a copy of DSDataTableEmptyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableEmptyStateImplCopyWith<_$DSDataTableEmptyStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableConfig {
  /// Table variant
  DSDataTableVariant get variant => throw _privateConstructorUsedError;

  /// Whether to show column headers
  bool get showHeaders => throw _privateConstructorUsedError;

  /// Whether to show row dividers
  bool get showRowDividers => throw _privateConstructorUsedError;

  /// Whether to show column dividers
  bool get showColumnDividers => throw _privateConstructorUsedError;

  /// Whether to alternate row colors
  bool get alternateRowColors => throw _privateConstructorUsedError;

  /// Whether to show hover effects
  bool get showHoverEffects => throw _privateConstructorUsedError;

  /// Table border radius
  double get borderRadius => throw _privateConstructorUsedError;

  /// Row height
  double get rowHeight => throw _privateConstructorUsedError;

  /// Header height
  double get headerHeight => throw _privateConstructorUsedError;

  /// Cell padding
  EdgeInsets get cellPadding => throw _privateConstructorUsedError;

  /// Header padding
  EdgeInsets get headerPadding => throw _privateConstructorUsedError;

  /// Table elevation
  double get elevation => throw _privateConstructorUsedError;

  /// Maximum table height (null for unlimited)
  double? get maxHeight => throw _privateConstructorUsedError;

  /// Minimum table height
  double get minHeight => throw _privateConstructorUsedError;

  /// Whether the table is scrollable horizontally
  bool get horizontalScrollable => throw _privateConstructorUsedError;

  /// Whether the table is scrollable vertically
  bool get verticalScrollable => throw _privateConstructorUsedError;

  /// Resize configuration
  DSDataTableResizeConfig? get resizeConfig =>
      throw _privateConstructorUsedError;

  /// Freeze configuration for pinned columns
  DSDataTableFreezeConfig? get freezeConfig =>
      throw _privateConstructorUsedError;

  /// Edit mode configuration
  DSDataTableEditMode get editMode => throw _privateConstructorUsedError;

  /// Whether to show loading state
  bool get showLoading => throw _privateConstructorUsedError;

  /// Whether to show skeleton state
  bool get showSkeleton => throw _privateConstructorUsedError;

  /// Number of skeleton rows to show
  int get skeletonRowCount => throw _privateConstructorUsedError;

  /// Loading indicator widget
  Widget? get loadingIndicator => throw _privateConstructorUsedError;

  /// Skeleton row builder
  DSDataTableSkeletonBuilder? get skeletonBuilder =>
      throw _privateConstructorUsedError;

  /// Animation duration for state changes
  Duration get animationDuration => throw _privateConstructorUsedError;

  /// Animation curve for state changes
  Curve get animationCurve => throw _privateConstructorUsedError;

  /// Whether to enable keyboard navigation
  bool get enableKeyboardNavigation => throw _privateConstructorUsedError;

  /// Whether to enable accessibility features
  bool get enableAccessibility => throw _privateConstructorUsedError;

  /// Custom row actions
  List<DSDataTableRowAction>? get rowActions =>
      throw _privateConstructorUsedError;

  /// Bulk actions for selected rows
  List<DSDataTableBulkAction>? get bulkActions =>
      throw _privateConstructorUsedError;

  /// Context menu items
  List<DSDataTableContextMenuItem>? get contextMenuItems =>
      throw _privateConstructorUsedError;

  /// Custom header actions
  List<Widget>? get headerActions => throw _privateConstructorUsedError;

  /// Footer widget
  Widget? get footer => throw _privateConstructorUsedError;

  /// Whether to show row numbers
  bool get showRowNumbers => throw _privateConstructorUsedError;

  /// Row number column width
  double get rowNumberWidth => throw _privateConstructorUsedError;

  /// Whether to enable drag and drop for rows
  bool get enableDragAndDrop => throw _privateConstructorUsedError;

  /// Drag and drop callback
  DSDataTableDragDropCallback? get onDragDrop =>
      throw _privateConstructorUsedError;

  /// Whether to enable column reordering
  bool get enableColumnReordering => throw _privateConstructorUsedError;

  /// Column reorder callback
  DSDataTableColumnReorderCallback? get onColumnReorder =>
      throw _privateConstructorUsedError;

  /// Whether to enable column hiding
  bool get enableColumnHiding => throw _privateConstructorUsedError;

  /// Column visibility callback
  DSDataTableColumnVisibilityCallback? get onColumnVisibilityChanged =>
      throw _privateConstructorUsedError;

  /// Density for the table (compact, standard, comfortable)
  DSDataTableDensity get density => throw _privateConstructorUsedError;

  /// Custom theme overrides
  DSDataTableTheme? get theme => throw _privateConstructorUsedError;

  /// Platform-specific configurations
  DSDataTablePlatformConfig? get platformConfig =>
      throw _privateConstructorUsedError;

  /// RTL support configuration
  bool get supportRTL => throw _privateConstructorUsedError;

  /// Accessibility configuration
  DSDataTableAccessibilityConfig? get accessibilityConfig =>
      throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableConfigCopyWith<DSDataTableConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableConfigCopyWith<$Res> {
  factory $DSDataTableConfigCopyWith(
    DSDataTableConfig value,
    $Res Function(DSDataTableConfig) then,
  ) = _$DSDataTableConfigCopyWithImpl<$Res, DSDataTableConfig>;
  @useResult
  $Res call({
    DSDataTableVariant variant,
    bool showHeaders,
    bool showRowDividers,
    bool showColumnDividers,
    bool alternateRowColors,
    bool showHoverEffects,
    double borderRadius,
    double rowHeight,
    double headerHeight,
    EdgeInsets cellPadding,
    EdgeInsets headerPadding,
    double elevation,
    double? maxHeight,
    double minHeight,
    bool horizontalScrollable,
    bool verticalScrollable,
    DSDataTableResizeConfig? resizeConfig,
    DSDataTableFreezeConfig? freezeConfig,
    DSDataTableEditMode editMode,
    bool showLoading,
    bool showSkeleton,
    int skeletonRowCount,
    Widget? loadingIndicator,
    DSDataTableSkeletonBuilder? skeletonBuilder,
    Duration animationDuration,
    Curve animationCurve,
    bool enableKeyboardNavigation,
    bool enableAccessibility,
    List<DSDataTableRowAction>? rowActions,
    List<DSDataTableBulkAction>? bulkActions,
    List<DSDataTableContextMenuItem>? contextMenuItems,
    List<Widget>? headerActions,
    Widget? footer,
    bool showRowNumbers,
    double rowNumberWidth,
    bool enableDragAndDrop,
    DSDataTableDragDropCallback? onDragDrop,
    bool enableColumnReordering,
    DSDataTableColumnReorderCallback? onColumnReorder,
    bool enableColumnHiding,
    DSDataTableColumnVisibilityCallback? onColumnVisibilityChanged,
    DSDataTableDensity density,
    DSDataTableTheme? theme,
    DSDataTablePlatformConfig? platformConfig,
    bool supportRTL,
    DSDataTableAccessibilityConfig? accessibilityConfig,
  });

  $DSDataTableResizeConfigCopyWith<$Res>? get resizeConfig;
  $DSDataTableFreezeConfigCopyWith<$Res>? get freezeConfig;
  $DSDataTableThemeCopyWith<$Res>? get theme;
  $DSDataTablePlatformConfigCopyWith<$Res>? get platformConfig;
  $DSDataTableAccessibilityConfigCopyWith<$Res>? get accessibilityConfig;
}

/// @nodoc
class _$DSDataTableConfigCopyWithImpl<$Res, $Val extends DSDataTableConfig>
    implements $DSDataTableConfigCopyWith<$Res> {
  _$DSDataTableConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? showHeaders = null,
    Object? showRowDividers = null,
    Object? showColumnDividers = null,
    Object? alternateRowColors = null,
    Object? showHoverEffects = null,
    Object? borderRadius = null,
    Object? rowHeight = null,
    Object? headerHeight = null,
    Object? cellPadding = null,
    Object? headerPadding = null,
    Object? elevation = null,
    Object? maxHeight = freezed,
    Object? minHeight = null,
    Object? horizontalScrollable = null,
    Object? verticalScrollable = null,
    Object? resizeConfig = freezed,
    Object? freezeConfig = freezed,
    Object? editMode = null,
    Object? showLoading = null,
    Object? showSkeleton = null,
    Object? skeletonRowCount = null,
    Object? loadingIndicator = freezed,
    Object? skeletonBuilder = freezed,
    Object? animationDuration = null,
    Object? animationCurve = null,
    Object? enableKeyboardNavigation = null,
    Object? enableAccessibility = null,
    Object? rowActions = freezed,
    Object? bulkActions = freezed,
    Object? contextMenuItems = freezed,
    Object? headerActions = freezed,
    Object? footer = freezed,
    Object? showRowNumbers = null,
    Object? rowNumberWidth = null,
    Object? enableDragAndDrop = null,
    Object? onDragDrop = freezed,
    Object? enableColumnReordering = null,
    Object? onColumnReorder = freezed,
    Object? enableColumnHiding = null,
    Object? onColumnVisibilityChanged = freezed,
    Object? density = null,
    Object? theme = freezed,
    Object? platformConfig = freezed,
    Object? supportRTL = null,
    Object? accessibilityConfig = freezed,
  }) {
    return _then(
      _value.copyWith(
            variant: null == variant
                ? _value.variant
                : variant // ignore: cast_nullable_to_non_nullable
                      as DSDataTableVariant,
            showHeaders: null == showHeaders
                ? _value.showHeaders
                : showHeaders // ignore: cast_nullable_to_non_nullable
                      as bool,
            showRowDividers: null == showRowDividers
                ? _value.showRowDividers
                : showRowDividers // ignore: cast_nullable_to_non_nullable
                      as bool,
            showColumnDividers: null == showColumnDividers
                ? _value.showColumnDividers
                : showColumnDividers // ignore: cast_nullable_to_non_nullable
                      as bool,
            alternateRowColors: null == alternateRowColors
                ? _value.alternateRowColors
                : alternateRowColors // ignore: cast_nullable_to_non_nullable
                      as bool,
            showHoverEffects: null == showHoverEffects
                ? _value.showHoverEffects
                : showHoverEffects // ignore: cast_nullable_to_non_nullable
                      as bool,
            borderRadius: null == borderRadius
                ? _value.borderRadius
                : borderRadius // ignore: cast_nullable_to_non_nullable
                      as double,
            rowHeight: null == rowHeight
                ? _value.rowHeight
                : rowHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            headerHeight: null == headerHeight
                ? _value.headerHeight
                : headerHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            cellPadding: null == cellPadding
                ? _value.cellPadding
                : cellPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            headerPadding: null == headerPadding
                ? _value.headerPadding
                : headerPadding // ignore: cast_nullable_to_non_nullable
                      as EdgeInsets,
            elevation: null == elevation
                ? _value.elevation
                : elevation // ignore: cast_nullable_to_non_nullable
                      as double,
            maxHeight: freezed == maxHeight
                ? _value.maxHeight
                : maxHeight // ignore: cast_nullable_to_non_nullable
                      as double?,
            minHeight: null == minHeight
                ? _value.minHeight
                : minHeight // ignore: cast_nullable_to_non_nullable
                      as double,
            horizontalScrollable: null == horizontalScrollable
                ? _value.horizontalScrollable
                : horizontalScrollable // ignore: cast_nullable_to_non_nullable
                      as bool,
            verticalScrollable: null == verticalScrollable
                ? _value.verticalScrollable
                : verticalScrollable // ignore: cast_nullable_to_non_nullable
                      as bool,
            resizeConfig: freezed == resizeConfig
                ? _value.resizeConfig
                : resizeConfig // ignore: cast_nullable_to_non_nullable
                      as DSDataTableResizeConfig?,
            freezeConfig: freezed == freezeConfig
                ? _value.freezeConfig
                : freezeConfig // ignore: cast_nullable_to_non_nullable
                      as DSDataTableFreezeConfig?,
            editMode: null == editMode
                ? _value.editMode
                : editMode // ignore: cast_nullable_to_non_nullable
                      as DSDataTableEditMode,
            showLoading: null == showLoading
                ? _value.showLoading
                : showLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            showSkeleton: null == showSkeleton
                ? _value.showSkeleton
                : showSkeleton // ignore: cast_nullable_to_non_nullable
                      as bool,
            skeletonRowCount: null == skeletonRowCount
                ? _value.skeletonRowCount
                : skeletonRowCount // ignore: cast_nullable_to_non_nullable
                      as int,
            loadingIndicator: freezed == loadingIndicator
                ? _value.loadingIndicator
                : loadingIndicator // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            skeletonBuilder: freezed == skeletonBuilder
                ? _value.skeletonBuilder
                : skeletonBuilder // ignore: cast_nullable_to_non_nullable
                      as DSDataTableSkeletonBuilder?,
            animationDuration: null == animationDuration
                ? _value.animationDuration
                : animationDuration // ignore: cast_nullable_to_non_nullable
                      as Duration,
            animationCurve: null == animationCurve
                ? _value.animationCurve
                : animationCurve // ignore: cast_nullable_to_non_nullable
                      as Curve,
            enableKeyboardNavigation: null == enableKeyboardNavigation
                ? _value.enableKeyboardNavigation
                : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableAccessibility: null == enableAccessibility
                ? _value.enableAccessibility
                : enableAccessibility // ignore: cast_nullable_to_non_nullable
                      as bool,
            rowActions: freezed == rowActions
                ? _value.rowActions
                : rowActions // ignore: cast_nullable_to_non_nullable
                      as List<DSDataTableRowAction>?,
            bulkActions: freezed == bulkActions
                ? _value.bulkActions
                : bulkActions // ignore: cast_nullable_to_non_nullable
                      as List<DSDataTableBulkAction>?,
            contextMenuItems: freezed == contextMenuItems
                ? _value.contextMenuItems
                : contextMenuItems // ignore: cast_nullable_to_non_nullable
                      as List<DSDataTableContextMenuItem>?,
            headerActions: freezed == headerActions
                ? _value.headerActions
                : headerActions // ignore: cast_nullable_to_non_nullable
                      as List<Widget>?,
            footer: freezed == footer
                ? _value.footer
                : footer // ignore: cast_nullable_to_non_nullable
                      as Widget?,
            showRowNumbers: null == showRowNumbers
                ? _value.showRowNumbers
                : showRowNumbers // ignore: cast_nullable_to_non_nullable
                      as bool,
            rowNumberWidth: null == rowNumberWidth
                ? _value.rowNumberWidth
                : rowNumberWidth // ignore: cast_nullable_to_non_nullable
                      as double,
            enableDragAndDrop: null == enableDragAndDrop
                ? _value.enableDragAndDrop
                : enableDragAndDrop // ignore: cast_nullable_to_non_nullable
                      as bool,
            onDragDrop: freezed == onDragDrop
                ? _value.onDragDrop
                : onDragDrop // ignore: cast_nullable_to_non_nullable
                      as DSDataTableDragDropCallback?,
            enableColumnReordering: null == enableColumnReordering
                ? _value.enableColumnReordering
                : enableColumnReordering // ignore: cast_nullable_to_non_nullable
                      as bool,
            onColumnReorder: freezed == onColumnReorder
                ? _value.onColumnReorder
                : onColumnReorder // ignore: cast_nullable_to_non_nullable
                      as DSDataTableColumnReorderCallback?,
            enableColumnHiding: null == enableColumnHiding
                ? _value.enableColumnHiding
                : enableColumnHiding // ignore: cast_nullable_to_non_nullable
                      as bool,
            onColumnVisibilityChanged: freezed == onColumnVisibilityChanged
                ? _value.onColumnVisibilityChanged
                : onColumnVisibilityChanged // ignore: cast_nullable_to_non_nullable
                      as DSDataTableColumnVisibilityCallback?,
            density: null == density
                ? _value.density
                : density // ignore: cast_nullable_to_non_nullable
                      as DSDataTableDensity,
            theme: freezed == theme
                ? _value.theme
                : theme // ignore: cast_nullable_to_non_nullable
                      as DSDataTableTheme?,
            platformConfig: freezed == platformConfig
                ? _value.platformConfig
                : platformConfig // ignore: cast_nullable_to_non_nullable
                      as DSDataTablePlatformConfig?,
            supportRTL: null == supportRTL
                ? _value.supportRTL
                : supportRTL // ignore: cast_nullable_to_non_nullable
                      as bool,
            accessibilityConfig: freezed == accessibilityConfig
                ? _value.accessibilityConfig
                : accessibilityConfig // ignore: cast_nullable_to_non_nullable
                      as DSDataTableAccessibilityConfig?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSDataTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSDataTableResizeConfigCopyWith<$Res>? get resizeConfig {
    if (_value.resizeConfig == null) {
      return null;
    }

    return $DSDataTableResizeConfigCopyWith<$Res>(_value.resizeConfig!, (
      value,
    ) {
      return _then(_value.copyWith(resizeConfig: value) as $Val);
    });
  }

  /// Create a copy of DSDataTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSDataTableFreezeConfigCopyWith<$Res>? get freezeConfig {
    if (_value.freezeConfig == null) {
      return null;
    }

    return $DSDataTableFreezeConfigCopyWith<$Res>(_value.freezeConfig!, (
      value,
    ) {
      return _then(_value.copyWith(freezeConfig: value) as $Val);
    });
  }

  /// Create a copy of DSDataTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSDataTableThemeCopyWith<$Res>? get theme {
    if (_value.theme == null) {
      return null;
    }

    return $DSDataTableThemeCopyWith<$Res>(_value.theme!, (value) {
      return _then(_value.copyWith(theme: value) as $Val);
    });
  }

  /// Create a copy of DSDataTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSDataTablePlatformConfigCopyWith<$Res>? get platformConfig {
    if (_value.platformConfig == null) {
      return null;
    }

    return $DSDataTablePlatformConfigCopyWith<$Res>(_value.platformConfig!, (
      value,
    ) {
      return _then(_value.copyWith(platformConfig: value) as $Val);
    });
  }

  /// Create a copy of DSDataTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSDataTableAccessibilityConfigCopyWith<$Res>? get accessibilityConfig {
    if (_value.accessibilityConfig == null) {
      return null;
    }

    return $DSDataTableAccessibilityConfigCopyWith<$Res>(
      _value.accessibilityConfig!,
      (value) {
        return _then(_value.copyWith(accessibilityConfig: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableConfigImplCopyWith<$Res>
    implements $DSDataTableConfigCopyWith<$Res> {
  factory _$$DSDataTableConfigImplCopyWith(
    _$DSDataTableConfigImpl value,
    $Res Function(_$DSDataTableConfigImpl) then,
  ) = __$$DSDataTableConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSDataTableVariant variant,
    bool showHeaders,
    bool showRowDividers,
    bool showColumnDividers,
    bool alternateRowColors,
    bool showHoverEffects,
    double borderRadius,
    double rowHeight,
    double headerHeight,
    EdgeInsets cellPadding,
    EdgeInsets headerPadding,
    double elevation,
    double? maxHeight,
    double minHeight,
    bool horizontalScrollable,
    bool verticalScrollable,
    DSDataTableResizeConfig? resizeConfig,
    DSDataTableFreezeConfig? freezeConfig,
    DSDataTableEditMode editMode,
    bool showLoading,
    bool showSkeleton,
    int skeletonRowCount,
    Widget? loadingIndicator,
    DSDataTableSkeletonBuilder? skeletonBuilder,
    Duration animationDuration,
    Curve animationCurve,
    bool enableKeyboardNavigation,
    bool enableAccessibility,
    List<DSDataTableRowAction>? rowActions,
    List<DSDataTableBulkAction>? bulkActions,
    List<DSDataTableContextMenuItem>? contextMenuItems,
    List<Widget>? headerActions,
    Widget? footer,
    bool showRowNumbers,
    double rowNumberWidth,
    bool enableDragAndDrop,
    DSDataTableDragDropCallback? onDragDrop,
    bool enableColumnReordering,
    DSDataTableColumnReorderCallback? onColumnReorder,
    bool enableColumnHiding,
    DSDataTableColumnVisibilityCallback? onColumnVisibilityChanged,
    DSDataTableDensity density,
    DSDataTableTheme? theme,
    DSDataTablePlatformConfig? platformConfig,
    bool supportRTL,
    DSDataTableAccessibilityConfig? accessibilityConfig,
  });

  @override
  $DSDataTableResizeConfigCopyWith<$Res>? get resizeConfig;
  @override
  $DSDataTableFreezeConfigCopyWith<$Res>? get freezeConfig;
  @override
  $DSDataTableThemeCopyWith<$Res>? get theme;
  @override
  $DSDataTablePlatformConfigCopyWith<$Res>? get platformConfig;
  @override
  $DSDataTableAccessibilityConfigCopyWith<$Res>? get accessibilityConfig;
}

/// @nodoc
class __$$DSDataTableConfigImplCopyWithImpl<$Res>
    extends _$DSDataTableConfigCopyWithImpl<$Res, _$DSDataTableConfigImpl>
    implements _$$DSDataTableConfigImplCopyWith<$Res> {
  __$$DSDataTableConfigImplCopyWithImpl(
    _$DSDataTableConfigImpl _value,
    $Res Function(_$DSDataTableConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variant = null,
    Object? showHeaders = null,
    Object? showRowDividers = null,
    Object? showColumnDividers = null,
    Object? alternateRowColors = null,
    Object? showHoverEffects = null,
    Object? borderRadius = null,
    Object? rowHeight = null,
    Object? headerHeight = null,
    Object? cellPadding = null,
    Object? headerPadding = null,
    Object? elevation = null,
    Object? maxHeight = freezed,
    Object? minHeight = null,
    Object? horizontalScrollable = null,
    Object? verticalScrollable = null,
    Object? resizeConfig = freezed,
    Object? freezeConfig = freezed,
    Object? editMode = null,
    Object? showLoading = null,
    Object? showSkeleton = null,
    Object? skeletonRowCount = null,
    Object? loadingIndicator = freezed,
    Object? skeletonBuilder = freezed,
    Object? animationDuration = null,
    Object? animationCurve = null,
    Object? enableKeyboardNavigation = null,
    Object? enableAccessibility = null,
    Object? rowActions = freezed,
    Object? bulkActions = freezed,
    Object? contextMenuItems = freezed,
    Object? headerActions = freezed,
    Object? footer = freezed,
    Object? showRowNumbers = null,
    Object? rowNumberWidth = null,
    Object? enableDragAndDrop = null,
    Object? onDragDrop = freezed,
    Object? enableColumnReordering = null,
    Object? onColumnReorder = freezed,
    Object? enableColumnHiding = null,
    Object? onColumnVisibilityChanged = freezed,
    Object? density = null,
    Object? theme = freezed,
    Object? platformConfig = freezed,
    Object? supportRTL = null,
    Object? accessibilityConfig = freezed,
  }) {
    return _then(
      _$DSDataTableConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSDataTableVariant,
        showHeaders: null == showHeaders
            ? _value.showHeaders
            : showHeaders // ignore: cast_nullable_to_non_nullable
                  as bool,
        showRowDividers: null == showRowDividers
            ? _value.showRowDividers
            : showRowDividers // ignore: cast_nullable_to_non_nullable
                  as bool,
        showColumnDividers: null == showColumnDividers
            ? _value.showColumnDividers
            : showColumnDividers // ignore: cast_nullable_to_non_nullable
                  as bool,
        alternateRowColors: null == alternateRowColors
            ? _value.alternateRowColors
            : alternateRowColors // ignore: cast_nullable_to_non_nullable
                  as bool,
        showHoverEffects: null == showHoverEffects
            ? _value.showHoverEffects
            : showHoverEffects // ignore: cast_nullable_to_non_nullable
                  as bool,
        borderRadius: null == borderRadius
            ? _value.borderRadius
            : borderRadius // ignore: cast_nullable_to_non_nullable
                  as double,
        rowHeight: null == rowHeight
            ? _value.rowHeight
            : rowHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        headerHeight: null == headerHeight
            ? _value.headerHeight
            : headerHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        cellPadding: null == cellPadding
            ? _value.cellPadding
            : cellPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        headerPadding: null == headerPadding
            ? _value.headerPadding
            : headerPadding // ignore: cast_nullable_to_non_nullable
                  as EdgeInsets,
        elevation: null == elevation
            ? _value.elevation
            : elevation // ignore: cast_nullable_to_non_nullable
                  as double,
        maxHeight: freezed == maxHeight
            ? _value.maxHeight
            : maxHeight // ignore: cast_nullable_to_non_nullable
                  as double?,
        minHeight: null == minHeight
            ? _value.minHeight
            : minHeight // ignore: cast_nullable_to_non_nullable
                  as double,
        horizontalScrollable: null == horizontalScrollable
            ? _value.horizontalScrollable
            : horizontalScrollable // ignore: cast_nullable_to_non_nullable
                  as bool,
        verticalScrollable: null == verticalScrollable
            ? _value.verticalScrollable
            : verticalScrollable // ignore: cast_nullable_to_non_nullable
                  as bool,
        resizeConfig: freezed == resizeConfig
            ? _value.resizeConfig
            : resizeConfig // ignore: cast_nullable_to_non_nullable
                  as DSDataTableResizeConfig?,
        freezeConfig: freezed == freezeConfig
            ? _value.freezeConfig
            : freezeConfig // ignore: cast_nullable_to_non_nullable
                  as DSDataTableFreezeConfig?,
        editMode: null == editMode
            ? _value.editMode
            : editMode // ignore: cast_nullable_to_non_nullable
                  as DSDataTableEditMode,
        showLoading: null == showLoading
            ? _value.showLoading
            : showLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        showSkeleton: null == showSkeleton
            ? _value.showSkeleton
            : showSkeleton // ignore: cast_nullable_to_non_nullable
                  as bool,
        skeletonRowCount: null == skeletonRowCount
            ? _value.skeletonRowCount
            : skeletonRowCount // ignore: cast_nullable_to_non_nullable
                  as int,
        loadingIndicator: freezed == loadingIndicator
            ? _value.loadingIndicator
            : loadingIndicator // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        skeletonBuilder: freezed == skeletonBuilder
            ? _value.skeletonBuilder
            : skeletonBuilder // ignore: cast_nullable_to_non_nullable
                  as DSDataTableSkeletonBuilder?,
        animationDuration: null == animationDuration
            ? _value.animationDuration
            : animationDuration // ignore: cast_nullable_to_non_nullable
                  as Duration,
        animationCurve: null == animationCurve
            ? _value.animationCurve
            : animationCurve // ignore: cast_nullable_to_non_nullable
                  as Curve,
        enableKeyboardNavigation: null == enableKeyboardNavigation
            ? _value.enableKeyboardNavigation
            : enableKeyboardNavigation // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableAccessibility: null == enableAccessibility
            ? _value.enableAccessibility
            : enableAccessibility // ignore: cast_nullable_to_non_nullable
                  as bool,
        rowActions: freezed == rowActions
            ? _value._rowActions
            : rowActions // ignore: cast_nullable_to_non_nullable
                  as List<DSDataTableRowAction>?,
        bulkActions: freezed == bulkActions
            ? _value._bulkActions
            : bulkActions // ignore: cast_nullable_to_non_nullable
                  as List<DSDataTableBulkAction>?,
        contextMenuItems: freezed == contextMenuItems
            ? _value._contextMenuItems
            : contextMenuItems // ignore: cast_nullable_to_non_nullable
                  as List<DSDataTableContextMenuItem>?,
        headerActions: freezed == headerActions
            ? _value._headerActions
            : headerActions // ignore: cast_nullable_to_non_nullable
                  as List<Widget>?,
        footer: freezed == footer
            ? _value.footer
            : footer // ignore: cast_nullable_to_non_nullable
                  as Widget?,
        showRowNumbers: null == showRowNumbers
            ? _value.showRowNumbers
            : showRowNumbers // ignore: cast_nullable_to_non_nullable
                  as bool,
        rowNumberWidth: null == rowNumberWidth
            ? _value.rowNumberWidth
            : rowNumberWidth // ignore: cast_nullable_to_non_nullable
                  as double,
        enableDragAndDrop: null == enableDragAndDrop
            ? _value.enableDragAndDrop
            : enableDragAndDrop // ignore: cast_nullable_to_non_nullable
                  as bool,
        onDragDrop: freezed == onDragDrop
            ? _value.onDragDrop
            : onDragDrop // ignore: cast_nullable_to_non_nullable
                  as DSDataTableDragDropCallback?,
        enableColumnReordering: null == enableColumnReordering
            ? _value.enableColumnReordering
            : enableColumnReordering // ignore: cast_nullable_to_non_nullable
                  as bool,
        onColumnReorder: freezed == onColumnReorder
            ? _value.onColumnReorder
            : onColumnReorder // ignore: cast_nullable_to_non_nullable
                  as DSDataTableColumnReorderCallback?,
        enableColumnHiding: null == enableColumnHiding
            ? _value.enableColumnHiding
            : enableColumnHiding // ignore: cast_nullable_to_non_nullable
                  as bool,
        onColumnVisibilityChanged: freezed == onColumnVisibilityChanged
            ? _value.onColumnVisibilityChanged
            : onColumnVisibilityChanged // ignore: cast_nullable_to_non_nullable
                  as DSDataTableColumnVisibilityCallback?,
        density: null == density
            ? _value.density
            : density // ignore: cast_nullable_to_non_nullable
                  as DSDataTableDensity,
        theme: freezed == theme
            ? _value.theme
            : theme // ignore: cast_nullable_to_non_nullable
                  as DSDataTableTheme?,
        platformConfig: freezed == platformConfig
            ? _value.platformConfig
            : platformConfig // ignore: cast_nullable_to_non_nullable
                  as DSDataTablePlatformConfig?,
        supportRTL: null == supportRTL
            ? _value.supportRTL
            : supportRTL // ignore: cast_nullable_to_non_nullable
                  as bool,
        accessibilityConfig: freezed == accessibilityConfig
            ? _value.accessibilityConfig
            : accessibilityConfig // ignore: cast_nullable_to_non_nullable
                  as DSDataTableAccessibilityConfig?,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableConfigImpl implements _DSDataTableConfig {
  const _$DSDataTableConfigImpl({
    this.variant = DSDataTableVariant.resizable,
    this.showHeaders = true,
    this.showRowDividers = true,
    this.showColumnDividers = false,
    this.alternateRowColors = false,
    this.showHoverEffects = true,
    this.borderRadius = 8.0,
    this.rowHeight = 48.0,
    this.headerHeight = 56.0,
    this.cellPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.headerPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.elevation = 2.0,
    this.maxHeight,
    this.minHeight = 200.0,
    this.horizontalScrollable = true,
    this.verticalScrollable = true,
    this.resizeConfig,
    this.freezeConfig,
    this.editMode = DSDataTableEditMode.none,
    this.showLoading = false,
    this.showSkeleton = false,
    this.skeletonRowCount = 5,
    this.loadingIndicator,
    this.skeletonBuilder,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.enableKeyboardNavigation = true,
    this.enableAccessibility = true,
    final List<DSDataTableRowAction>? rowActions,
    final List<DSDataTableBulkAction>? bulkActions,
    final List<DSDataTableContextMenuItem>? contextMenuItems,
    final List<Widget>? headerActions,
    this.footer,
    this.showRowNumbers = false,
    this.rowNumberWidth = 60.0,
    this.enableDragAndDrop = false,
    this.onDragDrop,
    this.enableColumnReordering = false,
    this.onColumnReorder,
    this.enableColumnHiding = false,
    this.onColumnVisibilityChanged,
    this.density = DSDataTableDensity.standard,
    this.theme,
    this.platformConfig,
    this.supportRTL = true,
    this.accessibilityConfig,
  }) : _rowActions = rowActions,
       _bulkActions = bulkActions,
       _contextMenuItems = contextMenuItems,
       _headerActions = headerActions;

  /// Table variant
  @override
  @JsonKey()
  final DSDataTableVariant variant;

  /// Whether to show column headers
  @override
  @JsonKey()
  final bool showHeaders;

  /// Whether to show row dividers
  @override
  @JsonKey()
  final bool showRowDividers;

  /// Whether to show column dividers
  @override
  @JsonKey()
  final bool showColumnDividers;

  /// Whether to alternate row colors
  @override
  @JsonKey()
  final bool alternateRowColors;

  /// Whether to show hover effects
  @override
  @JsonKey()
  final bool showHoverEffects;

  /// Table border radius
  @override
  @JsonKey()
  final double borderRadius;

  /// Row height
  @override
  @JsonKey()
  final double rowHeight;

  /// Header height
  @override
  @JsonKey()
  final double headerHeight;

  /// Cell padding
  @override
  @JsonKey()
  final EdgeInsets cellPadding;

  /// Header padding
  @override
  @JsonKey()
  final EdgeInsets headerPadding;

  /// Table elevation
  @override
  @JsonKey()
  final double elevation;

  /// Maximum table height (null for unlimited)
  @override
  final double? maxHeight;

  /// Minimum table height
  @override
  @JsonKey()
  final double minHeight;

  /// Whether the table is scrollable horizontally
  @override
  @JsonKey()
  final bool horizontalScrollable;

  /// Whether the table is scrollable vertically
  @override
  @JsonKey()
  final bool verticalScrollable;

  /// Resize configuration
  @override
  final DSDataTableResizeConfig? resizeConfig;

  /// Freeze configuration for pinned columns
  @override
  final DSDataTableFreezeConfig? freezeConfig;

  /// Edit mode configuration
  @override
  @JsonKey()
  final DSDataTableEditMode editMode;

  /// Whether to show loading state
  @override
  @JsonKey()
  final bool showLoading;

  /// Whether to show skeleton state
  @override
  @JsonKey()
  final bool showSkeleton;

  /// Number of skeleton rows to show
  @override
  @JsonKey()
  final int skeletonRowCount;

  /// Loading indicator widget
  @override
  final Widget? loadingIndicator;

  /// Skeleton row builder
  @override
  final DSDataTableSkeletonBuilder? skeletonBuilder;

  /// Animation duration for state changes
  @override
  @JsonKey()
  final Duration animationDuration;

  /// Animation curve for state changes
  @override
  @JsonKey()
  final Curve animationCurve;

  /// Whether to enable keyboard navigation
  @override
  @JsonKey()
  final bool enableKeyboardNavigation;

  /// Whether to enable accessibility features
  @override
  @JsonKey()
  final bool enableAccessibility;

  /// Custom row actions
  final List<DSDataTableRowAction>? _rowActions;

  /// Custom row actions
  @override
  List<DSDataTableRowAction>? get rowActions {
    final value = _rowActions;
    if (value == null) return null;
    if (_rowActions is EqualUnmodifiableListView) return _rowActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Bulk actions for selected rows
  final List<DSDataTableBulkAction>? _bulkActions;

  /// Bulk actions for selected rows
  @override
  List<DSDataTableBulkAction>? get bulkActions {
    final value = _bulkActions;
    if (value == null) return null;
    if (_bulkActions is EqualUnmodifiableListView) return _bulkActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Context menu items
  final List<DSDataTableContextMenuItem>? _contextMenuItems;

  /// Context menu items
  @override
  List<DSDataTableContextMenuItem>? get contextMenuItems {
    final value = _contextMenuItems;
    if (value == null) return null;
    if (_contextMenuItems is EqualUnmodifiableListView)
      return _contextMenuItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Custom header actions
  final List<Widget>? _headerActions;

  /// Custom header actions
  @override
  List<Widget>? get headerActions {
    final value = _headerActions;
    if (value == null) return null;
    if (_headerActions is EqualUnmodifiableListView) return _headerActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Footer widget
  @override
  final Widget? footer;

  /// Whether to show row numbers
  @override
  @JsonKey()
  final bool showRowNumbers;

  /// Row number column width
  @override
  @JsonKey()
  final double rowNumberWidth;

  /// Whether to enable drag and drop for rows
  @override
  @JsonKey()
  final bool enableDragAndDrop;

  /// Drag and drop callback
  @override
  final DSDataTableDragDropCallback? onDragDrop;

  /// Whether to enable column reordering
  @override
  @JsonKey()
  final bool enableColumnReordering;

  /// Column reorder callback
  @override
  final DSDataTableColumnReorderCallback? onColumnReorder;

  /// Whether to enable column hiding
  @override
  @JsonKey()
  final bool enableColumnHiding;

  /// Column visibility callback
  @override
  final DSDataTableColumnVisibilityCallback? onColumnVisibilityChanged;

  /// Density for the table (compact, standard, comfortable)
  @override
  @JsonKey()
  final DSDataTableDensity density;

  /// Custom theme overrides
  @override
  final DSDataTableTheme? theme;

  /// Platform-specific configurations
  @override
  final DSDataTablePlatformConfig? platformConfig;

  /// RTL support configuration
  @override
  @JsonKey()
  final bool supportRTL;

  /// Accessibility configuration
  @override
  final DSDataTableAccessibilityConfig? accessibilityConfig;

  @override
  String toString() {
    return 'DSDataTableConfig(variant: $variant, showHeaders: $showHeaders, showRowDividers: $showRowDividers, showColumnDividers: $showColumnDividers, alternateRowColors: $alternateRowColors, showHoverEffects: $showHoverEffects, borderRadius: $borderRadius, rowHeight: $rowHeight, headerHeight: $headerHeight, cellPadding: $cellPadding, headerPadding: $headerPadding, elevation: $elevation, maxHeight: $maxHeight, minHeight: $minHeight, horizontalScrollable: $horizontalScrollable, verticalScrollable: $verticalScrollable, resizeConfig: $resizeConfig, freezeConfig: $freezeConfig, editMode: $editMode, showLoading: $showLoading, showSkeleton: $showSkeleton, skeletonRowCount: $skeletonRowCount, loadingIndicator: $loadingIndicator, skeletonBuilder: $skeletonBuilder, animationDuration: $animationDuration, animationCurve: $animationCurve, enableKeyboardNavigation: $enableKeyboardNavigation, enableAccessibility: $enableAccessibility, rowActions: $rowActions, bulkActions: $bulkActions, contextMenuItems: $contextMenuItems, headerActions: $headerActions, footer: $footer, showRowNumbers: $showRowNumbers, rowNumberWidth: $rowNumberWidth, enableDragAndDrop: $enableDragAndDrop, onDragDrop: $onDragDrop, enableColumnReordering: $enableColumnReordering, onColumnReorder: $onColumnReorder, enableColumnHiding: $enableColumnHiding, onColumnVisibilityChanged: $onColumnVisibilityChanged, density: $density, theme: $theme, platformConfig: $platformConfig, supportRTL: $supportRTL, accessibilityConfig: $accessibilityConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableConfigImpl &&
            (identical(other.variant, variant) || other.variant == variant) &&
            (identical(other.showHeaders, showHeaders) ||
                other.showHeaders == showHeaders) &&
            (identical(other.showRowDividers, showRowDividers) ||
                other.showRowDividers == showRowDividers) &&
            (identical(other.showColumnDividers, showColumnDividers) ||
                other.showColumnDividers == showColumnDividers) &&
            (identical(other.alternateRowColors, alternateRowColors) ||
                other.alternateRowColors == alternateRowColors) &&
            (identical(other.showHoverEffects, showHoverEffects) ||
                other.showHoverEffects == showHoverEffects) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(other.rowHeight, rowHeight) ||
                other.rowHeight == rowHeight) &&
            (identical(other.headerHeight, headerHeight) ||
                other.headerHeight == headerHeight) &&
            (identical(other.cellPadding, cellPadding) ||
                other.cellPadding == cellPadding) &&
            (identical(other.headerPadding, headerPadding) ||
                other.headerPadding == headerPadding) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.maxHeight, maxHeight) ||
                other.maxHeight == maxHeight) &&
            (identical(other.minHeight, minHeight) ||
                other.minHeight == minHeight) &&
            (identical(other.horizontalScrollable, horizontalScrollable) ||
                other.horizontalScrollable == horizontalScrollable) &&
            (identical(other.verticalScrollable, verticalScrollable) ||
                other.verticalScrollable == verticalScrollable) &&
            (identical(other.resizeConfig, resizeConfig) ||
                other.resizeConfig == resizeConfig) &&
            (identical(other.freezeConfig, freezeConfig) ||
                other.freezeConfig == freezeConfig) &&
            (identical(other.editMode, editMode) ||
                other.editMode == editMode) &&
            (identical(other.showLoading, showLoading) ||
                other.showLoading == showLoading) &&
            (identical(other.showSkeleton, showSkeleton) ||
                other.showSkeleton == showSkeleton) &&
            (identical(other.skeletonRowCount, skeletonRowCount) ||
                other.skeletonRowCount == skeletonRowCount) &&
            (identical(other.loadingIndicator, loadingIndicator) ||
                other.loadingIndicator == loadingIndicator) &&
            (identical(other.skeletonBuilder, skeletonBuilder) ||
                other.skeletonBuilder == skeletonBuilder) &&
            (identical(other.animationDuration, animationDuration) ||
                other.animationDuration == animationDuration) &&
            (identical(other.animationCurve, animationCurve) ||
                other.animationCurve == animationCurve) &&
            (identical(
                  other.enableKeyboardNavigation,
                  enableKeyboardNavigation,
                ) ||
                other.enableKeyboardNavigation == enableKeyboardNavigation) &&
            (identical(other.enableAccessibility, enableAccessibility) ||
                other.enableAccessibility == enableAccessibility) &&
            const DeepCollectionEquality().equals(
              other._rowActions,
              _rowActions,
            ) &&
            const DeepCollectionEquality().equals(
              other._bulkActions,
              _bulkActions,
            ) &&
            const DeepCollectionEquality().equals(
              other._contextMenuItems,
              _contextMenuItems,
            ) &&
            const DeepCollectionEquality().equals(
              other._headerActions,
              _headerActions,
            ) &&
            (identical(other.footer, footer) || other.footer == footer) &&
            (identical(other.showRowNumbers, showRowNumbers) ||
                other.showRowNumbers == showRowNumbers) &&
            (identical(other.rowNumberWidth, rowNumberWidth) ||
                other.rowNumberWidth == rowNumberWidth) &&
            (identical(other.enableDragAndDrop, enableDragAndDrop) ||
                other.enableDragAndDrop == enableDragAndDrop) &&
            (identical(other.onDragDrop, onDragDrop) ||
                other.onDragDrop == onDragDrop) &&
            (identical(other.enableColumnReordering, enableColumnReordering) ||
                other.enableColumnReordering == enableColumnReordering) &&
            (identical(other.onColumnReorder, onColumnReorder) ||
                other.onColumnReorder == onColumnReorder) &&
            (identical(other.enableColumnHiding, enableColumnHiding) ||
                other.enableColumnHiding == enableColumnHiding) &&
            (identical(
                  other.onColumnVisibilityChanged,
                  onColumnVisibilityChanged,
                ) ||
                other.onColumnVisibilityChanged == onColumnVisibilityChanged) &&
            (identical(other.density, density) || other.density == density) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.platformConfig, platformConfig) ||
                other.platformConfig == platformConfig) &&
            (identical(other.supportRTL, supportRTL) ||
                other.supportRTL == supportRTL) &&
            (identical(other.accessibilityConfig, accessibilityConfig) ||
                other.accessibilityConfig == accessibilityConfig));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    variant,
    showHeaders,
    showRowDividers,
    showColumnDividers,
    alternateRowColors,
    showHoverEffects,
    borderRadius,
    rowHeight,
    headerHeight,
    cellPadding,
    headerPadding,
    elevation,
    maxHeight,
    minHeight,
    horizontalScrollable,
    verticalScrollable,
    resizeConfig,
    freezeConfig,
    editMode,
    showLoading,
    showSkeleton,
    skeletonRowCount,
    loadingIndicator,
    skeletonBuilder,
    animationDuration,
    animationCurve,
    enableKeyboardNavigation,
    enableAccessibility,
    const DeepCollectionEquality().hash(_rowActions),
    const DeepCollectionEquality().hash(_bulkActions),
    const DeepCollectionEquality().hash(_contextMenuItems),
    const DeepCollectionEquality().hash(_headerActions),
    footer,
    showRowNumbers,
    rowNumberWidth,
    enableDragAndDrop,
    onDragDrop,
    enableColumnReordering,
    onColumnReorder,
    enableColumnHiding,
    onColumnVisibilityChanged,
    density,
    theme,
    platformConfig,
    supportRTL,
    accessibilityConfig,
  ]);

  /// Create a copy of DSDataTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableConfigImplCopyWith<_$DSDataTableConfigImpl> get copyWith =>
      __$$DSDataTableConfigImplCopyWithImpl<_$DSDataTableConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDataTableConfig implements DSDataTableConfig {
  const factory _DSDataTableConfig({
    final DSDataTableVariant variant,
    final bool showHeaders,
    final bool showRowDividers,
    final bool showColumnDividers,
    final bool alternateRowColors,
    final bool showHoverEffects,
    final double borderRadius,
    final double rowHeight,
    final double headerHeight,
    final EdgeInsets cellPadding,
    final EdgeInsets headerPadding,
    final double elevation,
    final double? maxHeight,
    final double minHeight,
    final bool horizontalScrollable,
    final bool verticalScrollable,
    final DSDataTableResizeConfig? resizeConfig,
    final DSDataTableFreezeConfig? freezeConfig,
    final DSDataTableEditMode editMode,
    final bool showLoading,
    final bool showSkeleton,
    final int skeletonRowCount,
    final Widget? loadingIndicator,
    final DSDataTableSkeletonBuilder? skeletonBuilder,
    final Duration animationDuration,
    final Curve animationCurve,
    final bool enableKeyboardNavigation,
    final bool enableAccessibility,
    final List<DSDataTableRowAction>? rowActions,
    final List<DSDataTableBulkAction>? bulkActions,
    final List<DSDataTableContextMenuItem>? contextMenuItems,
    final List<Widget>? headerActions,
    final Widget? footer,
    final bool showRowNumbers,
    final double rowNumberWidth,
    final bool enableDragAndDrop,
    final DSDataTableDragDropCallback? onDragDrop,
    final bool enableColumnReordering,
    final DSDataTableColumnReorderCallback? onColumnReorder,
    final bool enableColumnHiding,
    final DSDataTableColumnVisibilityCallback? onColumnVisibilityChanged,
    final DSDataTableDensity density,
    final DSDataTableTheme? theme,
    final DSDataTablePlatformConfig? platformConfig,
    final bool supportRTL,
    final DSDataTableAccessibilityConfig? accessibilityConfig,
  }) = _$DSDataTableConfigImpl;

  /// Table variant
  @override
  DSDataTableVariant get variant;

  /// Whether to show column headers
  @override
  bool get showHeaders;

  /// Whether to show row dividers
  @override
  bool get showRowDividers;

  /// Whether to show column dividers
  @override
  bool get showColumnDividers;

  /// Whether to alternate row colors
  @override
  bool get alternateRowColors;

  /// Whether to show hover effects
  @override
  bool get showHoverEffects;

  /// Table border radius
  @override
  double get borderRadius;

  /// Row height
  @override
  double get rowHeight;

  /// Header height
  @override
  double get headerHeight;

  /// Cell padding
  @override
  EdgeInsets get cellPadding;

  /// Header padding
  @override
  EdgeInsets get headerPadding;

  /// Table elevation
  @override
  double get elevation;

  /// Maximum table height (null for unlimited)
  @override
  double? get maxHeight;

  /// Minimum table height
  @override
  double get minHeight;

  /// Whether the table is scrollable horizontally
  @override
  bool get horizontalScrollable;

  /// Whether the table is scrollable vertically
  @override
  bool get verticalScrollable;

  /// Resize configuration
  @override
  DSDataTableResizeConfig? get resizeConfig;

  /// Freeze configuration for pinned columns
  @override
  DSDataTableFreezeConfig? get freezeConfig;

  /// Edit mode configuration
  @override
  DSDataTableEditMode get editMode;

  /// Whether to show loading state
  @override
  bool get showLoading;

  /// Whether to show skeleton state
  @override
  bool get showSkeleton;

  /// Number of skeleton rows to show
  @override
  int get skeletonRowCount;

  /// Loading indicator widget
  @override
  Widget? get loadingIndicator;

  /// Skeleton row builder
  @override
  DSDataTableSkeletonBuilder? get skeletonBuilder;

  /// Animation duration for state changes
  @override
  Duration get animationDuration;

  /// Animation curve for state changes
  @override
  Curve get animationCurve;

  /// Whether to enable keyboard navigation
  @override
  bool get enableKeyboardNavigation;

  /// Whether to enable accessibility features
  @override
  bool get enableAccessibility;

  /// Custom row actions
  @override
  List<DSDataTableRowAction>? get rowActions;

  /// Bulk actions for selected rows
  @override
  List<DSDataTableBulkAction>? get bulkActions;

  /// Context menu items
  @override
  List<DSDataTableContextMenuItem>? get contextMenuItems;

  /// Custom header actions
  @override
  List<Widget>? get headerActions;

  /// Footer widget
  @override
  Widget? get footer;

  /// Whether to show row numbers
  @override
  bool get showRowNumbers;

  /// Row number column width
  @override
  double get rowNumberWidth;

  /// Whether to enable drag and drop for rows
  @override
  bool get enableDragAndDrop;

  /// Drag and drop callback
  @override
  DSDataTableDragDropCallback? get onDragDrop;

  /// Whether to enable column reordering
  @override
  bool get enableColumnReordering;

  /// Column reorder callback
  @override
  DSDataTableColumnReorderCallback? get onColumnReorder;

  /// Whether to enable column hiding
  @override
  bool get enableColumnHiding;

  /// Column visibility callback
  @override
  DSDataTableColumnVisibilityCallback? get onColumnVisibilityChanged;

  /// Density for the table (compact, standard, comfortable)
  @override
  DSDataTableDensity get density;

  /// Custom theme overrides
  @override
  DSDataTableTheme? get theme;

  /// Platform-specific configurations
  @override
  DSDataTablePlatformConfig? get platformConfig;

  /// RTL support configuration
  @override
  bool get supportRTL;

  /// Accessibility configuration
  @override
  DSDataTableAccessibilityConfig? get accessibilityConfig;

  /// Create a copy of DSDataTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableConfigImplCopyWith<_$DSDataTableConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableRowAction {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  DSDataTableRowActionCallback get callback =>
      throw _privateConstructorUsedError;
  String? get tooltip => throw _privateConstructorUsedError;
  bool get visible => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableRowAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableRowActionCopyWith<DSDataTableRowAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableRowActionCopyWith<$Res> {
  factory $DSDataTableRowActionCopyWith(
    DSDataTableRowAction value,
    $Res Function(DSDataTableRowAction) then,
  ) = _$DSDataTableRowActionCopyWithImpl<$Res, DSDataTableRowAction>;
  @useResult
  $Res call({
    String id,
    String label,
    IconData icon,
    DSDataTableRowActionCallback callback,
    String? tooltip,
    bool visible,
    bool enabled,
    Color? color,
  });
}

/// @nodoc
class _$DSDataTableRowActionCopyWithImpl<
  $Res,
  $Val extends DSDataTableRowAction
>
    implements $DSDataTableRowActionCopyWith<$Res> {
  _$DSDataTableRowActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableRowAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? icon = null,
    Object? callback = null,
    Object? tooltip = freezed,
    Object? visible = null,
    Object? enabled = null,
    Object? color = freezed,
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
                      as IconData,
            callback: null == callback
                ? _value.callback
                : callback // ignore: cast_nullable_to_non_nullable
                      as DSDataTableRowActionCallback,
            tooltip: freezed == tooltip
                ? _value.tooltip
                : tooltip // ignore: cast_nullable_to_non_nullable
                      as String?,
            visible: null == visible
                ? _value.visible
                : visible // ignore: cast_nullable_to_non_nullable
                      as bool,
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableRowActionImplCopyWith<$Res>
    implements $DSDataTableRowActionCopyWith<$Res> {
  factory _$$DSDataTableRowActionImplCopyWith(
    _$DSDataTableRowActionImpl value,
    $Res Function(_$DSDataTableRowActionImpl) then,
  ) = __$$DSDataTableRowActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String label,
    IconData icon,
    DSDataTableRowActionCallback callback,
    String? tooltip,
    bool visible,
    bool enabled,
    Color? color,
  });
}

/// @nodoc
class __$$DSDataTableRowActionImplCopyWithImpl<$Res>
    extends _$DSDataTableRowActionCopyWithImpl<$Res, _$DSDataTableRowActionImpl>
    implements _$$DSDataTableRowActionImplCopyWith<$Res> {
  __$$DSDataTableRowActionImplCopyWithImpl(
    _$DSDataTableRowActionImpl _value,
    $Res Function(_$DSDataTableRowActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableRowAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? icon = null,
    Object? callback = null,
    Object? tooltip = freezed,
    Object? visible = null,
    Object? enabled = null,
    Object? color = freezed,
  }) {
    return _then(
      _$DSDataTableRowActionImpl(
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
                  as IconData,
        callback: null == callback
            ? _value.callback
            : callback // ignore: cast_nullable_to_non_nullable
                  as DSDataTableRowActionCallback,
        tooltip: freezed == tooltip
            ? _value.tooltip
            : tooltip // ignore: cast_nullable_to_non_nullable
                  as String?,
        visible: null == visible
            ? _value.visible
            : visible // ignore: cast_nullable_to_non_nullable
                  as bool,
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableRowActionImpl implements _DSDataTableRowAction {
  const _$DSDataTableRowActionImpl({
    required this.id,
    required this.label,
    required this.icon,
    required this.callback,
    this.tooltip,
    this.visible = true,
    this.enabled = true,
    this.color,
  });

  @override
  final String id;
  @override
  final String label;
  @override
  final IconData icon;
  @override
  final DSDataTableRowActionCallback callback;
  @override
  final String? tooltip;
  @override
  @JsonKey()
  final bool visible;
  @override
  @JsonKey()
  final bool enabled;
  @override
  final Color? color;

  @override
  String toString() {
    return 'DSDataTableRowAction(id: $id, label: $label, icon: $icon, callback: $callback, tooltip: $tooltip, visible: $visible, enabled: $enabled, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableRowActionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.callback, callback) ||
                other.callback == callback) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.visible, visible) || other.visible == visible) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    label,
    icon,
    callback,
    tooltip,
    visible,
    enabled,
    color,
  );

  /// Create a copy of DSDataTableRowAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableRowActionImplCopyWith<_$DSDataTableRowActionImpl>
  get copyWith =>
      __$$DSDataTableRowActionImplCopyWithImpl<_$DSDataTableRowActionImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDataTableRowAction implements DSDataTableRowAction {
  const factory _DSDataTableRowAction({
    required final String id,
    required final String label,
    required final IconData icon,
    required final DSDataTableRowActionCallback callback,
    final String? tooltip,
    final bool visible,
    final bool enabled,
    final Color? color,
  }) = _$DSDataTableRowActionImpl;

  @override
  String get id;
  @override
  String get label;
  @override
  IconData get icon;
  @override
  DSDataTableRowActionCallback get callback;
  @override
  String? get tooltip;
  @override
  bool get visible;
  @override
  bool get enabled;
  @override
  Color? get color;

  /// Create a copy of DSDataTableRowAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableRowActionImplCopyWith<_$DSDataTableRowActionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableBulkAction {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  DSDataTableBulkActionCallback get callback =>
      throw _privateConstructorUsedError;
  String? get tooltip => throw _privateConstructorUsedError;
  bool get visible => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  Color? get color => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableBulkAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableBulkActionCopyWith<DSDataTableBulkAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableBulkActionCopyWith<$Res> {
  factory $DSDataTableBulkActionCopyWith(
    DSDataTableBulkAction value,
    $Res Function(DSDataTableBulkAction) then,
  ) = _$DSDataTableBulkActionCopyWithImpl<$Res, DSDataTableBulkAction>;
  @useResult
  $Res call({
    String id,
    String label,
    IconData icon,
    DSDataTableBulkActionCallback callback,
    String? tooltip,
    bool visible,
    bool enabled,
    Color? color,
  });
}

/// @nodoc
class _$DSDataTableBulkActionCopyWithImpl<
  $Res,
  $Val extends DSDataTableBulkAction
>
    implements $DSDataTableBulkActionCopyWith<$Res> {
  _$DSDataTableBulkActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableBulkAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? icon = null,
    Object? callback = null,
    Object? tooltip = freezed,
    Object? visible = null,
    Object? enabled = null,
    Object? color = freezed,
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
                      as IconData,
            callback: null == callback
                ? _value.callback
                : callback // ignore: cast_nullable_to_non_nullable
                      as DSDataTableBulkActionCallback,
            tooltip: freezed == tooltip
                ? _value.tooltip
                : tooltip // ignore: cast_nullable_to_non_nullable
                      as String?,
            visible: null == visible
                ? _value.visible
                : visible // ignore: cast_nullable_to_non_nullable
                      as bool,
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as Color?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableBulkActionImplCopyWith<$Res>
    implements $DSDataTableBulkActionCopyWith<$Res> {
  factory _$$DSDataTableBulkActionImplCopyWith(
    _$DSDataTableBulkActionImpl value,
    $Res Function(_$DSDataTableBulkActionImpl) then,
  ) = __$$DSDataTableBulkActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String label,
    IconData icon,
    DSDataTableBulkActionCallback callback,
    String? tooltip,
    bool visible,
    bool enabled,
    Color? color,
  });
}

/// @nodoc
class __$$DSDataTableBulkActionImplCopyWithImpl<$Res>
    extends
        _$DSDataTableBulkActionCopyWithImpl<$Res, _$DSDataTableBulkActionImpl>
    implements _$$DSDataTableBulkActionImplCopyWith<$Res> {
  __$$DSDataTableBulkActionImplCopyWithImpl(
    _$DSDataTableBulkActionImpl _value,
    $Res Function(_$DSDataTableBulkActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableBulkAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? icon = null,
    Object? callback = null,
    Object? tooltip = freezed,
    Object? visible = null,
    Object? enabled = null,
    Object? color = freezed,
  }) {
    return _then(
      _$DSDataTableBulkActionImpl(
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
                  as IconData,
        callback: null == callback
            ? _value.callback
            : callback // ignore: cast_nullable_to_non_nullable
                  as DSDataTableBulkActionCallback,
        tooltip: freezed == tooltip
            ? _value.tooltip
            : tooltip // ignore: cast_nullable_to_non_nullable
                  as String?,
        visible: null == visible
            ? _value.visible
            : visible // ignore: cast_nullable_to_non_nullable
                  as bool,
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as Color?,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableBulkActionImpl implements _DSDataTableBulkAction {
  const _$DSDataTableBulkActionImpl({
    required this.id,
    required this.label,
    required this.icon,
    required this.callback,
    this.tooltip,
    this.visible = true,
    this.enabled = true,
    this.color,
  });

  @override
  final String id;
  @override
  final String label;
  @override
  final IconData icon;
  @override
  final DSDataTableBulkActionCallback callback;
  @override
  final String? tooltip;
  @override
  @JsonKey()
  final bool visible;
  @override
  @JsonKey()
  final bool enabled;
  @override
  final Color? color;

  @override
  String toString() {
    return 'DSDataTableBulkAction(id: $id, label: $label, icon: $icon, callback: $callback, tooltip: $tooltip, visible: $visible, enabled: $enabled, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableBulkActionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.callback, callback) ||
                other.callback == callback) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.visible, visible) || other.visible == visible) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    label,
    icon,
    callback,
    tooltip,
    visible,
    enabled,
    color,
  );

  /// Create a copy of DSDataTableBulkAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableBulkActionImplCopyWith<_$DSDataTableBulkActionImpl>
  get copyWith =>
      __$$DSDataTableBulkActionImplCopyWithImpl<_$DSDataTableBulkActionImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDataTableBulkAction implements DSDataTableBulkAction {
  const factory _DSDataTableBulkAction({
    required final String id,
    required final String label,
    required final IconData icon,
    required final DSDataTableBulkActionCallback callback,
    final String? tooltip,
    final bool visible,
    final bool enabled,
    final Color? color,
  }) = _$DSDataTableBulkActionImpl;

  @override
  String get id;
  @override
  String get label;
  @override
  IconData get icon;
  @override
  DSDataTableBulkActionCallback get callback;
  @override
  String? get tooltip;
  @override
  bool get visible;
  @override
  bool get enabled;
  @override
  Color? get color;

  /// Create a copy of DSDataTableBulkAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableBulkActionImplCopyWith<_$DSDataTableBulkActionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableContextMenuItem {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  IconData? get icon => throw _privateConstructorUsedError;
  DSDataTableContextMenuCallback get callback =>
      throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  bool get isDivider => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableContextMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableContextMenuItemCopyWith<DSDataTableContextMenuItem>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableContextMenuItemCopyWith<$Res> {
  factory $DSDataTableContextMenuItemCopyWith(
    DSDataTableContextMenuItem value,
    $Res Function(DSDataTableContextMenuItem) then,
  ) =
      _$DSDataTableContextMenuItemCopyWithImpl<
        $Res,
        DSDataTableContextMenuItem
      >;
  @useResult
  $Res call({
    String id,
    String label,
    IconData? icon,
    DSDataTableContextMenuCallback callback,
    bool enabled,
    bool isDivider,
  });
}

/// @nodoc
class _$DSDataTableContextMenuItemCopyWithImpl<
  $Res,
  $Val extends DSDataTableContextMenuItem
>
    implements $DSDataTableContextMenuItemCopyWith<$Res> {
  _$DSDataTableContextMenuItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableContextMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? icon = freezed,
    Object? callback = null,
    Object? enabled = null,
    Object? isDivider = null,
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
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as IconData?,
            callback: null == callback
                ? _value.callback
                : callback // ignore: cast_nullable_to_non_nullable
                      as DSDataTableContextMenuCallback,
            enabled: null == enabled
                ? _value.enabled
                : enabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            isDivider: null == isDivider
                ? _value.isDivider
                : isDivider // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableContextMenuItemImplCopyWith<$Res>
    implements $DSDataTableContextMenuItemCopyWith<$Res> {
  factory _$$DSDataTableContextMenuItemImplCopyWith(
    _$DSDataTableContextMenuItemImpl value,
    $Res Function(_$DSDataTableContextMenuItemImpl) then,
  ) = __$$DSDataTableContextMenuItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String label,
    IconData? icon,
    DSDataTableContextMenuCallback callback,
    bool enabled,
    bool isDivider,
  });
}

/// @nodoc
class __$$DSDataTableContextMenuItemImplCopyWithImpl<$Res>
    extends
        _$DSDataTableContextMenuItemCopyWithImpl<
          $Res,
          _$DSDataTableContextMenuItemImpl
        >
    implements _$$DSDataTableContextMenuItemImplCopyWith<$Res> {
  __$$DSDataTableContextMenuItemImplCopyWithImpl(
    _$DSDataTableContextMenuItemImpl _value,
    $Res Function(_$DSDataTableContextMenuItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableContextMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? icon = freezed,
    Object? callback = null,
    Object? enabled = null,
    Object? isDivider = null,
  }) {
    return _then(
      _$DSDataTableContextMenuItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as IconData?,
        callback: null == callback
            ? _value.callback
            : callback // ignore: cast_nullable_to_non_nullable
                  as DSDataTableContextMenuCallback,
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        isDivider: null == isDivider
            ? _value.isDivider
            : isDivider // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableContextMenuItemImpl implements _DSDataTableContextMenuItem {
  const _$DSDataTableContextMenuItemImpl({
    required this.id,
    required this.label,
    this.icon,
    required this.callback,
    this.enabled = true,
    this.isDivider = false,
  });

  @override
  final String id;
  @override
  final String label;
  @override
  final IconData? icon;
  @override
  final DSDataTableContextMenuCallback callback;
  @override
  @JsonKey()
  final bool enabled;
  @override
  @JsonKey()
  final bool isDivider;

  @override
  String toString() {
    return 'DSDataTableContextMenuItem(id: $id, label: $label, icon: $icon, callback: $callback, enabled: $enabled, isDivider: $isDivider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableContextMenuItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.callback, callback) ||
                other.callback == callback) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.isDivider, isDivider) ||
                other.isDivider == isDivider));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, label, icon, callback, enabled, isDivider);

  /// Create a copy of DSDataTableContextMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableContextMenuItemImplCopyWith<_$DSDataTableContextMenuItemImpl>
  get copyWith =>
      __$$DSDataTableContextMenuItemImplCopyWithImpl<
        _$DSDataTableContextMenuItemImpl
      >(this, _$identity);
}

abstract class _DSDataTableContextMenuItem
    implements DSDataTableContextMenuItem {
  const factory _DSDataTableContextMenuItem({
    required final String id,
    required final String label,
    final IconData? icon,
    required final DSDataTableContextMenuCallback callback,
    final bool enabled,
    final bool isDivider,
  }) = _$DSDataTableContextMenuItemImpl;

  @override
  String get id;
  @override
  String get label;
  @override
  IconData? get icon;
  @override
  DSDataTableContextMenuCallback get callback;
  @override
  bool get enabled;
  @override
  bool get isDivider;

  /// Create a copy of DSDataTableContextMenuItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableContextMenuItemImplCopyWith<_$DSDataTableContextMenuItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableTheme {
  /// Header background color
  Color? get headerBackgroundColor => throw _privateConstructorUsedError;

  /// Header text color
  Color? get headerTextColor => throw _privateConstructorUsedError;

  /// Row background color
  Color? get rowBackgroundColor => throw _privateConstructorUsedError;

  /// Alternate row background color
  Color? get alternateRowBackgroundColor => throw _privateConstructorUsedError;

  /// Selected row background color
  Color? get selectedRowBackgroundColor => throw _privateConstructorUsedError;

  /// Hovered row background color
  Color? get hoveredRowBackgroundColor => throw _privateConstructorUsedError;

  /// Row text color
  Color? get rowTextColor => throw _privateConstructorUsedError;

  /// Selected row text color
  Color? get selectedRowTextColor => throw _privateConstructorUsedError;

  /// Border color
  Color? get borderColor => throw _privateConstructorUsedError;

  /// Divider color
  Color? get dividerColor => throw _privateConstructorUsedError;

  /// Sort icon color
  Color? get sortIconColor => throw _privateConstructorUsedError;

  /// Resize handle color
  Color? get resizeHandleColor => throw _privateConstructorUsedError;

  /// Loading indicator color
  Color? get loadingIndicatorColor => throw _privateConstructorUsedError;

  /// Custom cell styles
  Map<DSDataTableCellType, TextStyle>? get cellStyles =>
      throw _privateConstructorUsedError;

  /// Custom header style
  TextStyle? get headerStyle => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableThemeCopyWith<DSDataTableTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableThemeCopyWith<$Res> {
  factory $DSDataTableThemeCopyWith(
    DSDataTableTheme value,
    $Res Function(DSDataTableTheme) then,
  ) = _$DSDataTableThemeCopyWithImpl<$Res, DSDataTableTheme>;
  @useResult
  $Res call({
    Color? headerBackgroundColor,
    Color? headerTextColor,
    Color? rowBackgroundColor,
    Color? alternateRowBackgroundColor,
    Color? selectedRowBackgroundColor,
    Color? hoveredRowBackgroundColor,
    Color? rowTextColor,
    Color? selectedRowTextColor,
    Color? borderColor,
    Color? dividerColor,
    Color? sortIconColor,
    Color? resizeHandleColor,
    Color? loadingIndicatorColor,
    Map<DSDataTableCellType, TextStyle>? cellStyles,
    TextStyle? headerStyle,
  });
}

/// @nodoc
class _$DSDataTableThemeCopyWithImpl<$Res, $Val extends DSDataTableTheme>
    implements $DSDataTableThemeCopyWith<$Res> {
  _$DSDataTableThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headerBackgroundColor = freezed,
    Object? headerTextColor = freezed,
    Object? rowBackgroundColor = freezed,
    Object? alternateRowBackgroundColor = freezed,
    Object? selectedRowBackgroundColor = freezed,
    Object? hoveredRowBackgroundColor = freezed,
    Object? rowTextColor = freezed,
    Object? selectedRowTextColor = freezed,
    Object? borderColor = freezed,
    Object? dividerColor = freezed,
    Object? sortIconColor = freezed,
    Object? resizeHandleColor = freezed,
    Object? loadingIndicatorColor = freezed,
    Object? cellStyles = freezed,
    Object? headerStyle = freezed,
  }) {
    return _then(
      _value.copyWith(
            headerBackgroundColor: freezed == headerBackgroundColor
                ? _value.headerBackgroundColor
                : headerBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            headerTextColor: freezed == headerTextColor
                ? _value.headerTextColor
                : headerTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            rowBackgroundColor: freezed == rowBackgroundColor
                ? _value.rowBackgroundColor
                : rowBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            alternateRowBackgroundColor: freezed == alternateRowBackgroundColor
                ? _value.alternateRowBackgroundColor
                : alternateRowBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            selectedRowBackgroundColor: freezed == selectedRowBackgroundColor
                ? _value.selectedRowBackgroundColor
                : selectedRowBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            hoveredRowBackgroundColor: freezed == hoveredRowBackgroundColor
                ? _value.hoveredRowBackgroundColor
                : hoveredRowBackgroundColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            rowTextColor: freezed == rowTextColor
                ? _value.rowTextColor
                : rowTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            selectedRowTextColor: freezed == selectedRowTextColor
                ? _value.selectedRowTextColor
                : selectedRowTextColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            borderColor: freezed == borderColor
                ? _value.borderColor
                : borderColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            dividerColor: freezed == dividerColor
                ? _value.dividerColor
                : dividerColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            sortIconColor: freezed == sortIconColor
                ? _value.sortIconColor
                : sortIconColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            resizeHandleColor: freezed == resizeHandleColor
                ? _value.resizeHandleColor
                : resizeHandleColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            loadingIndicatorColor: freezed == loadingIndicatorColor
                ? _value.loadingIndicatorColor
                : loadingIndicatorColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            cellStyles: freezed == cellStyles
                ? _value.cellStyles
                : cellStyles // ignore: cast_nullable_to_non_nullable
                      as Map<DSDataTableCellType, TextStyle>?,
            headerStyle: freezed == headerStyle
                ? _value.headerStyle
                : headerStyle // ignore: cast_nullable_to_non_nullable
                      as TextStyle?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableThemeImplCopyWith<$Res>
    implements $DSDataTableThemeCopyWith<$Res> {
  factory _$$DSDataTableThemeImplCopyWith(
    _$DSDataTableThemeImpl value,
    $Res Function(_$DSDataTableThemeImpl) then,
  ) = __$$DSDataTableThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? headerBackgroundColor,
    Color? headerTextColor,
    Color? rowBackgroundColor,
    Color? alternateRowBackgroundColor,
    Color? selectedRowBackgroundColor,
    Color? hoveredRowBackgroundColor,
    Color? rowTextColor,
    Color? selectedRowTextColor,
    Color? borderColor,
    Color? dividerColor,
    Color? sortIconColor,
    Color? resizeHandleColor,
    Color? loadingIndicatorColor,
    Map<DSDataTableCellType, TextStyle>? cellStyles,
    TextStyle? headerStyle,
  });
}

/// @nodoc
class __$$DSDataTableThemeImplCopyWithImpl<$Res>
    extends _$DSDataTableThemeCopyWithImpl<$Res, _$DSDataTableThemeImpl>
    implements _$$DSDataTableThemeImplCopyWith<$Res> {
  __$$DSDataTableThemeImplCopyWithImpl(
    _$DSDataTableThemeImpl _value,
    $Res Function(_$DSDataTableThemeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableTheme
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? headerBackgroundColor = freezed,
    Object? headerTextColor = freezed,
    Object? rowBackgroundColor = freezed,
    Object? alternateRowBackgroundColor = freezed,
    Object? selectedRowBackgroundColor = freezed,
    Object? hoveredRowBackgroundColor = freezed,
    Object? rowTextColor = freezed,
    Object? selectedRowTextColor = freezed,
    Object? borderColor = freezed,
    Object? dividerColor = freezed,
    Object? sortIconColor = freezed,
    Object? resizeHandleColor = freezed,
    Object? loadingIndicatorColor = freezed,
    Object? cellStyles = freezed,
    Object? headerStyle = freezed,
  }) {
    return _then(
      _$DSDataTableThemeImpl(
        headerBackgroundColor: freezed == headerBackgroundColor
            ? _value.headerBackgroundColor
            : headerBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        headerTextColor: freezed == headerTextColor
            ? _value.headerTextColor
            : headerTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        rowBackgroundColor: freezed == rowBackgroundColor
            ? _value.rowBackgroundColor
            : rowBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        alternateRowBackgroundColor: freezed == alternateRowBackgroundColor
            ? _value.alternateRowBackgroundColor
            : alternateRowBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        selectedRowBackgroundColor: freezed == selectedRowBackgroundColor
            ? _value.selectedRowBackgroundColor
            : selectedRowBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        hoveredRowBackgroundColor: freezed == hoveredRowBackgroundColor
            ? _value.hoveredRowBackgroundColor
            : hoveredRowBackgroundColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        rowTextColor: freezed == rowTextColor
            ? _value.rowTextColor
            : rowTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        selectedRowTextColor: freezed == selectedRowTextColor
            ? _value.selectedRowTextColor
            : selectedRowTextColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        borderColor: freezed == borderColor
            ? _value.borderColor
            : borderColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        dividerColor: freezed == dividerColor
            ? _value.dividerColor
            : dividerColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        sortIconColor: freezed == sortIconColor
            ? _value.sortIconColor
            : sortIconColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        resizeHandleColor: freezed == resizeHandleColor
            ? _value.resizeHandleColor
            : resizeHandleColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        loadingIndicatorColor: freezed == loadingIndicatorColor
            ? _value.loadingIndicatorColor
            : loadingIndicatorColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        cellStyles: freezed == cellStyles
            ? _value._cellStyles
            : cellStyles // ignore: cast_nullable_to_non_nullable
                  as Map<DSDataTableCellType, TextStyle>?,
        headerStyle: freezed == headerStyle
            ? _value.headerStyle
            : headerStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableThemeImpl implements _DSDataTableTheme {
  const _$DSDataTableThemeImpl({
    this.headerBackgroundColor,
    this.headerTextColor,
    this.rowBackgroundColor,
    this.alternateRowBackgroundColor,
    this.selectedRowBackgroundColor,
    this.hoveredRowBackgroundColor,
    this.rowTextColor,
    this.selectedRowTextColor,
    this.borderColor,
    this.dividerColor,
    this.sortIconColor,
    this.resizeHandleColor,
    this.loadingIndicatorColor,
    final Map<DSDataTableCellType, TextStyle>? cellStyles,
    this.headerStyle,
  }) : _cellStyles = cellStyles;

  /// Header background color
  @override
  final Color? headerBackgroundColor;

  /// Header text color
  @override
  final Color? headerTextColor;

  /// Row background color
  @override
  final Color? rowBackgroundColor;

  /// Alternate row background color
  @override
  final Color? alternateRowBackgroundColor;

  /// Selected row background color
  @override
  final Color? selectedRowBackgroundColor;

  /// Hovered row background color
  @override
  final Color? hoveredRowBackgroundColor;

  /// Row text color
  @override
  final Color? rowTextColor;

  /// Selected row text color
  @override
  final Color? selectedRowTextColor;

  /// Border color
  @override
  final Color? borderColor;

  /// Divider color
  @override
  final Color? dividerColor;

  /// Sort icon color
  @override
  final Color? sortIconColor;

  /// Resize handle color
  @override
  final Color? resizeHandleColor;

  /// Loading indicator color
  @override
  final Color? loadingIndicatorColor;

  /// Custom cell styles
  final Map<DSDataTableCellType, TextStyle>? _cellStyles;

  /// Custom cell styles
  @override
  Map<DSDataTableCellType, TextStyle>? get cellStyles {
    final value = _cellStyles;
    if (value == null) return null;
    if (_cellStyles is EqualUnmodifiableMapView) return _cellStyles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Custom header style
  @override
  final TextStyle? headerStyle;

  @override
  String toString() {
    return 'DSDataTableTheme(headerBackgroundColor: $headerBackgroundColor, headerTextColor: $headerTextColor, rowBackgroundColor: $rowBackgroundColor, alternateRowBackgroundColor: $alternateRowBackgroundColor, selectedRowBackgroundColor: $selectedRowBackgroundColor, hoveredRowBackgroundColor: $hoveredRowBackgroundColor, rowTextColor: $rowTextColor, selectedRowTextColor: $selectedRowTextColor, borderColor: $borderColor, dividerColor: $dividerColor, sortIconColor: $sortIconColor, resizeHandleColor: $resizeHandleColor, loadingIndicatorColor: $loadingIndicatorColor, cellStyles: $cellStyles, headerStyle: $headerStyle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableThemeImpl &&
            (identical(other.headerBackgroundColor, headerBackgroundColor) ||
                other.headerBackgroundColor == headerBackgroundColor) &&
            (identical(other.headerTextColor, headerTextColor) ||
                other.headerTextColor == headerTextColor) &&
            (identical(other.rowBackgroundColor, rowBackgroundColor) ||
                other.rowBackgroundColor == rowBackgroundColor) &&
            (identical(
                  other.alternateRowBackgroundColor,
                  alternateRowBackgroundColor,
                ) ||
                other.alternateRowBackgroundColor ==
                    alternateRowBackgroundColor) &&
            (identical(
                  other.selectedRowBackgroundColor,
                  selectedRowBackgroundColor,
                ) ||
                other.selectedRowBackgroundColor ==
                    selectedRowBackgroundColor) &&
            (identical(
                  other.hoveredRowBackgroundColor,
                  hoveredRowBackgroundColor,
                ) ||
                other.hoveredRowBackgroundColor == hoveredRowBackgroundColor) &&
            (identical(other.rowTextColor, rowTextColor) ||
                other.rowTextColor == rowTextColor) &&
            (identical(other.selectedRowTextColor, selectedRowTextColor) ||
                other.selectedRowTextColor == selectedRowTextColor) &&
            (identical(other.borderColor, borderColor) ||
                other.borderColor == borderColor) &&
            (identical(other.dividerColor, dividerColor) ||
                other.dividerColor == dividerColor) &&
            (identical(other.sortIconColor, sortIconColor) ||
                other.sortIconColor == sortIconColor) &&
            (identical(other.resizeHandleColor, resizeHandleColor) ||
                other.resizeHandleColor == resizeHandleColor) &&
            (identical(other.loadingIndicatorColor, loadingIndicatorColor) ||
                other.loadingIndicatorColor == loadingIndicatorColor) &&
            const DeepCollectionEquality().equals(
              other._cellStyles,
              _cellStyles,
            ) &&
            (identical(other.headerStyle, headerStyle) ||
                other.headerStyle == headerStyle));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    headerBackgroundColor,
    headerTextColor,
    rowBackgroundColor,
    alternateRowBackgroundColor,
    selectedRowBackgroundColor,
    hoveredRowBackgroundColor,
    rowTextColor,
    selectedRowTextColor,
    borderColor,
    dividerColor,
    sortIconColor,
    resizeHandleColor,
    loadingIndicatorColor,
    const DeepCollectionEquality().hash(_cellStyles),
    headerStyle,
  );

  /// Create a copy of DSDataTableTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableThemeImplCopyWith<_$DSDataTableThemeImpl> get copyWith =>
      __$$DSDataTableThemeImplCopyWithImpl<_$DSDataTableThemeImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDataTableTheme implements DSDataTableTheme {
  const factory _DSDataTableTheme({
    final Color? headerBackgroundColor,
    final Color? headerTextColor,
    final Color? rowBackgroundColor,
    final Color? alternateRowBackgroundColor,
    final Color? selectedRowBackgroundColor,
    final Color? hoveredRowBackgroundColor,
    final Color? rowTextColor,
    final Color? selectedRowTextColor,
    final Color? borderColor,
    final Color? dividerColor,
    final Color? sortIconColor,
    final Color? resizeHandleColor,
    final Color? loadingIndicatorColor,
    final Map<DSDataTableCellType, TextStyle>? cellStyles,
    final TextStyle? headerStyle,
  }) = _$DSDataTableThemeImpl;

  /// Header background color
  @override
  Color? get headerBackgroundColor;

  /// Header text color
  @override
  Color? get headerTextColor;

  /// Row background color
  @override
  Color? get rowBackgroundColor;

  /// Alternate row background color
  @override
  Color? get alternateRowBackgroundColor;

  /// Selected row background color
  @override
  Color? get selectedRowBackgroundColor;

  /// Hovered row background color
  @override
  Color? get hoveredRowBackgroundColor;

  /// Row text color
  @override
  Color? get rowTextColor;

  /// Selected row text color
  @override
  Color? get selectedRowTextColor;

  /// Border color
  @override
  Color? get borderColor;

  /// Divider color
  @override
  Color? get dividerColor;

  /// Sort icon color
  @override
  Color? get sortIconColor;

  /// Resize handle color
  @override
  Color? get resizeHandleColor;

  /// Loading indicator color
  @override
  Color? get loadingIndicatorColor;

  /// Custom cell styles
  @override
  Map<DSDataTableCellType, TextStyle>? get cellStyles;

  /// Custom header style
  @override
  TextStyle? get headerStyle;

  /// Create a copy of DSDataTableTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableThemeImplCopyWith<_$DSDataTableThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTablePlatformConfig {
  /// iOS-specific configurations
  DSDataTableIOSConfig? get ios => throw _privateConstructorUsedError;

  /// Android-specific configurations
  DSDataTableAndroidConfig? get android => throw _privateConstructorUsedError;

  /// Web-specific configurations
  DSDataTableWebConfig? get web => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTablePlatformConfigCopyWith<DSDataTablePlatformConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTablePlatformConfigCopyWith<$Res> {
  factory $DSDataTablePlatformConfigCopyWith(
    DSDataTablePlatformConfig value,
    $Res Function(DSDataTablePlatformConfig) then,
  ) = _$DSDataTablePlatformConfigCopyWithImpl<$Res, DSDataTablePlatformConfig>;
  @useResult
  $Res call({
    DSDataTableIOSConfig? ios,
    DSDataTableAndroidConfig? android,
    DSDataTableWebConfig? web,
  });

  $DSDataTableIOSConfigCopyWith<$Res>? get ios;
  $DSDataTableAndroidConfigCopyWith<$Res>? get android;
  $DSDataTableWebConfigCopyWith<$Res>? get web;
}

/// @nodoc
class _$DSDataTablePlatformConfigCopyWithImpl<
  $Res,
  $Val extends DSDataTablePlatformConfig
>
    implements $DSDataTablePlatformConfigCopyWith<$Res> {
  _$DSDataTablePlatformConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ios = freezed,
    Object? android = freezed,
    Object? web = freezed,
  }) {
    return _then(
      _value.copyWith(
            ios: freezed == ios
                ? _value.ios
                : ios // ignore: cast_nullable_to_non_nullable
                      as DSDataTableIOSConfig?,
            android: freezed == android
                ? _value.android
                : android // ignore: cast_nullable_to_non_nullable
                      as DSDataTableAndroidConfig?,
            web: freezed == web
                ? _value.web
                : web // ignore: cast_nullable_to_non_nullable
                      as DSDataTableWebConfig?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSDataTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSDataTableIOSConfigCopyWith<$Res>? get ios {
    if (_value.ios == null) {
      return null;
    }

    return $DSDataTableIOSConfigCopyWith<$Res>(_value.ios!, (value) {
      return _then(_value.copyWith(ios: value) as $Val);
    });
  }

  /// Create a copy of DSDataTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSDataTableAndroidConfigCopyWith<$Res>? get android {
    if (_value.android == null) {
      return null;
    }

    return $DSDataTableAndroidConfigCopyWith<$Res>(_value.android!, (value) {
      return _then(_value.copyWith(android: value) as $Val);
    });
  }

  /// Create a copy of DSDataTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSDataTableWebConfigCopyWith<$Res>? get web {
    if (_value.web == null) {
      return null;
    }

    return $DSDataTableWebConfigCopyWith<$Res>(_value.web!, (value) {
      return _then(_value.copyWith(web: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSDataTablePlatformConfigImplCopyWith<$Res>
    implements $DSDataTablePlatformConfigCopyWith<$Res> {
  factory _$$DSDataTablePlatformConfigImplCopyWith(
    _$DSDataTablePlatformConfigImpl value,
    $Res Function(_$DSDataTablePlatformConfigImpl) then,
  ) = __$$DSDataTablePlatformConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSDataTableIOSConfig? ios,
    DSDataTableAndroidConfig? android,
    DSDataTableWebConfig? web,
  });

  @override
  $DSDataTableIOSConfigCopyWith<$Res>? get ios;
  @override
  $DSDataTableAndroidConfigCopyWith<$Res>? get android;
  @override
  $DSDataTableWebConfigCopyWith<$Res>? get web;
}

/// @nodoc
class __$$DSDataTablePlatformConfigImplCopyWithImpl<$Res>
    extends
        _$DSDataTablePlatformConfigCopyWithImpl<
          $Res,
          _$DSDataTablePlatformConfigImpl
        >
    implements _$$DSDataTablePlatformConfigImplCopyWith<$Res> {
  __$$DSDataTablePlatformConfigImplCopyWithImpl(
    _$DSDataTablePlatformConfigImpl _value,
    $Res Function(_$DSDataTablePlatformConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ios = freezed,
    Object? android = freezed,
    Object? web = freezed,
  }) {
    return _then(
      _$DSDataTablePlatformConfigImpl(
        ios: freezed == ios
            ? _value.ios
            : ios // ignore: cast_nullable_to_non_nullable
                  as DSDataTableIOSConfig?,
        android: freezed == android
            ? _value.android
            : android // ignore: cast_nullable_to_non_nullable
                  as DSDataTableAndroidConfig?,
        web: freezed == web
            ? _value.web
            : web // ignore: cast_nullable_to_non_nullable
                  as DSDataTableWebConfig?,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTablePlatformConfigImpl implements _DSDataTablePlatformConfig {
  const _$DSDataTablePlatformConfigImpl({this.ios, this.android, this.web});

  /// iOS-specific configurations
  @override
  final DSDataTableIOSConfig? ios;

  /// Android-specific configurations
  @override
  final DSDataTableAndroidConfig? android;

  /// Web-specific configurations
  @override
  final DSDataTableWebConfig? web;

  @override
  String toString() {
    return 'DSDataTablePlatformConfig(ios: $ios, android: $android, web: $web)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTablePlatformConfigImpl &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.android, android) || other.android == android) &&
            (identical(other.web, web) || other.web == web));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ios, android, web);

  /// Create a copy of DSDataTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTablePlatformConfigImplCopyWith<_$DSDataTablePlatformConfigImpl>
  get copyWith =>
      __$$DSDataTablePlatformConfigImplCopyWithImpl<
        _$DSDataTablePlatformConfigImpl
      >(this, _$identity);
}

abstract class _DSDataTablePlatformConfig implements DSDataTablePlatformConfig {
  const factory _DSDataTablePlatformConfig({
    final DSDataTableIOSConfig? ios,
    final DSDataTableAndroidConfig? android,
    final DSDataTableWebConfig? web,
  }) = _$DSDataTablePlatformConfigImpl;

  /// iOS-specific configurations
  @override
  DSDataTableIOSConfig? get ios;

  /// Android-specific configurations
  @override
  DSDataTableAndroidConfig? get android;

  /// Web-specific configurations
  @override
  DSDataTableWebConfig? get web;

  /// Create a copy of DSDataTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTablePlatformConfigImplCopyWith<_$DSDataTablePlatformConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableIOSConfig {
  /// Whether to use iOS-style scrollbars
  bool get useIOSScrollbars => throw _privateConstructorUsedError;

  /// Whether to enable haptic feedback
  bool get enableHapticFeedback => throw _privateConstructorUsedError;

  /// iOS-specific row height
  double? get rowHeight => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableIOSConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableIOSConfigCopyWith<DSDataTableIOSConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableIOSConfigCopyWith<$Res> {
  factory $DSDataTableIOSConfigCopyWith(
    DSDataTableIOSConfig value,
    $Res Function(DSDataTableIOSConfig) then,
  ) = _$DSDataTableIOSConfigCopyWithImpl<$Res, DSDataTableIOSConfig>;
  @useResult
  $Res call({
    bool useIOSScrollbars,
    bool enableHapticFeedback,
    double? rowHeight,
  });
}

/// @nodoc
class _$DSDataTableIOSConfigCopyWithImpl<
  $Res,
  $Val extends DSDataTableIOSConfig
>
    implements $DSDataTableIOSConfigCopyWith<$Res> {
  _$DSDataTableIOSConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableIOSConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useIOSScrollbars = null,
    Object? enableHapticFeedback = null,
    Object? rowHeight = freezed,
  }) {
    return _then(
      _value.copyWith(
            useIOSScrollbars: null == useIOSScrollbars
                ? _value.useIOSScrollbars
                : useIOSScrollbars // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableHapticFeedback: null == enableHapticFeedback
                ? _value.enableHapticFeedback
                : enableHapticFeedback // ignore: cast_nullable_to_non_nullable
                      as bool,
            rowHeight: freezed == rowHeight
                ? _value.rowHeight
                : rowHeight // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableIOSConfigImplCopyWith<$Res>
    implements $DSDataTableIOSConfigCopyWith<$Res> {
  factory _$$DSDataTableIOSConfigImplCopyWith(
    _$DSDataTableIOSConfigImpl value,
    $Res Function(_$DSDataTableIOSConfigImpl) then,
  ) = __$$DSDataTableIOSConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool useIOSScrollbars,
    bool enableHapticFeedback,
    double? rowHeight,
  });
}

/// @nodoc
class __$$DSDataTableIOSConfigImplCopyWithImpl<$Res>
    extends _$DSDataTableIOSConfigCopyWithImpl<$Res, _$DSDataTableIOSConfigImpl>
    implements _$$DSDataTableIOSConfigImplCopyWith<$Res> {
  __$$DSDataTableIOSConfigImplCopyWithImpl(
    _$DSDataTableIOSConfigImpl _value,
    $Res Function(_$DSDataTableIOSConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableIOSConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useIOSScrollbars = null,
    Object? enableHapticFeedback = null,
    Object? rowHeight = freezed,
  }) {
    return _then(
      _$DSDataTableIOSConfigImpl(
        useIOSScrollbars: null == useIOSScrollbars
            ? _value.useIOSScrollbars
            : useIOSScrollbars // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableHapticFeedback: null == enableHapticFeedback
            ? _value.enableHapticFeedback
            : enableHapticFeedback // ignore: cast_nullable_to_non_nullable
                  as bool,
        rowHeight: freezed == rowHeight
            ? _value.rowHeight
            : rowHeight // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableIOSConfigImpl implements _DSDataTableIOSConfig {
  const _$DSDataTableIOSConfigImpl({
    this.useIOSScrollbars = true,
    this.enableHapticFeedback = true,
    this.rowHeight,
  });

  /// Whether to use iOS-style scrollbars
  @override
  @JsonKey()
  final bool useIOSScrollbars;

  /// Whether to enable haptic feedback
  @override
  @JsonKey()
  final bool enableHapticFeedback;

  /// iOS-specific row height
  @override
  final double? rowHeight;

  @override
  String toString() {
    return 'DSDataTableIOSConfig(useIOSScrollbars: $useIOSScrollbars, enableHapticFeedback: $enableHapticFeedback, rowHeight: $rowHeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableIOSConfigImpl &&
            (identical(other.useIOSScrollbars, useIOSScrollbars) ||
                other.useIOSScrollbars == useIOSScrollbars) &&
            (identical(other.enableHapticFeedback, enableHapticFeedback) ||
                other.enableHapticFeedback == enableHapticFeedback) &&
            (identical(other.rowHeight, rowHeight) ||
                other.rowHeight == rowHeight));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    useIOSScrollbars,
    enableHapticFeedback,
    rowHeight,
  );

  /// Create a copy of DSDataTableIOSConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableIOSConfigImplCopyWith<_$DSDataTableIOSConfigImpl>
  get copyWith =>
      __$$DSDataTableIOSConfigImplCopyWithImpl<_$DSDataTableIOSConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDataTableIOSConfig implements DSDataTableIOSConfig {
  const factory _DSDataTableIOSConfig({
    final bool useIOSScrollbars,
    final bool enableHapticFeedback,
    final double? rowHeight,
  }) = _$DSDataTableIOSConfigImpl;

  /// Whether to use iOS-style scrollbars
  @override
  bool get useIOSScrollbars;

  /// Whether to enable haptic feedback
  @override
  bool get enableHapticFeedback;

  /// iOS-specific row height
  @override
  double? get rowHeight;

  /// Create a copy of DSDataTableIOSConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableIOSConfigImplCopyWith<_$DSDataTableIOSConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableAndroidConfig {
  /// Whether to use Material ripple effects
  bool get useMaterialRipple => throw _privateConstructorUsedError;

  /// Android-specific row height
  double? get rowHeight => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableAndroidConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableAndroidConfigCopyWith<DSDataTableAndroidConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableAndroidConfigCopyWith<$Res> {
  factory $DSDataTableAndroidConfigCopyWith(
    DSDataTableAndroidConfig value,
    $Res Function(DSDataTableAndroidConfig) then,
  ) = _$DSDataTableAndroidConfigCopyWithImpl<$Res, DSDataTableAndroidConfig>;
  @useResult
  $Res call({bool useMaterialRipple, double? rowHeight});
}

/// @nodoc
class _$DSDataTableAndroidConfigCopyWithImpl<
  $Res,
  $Val extends DSDataTableAndroidConfig
>
    implements $DSDataTableAndroidConfigCopyWith<$Res> {
  _$DSDataTableAndroidConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableAndroidConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? useMaterialRipple = null, Object? rowHeight = freezed}) {
    return _then(
      _value.copyWith(
            useMaterialRipple: null == useMaterialRipple
                ? _value.useMaterialRipple
                : useMaterialRipple // ignore: cast_nullable_to_non_nullable
                      as bool,
            rowHeight: freezed == rowHeight
                ? _value.rowHeight
                : rowHeight // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableAndroidConfigImplCopyWith<$Res>
    implements $DSDataTableAndroidConfigCopyWith<$Res> {
  factory _$$DSDataTableAndroidConfigImplCopyWith(
    _$DSDataTableAndroidConfigImpl value,
    $Res Function(_$DSDataTableAndroidConfigImpl) then,
  ) = __$$DSDataTableAndroidConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool useMaterialRipple, double? rowHeight});
}

/// @nodoc
class __$$DSDataTableAndroidConfigImplCopyWithImpl<$Res>
    extends
        _$DSDataTableAndroidConfigCopyWithImpl<
          $Res,
          _$DSDataTableAndroidConfigImpl
        >
    implements _$$DSDataTableAndroidConfigImplCopyWith<$Res> {
  __$$DSDataTableAndroidConfigImplCopyWithImpl(
    _$DSDataTableAndroidConfigImpl _value,
    $Res Function(_$DSDataTableAndroidConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableAndroidConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? useMaterialRipple = null, Object? rowHeight = freezed}) {
    return _then(
      _$DSDataTableAndroidConfigImpl(
        useMaterialRipple: null == useMaterialRipple
            ? _value.useMaterialRipple
            : useMaterialRipple // ignore: cast_nullable_to_non_nullable
                  as bool,
        rowHeight: freezed == rowHeight
            ? _value.rowHeight
            : rowHeight // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableAndroidConfigImpl implements _DSDataTableAndroidConfig {
  const _$DSDataTableAndroidConfigImpl({
    this.useMaterialRipple = true,
    this.rowHeight,
  });

  /// Whether to use Material ripple effects
  @override
  @JsonKey()
  final bool useMaterialRipple;

  /// Android-specific row height
  @override
  final double? rowHeight;

  @override
  String toString() {
    return 'DSDataTableAndroidConfig(useMaterialRipple: $useMaterialRipple, rowHeight: $rowHeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableAndroidConfigImpl &&
            (identical(other.useMaterialRipple, useMaterialRipple) ||
                other.useMaterialRipple == useMaterialRipple) &&
            (identical(other.rowHeight, rowHeight) ||
                other.rowHeight == rowHeight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, useMaterialRipple, rowHeight);

  /// Create a copy of DSDataTableAndroidConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableAndroidConfigImplCopyWith<_$DSDataTableAndroidConfigImpl>
  get copyWith =>
      __$$DSDataTableAndroidConfigImplCopyWithImpl<
        _$DSDataTableAndroidConfigImpl
      >(this, _$identity);
}

abstract class _DSDataTableAndroidConfig implements DSDataTableAndroidConfig {
  const factory _DSDataTableAndroidConfig({
    final bool useMaterialRipple,
    final double? rowHeight,
  }) = _$DSDataTableAndroidConfigImpl;

  /// Whether to use Material ripple effects
  @override
  bool get useMaterialRipple;

  /// Android-specific row height
  @override
  double? get rowHeight;

  /// Create a copy of DSDataTableAndroidConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableAndroidConfigImplCopyWith<_$DSDataTableAndroidConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableWebConfig {
  /// Whether to show horizontal scrollbar
  bool get showHorizontalScrollbar => throw _privateConstructorUsedError;

  /// Whether to show vertical scrollbar
  bool get showVerticalScrollbar => throw _privateConstructorUsedError;

  /// Whether to enable right-click context menu
  bool get enableContextMenu => throw _privateConstructorUsedError;

  /// Web-specific row height
  double? get rowHeight => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableWebConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableWebConfigCopyWith<DSDataTableWebConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableWebConfigCopyWith<$Res> {
  factory $DSDataTableWebConfigCopyWith(
    DSDataTableWebConfig value,
    $Res Function(DSDataTableWebConfig) then,
  ) = _$DSDataTableWebConfigCopyWithImpl<$Res, DSDataTableWebConfig>;
  @useResult
  $Res call({
    bool showHorizontalScrollbar,
    bool showVerticalScrollbar,
    bool enableContextMenu,
    double? rowHeight,
  });
}

/// @nodoc
class _$DSDataTableWebConfigCopyWithImpl<
  $Res,
  $Val extends DSDataTableWebConfig
>
    implements $DSDataTableWebConfigCopyWith<$Res> {
  _$DSDataTableWebConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableWebConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showHorizontalScrollbar = null,
    Object? showVerticalScrollbar = null,
    Object? enableContextMenu = null,
    Object? rowHeight = freezed,
  }) {
    return _then(
      _value.copyWith(
            showHorizontalScrollbar: null == showHorizontalScrollbar
                ? _value.showHorizontalScrollbar
                : showHorizontalScrollbar // ignore: cast_nullable_to_non_nullable
                      as bool,
            showVerticalScrollbar: null == showVerticalScrollbar
                ? _value.showVerticalScrollbar
                : showVerticalScrollbar // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableContextMenu: null == enableContextMenu
                ? _value.enableContextMenu
                : enableContextMenu // ignore: cast_nullable_to_non_nullable
                      as bool,
            rowHeight: freezed == rowHeight
                ? _value.rowHeight
                : rowHeight // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableWebConfigImplCopyWith<$Res>
    implements $DSDataTableWebConfigCopyWith<$Res> {
  factory _$$DSDataTableWebConfigImplCopyWith(
    _$DSDataTableWebConfigImpl value,
    $Res Function(_$DSDataTableWebConfigImpl) then,
  ) = __$$DSDataTableWebConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool showHorizontalScrollbar,
    bool showVerticalScrollbar,
    bool enableContextMenu,
    double? rowHeight,
  });
}

/// @nodoc
class __$$DSDataTableWebConfigImplCopyWithImpl<$Res>
    extends _$DSDataTableWebConfigCopyWithImpl<$Res, _$DSDataTableWebConfigImpl>
    implements _$$DSDataTableWebConfigImplCopyWith<$Res> {
  __$$DSDataTableWebConfigImplCopyWithImpl(
    _$DSDataTableWebConfigImpl _value,
    $Res Function(_$DSDataTableWebConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableWebConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showHorizontalScrollbar = null,
    Object? showVerticalScrollbar = null,
    Object? enableContextMenu = null,
    Object? rowHeight = freezed,
  }) {
    return _then(
      _$DSDataTableWebConfigImpl(
        showHorizontalScrollbar: null == showHorizontalScrollbar
            ? _value.showHorizontalScrollbar
            : showHorizontalScrollbar // ignore: cast_nullable_to_non_nullable
                  as bool,
        showVerticalScrollbar: null == showVerticalScrollbar
            ? _value.showVerticalScrollbar
            : showVerticalScrollbar // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableContextMenu: null == enableContextMenu
            ? _value.enableContextMenu
            : enableContextMenu // ignore: cast_nullable_to_non_nullable
                  as bool,
        rowHeight: freezed == rowHeight
            ? _value.rowHeight
            : rowHeight // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableWebConfigImpl implements _DSDataTableWebConfig {
  const _$DSDataTableWebConfigImpl({
    this.showHorizontalScrollbar = true,
    this.showVerticalScrollbar = true,
    this.enableContextMenu = true,
    this.rowHeight,
  });

  /// Whether to show horizontal scrollbar
  @override
  @JsonKey()
  final bool showHorizontalScrollbar;

  /// Whether to show vertical scrollbar
  @override
  @JsonKey()
  final bool showVerticalScrollbar;

  /// Whether to enable right-click context menu
  @override
  @JsonKey()
  final bool enableContextMenu;

  /// Web-specific row height
  @override
  final double? rowHeight;

  @override
  String toString() {
    return 'DSDataTableWebConfig(showHorizontalScrollbar: $showHorizontalScrollbar, showVerticalScrollbar: $showVerticalScrollbar, enableContextMenu: $enableContextMenu, rowHeight: $rowHeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableWebConfigImpl &&
            (identical(
                  other.showHorizontalScrollbar,
                  showHorizontalScrollbar,
                ) ||
                other.showHorizontalScrollbar == showHorizontalScrollbar) &&
            (identical(other.showVerticalScrollbar, showVerticalScrollbar) ||
                other.showVerticalScrollbar == showVerticalScrollbar) &&
            (identical(other.enableContextMenu, enableContextMenu) ||
                other.enableContextMenu == enableContextMenu) &&
            (identical(other.rowHeight, rowHeight) ||
                other.rowHeight == rowHeight));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    showHorizontalScrollbar,
    showVerticalScrollbar,
    enableContextMenu,
    rowHeight,
  );

  /// Create a copy of DSDataTableWebConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableWebConfigImplCopyWith<_$DSDataTableWebConfigImpl>
  get copyWith =>
      __$$DSDataTableWebConfigImplCopyWithImpl<_$DSDataTableWebConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSDataTableWebConfig implements DSDataTableWebConfig {
  const factory _DSDataTableWebConfig({
    final bool showHorizontalScrollbar,
    final bool showVerticalScrollbar,
    final bool enableContextMenu,
    final double? rowHeight,
  }) = _$DSDataTableWebConfigImpl;

  /// Whether to show horizontal scrollbar
  @override
  bool get showHorizontalScrollbar;

  /// Whether to show vertical scrollbar
  @override
  bool get showVerticalScrollbar;

  /// Whether to enable right-click context menu
  @override
  bool get enableContextMenu;

  /// Web-specific row height
  @override
  double? get rowHeight;

  /// Create a copy of DSDataTableWebConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableWebConfigImplCopyWith<_$DSDataTableWebConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableAccessibilityConfig {
  /// Whether to announce sort changes
  bool get announceSortChanges => throw _privateConstructorUsedError;

  /// Whether to announce selection changes
  bool get announceSelectionChanges => throw _privateConstructorUsedError;

  /// Whether to provide row and column navigation hints
  bool get provideNavigationHints => throw _privateConstructorUsedError;

  /// Custom semantics for the table
  String? get tableSemantics => throw _privateConstructorUsedError;

  /// Custom semantics for headers
  Map<String, String>? get headerSemantics =>
      throw _privateConstructorUsedError;

  /// Custom semantics for cells
  Map<String, String>? get cellSemantics => throw _privateConstructorUsedError;

  /// Create a copy of DSDataTableAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSDataTableAccessibilityConfigCopyWith<DSDataTableAccessibilityConfig>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableAccessibilityConfigCopyWith<$Res> {
  factory $DSDataTableAccessibilityConfigCopyWith(
    DSDataTableAccessibilityConfig value,
    $Res Function(DSDataTableAccessibilityConfig) then,
  ) =
      _$DSDataTableAccessibilityConfigCopyWithImpl<
        $Res,
        DSDataTableAccessibilityConfig
      >;
  @useResult
  $Res call({
    bool announceSortChanges,
    bool announceSelectionChanges,
    bool provideNavigationHints,
    String? tableSemantics,
    Map<String, String>? headerSemantics,
    Map<String, String>? cellSemantics,
  });
}

/// @nodoc
class _$DSDataTableAccessibilityConfigCopyWithImpl<
  $Res,
  $Val extends DSDataTableAccessibilityConfig
>
    implements $DSDataTableAccessibilityConfigCopyWith<$Res> {
  _$DSDataTableAccessibilityConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? announceSortChanges = null,
    Object? announceSelectionChanges = null,
    Object? provideNavigationHints = null,
    Object? tableSemantics = freezed,
    Object? headerSemantics = freezed,
    Object? cellSemantics = freezed,
  }) {
    return _then(
      _value.copyWith(
            announceSortChanges: null == announceSortChanges
                ? _value.announceSortChanges
                : announceSortChanges // ignore: cast_nullable_to_non_nullable
                      as bool,
            announceSelectionChanges: null == announceSelectionChanges
                ? _value.announceSelectionChanges
                : announceSelectionChanges // ignore: cast_nullable_to_non_nullable
                      as bool,
            provideNavigationHints: null == provideNavigationHints
                ? _value.provideNavigationHints
                : provideNavigationHints // ignore: cast_nullable_to_non_nullable
                      as bool,
            tableSemantics: freezed == tableSemantics
                ? _value.tableSemantics
                : tableSemantics // ignore: cast_nullable_to_non_nullable
                      as String?,
            headerSemantics: freezed == headerSemantics
                ? _value.headerSemantics
                : headerSemantics // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>?,
            cellSemantics: freezed == cellSemantics
                ? _value.cellSemantics
                : cellSemantics // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSDataTableAccessibilityConfigImplCopyWith<$Res>
    implements $DSDataTableAccessibilityConfigCopyWith<$Res> {
  factory _$$DSDataTableAccessibilityConfigImplCopyWith(
    _$DSDataTableAccessibilityConfigImpl value,
    $Res Function(_$DSDataTableAccessibilityConfigImpl) then,
  ) = __$$DSDataTableAccessibilityConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool announceSortChanges,
    bool announceSelectionChanges,
    bool provideNavigationHints,
    String? tableSemantics,
    Map<String, String>? headerSemantics,
    Map<String, String>? cellSemantics,
  });
}

/// @nodoc
class __$$DSDataTableAccessibilityConfigImplCopyWithImpl<$Res>
    extends
        _$DSDataTableAccessibilityConfigCopyWithImpl<
          $Res,
          _$DSDataTableAccessibilityConfigImpl
        >
    implements _$$DSDataTableAccessibilityConfigImplCopyWith<$Res> {
  __$$DSDataTableAccessibilityConfigImplCopyWithImpl(
    _$DSDataTableAccessibilityConfigImpl _value,
    $Res Function(_$DSDataTableAccessibilityConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? announceSortChanges = null,
    Object? announceSelectionChanges = null,
    Object? provideNavigationHints = null,
    Object? tableSemantics = freezed,
    Object? headerSemantics = freezed,
    Object? cellSemantics = freezed,
  }) {
    return _then(
      _$DSDataTableAccessibilityConfigImpl(
        announceSortChanges: null == announceSortChanges
            ? _value.announceSortChanges
            : announceSortChanges // ignore: cast_nullable_to_non_nullable
                  as bool,
        announceSelectionChanges: null == announceSelectionChanges
            ? _value.announceSelectionChanges
            : announceSelectionChanges // ignore: cast_nullable_to_non_nullable
                  as bool,
        provideNavigationHints: null == provideNavigationHints
            ? _value.provideNavigationHints
            : provideNavigationHints // ignore: cast_nullable_to_non_nullable
                  as bool,
        tableSemantics: freezed == tableSemantics
            ? _value.tableSemantics
            : tableSemantics // ignore: cast_nullable_to_non_nullable
                  as String?,
        headerSemantics: freezed == headerSemantics
            ? _value._headerSemantics
            : headerSemantics // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>?,
        cellSemantics: freezed == cellSemantics
            ? _value._cellSemantics
            : cellSemantics // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>?,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableAccessibilityConfigImpl
    implements _DSDataTableAccessibilityConfig {
  const _$DSDataTableAccessibilityConfigImpl({
    this.announceSortChanges = true,
    this.announceSelectionChanges = true,
    this.provideNavigationHints = true,
    this.tableSemantics,
    final Map<String, String>? headerSemantics,
    final Map<String, String>? cellSemantics,
  }) : _headerSemantics = headerSemantics,
       _cellSemantics = cellSemantics;

  /// Whether to announce sort changes
  @override
  @JsonKey()
  final bool announceSortChanges;

  /// Whether to announce selection changes
  @override
  @JsonKey()
  final bool announceSelectionChanges;

  /// Whether to provide row and column navigation hints
  @override
  @JsonKey()
  final bool provideNavigationHints;

  /// Custom semantics for the table
  @override
  final String? tableSemantics;

  /// Custom semantics for headers
  final Map<String, String>? _headerSemantics;

  /// Custom semantics for headers
  @override
  Map<String, String>? get headerSemantics {
    final value = _headerSemantics;
    if (value == null) return null;
    if (_headerSemantics is EqualUnmodifiableMapView) return _headerSemantics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Custom semantics for cells
  final Map<String, String>? _cellSemantics;

  /// Custom semantics for cells
  @override
  Map<String, String>? get cellSemantics {
    final value = _cellSemantics;
    if (value == null) return null;
    if (_cellSemantics is EqualUnmodifiableMapView) return _cellSemantics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DSDataTableAccessibilityConfig(announceSortChanges: $announceSortChanges, announceSelectionChanges: $announceSelectionChanges, provideNavigationHints: $provideNavigationHints, tableSemantics: $tableSemantics, headerSemantics: $headerSemantics, cellSemantics: $cellSemantics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableAccessibilityConfigImpl &&
            (identical(other.announceSortChanges, announceSortChanges) ||
                other.announceSortChanges == announceSortChanges) &&
            (identical(
                  other.announceSelectionChanges,
                  announceSelectionChanges,
                ) ||
                other.announceSelectionChanges == announceSelectionChanges) &&
            (identical(other.provideNavigationHints, provideNavigationHints) ||
                other.provideNavigationHints == provideNavigationHints) &&
            (identical(other.tableSemantics, tableSemantics) ||
                other.tableSemantics == tableSemantics) &&
            const DeepCollectionEquality().equals(
              other._headerSemantics,
              _headerSemantics,
            ) &&
            const DeepCollectionEquality().equals(
              other._cellSemantics,
              _cellSemantics,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    announceSortChanges,
    announceSelectionChanges,
    provideNavigationHints,
    tableSemantics,
    const DeepCollectionEquality().hash(_headerSemantics),
    const DeepCollectionEquality().hash(_cellSemantics),
  );

  /// Create a copy of DSDataTableAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableAccessibilityConfigImplCopyWith<
    _$DSDataTableAccessibilityConfigImpl
  >
  get copyWith =>
      __$$DSDataTableAccessibilityConfigImplCopyWithImpl<
        _$DSDataTableAccessibilityConfigImpl
      >(this, _$identity);
}

abstract class _DSDataTableAccessibilityConfig
    implements DSDataTableAccessibilityConfig {
  const factory _DSDataTableAccessibilityConfig({
    final bool announceSortChanges,
    final bool announceSelectionChanges,
    final bool provideNavigationHints,
    final String? tableSemantics,
    final Map<String, String>? headerSemantics,
    final Map<String, String>? cellSemantics,
  }) = _$DSDataTableAccessibilityConfigImpl;

  /// Whether to announce sort changes
  @override
  bool get announceSortChanges;

  /// Whether to announce selection changes
  @override
  bool get announceSelectionChanges;

  /// Whether to provide row and column navigation hints
  @override
  bool get provideNavigationHints;

  /// Custom semantics for the table
  @override
  String? get tableSemantics;

  /// Custom semantics for headers
  @override
  Map<String, String>? get headerSemantics;

  /// Custom semantics for cells
  @override
  Map<String, String>? get cellSemantics;

  /// Create a copy of DSDataTableAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableAccessibilityConfigImplCopyWith<
    _$DSDataTableAccessibilityConfigImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSDataTableEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String columnId,
      DSDataTableSortDirection direction,
    )
    sort,
    required TResult Function(String rowId, bool selected) select,
    required TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )
    edit,
    required TResult Function(String columnId, double newWidth) resize,
    required TResult Function(List<String> newColumnOrder) reorder,
    required TResult Function(String rowId, bool expanded) expand,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String columnId, DSDataTableSortDirection direction)?
    sort,
    TResult? Function(String rowId, bool selected)? select,
    TResult? Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult? Function(String columnId, double newWidth)? resize,
    TResult? Function(List<String> newColumnOrder)? reorder,
    TResult? Function(String rowId, bool expanded)? expand,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String columnId, DSDataTableSortDirection direction)? sort,
    TResult Function(String rowId, bool selected)? select,
    TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult Function(String columnId, double newWidth)? resize,
    TResult Function(List<String> newColumnOrder)? reorder,
    TResult Function(String rowId, bool expanded)? expand,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DSDataTableSortEvent value) sort,
    required TResult Function(DSDataTableSelectEvent value) select,
    required TResult Function(DSDataTableEditEvent value) edit,
    required TResult Function(DSDataTableResizeEvent value) resize,
    required TResult Function(DSDataTableReorderEvent value) reorder,
    required TResult Function(DSDataTableExpandEvent value) expand,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DSDataTableSortEvent value)? sort,
    TResult? Function(DSDataTableSelectEvent value)? select,
    TResult? Function(DSDataTableEditEvent value)? edit,
    TResult? Function(DSDataTableResizeEvent value)? resize,
    TResult? Function(DSDataTableReorderEvent value)? reorder,
    TResult? Function(DSDataTableExpandEvent value)? expand,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DSDataTableSortEvent value)? sort,
    TResult Function(DSDataTableSelectEvent value)? select,
    TResult Function(DSDataTableEditEvent value)? edit,
    TResult Function(DSDataTableResizeEvent value)? resize,
    TResult Function(DSDataTableReorderEvent value)? reorder,
    TResult Function(DSDataTableExpandEvent value)? expand,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSDataTableEventCopyWith<$Res> {
  factory $DSDataTableEventCopyWith(
    DSDataTableEvent value,
    $Res Function(DSDataTableEvent) then,
  ) = _$DSDataTableEventCopyWithImpl<$Res, DSDataTableEvent>;
}

/// @nodoc
class _$DSDataTableEventCopyWithImpl<$Res, $Val extends DSDataTableEvent>
    implements $DSDataTableEventCopyWith<$Res> {
  _$DSDataTableEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DSDataTableSortEventImplCopyWith<$Res> {
  factory _$$DSDataTableSortEventImplCopyWith(
    _$DSDataTableSortEventImpl value,
    $Res Function(_$DSDataTableSortEventImpl) then,
  ) = __$$DSDataTableSortEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String columnId, DSDataTableSortDirection direction});
}

/// @nodoc
class __$$DSDataTableSortEventImplCopyWithImpl<$Res>
    extends _$DSDataTableEventCopyWithImpl<$Res, _$DSDataTableSortEventImpl>
    implements _$$DSDataTableSortEventImplCopyWith<$Res> {
  __$$DSDataTableSortEventImplCopyWithImpl(
    _$DSDataTableSortEventImpl _value,
    $Res Function(_$DSDataTableSortEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? columnId = null, Object? direction = null}) {
    return _then(
      _$DSDataTableSortEventImpl(
        columnId: null == columnId
            ? _value.columnId
            : columnId // ignore: cast_nullable_to_non_nullable
                  as String,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as DSDataTableSortDirection,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableSortEventImpl implements DSDataTableSortEvent {
  const _$DSDataTableSortEventImpl({
    required this.columnId,
    required this.direction,
  });

  @override
  final String columnId;
  @override
  final DSDataTableSortDirection direction;

  @override
  String toString() {
    return 'DSDataTableEvent.sort(columnId: $columnId, direction: $direction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableSortEventImpl &&
            (identical(other.columnId, columnId) ||
                other.columnId == columnId) &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, columnId, direction);

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableSortEventImplCopyWith<_$DSDataTableSortEventImpl>
  get copyWith =>
      __$$DSDataTableSortEventImplCopyWithImpl<_$DSDataTableSortEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String columnId,
      DSDataTableSortDirection direction,
    )
    sort,
    required TResult Function(String rowId, bool selected) select,
    required TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )
    edit,
    required TResult Function(String columnId, double newWidth) resize,
    required TResult Function(List<String> newColumnOrder) reorder,
    required TResult Function(String rowId, bool expanded) expand,
  }) {
    return sort(columnId, direction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String columnId, DSDataTableSortDirection direction)?
    sort,
    TResult? Function(String rowId, bool selected)? select,
    TResult? Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult? Function(String columnId, double newWidth)? resize,
    TResult? Function(List<String> newColumnOrder)? reorder,
    TResult? Function(String rowId, bool expanded)? expand,
  }) {
    return sort?.call(columnId, direction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String columnId, DSDataTableSortDirection direction)? sort,
    TResult Function(String rowId, bool selected)? select,
    TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult Function(String columnId, double newWidth)? resize,
    TResult Function(List<String> newColumnOrder)? reorder,
    TResult Function(String rowId, bool expanded)? expand,
    required TResult orElse(),
  }) {
    if (sort != null) {
      return sort(columnId, direction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DSDataTableSortEvent value) sort,
    required TResult Function(DSDataTableSelectEvent value) select,
    required TResult Function(DSDataTableEditEvent value) edit,
    required TResult Function(DSDataTableResizeEvent value) resize,
    required TResult Function(DSDataTableReorderEvent value) reorder,
    required TResult Function(DSDataTableExpandEvent value) expand,
  }) {
    return sort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DSDataTableSortEvent value)? sort,
    TResult? Function(DSDataTableSelectEvent value)? select,
    TResult? Function(DSDataTableEditEvent value)? edit,
    TResult? Function(DSDataTableResizeEvent value)? resize,
    TResult? Function(DSDataTableReorderEvent value)? reorder,
    TResult? Function(DSDataTableExpandEvent value)? expand,
  }) {
    return sort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DSDataTableSortEvent value)? sort,
    TResult Function(DSDataTableSelectEvent value)? select,
    TResult Function(DSDataTableEditEvent value)? edit,
    TResult Function(DSDataTableResizeEvent value)? resize,
    TResult Function(DSDataTableReorderEvent value)? reorder,
    TResult Function(DSDataTableExpandEvent value)? expand,
    required TResult orElse(),
  }) {
    if (sort != null) {
      return sort(this);
    }
    return orElse();
  }
}

abstract class DSDataTableSortEvent implements DSDataTableEvent {
  const factory DSDataTableSortEvent({
    required final String columnId,
    required final DSDataTableSortDirection direction,
  }) = _$DSDataTableSortEventImpl;

  String get columnId;
  DSDataTableSortDirection get direction;

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableSortEventImplCopyWith<_$DSDataTableSortEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DSDataTableSelectEventImplCopyWith<$Res> {
  factory _$$DSDataTableSelectEventImplCopyWith(
    _$DSDataTableSelectEventImpl value,
    $Res Function(_$DSDataTableSelectEventImpl) then,
  ) = __$$DSDataTableSelectEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String rowId, bool selected});
}

/// @nodoc
class __$$DSDataTableSelectEventImplCopyWithImpl<$Res>
    extends _$DSDataTableEventCopyWithImpl<$Res, _$DSDataTableSelectEventImpl>
    implements _$$DSDataTableSelectEventImplCopyWith<$Res> {
  __$$DSDataTableSelectEventImplCopyWithImpl(
    _$DSDataTableSelectEventImpl _value,
    $Res Function(_$DSDataTableSelectEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rowId = null, Object? selected = null}) {
    return _then(
      _$DSDataTableSelectEventImpl(
        rowId: null == rowId
            ? _value.rowId
            : rowId // ignore: cast_nullable_to_non_nullable
                  as String,
        selected: null == selected
            ? _value.selected
            : selected // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableSelectEventImpl implements DSDataTableSelectEvent {
  const _$DSDataTableSelectEventImpl({
    required this.rowId,
    required this.selected,
  });

  @override
  final String rowId;
  @override
  final bool selected;

  @override
  String toString() {
    return 'DSDataTableEvent.select(rowId: $rowId, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableSelectEventImpl &&
            (identical(other.rowId, rowId) || other.rowId == rowId) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rowId, selected);

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableSelectEventImplCopyWith<_$DSDataTableSelectEventImpl>
  get copyWith =>
      __$$DSDataTableSelectEventImplCopyWithImpl<_$DSDataTableSelectEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String columnId,
      DSDataTableSortDirection direction,
    )
    sort,
    required TResult Function(String rowId, bool selected) select,
    required TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )
    edit,
    required TResult Function(String columnId, double newWidth) resize,
    required TResult Function(List<String> newColumnOrder) reorder,
    required TResult Function(String rowId, bool expanded) expand,
  }) {
    return select(rowId, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String columnId, DSDataTableSortDirection direction)?
    sort,
    TResult? Function(String rowId, bool selected)? select,
    TResult? Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult? Function(String columnId, double newWidth)? resize,
    TResult? Function(List<String> newColumnOrder)? reorder,
    TResult? Function(String rowId, bool expanded)? expand,
  }) {
    return select?.call(rowId, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String columnId, DSDataTableSortDirection direction)? sort,
    TResult Function(String rowId, bool selected)? select,
    TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult Function(String columnId, double newWidth)? resize,
    TResult Function(List<String> newColumnOrder)? reorder,
    TResult Function(String rowId, bool expanded)? expand,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(rowId, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DSDataTableSortEvent value) sort,
    required TResult Function(DSDataTableSelectEvent value) select,
    required TResult Function(DSDataTableEditEvent value) edit,
    required TResult Function(DSDataTableResizeEvent value) resize,
    required TResult Function(DSDataTableReorderEvent value) reorder,
    required TResult Function(DSDataTableExpandEvent value) expand,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DSDataTableSortEvent value)? sort,
    TResult? Function(DSDataTableSelectEvent value)? select,
    TResult? Function(DSDataTableEditEvent value)? edit,
    TResult? Function(DSDataTableResizeEvent value)? resize,
    TResult? Function(DSDataTableReorderEvent value)? reorder,
    TResult? Function(DSDataTableExpandEvent value)? expand,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DSDataTableSortEvent value)? sort,
    TResult Function(DSDataTableSelectEvent value)? select,
    TResult Function(DSDataTableEditEvent value)? edit,
    TResult Function(DSDataTableResizeEvent value)? resize,
    TResult Function(DSDataTableReorderEvent value)? reorder,
    TResult Function(DSDataTableExpandEvent value)? expand,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class DSDataTableSelectEvent implements DSDataTableEvent {
  const factory DSDataTableSelectEvent({
    required final String rowId,
    required final bool selected,
  }) = _$DSDataTableSelectEventImpl;

  String get rowId;
  bool get selected;

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableSelectEventImplCopyWith<_$DSDataTableSelectEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DSDataTableEditEventImplCopyWith<$Res> {
  factory _$$DSDataTableEditEventImplCopyWith(
    _$DSDataTableEditEventImpl value,
    $Res Function(_$DSDataTableEditEventImpl) then,
  ) = __$$DSDataTableEditEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String rowId,
    String columnId,
    dynamic oldValue,
    dynamic newValue,
  });
}

/// @nodoc
class __$$DSDataTableEditEventImplCopyWithImpl<$Res>
    extends _$DSDataTableEventCopyWithImpl<$Res, _$DSDataTableEditEventImpl>
    implements _$$DSDataTableEditEventImplCopyWith<$Res> {
  __$$DSDataTableEditEventImplCopyWithImpl(
    _$DSDataTableEditEventImpl _value,
    $Res Function(_$DSDataTableEditEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowId = null,
    Object? columnId = null,
    Object? oldValue = freezed,
    Object? newValue = freezed,
  }) {
    return _then(
      _$DSDataTableEditEventImpl(
        rowId: null == rowId
            ? _value.rowId
            : rowId // ignore: cast_nullable_to_non_nullable
                  as String,
        columnId: null == columnId
            ? _value.columnId
            : columnId // ignore: cast_nullable_to_non_nullable
                  as String,
        oldValue: freezed == oldValue
            ? _value.oldValue
            : oldValue // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        newValue: freezed == newValue
            ? _value.newValue
            : newValue // ignore: cast_nullable_to_non_nullable
                  as dynamic,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableEditEventImpl implements DSDataTableEditEvent {
  const _$DSDataTableEditEventImpl({
    required this.rowId,
    required this.columnId,
    required this.oldValue,
    required this.newValue,
  });

  @override
  final String rowId;
  @override
  final String columnId;
  @override
  final dynamic oldValue;
  @override
  final dynamic newValue;

  @override
  String toString() {
    return 'DSDataTableEvent.edit(rowId: $rowId, columnId: $columnId, oldValue: $oldValue, newValue: $newValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableEditEventImpl &&
            (identical(other.rowId, rowId) || other.rowId == rowId) &&
            (identical(other.columnId, columnId) ||
                other.columnId == columnId) &&
            const DeepCollectionEquality().equals(other.oldValue, oldValue) &&
            const DeepCollectionEquality().equals(other.newValue, newValue));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    rowId,
    columnId,
    const DeepCollectionEquality().hash(oldValue),
    const DeepCollectionEquality().hash(newValue),
  );

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableEditEventImplCopyWith<_$DSDataTableEditEventImpl>
  get copyWith =>
      __$$DSDataTableEditEventImplCopyWithImpl<_$DSDataTableEditEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String columnId,
      DSDataTableSortDirection direction,
    )
    sort,
    required TResult Function(String rowId, bool selected) select,
    required TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )
    edit,
    required TResult Function(String columnId, double newWidth) resize,
    required TResult Function(List<String> newColumnOrder) reorder,
    required TResult Function(String rowId, bool expanded) expand,
  }) {
    return edit(rowId, columnId, oldValue, newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String columnId, DSDataTableSortDirection direction)?
    sort,
    TResult? Function(String rowId, bool selected)? select,
    TResult? Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult? Function(String columnId, double newWidth)? resize,
    TResult? Function(List<String> newColumnOrder)? reorder,
    TResult? Function(String rowId, bool expanded)? expand,
  }) {
    return edit?.call(rowId, columnId, oldValue, newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String columnId, DSDataTableSortDirection direction)? sort,
    TResult Function(String rowId, bool selected)? select,
    TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult Function(String columnId, double newWidth)? resize,
    TResult Function(List<String> newColumnOrder)? reorder,
    TResult Function(String rowId, bool expanded)? expand,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(rowId, columnId, oldValue, newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DSDataTableSortEvent value) sort,
    required TResult Function(DSDataTableSelectEvent value) select,
    required TResult Function(DSDataTableEditEvent value) edit,
    required TResult Function(DSDataTableResizeEvent value) resize,
    required TResult Function(DSDataTableReorderEvent value) reorder,
    required TResult Function(DSDataTableExpandEvent value) expand,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DSDataTableSortEvent value)? sort,
    TResult? Function(DSDataTableSelectEvent value)? select,
    TResult? Function(DSDataTableEditEvent value)? edit,
    TResult? Function(DSDataTableResizeEvent value)? resize,
    TResult? Function(DSDataTableReorderEvent value)? reorder,
    TResult? Function(DSDataTableExpandEvent value)? expand,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DSDataTableSortEvent value)? sort,
    TResult Function(DSDataTableSelectEvent value)? select,
    TResult Function(DSDataTableEditEvent value)? edit,
    TResult Function(DSDataTableResizeEvent value)? resize,
    TResult Function(DSDataTableReorderEvent value)? reorder,
    TResult Function(DSDataTableExpandEvent value)? expand,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class DSDataTableEditEvent implements DSDataTableEvent {
  const factory DSDataTableEditEvent({
    required final String rowId,
    required final String columnId,
    required final dynamic oldValue,
    required final dynamic newValue,
  }) = _$DSDataTableEditEventImpl;

  String get rowId;
  String get columnId;
  dynamic get oldValue;
  dynamic get newValue;

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableEditEventImplCopyWith<_$DSDataTableEditEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DSDataTableResizeEventImplCopyWith<$Res> {
  factory _$$DSDataTableResizeEventImplCopyWith(
    _$DSDataTableResizeEventImpl value,
    $Res Function(_$DSDataTableResizeEventImpl) then,
  ) = __$$DSDataTableResizeEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String columnId, double newWidth});
}

/// @nodoc
class __$$DSDataTableResizeEventImplCopyWithImpl<$Res>
    extends _$DSDataTableEventCopyWithImpl<$Res, _$DSDataTableResizeEventImpl>
    implements _$$DSDataTableResizeEventImplCopyWith<$Res> {
  __$$DSDataTableResizeEventImplCopyWithImpl(
    _$DSDataTableResizeEventImpl _value,
    $Res Function(_$DSDataTableResizeEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? columnId = null, Object? newWidth = null}) {
    return _then(
      _$DSDataTableResizeEventImpl(
        columnId: null == columnId
            ? _value.columnId
            : columnId // ignore: cast_nullable_to_non_nullable
                  as String,
        newWidth: null == newWidth
            ? _value.newWidth
            : newWidth // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableResizeEventImpl implements DSDataTableResizeEvent {
  const _$DSDataTableResizeEventImpl({
    required this.columnId,
    required this.newWidth,
  });

  @override
  final String columnId;
  @override
  final double newWidth;

  @override
  String toString() {
    return 'DSDataTableEvent.resize(columnId: $columnId, newWidth: $newWidth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableResizeEventImpl &&
            (identical(other.columnId, columnId) ||
                other.columnId == columnId) &&
            (identical(other.newWidth, newWidth) ||
                other.newWidth == newWidth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, columnId, newWidth);

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableResizeEventImplCopyWith<_$DSDataTableResizeEventImpl>
  get copyWith =>
      __$$DSDataTableResizeEventImplCopyWithImpl<_$DSDataTableResizeEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String columnId,
      DSDataTableSortDirection direction,
    )
    sort,
    required TResult Function(String rowId, bool selected) select,
    required TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )
    edit,
    required TResult Function(String columnId, double newWidth) resize,
    required TResult Function(List<String> newColumnOrder) reorder,
    required TResult Function(String rowId, bool expanded) expand,
  }) {
    return resize(columnId, newWidth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String columnId, DSDataTableSortDirection direction)?
    sort,
    TResult? Function(String rowId, bool selected)? select,
    TResult? Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult? Function(String columnId, double newWidth)? resize,
    TResult? Function(List<String> newColumnOrder)? reorder,
    TResult? Function(String rowId, bool expanded)? expand,
  }) {
    return resize?.call(columnId, newWidth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String columnId, DSDataTableSortDirection direction)? sort,
    TResult Function(String rowId, bool selected)? select,
    TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult Function(String columnId, double newWidth)? resize,
    TResult Function(List<String> newColumnOrder)? reorder,
    TResult Function(String rowId, bool expanded)? expand,
    required TResult orElse(),
  }) {
    if (resize != null) {
      return resize(columnId, newWidth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DSDataTableSortEvent value) sort,
    required TResult Function(DSDataTableSelectEvent value) select,
    required TResult Function(DSDataTableEditEvent value) edit,
    required TResult Function(DSDataTableResizeEvent value) resize,
    required TResult Function(DSDataTableReorderEvent value) reorder,
    required TResult Function(DSDataTableExpandEvent value) expand,
  }) {
    return resize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DSDataTableSortEvent value)? sort,
    TResult? Function(DSDataTableSelectEvent value)? select,
    TResult? Function(DSDataTableEditEvent value)? edit,
    TResult? Function(DSDataTableResizeEvent value)? resize,
    TResult? Function(DSDataTableReorderEvent value)? reorder,
    TResult? Function(DSDataTableExpandEvent value)? expand,
  }) {
    return resize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DSDataTableSortEvent value)? sort,
    TResult Function(DSDataTableSelectEvent value)? select,
    TResult Function(DSDataTableEditEvent value)? edit,
    TResult Function(DSDataTableResizeEvent value)? resize,
    TResult Function(DSDataTableReorderEvent value)? reorder,
    TResult Function(DSDataTableExpandEvent value)? expand,
    required TResult orElse(),
  }) {
    if (resize != null) {
      return resize(this);
    }
    return orElse();
  }
}

abstract class DSDataTableResizeEvent implements DSDataTableEvent {
  const factory DSDataTableResizeEvent({
    required final String columnId,
    required final double newWidth,
  }) = _$DSDataTableResizeEventImpl;

  String get columnId;
  double get newWidth;

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableResizeEventImplCopyWith<_$DSDataTableResizeEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DSDataTableReorderEventImplCopyWith<$Res> {
  factory _$$DSDataTableReorderEventImplCopyWith(
    _$DSDataTableReorderEventImpl value,
    $Res Function(_$DSDataTableReorderEventImpl) then,
  ) = __$$DSDataTableReorderEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> newColumnOrder});
}

/// @nodoc
class __$$DSDataTableReorderEventImplCopyWithImpl<$Res>
    extends _$DSDataTableEventCopyWithImpl<$Res, _$DSDataTableReorderEventImpl>
    implements _$$DSDataTableReorderEventImplCopyWith<$Res> {
  __$$DSDataTableReorderEventImplCopyWithImpl(
    _$DSDataTableReorderEventImpl _value,
    $Res Function(_$DSDataTableReorderEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? newColumnOrder = null}) {
    return _then(
      _$DSDataTableReorderEventImpl(
        newColumnOrder: null == newColumnOrder
            ? _value._newColumnOrder
            : newColumnOrder // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableReorderEventImpl implements DSDataTableReorderEvent {
  const _$DSDataTableReorderEventImpl({
    required final List<String> newColumnOrder,
  }) : _newColumnOrder = newColumnOrder;

  final List<String> _newColumnOrder;
  @override
  List<String> get newColumnOrder {
    if (_newColumnOrder is EqualUnmodifiableListView) return _newColumnOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newColumnOrder);
  }

  @override
  String toString() {
    return 'DSDataTableEvent.reorder(newColumnOrder: $newColumnOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableReorderEventImpl &&
            const DeepCollectionEquality().equals(
              other._newColumnOrder,
              _newColumnOrder,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_newColumnOrder),
  );

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableReorderEventImplCopyWith<_$DSDataTableReorderEventImpl>
  get copyWith =>
      __$$DSDataTableReorderEventImplCopyWithImpl<
        _$DSDataTableReorderEventImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String columnId,
      DSDataTableSortDirection direction,
    )
    sort,
    required TResult Function(String rowId, bool selected) select,
    required TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )
    edit,
    required TResult Function(String columnId, double newWidth) resize,
    required TResult Function(List<String> newColumnOrder) reorder,
    required TResult Function(String rowId, bool expanded) expand,
  }) {
    return reorder(newColumnOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String columnId, DSDataTableSortDirection direction)?
    sort,
    TResult? Function(String rowId, bool selected)? select,
    TResult? Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult? Function(String columnId, double newWidth)? resize,
    TResult? Function(List<String> newColumnOrder)? reorder,
    TResult? Function(String rowId, bool expanded)? expand,
  }) {
    return reorder?.call(newColumnOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String columnId, DSDataTableSortDirection direction)? sort,
    TResult Function(String rowId, bool selected)? select,
    TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult Function(String columnId, double newWidth)? resize,
    TResult Function(List<String> newColumnOrder)? reorder,
    TResult Function(String rowId, bool expanded)? expand,
    required TResult orElse(),
  }) {
    if (reorder != null) {
      return reorder(newColumnOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DSDataTableSortEvent value) sort,
    required TResult Function(DSDataTableSelectEvent value) select,
    required TResult Function(DSDataTableEditEvent value) edit,
    required TResult Function(DSDataTableResizeEvent value) resize,
    required TResult Function(DSDataTableReorderEvent value) reorder,
    required TResult Function(DSDataTableExpandEvent value) expand,
  }) {
    return reorder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DSDataTableSortEvent value)? sort,
    TResult? Function(DSDataTableSelectEvent value)? select,
    TResult? Function(DSDataTableEditEvent value)? edit,
    TResult? Function(DSDataTableResizeEvent value)? resize,
    TResult? Function(DSDataTableReorderEvent value)? reorder,
    TResult? Function(DSDataTableExpandEvent value)? expand,
  }) {
    return reorder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DSDataTableSortEvent value)? sort,
    TResult Function(DSDataTableSelectEvent value)? select,
    TResult Function(DSDataTableEditEvent value)? edit,
    TResult Function(DSDataTableResizeEvent value)? resize,
    TResult Function(DSDataTableReorderEvent value)? reorder,
    TResult Function(DSDataTableExpandEvent value)? expand,
    required TResult orElse(),
  }) {
    if (reorder != null) {
      return reorder(this);
    }
    return orElse();
  }
}

abstract class DSDataTableReorderEvent implements DSDataTableEvent {
  const factory DSDataTableReorderEvent({
    required final List<String> newColumnOrder,
  }) = _$DSDataTableReorderEventImpl;

  List<String> get newColumnOrder;

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableReorderEventImplCopyWith<_$DSDataTableReorderEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DSDataTableExpandEventImplCopyWith<$Res> {
  factory _$$DSDataTableExpandEventImplCopyWith(
    _$DSDataTableExpandEventImpl value,
    $Res Function(_$DSDataTableExpandEventImpl) then,
  ) = __$$DSDataTableExpandEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String rowId, bool expanded});
}

/// @nodoc
class __$$DSDataTableExpandEventImplCopyWithImpl<$Res>
    extends _$DSDataTableEventCopyWithImpl<$Res, _$DSDataTableExpandEventImpl>
    implements _$$DSDataTableExpandEventImplCopyWith<$Res> {
  __$$DSDataTableExpandEventImplCopyWithImpl(
    _$DSDataTableExpandEventImpl _value,
    $Res Function(_$DSDataTableExpandEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rowId = null, Object? expanded = null}) {
    return _then(
      _$DSDataTableExpandEventImpl(
        rowId: null == rowId
            ? _value.rowId
            : rowId // ignore: cast_nullable_to_non_nullable
                  as String,
        expanded: null == expanded
            ? _value.expanded
            : expanded // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSDataTableExpandEventImpl implements DSDataTableExpandEvent {
  const _$DSDataTableExpandEventImpl({
    required this.rowId,
    required this.expanded,
  });

  @override
  final String rowId;
  @override
  final bool expanded;

  @override
  String toString() {
    return 'DSDataTableEvent.expand(rowId: $rowId, expanded: $expanded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSDataTableExpandEventImpl &&
            (identical(other.rowId, rowId) || other.rowId == rowId) &&
            (identical(other.expanded, expanded) ||
                other.expanded == expanded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rowId, expanded);

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSDataTableExpandEventImplCopyWith<_$DSDataTableExpandEventImpl>
  get copyWith =>
      __$$DSDataTableExpandEventImplCopyWithImpl<_$DSDataTableExpandEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String columnId,
      DSDataTableSortDirection direction,
    )
    sort,
    required TResult Function(String rowId, bool selected) select,
    required TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )
    edit,
    required TResult Function(String columnId, double newWidth) resize,
    required TResult Function(List<String> newColumnOrder) reorder,
    required TResult Function(String rowId, bool expanded) expand,
  }) {
    return expand(rowId, expanded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String columnId, DSDataTableSortDirection direction)?
    sort,
    TResult? Function(String rowId, bool selected)? select,
    TResult? Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult? Function(String columnId, double newWidth)? resize,
    TResult? Function(List<String> newColumnOrder)? reorder,
    TResult? Function(String rowId, bool expanded)? expand,
  }) {
    return expand?.call(rowId, expanded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String columnId, DSDataTableSortDirection direction)? sort,
    TResult Function(String rowId, bool selected)? select,
    TResult Function(
      String rowId,
      String columnId,
      dynamic oldValue,
      dynamic newValue,
    )?
    edit,
    TResult Function(String columnId, double newWidth)? resize,
    TResult Function(List<String> newColumnOrder)? reorder,
    TResult Function(String rowId, bool expanded)? expand,
    required TResult orElse(),
  }) {
    if (expand != null) {
      return expand(rowId, expanded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DSDataTableSortEvent value) sort,
    required TResult Function(DSDataTableSelectEvent value) select,
    required TResult Function(DSDataTableEditEvent value) edit,
    required TResult Function(DSDataTableResizeEvent value) resize,
    required TResult Function(DSDataTableReorderEvent value) reorder,
    required TResult Function(DSDataTableExpandEvent value) expand,
  }) {
    return expand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DSDataTableSortEvent value)? sort,
    TResult? Function(DSDataTableSelectEvent value)? select,
    TResult? Function(DSDataTableEditEvent value)? edit,
    TResult? Function(DSDataTableResizeEvent value)? resize,
    TResult? Function(DSDataTableReorderEvent value)? reorder,
    TResult? Function(DSDataTableExpandEvent value)? expand,
  }) {
    return expand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DSDataTableSortEvent value)? sort,
    TResult Function(DSDataTableSelectEvent value)? select,
    TResult Function(DSDataTableEditEvent value)? edit,
    TResult Function(DSDataTableResizeEvent value)? resize,
    TResult Function(DSDataTableReorderEvent value)? reorder,
    TResult Function(DSDataTableExpandEvent value)? expand,
    required TResult orElse(),
  }) {
    if (expand != null) {
      return expand(this);
    }
    return orElse();
  }
}

abstract class DSDataTableExpandEvent implements DSDataTableEvent {
  const factory DSDataTableExpandEvent({
    required final String rowId,
    required final bool expanded,
  }) = _$DSDataTableExpandEventImpl;

  String get rowId;
  bool get expanded;

  /// Create a copy of DSDataTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSDataTableExpandEventImplCopyWith<_$DSDataTableExpandEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}
