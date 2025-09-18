import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'select_config.dart';

class AppSelect<T> extends StatefulWidget {
  final List<AppSelectItem<T>> items;
  final T? value;
  final List<T>? values;
  final ValueChanged<T?>? onChanged;
  final ValueChanged<List<T>>? onMultiChanged;
  final String? placeholder;
  final String? label;
  final String? helperText;
  final String? errorText;
  final String? Function(T?)? validator;
  final String? Function(List<T>)? multiValidator;
  final AppSelectVariant variant;
  final AppSelectConfig? config;
  final AppSelectColors? colors;
  final bool enabled;
  final bool autoFocus;
  final FocusNode? focusNode;
  final String? semanticLabel;
  final AppSelectState? overrideState;
  final TextDirection? textDirection;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool dense;
  final double? width;
  final String? searchHint;
  final bool Function(AppSelectItem<T>, String)? searchMatcher;

  const AppSelect({
    super.key,
    required this.items,
    this.value,
    this.values,
    this.onChanged,
    this.onMultiChanged,
    this.placeholder,
    this.label,
    this.helperText,
    this.errorText,
    this.validator,
    this.multiValidator,
    this.variant = AppSelectVariant.single,
    this.config,
    this.colors,
    this.enabled = true,
    this.autoFocus = false,
    this.focusNode,
    this.semanticLabel,
    this.overrideState,
    this.textDirection,
    this.prefixIcon,
    this.suffixIcon,
    this.dense = false,
    this.width,
    this.searchHint,
    this.searchMatcher,
  }) : assert(
          (variant == AppSelectVariant.single && onChanged != null) ||
              (variant == AppSelectVariant.multi && onMultiChanged != null) ||
              (variant == AppSelectVariant.searchable && onChanged != null),
          'Value and callback must match the variant type',
        );

  @override
  State<AppSelect<T>> createState() => _AppSelectState<T>();
}

