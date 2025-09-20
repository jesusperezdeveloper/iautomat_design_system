// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple_table_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DSSimpleTableColumn {
  /// Unique identifier for the column
  String get id => throw _privateConstructorUsedError;

  /// Display label for the column header
  String get label => throw _privateConstructorUsedError;

  /// Data field name for row data access
  String get field => throw _privateConstructorUsedError;

  /// Column width (null for flex sizing)
  double? get width => throw _privateConstructorUsedError;

  /// Flex value for column width distribution
  int get flex => throw _privateConstructorUsedError;

  /// Whether the column is sortable
  bool get sortable => throw _privateConstructorUsedError;

  /// Whether the column is visible
  bool get visible => throw _privateConstructorUsedError;

  /// Column alignment
  DSSimpleTableColumnAlignment get alignment =>
      throw _privateConstructorUsedError;

  /// Cell type for this column
  DSSimpleTableCellType get cellType => throw _privateConstructorUsedError;

  /// Custom cell builder
  DSSimpleTableCellBuilder? get cellBuilder =>
      throw _privateConstructorUsedError;

  /// Custom header builder
  DSSimpleTableHeaderBuilder? get headerBuilder =>
      throw _privateConstructorUsedError;

  /// Formatter for displaying cell values
  DSSimpleTableCellFormatter? get formatter =>
      throw _privateConstructorUsedError;

  /// Tooltip for the column header
  String? get tooltip => throw _privateConstructorUsedError;

  /// Icon for the column header
  IconData? get icon => throw _privateConstructorUsedError;

  /// Custom data for the column
  Map<String, dynamic>? get customData => throw _privateConstructorUsedError;

  /// Accessibility label for the column
  String? get semanticLabel => throw _privateConstructorUsedError;

  /// Sort direction for this column
  DSSimpleTableSortDirection get sortDirection =>
      throw _privateConstructorUsedError;

  /// Create a copy of DSSimpleTableColumn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSSimpleTableColumnCopyWith<DSSimpleTableColumn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSSimpleTableColumnCopyWith<$Res> {
  factory $DSSimpleTableColumnCopyWith(
    DSSimpleTableColumn value,
    $Res Function(DSSimpleTableColumn) then,
  ) = _$DSSimpleTableColumnCopyWithImpl<$Res, DSSimpleTableColumn>;
  @useResult
  $Res call({
    String id,
    String label,
    String field,
    double? width,
    int flex,
    bool sortable,
    bool visible,
    DSSimpleTableColumnAlignment alignment,
    DSSimpleTableCellType cellType,
    DSSimpleTableCellBuilder? cellBuilder,
    DSSimpleTableHeaderBuilder? headerBuilder,
    DSSimpleTableCellFormatter? formatter,
    String? tooltip,
    IconData? icon,
    Map<String, dynamic>? customData,
    String? semanticLabel,
    DSSimpleTableSortDirection sortDirection,
  });
}

/// @nodoc
class _$DSSimpleTableColumnCopyWithImpl<$Res, $Val extends DSSimpleTableColumn>
    implements $DSSimpleTableColumnCopyWith<$Res> {
  _$DSSimpleTableColumnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSSimpleTableColumn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? field = null,
    Object? width = freezed,
    Object? flex = null,
    Object? sortable = null,
    Object? visible = null,
    Object? alignment = null,
    Object? cellType = null,
    Object? cellBuilder = freezed,
    Object? headerBuilder = freezed,
    Object? formatter = freezed,
    Object? tooltip = freezed,
    Object? icon = freezed,
    Object? customData = freezed,
    Object? semanticLabel = freezed,
    Object? sortDirection = null,
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
            flex: null == flex
                ? _value.flex
                : flex // ignore: cast_nullable_to_non_nullable
                      as int,
            sortable: null == sortable
                ? _value.sortable
                : sortable // ignore: cast_nullable_to_non_nullable
                      as bool,
            visible: null == visible
                ? _value.visible
                : visible // ignore: cast_nullable_to_non_nullable
                      as bool,
            alignment: null == alignment
                ? _value.alignment
                : alignment // ignore: cast_nullable_to_non_nullable
                      as DSSimpleTableColumnAlignment,
            cellType: null == cellType
                ? _value.cellType
                : cellType // ignore: cast_nullable_to_non_nullable
                      as DSSimpleTableCellType,
            cellBuilder: freezed == cellBuilder
                ? _value.cellBuilder
                : cellBuilder // ignore: cast_nullable_to_non_nullable
                      as DSSimpleTableCellBuilder?,
            headerBuilder: freezed == headerBuilder
                ? _value.headerBuilder
                : headerBuilder // ignore: cast_nullable_to_non_nullable
                      as DSSimpleTableHeaderBuilder?,
            formatter: freezed == formatter
                ? _value.formatter
                : formatter // ignore: cast_nullable_to_non_nullable
                      as DSSimpleTableCellFormatter?,
            tooltip: freezed == tooltip
                ? _value.tooltip
                : tooltip // ignore: cast_nullable_to_non_nullable
                      as String?,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as IconData?,
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
                      as DSSimpleTableSortDirection,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSSimpleTableColumnImplCopyWith<$Res>
    implements $DSSimpleTableColumnCopyWith<$Res> {
  factory _$$DSSimpleTableColumnImplCopyWith(
    _$DSSimpleTableColumnImpl value,
    $Res Function(_$DSSimpleTableColumnImpl) then,
  ) = __$$DSSimpleTableColumnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String label,
    String field,
    double? width,
    int flex,
    bool sortable,
    bool visible,
    DSSimpleTableColumnAlignment alignment,
    DSSimpleTableCellType cellType,
    DSSimpleTableCellBuilder? cellBuilder,
    DSSimpleTableHeaderBuilder? headerBuilder,
    DSSimpleTableCellFormatter? formatter,
    String? tooltip,
    IconData? icon,
    Map<String, dynamic>? customData,
    String? semanticLabel,
    DSSimpleTableSortDirection sortDirection,
  });
}

/// @nodoc
class __$$DSSimpleTableColumnImplCopyWithImpl<$Res>
    extends _$DSSimpleTableColumnCopyWithImpl<$Res, _$DSSimpleTableColumnImpl>
    implements _$$DSSimpleTableColumnImplCopyWith<$Res> {
  __$$DSSimpleTableColumnImplCopyWithImpl(
    _$DSSimpleTableColumnImpl _value,
    $Res Function(_$DSSimpleTableColumnImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableColumn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? field = null,
    Object? width = freezed,
    Object? flex = null,
    Object? sortable = null,
    Object? visible = null,
    Object? alignment = null,
    Object? cellType = null,
    Object? cellBuilder = freezed,
    Object? headerBuilder = freezed,
    Object? formatter = freezed,
    Object? tooltip = freezed,
    Object? icon = freezed,
    Object? customData = freezed,
    Object? semanticLabel = freezed,
    Object? sortDirection = null,
  }) {
    return _then(
      _$DSSimpleTableColumnImpl(
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
        flex: null == flex
            ? _value.flex
            : flex // ignore: cast_nullable_to_non_nullable
                  as int,
        sortable: null == sortable
            ? _value.sortable
            : sortable // ignore: cast_nullable_to_non_nullable
                  as bool,
        visible: null == visible
            ? _value.visible
            : visible // ignore: cast_nullable_to_non_nullable
                  as bool,
        alignment: null == alignment
            ? _value.alignment
            : alignment // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableColumnAlignment,
        cellType: null == cellType
            ? _value.cellType
            : cellType // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableCellType,
        cellBuilder: freezed == cellBuilder
            ? _value.cellBuilder
            : cellBuilder // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableCellBuilder?,
        headerBuilder: freezed == headerBuilder
            ? _value.headerBuilder
            : headerBuilder // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableHeaderBuilder?,
        formatter: freezed == formatter
            ? _value.formatter
            : formatter // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableCellFormatter?,
        tooltip: freezed == tooltip
            ? _value.tooltip
            : tooltip // ignore: cast_nullable_to_non_nullable
                  as String?,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as IconData?,
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
                  as DSSimpleTableSortDirection,
      ),
    );
  }
}

/// @nodoc

class _$DSSimpleTableColumnImpl extends _DSSimpleTableColumn {
  const _$DSSimpleTableColumnImpl({
    required this.id,
    required this.label,
    required this.field,
    this.width,
    this.flex = 1,
    this.sortable = false,
    this.visible = true,
    this.alignment = DSSimpleTableColumnAlignment.left,
    this.cellType = DSSimpleTableCellType.text,
    this.cellBuilder,
    this.headerBuilder,
    this.formatter,
    this.tooltip,
    this.icon,
    final Map<String, dynamic>? customData,
    this.semanticLabel,
    this.sortDirection = DSSimpleTableSortDirection.none,
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

  /// Column width (null for flex sizing)
  @override
  final double? width;

  /// Flex value for column width distribution
  @override
  @JsonKey()
  final int flex;

  /// Whether the column is sortable
  @override
  @JsonKey()
  final bool sortable;

  /// Whether the column is visible
  @override
  @JsonKey()
  final bool visible;

  /// Column alignment
  @override
  @JsonKey()
  final DSSimpleTableColumnAlignment alignment;

  /// Cell type for this column
  @override
  @JsonKey()
  final DSSimpleTableCellType cellType;

  /// Custom cell builder
  @override
  final DSSimpleTableCellBuilder? cellBuilder;

  /// Custom header builder
  @override
  final DSSimpleTableHeaderBuilder? headerBuilder;

  /// Formatter for displaying cell values
  @override
  final DSSimpleTableCellFormatter? formatter;

  /// Tooltip for the column header
  @override
  final String? tooltip;

  /// Icon for the column header
  @override
  final IconData? icon;

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
  final DSSimpleTableSortDirection sortDirection;

  @override
  String toString() {
    return 'DSSimpleTableColumn(id: $id, label: $label, field: $field, width: $width, flex: $flex, sortable: $sortable, visible: $visible, alignment: $alignment, cellType: $cellType, cellBuilder: $cellBuilder, headerBuilder: $headerBuilder, formatter: $formatter, tooltip: $tooltip, icon: $icon, customData: $customData, semanticLabel: $semanticLabel, sortDirection: $sortDirection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableColumnImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.flex, flex) || other.flex == flex) &&
            (identical(other.sortable, sortable) ||
                other.sortable == sortable) &&
            (identical(other.visible, visible) || other.visible == visible) &&
            (identical(other.alignment, alignment) ||
                other.alignment == alignment) &&
            (identical(other.cellType, cellType) ||
                other.cellType == cellType) &&
            (identical(other.cellBuilder, cellBuilder) ||
                other.cellBuilder == cellBuilder) &&
            (identical(other.headerBuilder, headerBuilder) ||
                other.headerBuilder == headerBuilder) &&
            (identical(other.formatter, formatter) ||
                other.formatter == formatter) &&
            (identical(other.tooltip, tooltip) || other.tooltip == tooltip) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            const DeepCollectionEquality().equals(
              other._customData,
              _customData,
            ) &&
            (identical(other.semanticLabel, semanticLabel) ||
                other.semanticLabel == semanticLabel) &&
            (identical(other.sortDirection, sortDirection) ||
                other.sortDirection == sortDirection));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    label,
    field,
    width,
    flex,
    sortable,
    visible,
    alignment,
    cellType,
    cellBuilder,
    headerBuilder,
    formatter,
    tooltip,
    icon,
    const DeepCollectionEquality().hash(_customData),
    semanticLabel,
    sortDirection,
  );

  /// Create a copy of DSSimpleTableColumn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableColumnImplCopyWith<_$DSSimpleTableColumnImpl> get copyWith =>
      __$$DSSimpleTableColumnImplCopyWithImpl<_$DSSimpleTableColumnImpl>(
        this,
        _$identity,
      );
}

abstract class _DSSimpleTableColumn extends DSSimpleTableColumn {
  const factory _DSSimpleTableColumn({
    required final String id,
    required final String label,
    required final String field,
    final double? width,
    final int flex,
    final bool sortable,
    final bool visible,
    final DSSimpleTableColumnAlignment alignment,
    final DSSimpleTableCellType cellType,
    final DSSimpleTableCellBuilder? cellBuilder,
    final DSSimpleTableHeaderBuilder? headerBuilder,
    final DSSimpleTableCellFormatter? formatter,
    final String? tooltip,
    final IconData? icon,
    final Map<String, dynamic>? customData,
    final String? semanticLabel,
    final DSSimpleTableSortDirection sortDirection,
  }) = _$DSSimpleTableColumnImpl;
  const _DSSimpleTableColumn._() : super._();