class _AppSelectState<T> extends State<AppSelect<T>>
    with TickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _animationController;
  late AnimationController _skeletonAnimationController;
  late Animation<double> _skeletonAnimation;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final TextEditingController _searchController = TextEditingController();
  Timer? _searchDebounceTimer;

  bool _isHovered = false;
  final bool _isPressed = false;
  bool _isFocused = false;
  bool _isDropdownOpen = false;
  String? _errorText;
  List<AppSelectItem<T>> _filteredItems = [];
  String _searchQuery = '';

  AppSelectConfig get _config => widget.config ?? const AppSelectConfig();

  AppSelectColors get _colors =>
      widget.colors ?? AppSelectColors.fromTheme(Theme.of(context));

  bool get _isEnabled => widget.enabled;

  bool get _hasError => _errorText != null || widget.errorText != null;

  String? get _effectiveErrorText => widget.errorText ?? _errorText;

  AppSelectState get _currentState {
    if (widget.overrideState != null) {
      return widget.overrideState!;
    }

    if (!_isEnabled) {
      return AppSelectState.disabled;
    }

    if (_hasError) {
      return AppSelectState.error;
    }

    if (_isPressed) {
      return AppSelectState.pressed;
    }

    if (_isFocused || _isDropdownOpen) {
      return AppSelectState.focus;
    }

    if (_isHovered) {
      return AppSelectState.hover;
    }

    if (_hasSelection) {
      return AppSelectState.selected;
    }

    return AppSelectState.defaultState;
  }

  bool get _hasSelection {
    switch (widget.variant) {
      case AppSelectVariant.single:
      case AppSelectVariant.searchable:
        return widget.value != null;
      case AppSelectVariant.multi:
        return widget.values != null && widget.values!.isNotEmpty;
    }
  }

  String get _displayText {
    switch (widget.variant) {
      case AppSelectVariant.single:
      case AppSelectVariant.searchable:
        if (widget.value != null) {
          final item = widget.items.firstWhere(
            (item) => item.value == widget.value,
            orElse: () => AppSelectItem(
                value: widget.value as T, label: widget.value.toString()),
          );
          return item.label;
        }
        return widget.placeholder ?? '';
      case AppSelectVariant.multi:
        if (widget.values != null && widget.values!.isNotEmpty) {
          return '${widget.values!.length} seleccionado${widget.values!.length > 1 ? 's' : ''}';
        }
        return widget.placeholder ?? '';
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
    _filteredItems = widget.items;

    _animationController = AnimationController(
      duration: _config.animationDuration,
      vsync: this,
    );

    _skeletonAnimationController = AnimationController(
      duration:
          Duration(milliseconds: (1000 / _config.skeletonShimmerSpeed).round()),
      vsync: this,
    );

    _skeletonAnimation = Tween<double>(
      begin: 0.3,
      end: 0.3 + _config.skeletonOpacityRange,
    ).animate(CurvedAnimation(
      parent: _skeletonAnimationController,
      curve: Curves.easeInOut,
    ));

    if (_currentState == AppSelectState.skeleton) {
      _skeletonAnimationController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(AppSelect<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.items != widget.items) {
      _filteredItems = widget.items;
      _searchQuery = '';
      _searchController.clear();
    }

    if (oldWidget.overrideState != widget.overrideState) {
      if (_currentState == AppSelectState.skeleton) {
        _skeletonAnimationController.repeat(reverse: true);
      } else {
        _skeletonAnimationController.stop();
      }
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _closeDropdown();
    _animationController.dispose();
    _skeletonAnimationController.dispose();
    _searchController.dispose();
    _searchDebounceTimer?.cancel();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });

    if (!_isFocused && _isDropdownOpen) {
      _closeDropdown();
    }
  }

  void _handleTap() {
    if (!_isEnabled) return;

    if (_config.enableHapticFeedback &&
        (Platform.isIOS || Platform.isAndroid)) {
      HapticFeedback.lightImpact();
    }

    _focusNode.requestFocus();

    if (_isDropdownOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    if (!_isEnabled || _isDropdownOpen) return;

    setState(() {
      _isDropdownOpen = true;
    });

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeDropdown() {
    if (!_isDropdownOpen) return;

    setState(() {
      _isDropdownOpen = false;
    });

    _overlayEntry?.remove();
    _overlayEntry = null;

    // Reset search
    if (widget.variant == AppSelectVariant.searchable) {
      _searchController.clear();
      _filteredItems = widget.items;
      _searchQuery = '';
    }
  }

  void _handleSelection(T value) {
    switch (widget.variant) {
      case AppSelectVariant.single:
      case AppSelectVariant.searchable:
        widget.onChanged?.call(value);
        _closeDropdown();
        break;
      case AppSelectVariant.multi:
        final currentValues = List<T>.from(widget.values ?? []);
        if (currentValues.contains(value)) {
          currentValues.remove(value);
        } else {
          currentValues.add(value);
        }
        widget.onMultiChanged?.call(currentValues);
        break;
    }
  }

  void _handleSearch(String query) {
    _searchDebounceTimer?.cancel();
    _searchDebounceTimer =
        Timer(Duration(milliseconds: _config.searchDebounceMs), () {
      setState(() {
        _searchQuery = query.toLowerCase();
        _filteredItems = widget.items.where((item) {
          if (widget.searchMatcher != null) {
            return widget.searchMatcher!(item, query);
          }

          // Default search logic
          final searchText = item.searchableText ?? item.label;
          return searchText.toLowerCase().contains(_searchQuery);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentState == AppSelectState.skeleton) {
      return _buildSkeleton();
    }

    if (_currentState == AppSelectState.loading) {
      return _buildLoadingField();
    }

    return _buildSelect();
  }

  Widget _buildSkeleton() {
    return AnimatedBuilder(
      animation: _skeletonAnimation,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null) ...[
              Container(
                height: 16,
                width: 80,
                decoration: BoxDecoration(
                  color: _colors.skeletonBaseColor
                      .withValues(alpha: _skeletonAnimation.value),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(height: _config.labelSpacing),
            ],
            Container(
              height: _config.minimumHeight,
              width: widget.width ?? double.infinity,
              decoration: BoxDecoration(
                color: _colors.skeletonBaseColor
                    .withValues(alpha: _skeletonAnimation.value),
                borderRadius: BorderRadius.circular(_config.borderRadius),
                border: Border.all(
                  color: _colors.skeletonHighlightColor.withValues(alpha: 0.5),
                  width: _config.borderWidth,
                ),
              ),
            ),
            if (widget.helperText != null) ...[
              SizedBox(height: _config.helperErrorSpacing),
              Container(
                height: 12,
                width: 120,
                decoration: BoxDecoration(
                  color: _colors.skeletonBaseColor
                      .withValues(alpha: _skeletonAnimation.value),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildLoadingField() {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: _colors.labelColor,
            ),
          ),
          SizedBox(height: _config.labelSpacing),
        ],
        Container(
          height: _config.minimumHeight,
          width: widget.width ?? double.infinity,
          decoration: BoxDecoration(
            color: _colors.disabledFillColor,
            borderRadius: BorderRadius.circular(_config.borderRadius),
            border: Border.all(
              color: _colors.disabledBorderColor,
              width: _config.borderWidth,
            ),
          ),
          child: Center(
            child: theme.platform == TargetPlatform.iOS
                ? const CupertinoActivityIndicator()
                : const CircularProgressIndicator(),
          ),
        ),
        if (widget.helperText != null) ...[
          SizedBox(height: _config.helperErrorSpacing),
          Text(
            widget.helperText!,
            style: theme.textTheme.bodySmall?.copyWith(
              color: _colors.helperTextColor,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSelect() {
    final theme = Theme.of(context);

    return Semantics(
      label: widget.semanticLabel ?? widget.label,
      button: true,
      enabled: _isEnabled,
      focusable: _isEnabled,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: CompositedTransformTarget(
          link: _layerLink,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.label != null && !_config.enableFloatingLabel) ...[
                Text(
                  widget.label!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: _hasError
                        ? _colors.errorLabelColor
                        : _isFocused
                            ? _colors.focusedLabelColor
                            : _isEnabled
                                ? _colors.labelColor
                                : _colors.disabledLabelColor,
                  ),
                ),
                SizedBox(height: _config.labelSpacing),
              ],
              _buildSelectField(),
              if (_effectiveErrorText != null) ...[
                SizedBox(height: _config.helperErrorSpacing),
                Text(
                  _effectiveErrorText!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: _colors.errorTextColor,
                  ),
                ),
              ] else if (widget.helperText != null) ...[
                SizedBox(height: _config.helperErrorSpacing),
                Text(
                  widget.helperText!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: _colors.helperTextColor,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectField() {
    final theme = Theme.of(context);

    return SizedBox(
      width: widget.width,
      child: InkWell(
        onTap: _handleTap,
        borderRadius: BorderRadius.circular(_config.borderRadius),
        focusNode: _focusNode,
        autofocus: widget.autoFocus,
        child: Container(
          height: _config.minimumHeight,
          decoration: BoxDecoration(
            color: _isEnabled ? _colors.fillColor : _colors.disabledFillColor,
            borderRadius: BorderRadius.circular(_config.borderRadius),
            border: Border.all(
              color: _hasError
                  ? _colors.errorBorderColor
                  : _isFocused
                      ? _colors.focusedBorderColor
                      : _colors.borderColor,
              width:
                  _isFocused ? _config.focusBorderWidth : _config.borderWidth,
            ),
          ),
          child: Padding(
            padding: _config.contentPadding,
            child: Row(
              children: [
                if (widget.prefixIcon != null) ...[
                  widget.prefixIcon!,
                  SizedBox(width: _config.itemSpacing),
                ],
                Expanded(
                  child:
                      widget.variant == AppSelectVariant.multi && _hasSelection
                          ? _buildMultiSelectChips()
                          : _buildSingleSelectText(theme),
                ),
                if (widget.suffixIcon != null) ...[
                  SizedBox(width: _config.itemSpacing),
                  widget.suffixIcon!,
                ],
                SizedBox(width: _config.itemSpacing),
                AnimatedRotation(
                  turns: _isDropdownOpen ? 0.5 : 0,
                  duration: _config.animationDuration,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: _config.iconSize,
                    color: _isEnabled
                        ? _colors.dropdownIconColor
                        : _colors.disabledIconColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSingleSelectText(ThemeData theme) {
    final hasValue = _hasSelection;
    final text = hasValue ? _displayText : (widget.placeholder ?? '');

    return Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: hasValue
            ? (_isEnabled ? _colors.textColor : _colors.disabledTextColor)
            : (_isEnabled ? _colors.hintColor : _colors.disabledHintColor),
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildMultiSelectChips() {
    if (widget.values == null || widget.values!.isEmpty) {
      return _buildSingleSelectText(Theme.of(context));
    }

    return Wrap(
      spacing: _config.chipSpacing,
      runSpacing: _config.chipSpacing / 2,
      children: widget.values!.map((value) {
        final item = widget.items.firstWhere(
          (item) => item.value == value,
          orElse: () => AppSelectItem(value: value, label: value.toString()),
        );

        return Chip(
          label: Text(
            item.label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: _colors.chipTextColor,
                ),
          ),
          backgroundColor: _colors.chipBackgroundColor,
          side: BorderSide(color: _colors.chipBorderColor),
          deleteIcon: Icon(
            Icons.close,
            size: 16,
            color: _colors.chipDeleteIconColor,
          ),
          onDeleted: _isEnabled ? () => _handleSelection(value) : null,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        );
      }).toList(),
    );
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + _config.dropdownOffset),
          child: Material(
            elevation:
                _config.enableDropdownElevation ? _config.dropdownElevation : 0,
            borderRadius: BorderRadius.circular(_config.borderRadius),
            color: _colors.dropdownBackgroundColor,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: _config.maxDropdownHeight,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_config.borderRadius),
                border: Border.all(
                  color: _colors.borderColor,
                  width: _config.borderWidth,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.variant == AppSelectVariant.searchable)
                    _buildSearchField(),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: _filteredItems.length,
                      itemBuilder: (context, index) =>
                          _buildDropdownItem(_filteredItems[index]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      margin: EdgeInsets.all(_config.itemSpacing),
      child: TextField(
        controller: _searchController,
        onChanged: _handleSearch,
        decoration: InputDecoration(
          hintText: widget.searchHint ?? 'Buscar...',
          prefixIcon: Icon(Icons.search, size: _config.iconSize),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(_config.borderRadius / 2),
            borderSide: BorderSide(color: _colors.searchFieldBorderColor),
          ),
          filled: true,
          fillColor: _colors.searchFieldBackgroundColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          isDense: true,
        ),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }

  Widget _buildDropdownItem(AppSelectItem<T> item) {
    final isSelected = _isItemSelected(item);

    return InkWell(
      onTap: item.enabled ? () => _handleSelection(item.value) : null,
      child: Container(
        height: _config.itemHeight,
        padding: EdgeInsets.symmetric(horizontal: _config.itemSpacing),
        decoration: BoxDecoration(
          color: isSelected
              ? _colors.itemSelectedColor
              : _colors.itemBackgroundColor,
        ),
        child: Row(
          children: [
            if (item.leading != null) ...[
              item.leading!,
              SizedBox(width: _config.itemSpacing),
            ],
            if (widget.variant == AppSelectVariant.multi)
              Checkbox(
                value: isSelected,
                onChanged:
                    item.enabled ? (_) => _handleSelection(item.value) : null,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            if (widget.variant == AppSelectVariant.multi)
              SizedBox(width: _config.itemSpacing),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: item.enabled
                              ? _colors.itemTextColor
                              : _colors.itemDisabledTextColor,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (item.subtitle != null)
                    Text(
                      item.subtitle!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: item.enabled
                                ? _colors.itemTextColor.withValues(alpha: 0.7)
                                : _colors.itemDisabledTextColor,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            if (item.trailing != null) ...[
              SizedBox(width: _config.itemSpacing),
              item.trailing!,
            ],
            if (widget.variant != AppSelectVariant.multi && isSelected)
              Icon(
                Icons.check,
                size: _config.iconSize,
                color: _colors.focusedBorderColor,
              ),
          ],
        ),
      ),
    );
  }

  bool _isItemSelected(AppSelectItem<T> item) {
    switch (widget.variant) {
      case AppSelectVariant.single:
      case AppSelectVariant.searchable:
        return widget.value == item.value;
      case AppSelectVariant.multi:
        return widget.values?.contains(item.value) ?? false;
    }
  }
}