  /// Unique identifier for the column
  @override
  String get id;

  /// Display label for the column header
  @override
  String get label;

  /// Data field name for row data access
  @override
  String get field;

  /// Column width (null for flex sizing)
  @override
  double? get width;

  /// Flex value for column width distribution
  @override
  int get flex;

  /// Whether the column is sortable
  @override
  bool get sortable;

  /// Whether the column is visible
  @override
  bool get visible;

  /// Column alignment
  @override
  DSSimpleTableColumnAlignment get alignment;

  /// Cell type for this column
  @override
  DSSimpleTableCellType get cellType;

  /// Custom cell builder
  @override
  DSSimpleTableCellBuilder? get cellBuilder;

  /// Custom header builder
  @override
  DSSimpleTableHeaderBuilder? get headerBuilder;

  /// Formatter for displaying cell values
  @override
  DSSimpleTableCellFormatter? get formatter;

  /// Tooltip for the column header
  @override
  String? get tooltip;

  /// Icon for the column header
  @override
  IconData? get icon;

  /// Custom data for the column
  @override
  Map<String, dynamic>? get customData;

  /// Accessibility label for the column
  @override
  String? get semanticLabel;

  /// Sort direction for this column
  @override
  DSSimpleTableSortDirection get sortDirection;

  /// Create a copy of DSSimpleTableColumn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableColumnImplCopyWith<_$DSSimpleTableColumnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSSimpleTableRow {
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
  DSSimpleTableRowState get state => throw _privateConstructorUsedError;

  /// Custom row builder
  DSSimpleTableRowBuilder? get rowBuilder => throw _privateConstructorUsedError;

  /// Row height override
  double? get height => throw _privateConstructorUsedError;

  /// Row color override
  Color? get color => throw _privateConstructorUsedError;

  /// Custom data for the row
  Map<String, dynamic>? get customData => throw _privateConstructorUsedError;

  /// Accessibility label for the row
  String? get semanticLabel => throw _privateConstructorUsedError;

  /// Create a copy of DSSimpleTableRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSSimpleTableRowCopyWith<DSSimpleTableRow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSSimpleTableRowCopyWith<$Res> {
  factory $DSSimpleTableRowCopyWith(
    DSSimpleTableRow value,
    $Res Function(DSSimpleTableRow) then,
  ) = _$DSSimpleTableRowCopyWithImpl<$Res, DSSimpleTableRow>;
  @useResult
  $Res call({
    String id,
    Map<String, dynamic> data,
    bool selected,
    bool disabled,
    bool visible,
    DSSimpleTableRowState state,
    DSSimpleTableRowBuilder? rowBuilder,
    double? height,
    Color? color,
    Map<String, dynamic>? customData,
    String? semanticLabel,
  });
}

/// @nodoc
class _$DSSimpleTableRowCopyWithImpl<$Res, $Val extends DSSimpleTableRow>
    implements $DSSimpleTableRowCopyWith<$Res> {
  _$DSSimpleTableRowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSSimpleTableRow
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
    Object? customData = freezed,
    Object? semanticLabel = freezed,
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
                      as DSSimpleTableRowState,
            rowBuilder: freezed == rowBuilder
                ? _value.rowBuilder
                : rowBuilder // ignore: cast_nullable_to_non_nullable
                      as DSSimpleTableRowBuilder?,
            height: freezed == height
                ? _value.height
                : height // ignore: cast_nullable_to_non_nullable
                      as double?,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as Color?,
            customData: freezed == customData
                ? _value.customData
                : customData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
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
abstract class _$$DSSimpleTableRowImplCopyWith<$Res>
    implements $DSSimpleTableRowCopyWith<$Res> {
  factory _$$DSSimpleTableRowImplCopyWith(
    _$DSSimpleTableRowImpl value,
    $Res Function(_$DSSimpleTableRowImpl) then,
  ) = __$$DSSimpleTableRowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    Map<String, dynamic> data,
    bool selected,
    bool disabled,
    bool visible,
    DSSimpleTableRowState state,
    DSSimpleTableRowBuilder? rowBuilder,
    double? height,
    Color? color,
    Map<String, dynamic>? customData,
    String? semanticLabel,
  });
}

/// @nodoc
class __$$DSSimpleTableRowImplCopyWithImpl<$Res>
    extends _$DSSimpleTableRowCopyWithImpl<$Res, _$DSSimpleTableRowImpl>
    implements _$$DSSimpleTableRowImplCopyWith<$Res> {
  __$$DSSimpleTableRowImplCopyWithImpl(
    _$DSSimpleTableRowImpl _value,
    $Res Function(_$DSSimpleTableRowImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableRow
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
    Object? customData = freezed,
    Object? semanticLabel = freezed,
  }) {
    return _then(
      _$DSSimpleTableRowImpl(
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
                  as DSSimpleTableRowState,
        rowBuilder: freezed == rowBuilder
            ? _value.rowBuilder
            : rowBuilder // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableRowBuilder?,
        height: freezed == height
            ? _value.height
            : height // ignore: cast_nullable_to_non_nullable
                  as double?,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as Color?,
        customData: freezed == customData
            ? _value._customData
            : customData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        semanticLabel: freezed == semanticLabel
            ? _value.semanticLabel
            : semanticLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$DSSimpleTableRowImpl extends _DSSimpleTableRow {
  const _$DSSimpleTableRowImpl({
    required this.id,
    required final Map<String, dynamic> data,
    this.selected = false,
    this.disabled = false,
    this.visible = true,
    this.state = DSSimpleTableRowState.normal,
    this.rowBuilder,
    this.height,
    this.color,
    final Map<String, dynamic>? customData,
    this.semanticLabel,
  }) : _data = data,
       _customData = customData,
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
  final DSSimpleTableRowState state;

  /// Custom row builder
  @override
  final DSSimpleTableRowBuilder? rowBuilder;

  /// Row height override
  @override
  final double? height;

  /// Row color override
  @override
  final Color? color;

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

  @override
  String toString() {
    return 'DSSimpleTableRow(id: $id, data: $data, selected: $selected, disabled: $disabled, visible: $visible, state: $state, rowBuilder: $rowBuilder, height: $height, color: $color, customData: $customData, semanticLabel: $semanticLabel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableRowImpl &&
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
            const DeepCollectionEquality().equals(
              other._customData,
              _customData,
            ) &&
            (identical(other.semanticLabel, semanticLabel) ||
                other.semanticLabel == semanticLabel));
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
    const DeepCollectionEquality().hash(_customData),
    semanticLabel,
  );

  /// Create a copy of DSSimpleTableRow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableRowImplCopyWith<_$DSSimpleTableRowImpl> get copyWith =>
      __$$DSSimpleTableRowImplCopyWithImpl<_$DSSimpleTableRowImpl>(
        this,
        _$identity,
      );
}

abstract class _DSSimpleTableRow extends DSSimpleTableRow {
  const factory _DSSimpleTableRow({
    required final String id,
    required final Map<String, dynamic> data,
    final bool selected,
    final bool disabled,
    final bool visible,
    final DSSimpleTableRowState state,
    final DSSimpleTableRowBuilder? rowBuilder,
    final double? height,
    final Color? color,
    final Map<String, dynamic>? customData,
    final String? semanticLabel,
  }) = _$DSSimpleTableRowImpl;
  const _DSSimpleTableRow._() : super._();

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
  DSSimpleTableRowState get state;

  /// Custom row builder
  @override
  DSSimpleTableRowBuilder? get rowBuilder;

  /// Row height override
  @override
  double? get height;

  /// Row color override
  @override
  Color? get color;

  /// Custom data for the row
  @override
  Map<String, dynamic>? get customData;

  /// Accessibility label for the row
  @override
  String? get semanticLabel;

  /// Create a copy of DSSimpleTableRow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableRowImplCopyWith<_$DSSimpleTableRowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSSimpleTableSelection {
  /// Selection mode
  DSSimpleTableSelectionMode get mode => throw _privateConstructorUsedError;

  /// Selected row IDs
  List<String> get selectedRows => throw _privateConstructorUsedError;

  /// Whether to show selection checkboxes
  bool get showCheckboxes => throw _privateConstructorUsedError;

  /// Whether to allow select all
  bool get allowSelectAll => throw _privateConstructorUsedError;

  /// Maximum number of selections (null for unlimited)
  int? get maxSelections => throw _privateConstructorUsedError;

  /// Callback when selection changes
  DSSimpleTableSelectionCallback? get onSelectionChanged =>
      throw _privateConstructorUsedError;

  /// Create a copy of DSSimpleTableSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSSimpleTableSelectionCopyWith<DSSimpleTableSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSSimpleTableSelectionCopyWith<$Res> {
  factory $DSSimpleTableSelectionCopyWith(
    DSSimpleTableSelection value,
    $Res Function(DSSimpleTableSelection) then,
  ) = _$DSSimpleTableSelectionCopyWithImpl<$Res, DSSimpleTableSelection>;
  @useResult
  $Res call({
    DSSimpleTableSelectionMode mode,
    List<String> selectedRows,
    bool showCheckboxes,
    bool allowSelectAll,
    int? maxSelections,
    DSSimpleTableSelectionCallback? onSelectionChanged,
  });
}

/// @nodoc
class _$DSSimpleTableSelectionCopyWithImpl<
  $Res,
  $Val extends DSSimpleTableSelection
>
    implements $DSSimpleTableSelectionCopyWith<$Res> {
  _$DSSimpleTableSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSSimpleTableSelection
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
                      as DSSimpleTableSelectionMode,
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
                      as DSSimpleTableSelectionCallback?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSSimpleTableSelectionImplCopyWith<$Res>
    implements $DSSimpleTableSelectionCopyWith<$Res> {
  factory _$$DSSimpleTableSelectionImplCopyWith(
    _$DSSimpleTableSelectionImpl value,
    $Res Function(_$DSSimpleTableSelectionImpl) then,
  ) = __$$DSSimpleTableSelectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSSimpleTableSelectionMode mode,
    List<String> selectedRows,
    bool showCheckboxes,
    bool allowSelectAll,
    int? maxSelections,
    DSSimpleTableSelectionCallback? onSelectionChanged,
  });
}

/// @nodoc
class __$$DSSimpleTableSelectionImplCopyWithImpl<$Res>
    extends
        _$DSSimpleTableSelectionCopyWithImpl<$Res, _$DSSimpleTableSelectionImpl>
    implements _$$DSSimpleTableSelectionImplCopyWith<$Res> {
  __$$DSSimpleTableSelectionImplCopyWithImpl(
    _$DSSimpleTableSelectionImpl _value,
    $Res Function(_$DSSimpleTableSelectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableSelection
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
      _$DSSimpleTableSelectionImpl(
        mode: null == mode
            ? _value.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableSelectionMode,
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
                  as DSSimpleTableSelectionCallback?,
      ),
    );
  }
}

/// @nodoc

class _$DSSimpleTableSelectionImpl implements _DSSimpleTableSelection {
  const _$DSSimpleTableSelectionImpl({
    this.mode = DSSimpleTableSelectionMode.none,
    final List<String> selectedRows = const [],
    this.showCheckboxes = true,
    this.allowSelectAll = true,
    this.maxSelections,
    this.onSelectionChanged,
  }) : _selectedRows = selectedRows;

  /// Selection mode
  @override
  @JsonKey()
  final DSSimpleTableSelectionMode mode;

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
  final DSSimpleTableSelectionCallback? onSelectionChanged;

  @override
  String toString() {
    return 'DSSimpleTableSelection(mode: $mode, selectedRows: $selectedRows, showCheckboxes: $showCheckboxes, allowSelectAll: $allowSelectAll, maxSelections: $maxSelections, onSelectionChanged: $onSelectionChanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableSelectionImpl &&
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

  /// Create a copy of DSSimpleTableSelection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableSelectionImplCopyWith<_$DSSimpleTableSelectionImpl>
  get copyWith =>
      __$$DSSimpleTableSelectionImplCopyWithImpl<_$DSSimpleTableSelectionImpl>(
        this,
        _$identity,
      );
}

abstract class _DSSimpleTableSelection implements DSSimpleTableSelection {
  const factory _DSSimpleTableSelection({
    final DSSimpleTableSelectionMode mode,
    final List<String> selectedRows,
    final bool showCheckboxes,
    final bool allowSelectAll,
    final int? maxSelections,
    final DSSimpleTableSelectionCallback? onSelectionChanged,
  }) = _$DSSimpleTableSelectionImpl;

  /// Selection mode
  @override
  DSSimpleTableSelectionMode get mode;

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
  DSSimpleTableSelectionCallback? get onSelectionChanged;

  /// Create a copy of DSSimpleTableSelection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableSelectionImplCopyWith<_$DSSimpleTableSelectionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSSimpleTableSort {
  /// Column ID being sorted
  String? get columnId => throw _privateConstructorUsedError;

  /// Sort direction
  DSSimpleTableSortDirection get direction =>
      throw _privateConstructorUsedError;

  /// Callback when sort changes
  DSSimpleTableSortCallback? get onSortChanged =>
      throw _privateConstructorUsedError;

  /// Create a copy of DSSimpleTableSort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSSimpleTableSortCopyWith<DSSimpleTableSort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSSimpleTableSortCopyWith<$Res> {
  factory $DSSimpleTableSortCopyWith(
    DSSimpleTableSort value,
    $Res Function(DSSimpleTableSort) then,
  ) = _$DSSimpleTableSortCopyWithImpl<$Res, DSSimpleTableSort>;
  @useResult
  $Res call({
    String? columnId,
    DSSimpleTableSortDirection direction,
    DSSimpleTableSortCallback? onSortChanged,
  });
}

/// @nodoc
class _$DSSimpleTableSortCopyWithImpl<$Res, $Val extends DSSimpleTableSort>
    implements $DSSimpleTableSortCopyWith<$Res> {
  _$DSSimpleTableSortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSSimpleTableSort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columnId = freezed,
    Object? direction = null,
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
                      as DSSimpleTableSortDirection,
            onSortChanged: freezed == onSortChanged
                ? _value.onSortChanged
                : onSortChanged // ignore: cast_nullable_to_non_nullable
                      as DSSimpleTableSortCallback?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSSimpleTableSortImplCopyWith<$Res>
    implements $DSSimpleTableSortCopyWith<$Res> {
  factory _$$DSSimpleTableSortImplCopyWith(
    _$DSSimpleTableSortImpl value,
    $Res Function(_$DSSimpleTableSortImpl) then,
  ) = __$$DSSimpleTableSortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? columnId,
    DSSimpleTableSortDirection direction,
    DSSimpleTableSortCallback? onSortChanged,
  });
}

/// @nodoc
class __$$DSSimpleTableSortImplCopyWithImpl<$Res>
    extends _$DSSimpleTableSortCopyWithImpl<$Res, _$DSSimpleTableSortImpl>
    implements _$$DSSimpleTableSortImplCopyWith<$Res> {
  __$$DSSimpleTableSortImplCopyWithImpl(
    _$DSSimpleTableSortImpl _value,
    $Res Function(_$DSSimpleTableSortImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableSort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columnId = freezed,
    Object? direction = null,
    Object? onSortChanged = freezed,
  }) {
    return _then(
      _$DSSimpleTableSortImpl(
        columnId: freezed == columnId
            ? _value.columnId
            : columnId // ignore: cast_nullable_to_non_nullable
                  as String?,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableSortDirection,
        onSortChanged: freezed == onSortChanged
            ? _value.onSortChanged
            : onSortChanged // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableSortCallback?,
      ),
    );
  }
}

/// @nodoc

class _$DSSimpleTableSortImpl implements _DSSimpleTableSort {
  const _$DSSimpleTableSortImpl({
    this.columnId,
    this.direction = DSSimpleTableSortDirection.none,
    this.onSortChanged,
  });

  /// Column ID being sorted
  @override
  final String? columnId;

  /// Sort direction
  @override
  @JsonKey()
  final DSSimpleTableSortDirection direction;

  /// Callback when sort changes
  @override
  final DSSimpleTableSortCallback? onSortChanged;

  @override
  String toString() {
    return 'DSSimpleTableSort(columnId: $columnId, direction: $direction, onSortChanged: $onSortChanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableSortImpl &&
            (identical(other.columnId, columnId) ||
                other.columnId == columnId) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.onSortChanged, onSortChanged) ||
                other.onSortChanged == onSortChanged));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, columnId, direction, onSortChanged);

  /// Create a copy of DSSimpleTableSort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableSortImplCopyWith<_$DSSimpleTableSortImpl> get copyWith =>
      __$$DSSimpleTableSortImplCopyWithImpl<_$DSSimpleTableSortImpl>(
        this,
        _$identity,
      );
}

abstract class _DSSimpleTableSort implements DSSimpleTableSort {
  const factory _DSSimpleTableSort({
    final String? columnId,
    final DSSimpleTableSortDirection direction,
    final DSSimpleTableSortCallback? onSortChanged,
  }) = _$DSSimpleTableSortImpl;

  /// Column ID being sorted
  @override
  String? get columnId;

  /// Sort direction
  @override
  DSSimpleTableSortDirection get direction;

  /// Callback when sort changes
  @override
  DSSimpleTableSortCallback? get onSortChanged;

  /// Create a copy of DSSimpleTableSort
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableSortImplCopyWith<_$DSSimpleTableSortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSSimpleTableEmptyState {
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
  DSSimpleTableEmptyStateBuilder? get builder =>
      throw _privateConstructorUsedError;

  /// Create a copy of DSSimpleTableEmptyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSSimpleTableEmptyStateCopyWith<DSSimpleTableEmptyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSSimpleTableEmptyStateCopyWith<$Res> {
  factory $DSSimpleTableEmptyStateCopyWith(
    DSSimpleTableEmptyState value,
    $Res Function(DSSimpleTableEmptyState) then,
  ) = _$DSSimpleTableEmptyStateCopyWithImpl<$Res, DSSimpleTableEmptyState>;
  @useResult
  $Res call({
    String message,
    IconData? icon,
    Widget? illustration,
    Widget? action,
    bool show,
    DSSimpleTableEmptyStateBuilder? builder,
  });
}

/// @nodoc
class _$DSSimpleTableEmptyStateCopyWithImpl<
  $Res,
  $Val extends DSSimpleTableEmptyState
>
    implements $DSSimpleTableEmptyStateCopyWith<$Res> {
  _$DSSimpleTableEmptyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSSimpleTableEmptyState
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
                      as DSSimpleTableEmptyStateBuilder?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DSSimpleTableEmptyStateImplCopyWith<$Res>
    implements $DSSimpleTableEmptyStateCopyWith<$Res> {
  factory _$$DSSimpleTableEmptyStateImplCopyWith(
    _$DSSimpleTableEmptyStateImpl value,
    $Res Function(_$DSSimpleTableEmptyStateImpl) then,
  ) = __$$DSSimpleTableEmptyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    IconData? icon,
    Widget? illustration,
    Widget? action,
    bool show,
    DSSimpleTableEmptyStateBuilder? builder,
  });
}

/// @nodoc
class __$$DSSimpleTableEmptyStateImplCopyWithImpl<$Res>
    extends
        _$DSSimpleTableEmptyStateCopyWithImpl<
          $Res,
          _$DSSimpleTableEmptyStateImpl
        >
    implements _$$DSSimpleTableEmptyStateImplCopyWith<$Res> {
  __$$DSSimpleTableEmptyStateImplCopyWithImpl(
    _$DSSimpleTableEmptyStateImpl _value,
    $Res Function(_$DSSimpleTableEmptyStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableEmptyState
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
      _$DSSimpleTableEmptyStateImpl(
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
                  as DSSimpleTableEmptyStateBuilder?,
      ),
    );
  }
}

/// @nodoc

class _$DSSimpleTableEmptyStateImpl implements _DSSimpleTableEmptyState {
  const _$DSSimpleTableEmptyStateImpl({
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
  final DSSimpleTableEmptyStateBuilder? builder;

  @override
  String toString() {
    return 'DSSimpleTableEmptyState(message: $message, icon: $icon, illustration: $illustration, action: $action, show: $show, builder: $builder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableEmptyStateImpl &&
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

  /// Create a copy of DSSimpleTableEmptyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableEmptyStateImplCopyWith<_$DSSimpleTableEmptyStateImpl>
  get copyWith =>
      __$$DSSimpleTableEmptyStateImplCopyWithImpl<
        _$DSSimpleTableEmptyStateImpl
      >(this, _$identity);
}

abstract class _DSSimpleTableEmptyState implements DSSimpleTableEmptyState {
  const factory _DSSimpleTableEmptyState({
    final String message,
    final IconData? icon,
    final Widget? illustration,
    final Widget? action,
    final bool show,
    final DSSimpleTableEmptyStateBuilder? builder,
  }) = _$DSSimpleTableEmptyStateImpl;

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
  DSSimpleTableEmptyStateBuilder? get builder;

  /// Create a copy of DSSimpleTableEmptyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableEmptyStateImplCopyWith<_$DSSimpleTableEmptyStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSSimpleTableTheme {
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

  /// Loading indicator color
  Color? get loadingIndicatorColor => throw _privateConstructorUsedError;

  /// Custom cell styles
  Map<DSSimpleTableCellType, TextStyle>? get cellStyles =>
      throw _privateConstructorUsedError;

  /// Custom header style
  TextStyle? get headerStyle => throw _privateConstructorUsedError;

  /// Create a copy of DSSimpleTableTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSSimpleTableThemeCopyWith<DSSimpleTableTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSSimpleTableThemeCopyWith<$Res> {
  factory $DSSimpleTableThemeCopyWith(
    DSSimpleTableTheme value,
    $Res Function(DSSimpleTableTheme) then,
  ) = _$DSSimpleTableThemeCopyWithImpl<$Res, DSSimpleTableTheme>;
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
    Color? loadingIndicatorColor,
    Map<DSSimpleTableCellType, TextStyle>? cellStyles,
    TextStyle? headerStyle,
  });
}

/// @nodoc
class _$DSSimpleTableThemeCopyWithImpl<$Res, $Val extends DSSimpleTableTheme>
    implements $DSSimpleTableThemeCopyWith<$Res> {
  _$DSSimpleTableThemeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSSimpleTableTheme
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
            loadingIndicatorColor: freezed == loadingIndicatorColor
                ? _value.loadingIndicatorColor
                : loadingIndicatorColor // ignore: cast_nullable_to_non_nullable
                      as Color?,
            cellStyles: freezed == cellStyles
                ? _value.cellStyles
                : cellStyles // ignore: cast_nullable_to_non_nullable
                      as Map<DSSimpleTableCellType, TextStyle>?,
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
abstract class _$$DSSimpleTableThemeImplCopyWith<$Res>
    implements $DSSimpleTableThemeCopyWith<$Res> {
  factory _$$DSSimpleTableThemeImplCopyWith(
    _$DSSimpleTableThemeImpl value,
    $Res Function(_$DSSimpleTableThemeImpl) then,
  ) = __$$DSSimpleTableThemeImplCopyWithImpl<$Res>;
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
    Color? loadingIndicatorColor,
    Map<DSSimpleTableCellType, TextStyle>? cellStyles,
    TextStyle? headerStyle,
  });
}

/// @nodoc
class __$$DSSimpleTableThemeImplCopyWithImpl<$Res>
    extends _$DSSimpleTableThemeCopyWithImpl<$Res, _$DSSimpleTableThemeImpl>
    implements _$$DSSimpleTableThemeImplCopyWith<$Res> {
  __$$DSSimpleTableThemeImplCopyWithImpl(
    _$DSSimpleTableThemeImpl _value,
    $Res Function(_$DSSimpleTableThemeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableTheme
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
    Object? loadingIndicatorColor = freezed,
    Object? cellStyles = freezed,
    Object? headerStyle = freezed,
  }) {
    return _then(
      _$DSSimpleTableThemeImpl(
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
        loadingIndicatorColor: freezed == loadingIndicatorColor
            ? _value.loadingIndicatorColor
            : loadingIndicatorColor // ignore: cast_nullable_to_non_nullable
                  as Color?,
        cellStyles: freezed == cellStyles
            ? _value._cellStyles
            : cellStyles // ignore: cast_nullable_to_non_nullable
                  as Map<DSSimpleTableCellType, TextStyle>?,
        headerStyle: freezed == headerStyle
            ? _value.headerStyle
            : headerStyle // ignore: cast_nullable_to_non_nullable
                  as TextStyle?,
      ),
    );
  }
}

/// @nodoc

class _$DSSimpleTableThemeImpl implements _DSSimpleTableTheme {
  const _$DSSimpleTableThemeImpl({
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
    this.loadingIndicatorColor,
    final Map<DSSimpleTableCellType, TextStyle>? cellStyles,
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

  /// Loading indicator color
  @override
  final Color? loadingIndicatorColor;

  /// Custom cell styles
  final Map<DSSimpleTableCellType, TextStyle>? _cellStyles;

  /// Custom cell styles
  @override
  Map<DSSimpleTableCellType, TextStyle>? get cellStyles {
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
    return 'DSSimpleTableTheme(headerBackgroundColor: $headerBackgroundColor, headerTextColor: $headerTextColor, rowBackgroundColor: $rowBackgroundColor, alternateRowBackgroundColor: $alternateRowBackgroundColor, selectedRowBackgroundColor: $selectedRowBackgroundColor, hoveredRowBackgroundColor: $hoveredRowBackgroundColor, rowTextColor: $rowTextColor, selectedRowTextColor: $selectedRowTextColor, borderColor: $borderColor, dividerColor: $dividerColor, sortIconColor: $sortIconColor, loadingIndicatorColor: $loadingIndicatorColor, cellStyles: $cellStyles, headerStyle: $headerStyle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableThemeImpl &&
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
    loadingIndicatorColor,
    const DeepCollectionEquality().hash(_cellStyles),
    headerStyle,
  );

  /// Create a copy of DSSimpleTableTheme
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableThemeImplCopyWith<_$DSSimpleTableThemeImpl> get copyWith =>
      __$$DSSimpleTableThemeImplCopyWithImpl<_$DSSimpleTableThemeImpl>(
        this,
        _$identity,
      );
}

abstract class _DSSimpleTableTheme implements DSSimpleTableTheme {
  const factory _DSSimpleTableTheme({
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
    final Color? loadingIndicatorColor,
    final Map<DSSimpleTableCellType, TextStyle>? cellStyles,
    final TextStyle? headerStyle,
  }) = _$DSSimpleTableThemeImpl;

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

  /// Loading indicator color
  @override
  Color? get loadingIndicatorColor;

  /// Custom cell styles
  @override
  Map<DSSimpleTableCellType, TextStyle>? get cellStyles;

  /// Custom header style
  @override
  TextStyle? get headerStyle;

  /// Create a copy of DSSimpleTableTheme
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableThemeImplCopyWith<_$DSSimpleTableThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSSimpleTablePlatformConfig {
  /// iOS-specific configurations
  DSSimpleTableIOSConfig? get ios => throw _privateConstructorUsedError;

  /// Android-specific configurations
  DSSimpleTableAndroidConfig? get android => throw _privateConstructorUsedError;

  /// Web-specific configurations
  DSSimpleTableWebConfig? get web => throw _privateConstructorUsedError;

  /// Create a copy of DSSimpleTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSSimpleTablePlatformConfigCopyWith<DSSimpleTablePlatformConfig>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSSimpleTablePlatformConfigCopyWith<$Res> {
  factory $DSSimpleTablePlatformConfigCopyWith(
    DSSimpleTablePlatformConfig value,
    $Res Function(DSSimpleTablePlatformConfig) then,
  ) =
      _$DSSimpleTablePlatformConfigCopyWithImpl<
        $Res,
        DSSimpleTablePlatformConfig
      >;
  @useResult
  $Res call({
    DSSimpleTableIOSConfig? ios,
    DSSimpleTableAndroidConfig? android,
    DSSimpleTableWebConfig? web,
  });

  $DSSimpleTableIOSConfigCopyWith<$Res>? get ios;
  $DSSimpleTableAndroidConfigCopyWith<$Res>? get android;
  $DSSimpleTableWebConfigCopyWith<$Res>? get web;
}

/// @nodoc
class _$DSSimpleTablePlatformConfigCopyWithImpl<
  $Res,
  $Val extends DSSimpleTablePlatformConfig
>
    implements $DSSimpleTablePlatformConfigCopyWith<$Res> {
  _$DSSimpleTablePlatformConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSSimpleTablePlatformConfig
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
                      as DSSimpleTableIOSConfig?,
            android: freezed == android
                ? _value.android
                : android // ignore: cast_nullable_to_non_nullable
                      as DSSimpleTableAndroidConfig?,
            web: freezed == web
                ? _value.web
                : web // ignore: cast_nullable_to_non_nullable
                      as DSSimpleTableWebConfig?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSSimpleTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSSimpleTableIOSConfigCopyWith<$Res>? get ios {
    if (_value.ios == null) {
      return null;
    }

    return $DSSimpleTableIOSConfigCopyWith<$Res>(_value.ios!, (value) {
      return _then(_value.copyWith(ios: value) as $Val);
    });
  }

  /// Create a copy of DSSimpleTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSSimpleTableAndroidConfigCopyWith<$Res>? get android {
    if (_value.android == null) {
      return null;
    }

    return $DSSimpleTableAndroidConfigCopyWith<$Res>(_value.android!, (value) {
      return _then(_value.copyWith(android: value) as $Val);
    });
  }

  /// Create a copy of DSSimpleTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSSimpleTableWebConfigCopyWith<$Res>? get web {
    if (_value.web == null) {
      return null;
    }

    return $DSSimpleTableWebConfigCopyWith<$Res>(_value.web!, (value) {
      return _then(_value.copyWith(web: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DSSimpleTablePlatformConfigImplCopyWith<$Res>
    implements $DSSimpleTablePlatformConfigCopyWith<$Res> {
  factory _$$DSSimpleTablePlatformConfigImplCopyWith(
    _$DSSimpleTablePlatformConfigImpl value,
    $Res Function(_$DSSimpleTablePlatformConfigImpl) then,
  ) = __$$DSSimpleTablePlatformConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSSimpleTableIOSConfig? ios,
    DSSimpleTableAndroidConfig? android,
    DSSimpleTableWebConfig? web,
  });

  @override
  $DSSimpleTableIOSConfigCopyWith<$Res>? get ios;
  @override
  $DSSimpleTableAndroidConfigCopyWith<$Res>? get android;
  @override
  $DSSimpleTableWebConfigCopyWith<$Res>? get web;
}

/// @nodoc
class __$$DSSimpleTablePlatformConfigImplCopyWithImpl<$Res>
    extends
        _$DSSimpleTablePlatformConfigCopyWithImpl<
          $Res,
          _$DSSimpleTablePlatformConfigImpl
        >
    implements _$$DSSimpleTablePlatformConfigImplCopyWith<$Res> {
  __$$DSSimpleTablePlatformConfigImplCopyWithImpl(
    _$DSSimpleTablePlatformConfigImpl _value,
    $Res Function(_$DSSimpleTablePlatformConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ios = freezed,
    Object? android = freezed,
    Object? web = freezed,
  }) {
    return _then(
      _$DSSimpleTablePlatformConfigImpl(
        ios: freezed == ios
            ? _value.ios
            : ios // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableIOSConfig?,
        android: freezed == android
            ? _value.android
            : android // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableAndroidConfig?,
        web: freezed == web
            ? _value.web
            : web // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableWebConfig?,
      ),
    );
  }
}

/// @nodoc

class _$DSSimpleTablePlatformConfigImpl
    implements _DSSimpleTablePlatformConfig {
  const _$DSSimpleTablePlatformConfigImpl({this.ios, this.android, this.web});

  /// iOS-specific configurations
  @override
  final DSSimpleTableIOSConfig? ios;

  /// Android-specific configurations
  @override
  final DSSimpleTableAndroidConfig? android;

  /// Web-specific configurations
  @override
  final DSSimpleTableWebConfig? web;

  @override
  String toString() {
    return 'DSSimpleTablePlatformConfig(ios: $ios, android: $android, web: $web)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTablePlatformConfigImpl &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.android, android) || other.android == android) &&
            (identical(other.web, web) || other.web == web));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ios, android, web);

  /// Create a copy of DSSimpleTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTablePlatformConfigImplCopyWith<_$DSSimpleTablePlatformConfigImpl>
  get copyWith =>
      __$$DSSimpleTablePlatformConfigImplCopyWithImpl<
        _$DSSimpleTablePlatformConfigImpl
      >(this, _$identity);
}

abstract class _DSSimpleTablePlatformConfig
    implements DSSimpleTablePlatformConfig {
  const factory _DSSimpleTablePlatformConfig({
    final DSSimpleTableIOSConfig? ios,
    final DSSimpleTableAndroidConfig? android,
    final DSSimpleTableWebConfig? web,
  }) = _$DSSimpleTablePlatformConfigImpl;

  /// iOS-specific configurations
  @override
  DSSimpleTableIOSConfig? get ios;

  /// Android-specific configurations
  @override
  DSSimpleTableAndroidConfig? get android;

  /// Web-specific configurations
  @override
  DSSimpleTableWebConfig? get web;

  /// Create a copy of DSSimpleTablePlatformConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTablePlatformConfigImplCopyWith<_$DSSimpleTablePlatformConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSSimpleTableIOSConfig {
  /// Whether to use iOS-style scrollbars
  bool get useIOSScrollbars => throw _privateConstructorUsedError;

  /// Whether to enable haptic feedback
  bool get enableHapticFeedback => throw _privateConstructorUsedError;

  /// iOS-specific row height
  double? get rowHeight => throw _privateConstructorUsedError;

  /// Create a copy of DSSimpleTableIOSConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSSimpleTableIOSConfigCopyWith<DSSimpleTableIOSConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSSimpleTableIOSConfigCopyWith<$Res> {
  factory $DSSimpleTableIOSConfigCopyWith(
    DSSimpleTableIOSConfig value,
    $Res Function(DSSimpleTableIOSConfig) then,
  ) = _$DSSimpleTableIOSConfigCopyWithImpl<$Res, DSSimpleTableIOSConfig>;
  @useResult
  $Res call({
    bool useIOSScrollbars,
    bool enableHapticFeedback,
    double? rowHeight,
  });
}

/// @nodoc
class _$DSSimpleTableIOSConfigCopyWithImpl<
  $Res,
  $Val extends DSSimpleTableIOSConfig
>
    implements $DSSimpleTableIOSConfigCopyWith<$Res> {
  _$DSSimpleTableIOSConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSSimpleTableIOSConfig
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
abstract class _$$DSSimpleTableIOSConfigImplCopyWith<$Res>
    implements $DSSimpleTableIOSConfigCopyWith<$Res> {
  factory _$$DSSimpleTableIOSConfigImplCopyWith(
    _$DSSimpleTableIOSConfigImpl value,
    $Res Function(_$DSSimpleTableIOSConfigImpl) then,
  ) = __$$DSSimpleTableIOSConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool useIOSScrollbars,
    bool enableHapticFeedback,
    double? rowHeight,
  });
}

/// @nodoc
class __$$DSSimpleTableIOSConfigImplCopyWithImpl<$Res>
    extends
        _$DSSimpleTableIOSConfigCopyWithImpl<$Res, _$DSSimpleTableIOSConfigImpl>
    implements _$$DSSimpleTableIOSConfigImplCopyWith<$Res> {
  __$$DSSimpleTableIOSConfigImplCopyWithImpl(
    _$DSSimpleTableIOSConfigImpl _value,
    $Res Function(_$DSSimpleTableIOSConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableIOSConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useIOSScrollbars = null,
    Object? enableHapticFeedback = null,
    Object? rowHeight = freezed,
  }) {
    return _then(
      _$DSSimpleTableIOSConfigImpl(
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

class _$DSSimpleTableIOSConfigImpl implements _DSSimpleTableIOSConfig {
  const _$DSSimpleTableIOSConfigImpl({
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
    return 'DSSimpleTableIOSConfig(useIOSScrollbars: $useIOSScrollbars, enableHapticFeedback: $enableHapticFeedback, rowHeight: $rowHeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableIOSConfigImpl &&
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

  /// Create a copy of DSSimpleTableIOSConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableIOSConfigImplCopyWith<_$DSSimpleTableIOSConfigImpl>
  get copyWith =>
      __$$DSSimpleTableIOSConfigImplCopyWithImpl<_$DSSimpleTableIOSConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSSimpleTableIOSConfig implements DSSimpleTableIOSConfig {
  const factory _DSSimpleTableIOSConfig({
    final bool useIOSScrollbars,
    final bool enableHapticFeedback,
    final double? rowHeight,
  }) = _$DSSimpleTableIOSConfigImpl;

  /// Whether to use iOS-style scrollbars
  @override
  bool get useIOSScrollbars;

  /// Whether to enable haptic feedback
  @override
  bool get enableHapticFeedback;

  /// iOS-specific row height
  @override
  double? get rowHeight;

  /// Create a copy of DSSimpleTableIOSConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableIOSConfigImplCopyWith<_$DSSimpleTableIOSConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSSimpleTableAndroidConfig {
  /// Whether to use Material ripple effects
  bool get useMaterialRipple => throw _privateConstructorUsedError;

  /// Android-specific row height
  double? get rowHeight => throw _privateConstructorUsedError;

  /// Create a copy of DSSimpleTableAndroidConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSSimpleTableAndroidConfigCopyWith<DSSimpleTableAndroidConfig>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSSimpleTableAndroidConfigCopyWith<$Res> {
  factory $DSSimpleTableAndroidConfigCopyWith(
    DSSimpleTableAndroidConfig value,
    $Res Function(DSSimpleTableAndroidConfig) then,
  ) =
      _$DSSimpleTableAndroidConfigCopyWithImpl<
        $Res,
        DSSimpleTableAndroidConfig
      >;
  @useResult
  $Res call({bool useMaterialRipple, double? rowHeight});
}

/// @nodoc
class _$DSSimpleTableAndroidConfigCopyWithImpl<
  $Res,
  $Val extends DSSimpleTableAndroidConfig
>
    implements $DSSimpleTableAndroidConfigCopyWith<$Res> {
  _$DSSimpleTableAndroidConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSSimpleTableAndroidConfig
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
abstract class _$$DSSimpleTableAndroidConfigImplCopyWith<$Res>
    implements $DSSimpleTableAndroidConfigCopyWith<$Res> {
  factory _$$DSSimpleTableAndroidConfigImplCopyWith(
    _$DSSimpleTableAndroidConfigImpl value,
    $Res Function(_$DSSimpleTableAndroidConfigImpl) then,
  ) = __$$DSSimpleTableAndroidConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool useMaterialRipple, double? rowHeight});
}

/// @nodoc
class __$$DSSimpleTableAndroidConfigImplCopyWithImpl<$Res>
    extends
        _$DSSimpleTableAndroidConfigCopyWithImpl<
          $Res,
          _$DSSimpleTableAndroidConfigImpl
        >
    implements _$$DSSimpleTableAndroidConfigImplCopyWith<$Res> {
  __$$DSSimpleTableAndroidConfigImplCopyWithImpl(
    _$DSSimpleTableAndroidConfigImpl _value,
    $Res Function(_$DSSimpleTableAndroidConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableAndroidConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? useMaterialRipple = null, Object? rowHeight = freezed}) {
    return _then(
      _$DSSimpleTableAndroidConfigImpl(
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

class _$DSSimpleTableAndroidConfigImpl implements _DSSimpleTableAndroidConfig {
  const _$DSSimpleTableAndroidConfigImpl({
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
    return 'DSSimpleTableAndroidConfig(useMaterialRipple: $useMaterialRipple, rowHeight: $rowHeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableAndroidConfigImpl &&
            (identical(other.useMaterialRipple, useMaterialRipple) ||
                other.useMaterialRipple == useMaterialRipple) &&
            (identical(other.rowHeight, rowHeight) ||
                other.rowHeight == rowHeight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, useMaterialRipple, rowHeight);

  /// Create a copy of DSSimpleTableAndroidConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableAndroidConfigImplCopyWith<_$DSSimpleTableAndroidConfigImpl>
  get copyWith =>
      __$$DSSimpleTableAndroidConfigImplCopyWithImpl<
        _$DSSimpleTableAndroidConfigImpl
      >(this, _$identity);
}

abstract class _DSSimpleTableAndroidConfig
    implements DSSimpleTableAndroidConfig {
  const factory _DSSimpleTableAndroidConfig({
    final bool useMaterialRipple,
    final double? rowHeight,
  }) = _$DSSimpleTableAndroidConfigImpl;

  /// Whether to use Material ripple effects
  @override
  bool get useMaterialRipple;

  /// Android-specific row height
  @override
  double? get rowHeight;

  /// Create a copy of DSSimpleTableAndroidConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableAndroidConfigImplCopyWith<_$DSSimpleTableAndroidConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSSimpleTableWebConfig {
  /// Whether to show horizontal scrollbar
  bool get showHorizontalScrollbar => throw _privateConstructorUsedError;

  /// Whether to show vertical scrollbar
  bool get showVerticalScrollbar => throw _privateConstructorUsedError;

  /// Whether to enable right-click context menu
  bool get enableContextMenu => throw _privateConstructorUsedError;

  /// Web-specific row height
  double? get rowHeight => throw _privateConstructorUsedError;

  /// Create a copy of DSSimpleTableWebConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSSimpleTableWebConfigCopyWith<DSSimpleTableWebConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSSimpleTableWebConfigCopyWith<$Res> {
  factory $DSSimpleTableWebConfigCopyWith(
    DSSimpleTableWebConfig value,
    $Res Function(DSSimpleTableWebConfig) then,
  ) = _$DSSimpleTableWebConfigCopyWithImpl<$Res, DSSimpleTableWebConfig>;
  @useResult
  $Res call({
    bool showHorizontalScrollbar,
    bool showVerticalScrollbar,
    bool enableContextMenu,
    double? rowHeight,
  });
}

/// @nodoc
class _$DSSimpleTableWebConfigCopyWithImpl<
  $Res,
  $Val extends DSSimpleTableWebConfig
>
    implements $DSSimpleTableWebConfigCopyWith<$Res> {
  _$DSSimpleTableWebConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSSimpleTableWebConfig
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
abstract class _$$DSSimpleTableWebConfigImplCopyWith<$Res>
    implements $DSSimpleTableWebConfigCopyWith<$Res> {
  factory _$$DSSimpleTableWebConfigImplCopyWith(
    _$DSSimpleTableWebConfigImpl value,
    $Res Function(_$DSSimpleTableWebConfigImpl) then,
  ) = __$$DSSimpleTableWebConfigImplCopyWithImpl<$Res>;
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
class __$$DSSimpleTableWebConfigImplCopyWithImpl<$Res>
    extends
        _$DSSimpleTableWebConfigCopyWithImpl<$Res, _$DSSimpleTableWebConfigImpl>
    implements _$$DSSimpleTableWebConfigImplCopyWith<$Res> {
  __$$DSSimpleTableWebConfigImplCopyWithImpl(
    _$DSSimpleTableWebConfigImpl _value,
    $Res Function(_$DSSimpleTableWebConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableWebConfig
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
      _$DSSimpleTableWebConfigImpl(
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

class _$DSSimpleTableWebConfigImpl implements _DSSimpleTableWebConfig {
  const _$DSSimpleTableWebConfigImpl({
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
    return 'DSSimpleTableWebConfig(showHorizontalScrollbar: $showHorizontalScrollbar, showVerticalScrollbar: $showVerticalScrollbar, enableContextMenu: $enableContextMenu, rowHeight: $rowHeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableWebConfigImpl &&
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

  /// Create a copy of DSSimpleTableWebConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableWebConfigImplCopyWith<_$DSSimpleTableWebConfigImpl>
  get copyWith =>
      __$$DSSimpleTableWebConfigImplCopyWithImpl<_$DSSimpleTableWebConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSSimpleTableWebConfig implements DSSimpleTableWebConfig {
  const factory _DSSimpleTableWebConfig({
    final bool showHorizontalScrollbar,
    final bool showVerticalScrollbar,
    final bool enableContextMenu,
    final double? rowHeight,
  }) = _$DSSimpleTableWebConfigImpl;

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

  /// Create a copy of DSSimpleTableWebConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableWebConfigImplCopyWith<_$DSSimpleTableWebConfigImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSSimpleTableAccessibilityConfig {
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

  /// Create a copy of DSSimpleTableAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSSimpleTableAccessibilityConfigCopyWith<DSSimpleTableAccessibilityConfig>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSSimpleTableAccessibilityConfigCopyWith<$Res> {
  factory $DSSimpleTableAccessibilityConfigCopyWith(
    DSSimpleTableAccessibilityConfig value,
    $Res Function(DSSimpleTableAccessibilityConfig) then,
  ) =
      _$DSSimpleTableAccessibilityConfigCopyWithImpl<
        $Res,
        DSSimpleTableAccessibilityConfig
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
class _$DSSimpleTableAccessibilityConfigCopyWithImpl<
  $Res,
  $Val extends DSSimpleTableAccessibilityConfig
>
    implements $DSSimpleTableAccessibilityConfigCopyWith<$Res> {
  _$DSSimpleTableAccessibilityConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSSimpleTableAccessibilityConfig
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
abstract class _$$DSSimpleTableAccessibilityConfigImplCopyWith<$Res>
    implements $DSSimpleTableAccessibilityConfigCopyWith<$Res> {
  factory _$$DSSimpleTableAccessibilityConfigImplCopyWith(
    _$DSSimpleTableAccessibilityConfigImpl value,
    $Res Function(_$DSSimpleTableAccessibilityConfigImpl) then,
  ) = __$$DSSimpleTableAccessibilityConfigImplCopyWithImpl<$Res>;
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
class __$$DSSimpleTableAccessibilityConfigImplCopyWithImpl<$Res>
    extends
        _$DSSimpleTableAccessibilityConfigCopyWithImpl<
          $Res,
          _$DSSimpleTableAccessibilityConfigImpl
        >
    implements _$$DSSimpleTableAccessibilityConfigImplCopyWith<$Res> {
  __$$DSSimpleTableAccessibilityConfigImplCopyWithImpl(
    _$DSSimpleTableAccessibilityConfigImpl _value,
    $Res Function(_$DSSimpleTableAccessibilityConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableAccessibilityConfig
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
      _$DSSimpleTableAccessibilityConfigImpl(
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

class _$DSSimpleTableAccessibilityConfigImpl
    implements _DSSimpleTableAccessibilityConfig {
  const _$DSSimpleTableAccessibilityConfigImpl({
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
    return 'DSSimpleTableAccessibilityConfig(announceSortChanges: $announceSortChanges, announceSelectionChanges: $announceSelectionChanges, provideNavigationHints: $provideNavigationHints, tableSemantics: $tableSemantics, headerSemantics: $headerSemantics, cellSemantics: $cellSemantics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableAccessibilityConfigImpl &&
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

  /// Create a copy of DSSimpleTableAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableAccessibilityConfigImplCopyWith<
    _$DSSimpleTableAccessibilityConfigImpl
  >
  get copyWith =>
      __$$DSSimpleTableAccessibilityConfigImplCopyWithImpl<
        _$DSSimpleTableAccessibilityConfigImpl
      >(this, _$identity);
}

abstract class _DSSimpleTableAccessibilityConfig
    implements DSSimpleTableAccessibilityConfig {
  const factory _DSSimpleTableAccessibilityConfig({
    final bool announceSortChanges,
    final bool announceSelectionChanges,
    final bool provideNavigationHints,
    final String? tableSemantics,
    final Map<String, String>? headerSemantics,
    final Map<String, String>? cellSemantics,
  }) = _$DSSimpleTableAccessibilityConfigImpl;

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

  /// Create a copy of DSSimpleTableAccessibilityConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableAccessibilityConfigImplCopyWith<
    _$DSSimpleTableAccessibilityConfigImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSSimpleTableConfig {
  /// Table variant
  DSSimpleTableVariant get variant => throw _privateConstructorUsedError;

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

  /// Whether to show loading state
  bool get showLoading => throw _privateConstructorUsedError;

  /// Whether to show skeleton state
  bool get showSkeleton => throw _privateConstructorUsedError;

  /// Number of skeleton rows to show
  int get skeletonRowCount => throw _privateConstructorUsedError;

  /// Loading indicator widget
  Widget? get loadingIndicator => throw _privateConstructorUsedError;

  /// Skeleton row builder
  DSSimpleTableSkeletonBuilder? get skeletonBuilder =>
      throw _privateConstructorUsedError;

  /// Animation duration for state changes
  Duration get animationDuration => throw _privateConstructorUsedError;

  /// Animation curve for state changes
  Curve get animationCurve => throw _privateConstructorUsedError;

  /// Whether to enable keyboard navigation
  bool get enableKeyboardNavigation => throw _privateConstructorUsedError;

  /// Whether to enable accessibility features
  bool get enableAccessibility => throw _privateConstructorUsedError;

  /// Footer widget
  Widget? get footer => throw _privateConstructorUsedError;

  /// Whether to show row numbers
  bool get showRowNumbers => throw _privateConstructorUsedError;

  /// Row number column width
  double get rowNumberWidth => throw _privateConstructorUsedError;

  /// Density for the table
  DSSimpleTableDensity get density => throw _privateConstructorUsedError;

  /// Custom theme overrides
  DSSimpleTableTheme? get theme => throw _privateConstructorUsedError;

  /// Platform-specific configurations
  DSSimpleTablePlatformConfig? get platformConfig =>
      throw _privateConstructorUsedError;

  /// RTL support configuration
  bool get supportRTL => throw _privateConstructorUsedError;

  /// Accessibility configuration
  DSSimpleTableAccessibilityConfig? get accessibilityConfig =>
      throw _privateConstructorUsedError;

  /// Create a copy of DSSimpleTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DSSimpleTableConfigCopyWith<DSSimpleTableConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSSimpleTableConfigCopyWith<$Res> {
  factory $DSSimpleTableConfigCopyWith(
    DSSimpleTableConfig value,
    $Res Function(DSSimpleTableConfig) then,
  ) = _$DSSimpleTableConfigCopyWithImpl<$Res, DSSimpleTableConfig>;
  @useResult
  $Res call({
    DSSimpleTableVariant variant,
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
    bool showLoading,
    bool showSkeleton,
    int skeletonRowCount,
    Widget? loadingIndicator,
    DSSimpleTableSkeletonBuilder? skeletonBuilder,
    Duration animationDuration,
    Curve animationCurve,
    bool enableKeyboardNavigation,
    bool enableAccessibility,
    Widget? footer,
    bool showRowNumbers,
    double rowNumberWidth,
    DSSimpleTableDensity density,
    DSSimpleTableTheme? theme,
    DSSimpleTablePlatformConfig? platformConfig,
    bool supportRTL,
    DSSimpleTableAccessibilityConfig? accessibilityConfig,
  });

  $DSSimpleTableThemeCopyWith<$Res>? get theme;
  $DSSimpleTablePlatformConfigCopyWith<$Res>? get platformConfig;
  $DSSimpleTableAccessibilityConfigCopyWith<$Res>? get accessibilityConfig;
}

/// @nodoc
class _$DSSimpleTableConfigCopyWithImpl<$Res, $Val extends DSSimpleTableConfig>
    implements $DSSimpleTableConfigCopyWith<$Res> {
  _$DSSimpleTableConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSSimpleTableConfig
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
    Object? showLoading = null,
    Object? showSkeleton = null,
    Object? skeletonRowCount = null,
    Object? loadingIndicator = freezed,
    Object? skeletonBuilder = freezed,
    Object? animationDuration = null,
    Object? animationCurve = null,
    Object? enableKeyboardNavigation = null,
    Object? enableAccessibility = null,
    Object? footer = freezed,
    Object? showRowNumbers = null,
    Object? rowNumberWidth = null,
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
                      as DSSimpleTableVariant,
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
                      as DSSimpleTableSkeletonBuilder?,
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
            density: null == density
                ? _value.density
                : density // ignore: cast_nullable_to_non_nullable
                      as DSSimpleTableDensity,
            theme: freezed == theme
                ? _value.theme
                : theme // ignore: cast_nullable_to_non_nullable
                      as DSSimpleTableTheme?,
            platformConfig: freezed == platformConfig
                ? _value.platformConfig
                : platformConfig // ignore: cast_nullable_to_non_nullable
                      as DSSimpleTablePlatformConfig?,
            supportRTL: null == supportRTL
                ? _value.supportRTL
                : supportRTL // ignore: cast_nullable_to_non_nullable
                      as bool,
            accessibilityConfig: freezed == accessibilityConfig
                ? _value.accessibilityConfig
                : accessibilityConfig // ignore: cast_nullable_to_non_nullable
                      as DSSimpleTableAccessibilityConfig?,
          )
          as $Val,
    );
  }

  /// Create a copy of DSSimpleTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSSimpleTableThemeCopyWith<$Res>? get theme {
    if (_value.theme == null) {
      return null;
    }

    return $DSSimpleTableThemeCopyWith<$Res>(_value.theme!, (value) {
      return _then(_value.copyWith(theme: value) as $Val);
    });
  }

  /// Create a copy of DSSimpleTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSSimpleTablePlatformConfigCopyWith<$Res>? get platformConfig {
    if (_value.platformConfig == null) {
      return null;
    }

    return $DSSimpleTablePlatformConfigCopyWith<$Res>(_value.platformConfig!, (
      value,
    ) {
      return _then(_value.copyWith(platformConfig: value) as $Val);
    });
  }

  /// Create a copy of DSSimpleTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DSSimpleTableAccessibilityConfigCopyWith<$Res>? get accessibilityConfig {
    if (_value.accessibilityConfig == null) {
      return null;
    }

    return $DSSimpleTableAccessibilityConfigCopyWith<$Res>(
      _value.accessibilityConfig!,
      (value) {
        return _then(_value.copyWith(accessibilityConfig: value) as $Val);
      },
    );
  }
}

/// @nodoc
abstract class _$$DSSimpleTableConfigImplCopyWith<$Res>
    implements $DSSimpleTableConfigCopyWith<$Res> {
  factory _$$DSSimpleTableConfigImplCopyWith(
    _$DSSimpleTableConfigImpl value,
    $Res Function(_$DSSimpleTableConfigImpl) then,
  ) = __$$DSSimpleTableConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DSSimpleTableVariant variant,
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
    bool showLoading,
    bool showSkeleton,
    int skeletonRowCount,
    Widget? loadingIndicator,
    DSSimpleTableSkeletonBuilder? skeletonBuilder,
    Duration animationDuration,
    Curve animationCurve,
    bool enableKeyboardNavigation,
    bool enableAccessibility,
    Widget? footer,
    bool showRowNumbers,
    double rowNumberWidth,
    DSSimpleTableDensity density,
    DSSimpleTableTheme? theme,
    DSSimpleTablePlatformConfig? platformConfig,
    bool supportRTL,
    DSSimpleTableAccessibilityConfig? accessibilityConfig,
  });

  @override
  $DSSimpleTableThemeCopyWith<$Res>? get theme;
  @override
  $DSSimpleTablePlatformConfigCopyWith<$Res>? get platformConfig;
  @override
  $DSSimpleTableAccessibilityConfigCopyWith<$Res>? get accessibilityConfig;
}

/// @nodoc
class __$$DSSimpleTableConfigImplCopyWithImpl<$Res>
    extends _$DSSimpleTableConfigCopyWithImpl<$Res, _$DSSimpleTableConfigImpl>
    implements _$$DSSimpleTableConfigImplCopyWith<$Res> {
  __$$DSSimpleTableConfigImplCopyWithImpl(
    _$DSSimpleTableConfigImpl _value,
    $Res Function(_$DSSimpleTableConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableConfig
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
    Object? showLoading = null,
    Object? showSkeleton = null,
    Object? skeletonRowCount = null,
    Object? loadingIndicator = freezed,
    Object? skeletonBuilder = freezed,
    Object? animationDuration = null,
    Object? animationCurve = null,
    Object? enableKeyboardNavigation = null,
    Object? enableAccessibility = null,
    Object? footer = freezed,
    Object? showRowNumbers = null,
    Object? rowNumberWidth = null,
    Object? density = null,
    Object? theme = freezed,
    Object? platformConfig = freezed,
    Object? supportRTL = null,
    Object? accessibilityConfig = freezed,
  }) {
    return _then(
      _$DSSimpleTableConfigImpl(
        variant: null == variant
            ? _value.variant
            : variant // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableVariant,
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
                  as DSSimpleTableSkeletonBuilder?,
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
        density: null == density
            ? _value.density
            : density // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableDensity,
        theme: freezed == theme
            ? _value.theme
            : theme // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableTheme?,
        platformConfig: freezed == platformConfig
            ? _value.platformConfig
            : platformConfig // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTablePlatformConfig?,
        supportRTL: null == supportRTL
            ? _value.supportRTL
            : supportRTL // ignore: cast_nullable_to_non_nullable
                  as bool,
        accessibilityConfig: freezed == accessibilityConfig
            ? _value.accessibilityConfig
            : accessibilityConfig // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableAccessibilityConfig?,
      ),
    );
  }
}

/// @nodoc

class _$DSSimpleTableConfigImpl implements _DSSimpleTableConfig {
  const _$DSSimpleTableConfigImpl({
    this.variant = DSSimpleTableVariant.standard,
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
    this.showLoading = false,
    this.showSkeleton = false,
    this.skeletonRowCount = 5,
    this.loadingIndicator,
    this.skeletonBuilder,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.enableKeyboardNavigation = true,
    this.enableAccessibility = true,
    this.footer,
    this.showRowNumbers = false,
    this.rowNumberWidth = 60.0,
    this.density = DSSimpleTableDensity.standard,
    this.theme,
    this.platformConfig,
    this.supportRTL = true,
    this.accessibilityConfig,
  });

  /// Table variant
  @override
  @JsonKey()
  final DSSimpleTableVariant variant;

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
  final DSSimpleTableSkeletonBuilder? skeletonBuilder;

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

  /// Density for the table
  @override
  @JsonKey()
  final DSSimpleTableDensity density;

  /// Custom theme overrides
  @override
  final DSSimpleTableTheme? theme;

  /// Platform-specific configurations
  @override
  final DSSimpleTablePlatformConfig? platformConfig;

  /// RTL support configuration
  @override
  @JsonKey()
  final bool supportRTL;

  /// Accessibility configuration
  @override
  final DSSimpleTableAccessibilityConfig? accessibilityConfig;

  @override
  String toString() {
    return 'DSSimpleTableConfig(variant: $variant, showHeaders: $showHeaders, showRowDividers: $showRowDividers, showColumnDividers: $showColumnDividers, alternateRowColors: $alternateRowColors, showHoverEffects: $showHoverEffects, borderRadius: $borderRadius, rowHeight: $rowHeight, headerHeight: $headerHeight, cellPadding: $cellPadding, headerPadding: $headerPadding, elevation: $elevation, maxHeight: $maxHeight, minHeight: $minHeight, horizontalScrollable: $horizontalScrollable, verticalScrollable: $verticalScrollable, showLoading: $showLoading, showSkeleton: $showSkeleton, skeletonRowCount: $skeletonRowCount, loadingIndicator: $loadingIndicator, skeletonBuilder: $skeletonBuilder, animationDuration: $animationDuration, animationCurve: $animationCurve, enableKeyboardNavigation: $enableKeyboardNavigation, enableAccessibility: $enableAccessibility, footer: $footer, showRowNumbers: $showRowNumbers, rowNumberWidth: $rowNumberWidth, density: $density, theme: $theme, platformConfig: $platformConfig, supportRTL: $supportRTL, accessibilityConfig: $accessibilityConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableConfigImpl &&
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
            (identical(other.footer, footer) || other.footer == footer) &&
            (identical(other.showRowNumbers, showRowNumbers) ||
                other.showRowNumbers == showRowNumbers) &&
            (identical(other.rowNumberWidth, rowNumberWidth) ||
                other.rowNumberWidth == rowNumberWidth) &&
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
    showLoading,
    showSkeleton,
    skeletonRowCount,
    loadingIndicator,
    skeletonBuilder,
    animationDuration,
    animationCurve,
    enableKeyboardNavigation,
    enableAccessibility,
    footer,
    showRowNumbers,
    rowNumberWidth,
    density,
    theme,
    platformConfig,
    supportRTL,
    accessibilityConfig,
  ]);

  /// Create a copy of DSSimpleTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableConfigImplCopyWith<_$DSSimpleTableConfigImpl> get copyWith =>
      __$$DSSimpleTableConfigImplCopyWithImpl<_$DSSimpleTableConfigImpl>(
        this,
        _$identity,
      );
}

abstract class _DSSimpleTableConfig implements DSSimpleTableConfig {
  const factory _DSSimpleTableConfig({
    final DSSimpleTableVariant variant,
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
    final bool showLoading,
    final bool showSkeleton,
    final int skeletonRowCount,
    final Widget? loadingIndicator,
    final DSSimpleTableSkeletonBuilder? skeletonBuilder,
    final Duration animationDuration,
    final Curve animationCurve,
    final bool enableKeyboardNavigation,
    final bool enableAccessibility,
    final Widget? footer,
    final bool showRowNumbers,
    final double rowNumberWidth,
    final DSSimpleTableDensity density,
    final DSSimpleTableTheme? theme,
    final DSSimpleTablePlatformConfig? platformConfig,
    final bool supportRTL,
    final DSSimpleTableAccessibilityConfig? accessibilityConfig,
  }) = _$DSSimpleTableConfigImpl;

  /// Table variant
  @override
  DSSimpleTableVariant get variant;

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
  DSSimpleTableSkeletonBuilder? get skeletonBuilder;

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

  /// Footer widget
  @override
  Widget? get footer;

  /// Whether to show row numbers
  @override
  bool get showRowNumbers;

  /// Row number column width
  @override
  double get rowNumberWidth;

  /// Density for the table
  @override
  DSSimpleTableDensity get density;

  /// Custom theme overrides
  @override
  DSSimpleTableTheme? get theme;

  /// Platform-specific configurations
  @override
  DSSimpleTablePlatformConfig? get platformConfig;

  /// RTL support configuration
  @override
  bool get supportRTL;

  /// Accessibility configuration
  @override
  DSSimpleTableAccessibilityConfig? get accessibilityConfig;

  /// Create a copy of DSSimpleTableConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableConfigImplCopyWith<_$DSSimpleTableConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DSSimpleTableEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String columnId,
      DSSimpleTableSortDirection direction,
    )
    sort,
    required TResult Function(String rowId, bool selected) select,
    required TResult Function(String rowId, bool hovered) hover,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String columnId, DSSimpleTableSortDirection direction)?
    sort,
    TResult? Function(String rowId, bool selected)? select,
    TResult? Function(String rowId, bool hovered)? hover,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String columnId, DSSimpleTableSortDirection direction)?
    sort,
    TResult Function(String rowId, bool selected)? select,
    TResult Function(String rowId, bool hovered)? hover,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DSSimpleTableSortEvent value) sort,
    required TResult Function(DSSimpleTableSelectEvent value) select,
    required TResult Function(DSSimpleTableHoverEvent value) hover,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DSSimpleTableSortEvent value)? sort,
    TResult? Function(DSSimpleTableSelectEvent value)? select,
    TResult? Function(DSSimpleTableHoverEvent value)? hover,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DSSimpleTableSortEvent value)? sort,
    TResult Function(DSSimpleTableSelectEvent value)? select,
    TResult Function(DSSimpleTableHoverEvent value)? hover,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DSSimpleTableEventCopyWith<$Res> {
  factory $DSSimpleTableEventCopyWith(
    DSSimpleTableEvent value,
    $Res Function(DSSimpleTableEvent) then,
  ) = _$DSSimpleTableEventCopyWithImpl<$Res, DSSimpleTableEvent>;
}

/// @nodoc
class _$DSSimpleTableEventCopyWithImpl<$Res, $Val extends DSSimpleTableEvent>
    implements $DSSimpleTableEventCopyWith<$Res> {
  _$DSSimpleTableEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DSSimpleTableEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DSSimpleTableSortEventImplCopyWith<$Res> {
  factory _$$DSSimpleTableSortEventImplCopyWith(
    _$DSSimpleTableSortEventImpl value,
    $Res Function(_$DSSimpleTableSortEventImpl) then,
  ) = __$$DSSimpleTableSortEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String columnId, DSSimpleTableSortDirection direction});
}

/// @nodoc
class __$$DSSimpleTableSortEventImplCopyWithImpl<$Res>
    extends _$DSSimpleTableEventCopyWithImpl<$Res, _$DSSimpleTableSortEventImpl>
    implements _$$DSSimpleTableSortEventImplCopyWith<$Res> {
  __$$DSSimpleTableSortEventImplCopyWithImpl(
    _$DSSimpleTableSortEventImpl _value,
    $Res Function(_$DSSimpleTableSortEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? columnId = null, Object? direction = null}) {
    return _then(
      _$DSSimpleTableSortEventImpl(
        columnId: null == columnId
            ? _value.columnId
            : columnId // ignore: cast_nullable_to_non_nullable
                  as String,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as DSSimpleTableSortDirection,
      ),
    );
  }
}

/// @nodoc

class _$DSSimpleTableSortEventImpl implements DSSimpleTableSortEvent {
  const _$DSSimpleTableSortEventImpl({
    required this.columnId,
    required this.direction,
  });

  @override
  final String columnId;
  @override
  final DSSimpleTableSortDirection direction;

  @override
  String toString() {
    return 'DSSimpleTableEvent.sort(columnId: $columnId, direction: $direction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableSortEventImpl &&
            (identical(other.columnId, columnId) ||
                other.columnId == columnId) &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, columnId, direction);

  /// Create a copy of DSSimpleTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableSortEventImplCopyWith<_$DSSimpleTableSortEventImpl>
  get copyWith =>
      __$$DSSimpleTableSortEventImplCopyWithImpl<_$DSSimpleTableSortEventImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String columnId,
      DSSimpleTableSortDirection direction,
    )
    sort,
    required TResult Function(String rowId, bool selected) select,
    required TResult Function(String rowId, bool hovered) hover,
  }) {
    return sort(columnId, direction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String columnId, DSSimpleTableSortDirection direction)?
    sort,
    TResult? Function(String rowId, bool selected)? select,
    TResult? Function(String rowId, bool hovered)? hover,
  }) {
    return sort?.call(columnId, direction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String columnId, DSSimpleTableSortDirection direction)?
    sort,
    TResult Function(String rowId, bool selected)? select,
    TResult Function(String rowId, bool hovered)? hover,
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
    required TResult Function(DSSimpleTableSortEvent value) sort,
    required TResult Function(DSSimpleTableSelectEvent value) select,
    required TResult Function(DSSimpleTableHoverEvent value) hover,
  }) {
    return sort(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DSSimpleTableSortEvent value)? sort,
    TResult? Function(DSSimpleTableSelectEvent value)? select,
    TResult? Function(DSSimpleTableHoverEvent value)? hover,
  }) {
    return sort?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DSSimpleTableSortEvent value)? sort,
    TResult Function(DSSimpleTableSelectEvent value)? select,
    TResult Function(DSSimpleTableHoverEvent value)? hover,
    required TResult orElse(),
  }) {
    if (sort != null) {
      return sort(this);
    }
    return orElse();
  }
}

abstract class DSSimpleTableSortEvent implements DSSimpleTableEvent {
  const factory DSSimpleTableSortEvent({
    required final String columnId,
    required final DSSimpleTableSortDirection direction,
  }) = _$DSSimpleTableSortEventImpl;

  String get columnId;
  DSSimpleTableSortDirection get direction;

  /// Create a copy of DSSimpleTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableSortEventImplCopyWith<_$DSSimpleTableSortEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DSSimpleTableSelectEventImplCopyWith<$Res> {
  factory _$$DSSimpleTableSelectEventImplCopyWith(
    _$DSSimpleTableSelectEventImpl value,
    $Res Function(_$DSSimpleTableSelectEventImpl) then,
  ) = __$$DSSimpleTableSelectEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String rowId, bool selected});
}

/// @nodoc
class __$$DSSimpleTableSelectEventImplCopyWithImpl<$Res>
    extends
        _$DSSimpleTableEventCopyWithImpl<$Res, _$DSSimpleTableSelectEventImpl>
    implements _$$DSSimpleTableSelectEventImplCopyWith<$Res> {
  __$$DSSimpleTableSelectEventImplCopyWithImpl(
    _$DSSimpleTableSelectEventImpl _value,
    $Res Function(_$DSSimpleTableSelectEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rowId = null, Object? selected = null}) {
    return _then(
      _$DSSimpleTableSelectEventImpl(
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

class _$DSSimpleTableSelectEventImpl implements DSSimpleTableSelectEvent {
  const _$DSSimpleTableSelectEventImpl({
    required this.rowId,
    required this.selected,
  });

  @override
  final String rowId;
  @override
  final bool selected;

  @override
  String toString() {
    return 'DSSimpleTableEvent.select(rowId: $rowId, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableSelectEventImpl &&
            (identical(other.rowId, rowId) || other.rowId == rowId) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rowId, selected);

  /// Create a copy of DSSimpleTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableSelectEventImplCopyWith<_$DSSimpleTableSelectEventImpl>
  get copyWith =>
      __$$DSSimpleTableSelectEventImplCopyWithImpl<
        _$DSSimpleTableSelectEventImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String columnId,
      DSSimpleTableSortDirection direction,
    )
    sort,
    required TResult Function(String rowId, bool selected) select,
    required TResult Function(String rowId, bool hovered) hover,
  }) {
    return select(rowId, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String columnId, DSSimpleTableSortDirection direction)?
    sort,
    TResult? Function(String rowId, bool selected)? select,
    TResult? Function(String rowId, bool hovered)? hover,
  }) {
    return select?.call(rowId, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String columnId, DSSimpleTableSortDirection direction)?
    sort,
    TResult Function(String rowId, bool selected)? select,
    TResult Function(String rowId, bool hovered)? hover,
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
    required TResult Function(DSSimpleTableSortEvent value) sort,
    required TResult Function(DSSimpleTableSelectEvent value) select,
    required TResult Function(DSSimpleTableHoverEvent value) hover,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DSSimpleTableSortEvent value)? sort,
    TResult? Function(DSSimpleTableSelectEvent value)? select,
    TResult? Function(DSSimpleTableHoverEvent value)? hover,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DSSimpleTableSortEvent value)? sort,
    TResult Function(DSSimpleTableSelectEvent value)? select,
    TResult Function(DSSimpleTableHoverEvent value)? hover,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class DSSimpleTableSelectEvent implements DSSimpleTableEvent {
  const factory DSSimpleTableSelectEvent({
    required final String rowId,
    required final bool selected,
  }) = _$DSSimpleTableSelectEventImpl;

  String get rowId;
  bool get selected;

  /// Create a copy of DSSimpleTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableSelectEventImplCopyWith<_$DSSimpleTableSelectEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DSSimpleTableHoverEventImplCopyWith<$Res> {
  factory _$$DSSimpleTableHoverEventImplCopyWith(
    _$DSSimpleTableHoverEventImpl value,
    $Res Function(_$DSSimpleTableHoverEventImpl) then,
  ) = __$$DSSimpleTableHoverEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String rowId, bool hovered});
}

/// @nodoc
class __$$DSSimpleTableHoverEventImplCopyWithImpl<$Res>
    extends
        _$DSSimpleTableEventCopyWithImpl<$Res, _$DSSimpleTableHoverEventImpl>
    implements _$$DSSimpleTableHoverEventImplCopyWith<$Res> {
  __$$DSSimpleTableHoverEventImplCopyWithImpl(
    _$DSSimpleTableHoverEventImpl _value,
    $Res Function(_$DSSimpleTableHoverEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DSSimpleTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rowId = null, Object? hovered = null}) {
    return _then(
      _$DSSimpleTableHoverEventImpl(
        rowId: null == rowId
            ? _value.rowId
            : rowId // ignore: cast_nullable_to_non_nullable
                  as String,
        hovered: null == hovered
            ? _value.hovered
            : hovered // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$DSSimpleTableHoverEventImpl implements DSSimpleTableHoverEvent {
  const _$DSSimpleTableHoverEventImpl({
    required this.rowId,
    required this.hovered,
  });

  @override
  final String rowId;
  @override
  final bool hovered;

  @override
  String toString() {
    return 'DSSimpleTableEvent.hover(rowId: $rowId, hovered: $hovered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DSSimpleTableHoverEventImpl &&
            (identical(other.rowId, rowId) || other.rowId == rowId) &&
            (identical(other.hovered, hovered) || other.hovered == hovered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rowId, hovered);

  /// Create a copy of DSSimpleTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DSSimpleTableHoverEventImplCopyWith<_$DSSimpleTableHoverEventImpl>
  get copyWith =>
      __$$DSSimpleTableHoverEventImplCopyWithImpl<
        _$DSSimpleTableHoverEventImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String columnId,
      DSSimpleTableSortDirection direction,
    )
    sort,
    required TResult Function(String rowId, bool selected) select,
    required TResult Function(String rowId, bool hovered) hover,
  }) {
    return hover(rowId, hovered);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String columnId, DSSimpleTableSortDirection direction)?
    sort,
    TResult? Function(String rowId, bool selected)? select,
    TResult? Function(String rowId, bool hovered)? hover,
  }) {
    return hover?.call(rowId, hovered);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String columnId, DSSimpleTableSortDirection direction)?
    sort,
    TResult Function(String rowId, bool selected)? select,
    TResult Function(String rowId, bool hovered)? hover,
    required TResult orElse(),
  }) {
    if (hover != null) {
      return hover(rowId, hovered);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DSSimpleTableSortEvent value) sort,
    required TResult Function(DSSimpleTableSelectEvent value) select,
    required TResult Function(DSSimpleTableHoverEvent value) hover,
  }) {
    return hover(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DSSimpleTableSortEvent value)? sort,
    TResult? Function(DSSimpleTableSelectEvent value)? select,
    TResult? Function(DSSimpleTableHoverEvent value)? hover,
  }) {
    return hover?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DSSimpleTableSortEvent value)? sort,
    TResult Function(DSSimpleTableSelectEvent value)? select,
    TResult Function(DSSimpleTableHoverEvent value)? hover,
    required TResult orElse(),
  }) {
    if (hover != null) {
      return hover(this);
    }
    return orElse();
  }
}

abstract class DSSimpleTableHoverEvent implements DSSimpleTableEvent {
  const factory DSSimpleTableHoverEvent({
    required final String rowId,
    required final bool hovered,
  }) = _$DSSimpleTableHoverEventImpl;

  String get rowId;
  bool get hovered;

  /// Create a copy of DSSimpleTableEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DSSimpleTableHoverEventImplCopyWith<_$DSSimpleTableHoverEventImpl>
  get copyWith => throw _privateConstructorUsedError;
}
